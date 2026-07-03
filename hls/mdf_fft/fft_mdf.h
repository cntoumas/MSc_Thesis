#pragma once
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <stdint.h>

static const int MDF_N      = 1024;
static const int MDF_P      = 4;
static const int MDF_LOG2_N = 10;
static const int MDF_WORDS  = MDF_N / MDF_P;   // 256 groups per block

// 128-bit AXI-Stream word: P=4 complex samples packed as
//   bits [p*32+15 : p*32]    — real  of path p  (int16)
//   bits [p*32+31 : p*32+16] — imag  of path p  (int16)
typedef ap_axis<MDF_P * 32, 1, 1, 1> mdf_pkt_t;

// ---------------------------------------------------------------------------
// fft_mdf — streaming 4-path MDF (Multi-path Delay Feedback) radix-2 DIF FFT
//
// Throughput: 1 group (4 complex samples) per clock cycle.
// Latency:    ~256 cycles (delay-line pipeline fill).
//
// Structure mirrors the RTL fft_top.v:
//   • 8 feedback stages (fft_stage_fb), DEPTH = {128,64,32,16,8,4,2,1}
//   • 2 no-feedback stages (fft_stage_nf), IDX = {0,1}
//   • 1 bit-reversal reorder buffer
//
// Fixed BFP: every butterfly stage right-shifts all outputs by 1 bit
//   (round-to-even), matching the RTL block_scaler conservative mode.
//   Total exponent reported as MDF_LOG2_N = 10.
//
// The function is stateful (static delay-line arrays).  Feed one full
// block (MDF_WORDS = 256 packets) per call.  The first call fills the
// pipeline; the second call produces correct FFT output.
// ---------------------------------------------------------------------------
void fft_mdf(
    hls::stream<mdf_pkt_t>& s_in,
    hls::stream<mdf_pkt_t>& s_out
);
