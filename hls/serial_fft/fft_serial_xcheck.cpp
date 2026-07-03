// Cross-check driver: run the HLS serial FFT on the 5 RTL test vectors and
// dump raw outputs + blk_exp so a Python script can compare HLS vs RTL using
// the shared dsp_metrics library.  Not a pass/fail TB.
#include <cstdio>
#include "fft_serial.h"
#include "../cosim_inputs.h"

int main() {
    static int16_t in_re[FFT_N], in_im[FFT_N];
    static int16_t out_re[FFT_N], out_im[FFT_N];

    FILE* f = fopen("C:/Users/ntoum/Desktop/thesis_repo/hls/xcheck_serial_out.txt", "w");
    if (!f) { printf("ERROR: cannot open output file\n"); return 1; }

    for (int t = 0; t < XC_NTESTS; t++) {
        for (int n = 0; n < FFT_N; n++) { in_re[n] = XC_IN[t][n]; in_im[n] = 0; }

        int8_t blk_exp = 0;
        fft_serial(in_re, in_im, out_re, out_im, &blk_exp);

        fprintf(f, "TEST %d %s %d\n", t, XC_NAMES[t], (int)blk_exp);
        for (int n = 0; n < FFT_N; n++)
            fprintf(f, "%d %d\n", (int)out_re[n], (int)out_im[n]);
    }
    fclose(f);
    printf("xcheck_serial: wrote %d tests\n", XC_NTESTS);
    return 0;
}
