#include <cstdio>
#include <cmath>
#include <cstdlib>
#include "fft_serial.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

// ---------------------------------------------------------------------------
// Reference DFT (O(N^2)) for golden-check at specific bins.
// ---------------------------------------------------------------------------
static void dft_bin(
    const double* xr, const double* xi, int N, int k,
    double* Xr, double* Xi
) {
    *Xr = 0; *Xi = 0;
    for (int n = 0; n < N; n++) {
        double angle = -2.0 * M_PI * k * n / N;
        *Xr += xr[n] * cos(angle) - xi[n] * sin(angle);
        *Xi += xr[n] * sin(angle) + xi[n] * cos(angle);
    }
}

int main() {
    // --- Two-tone test signal ------------------------------------------------
    // Amplitudes chosen at 0.4 each so the BFP dynamic range is exercised but
    // there is no saturation (0.4 + 0.4 = 0.8 < 1.0).
    static int16_t in_re[FFT_N], in_im[FFT_N];
    static int16_t out_re[FFT_N], out_im[FFT_N];

    double xr_d[FFT_N], xi_d[FFT_N];
    for (int n = 0; n < FFT_N; n++) {
        double v = 0.4 * cos(2.0 * M_PI * 64  * n / FFT_N)
                 + 0.4 * cos(2.0 * M_PI * 200 * n / FFT_N);
        xr_d[n] = v;
        xi_d[n] = 0.0;
        in_re[n] = (int16_t)(v * 32767.0);
        in_im[n] = 0;
    }

    int8_t blk_exp = 0;
    fft_serial(in_re, in_im, out_re, out_im, &blk_exp);

    printf("blk_exp = %d  (dynamic BFP; fixed BFP would give %d)\n",
           (int)blk_exp, FFT_LOG2_N);

    // --- Golden reference from the *integer* inputs --------------------------
    // The HLS core processes int16 counts (v*32767), and its output is a BFP
    // mantissa whose absolute scale depends on the per-block exponent and the
    // "final-stage shift lives in the exponent, not the data" convention of
    // fft_serial.cpp.  Hard-coding that scale is fragile, so we validate the
    // SHAPE of the spectrum scale-invariantly: build the golden DFT from the
    // exact same integer samples, then normalise both spectra to their peak
    // (tone) bin.  The unknown global BFP scale cancels.
    for (int n = 0; n < FFT_N; n++) {
        xr_d[n] = (double)in_re[n];
        xi_d[n] = (double)in_im[n];
    }

    // Peak bin = a known tone (bin 64); used to normalise both spectra.
    double pr, pi;
    dft_bin(xr_d, xi_d, FFT_N, 64, &pr, &pi);
    double ref_peak = sqrt(pr * pr + pi * pi);
    double hls_peak = sqrt((double)out_re[64] * out_re[64] +
                           (double)out_im[64] * out_im[64]);

    int errors = 0;
    if (ref_peak <= 0.0 || hls_peak <= 0.0) {
        printf("ERROR: zero peak magnitude (ref=%.2f hls=%.2f)\n",
               ref_peak, hls_peak);
        errors++;
    }

    // --- Verify key bins against the normalised golden DFT ------------------
    // Tone bins (64, 200) should normalise to ~1.0; empty bins (1, 100, 512)
    // to ~0.0.  Tolerance 0.05 (5% of the peak) absorbs Q1.15 + BFP rounding.
    int check_bins[] = {64, 200, 1, 100, 512};
    for (int bi = 0; bi < 5; bi++) {
        int k = check_bins[bi];
        double Xr_ref, Xi_ref;
        dft_bin(xr_d, xi_d, FFT_N, k, &Xr_ref, &Xi_ref);

        double mag_ref = sqrt(Xr_ref * Xr_ref + Xi_ref * Xi_ref) / ref_peak;
        double mag_hls = sqrt((double)out_re[k] * out_re[k] +
                              (double)out_im[k] * out_im[k]) / hls_peak;

        double err = fabs(mag_hls - mag_ref);
        bool ok = (err <= 0.05);
        if (!ok) errors++;

        printf("bin %4d: ref_norm=%6.4f  hls_norm=%6.4f  err=%.4f  %s\n",
               k, mag_ref, mag_hls, err, ok ? "PASS" : "FAIL");
    }

    // --- SQNR estimate (signal bins 64 and 200) ----------------------------
    // Compare peak tone magnitudes against noise floor (average of null bins).
    double tone_sum = 0;
    double noise_sum = 0;
    int noise_count = 0;
    for (int k = 0; k < FFT_N; k++) {
        double m = sqrt((double)out_re[k] * out_re[k] +
                        (double)out_im[k] * out_im[k]);
        if (k == 64 || k == 200 || k == FFT_N - 64 || k == FFT_N - 200)
            tone_sum += m;
        else {
            noise_sum += m;
            noise_count++;
        }
    }
    double sqnr_db = 20.0 * log10((tone_sum / 4.0) / (noise_sum / noise_count));
    printf("\nSQNR estimate: %.1f dB  (dynamic BFP)\n", sqnr_db);

    printf("\n%s\n", errors ? "*** TESTBENCH FAILED ***" : "Testbench PASSED");
    return errors;
}
