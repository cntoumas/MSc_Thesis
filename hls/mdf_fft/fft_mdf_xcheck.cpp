// Cross-check driver: run the HLS MDF FFT on the 5 RTL test vectors and dump
// raw stream-order outputs so a Python script can de-interleave and compare
// HLS vs RTL with the shared dsp_metrics library.  Not a pass/fail TB.
#include <cstdio>
#include "fft_mdf.h"
#include "../cosim_inputs.h"

static void run_block(const int16_t* in_re, int16_t* out_re, int16_t* out_im) {
    hls::stream<mdf_pkt_t> s_in("s_in"), s_out("s_out");
    for (int g = 0; g < MDF_WORDS; g++) {
        mdf_pkt_t pkt;
        for (int p = 0; p < MDF_P; p++) {
            int n = g * MDF_P + p;
            pkt.data.range(p * 32 + 15, p * 32)     = in_re[n];
            pkt.data.range(p * 32 + 31, p * 32 + 16) = 0;
        }
        pkt.last = (g == MDF_WORDS - 1) ? 1 : 0;
        pkt.keep = -1; pkt.strb = -1;
        s_in.write(pkt);
    }
    fft_mdf(s_in, s_out);
    for (int g = 0; g < MDF_WORDS; g++) {
        mdf_pkt_t pkt = s_out.read();
        for (int p = 0; p < MDF_P; p++) {
            int n = g * MDF_P + p;
            out_re[n] = (int16_t)pkt.data.range(p * 32 + 15, p * 32);
            out_im[n] = (int16_t)pkt.data.range(p * 32 + 31, p * 32 + 16);
        }
    }
}

int main() {
    static int16_t out_re[MDF_N], out_im[MDF_N];
    static int16_t dre[MDF_N], dim[MDF_N];

    FILE* f = fopen("C:/Users/ntoum/Desktop/thesis_repo/hls/xcheck_mdf_out.txt", "w");
    if (!f) { printf("ERROR: cannot open output file\n"); return 1; }

    for (int t = 0; t < XC_NTESTS; t++) {
        // First block fills the stateful delay-line pipeline; second is valid.
        run_block(XC_IN[t], dre, dim);
        run_block(XC_IN[t], out_re, out_im);

        fprintf(f, "TEST %d %s 0\n", t, XC_NAMES[t]);   // MDF uses fixed BFP
        for (int n = 0; n < MDF_N; n++)
            fprintf(f, "%d %d\n", (int)out_re[n], (int)out_im[n]);
    }
    fclose(f);
    printf("xcheck_mdf: wrote %d tests\n", XC_NTESTS);
    return 0;
}
