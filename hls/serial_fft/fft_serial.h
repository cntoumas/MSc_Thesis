#pragma once
#include <ap_int.h>
#include <stdint.h>

static const int FFT_N      = 1024;
static const int FFT_LOG2_N = 10;

// ---------------------------------------------------------------------------
// fft_serial — in-place, iterative, radix-2 DIT FFT with dynamic BFP
//
// I/O uses 16-bit Q1.15 samples (matching the RTL AXI-Stream ports).
// Internally uses 17-bit (Q2.15) working precision — same as the RTL
// butterfly_unit which grows the data by 1 bit per add/sub.
//
// Dynamic BFP (Block Floating Point): matches the RTL bfp_scanner.v +
// bfp_shifter.v exactly.  Each stage scans all 17-bit butterfly outputs via
// OR-accumulated magnitude bits, computes CLZ, and shifts the data for the
// next stage left or right accordingly.  blk_exp is the accumulated exponent
// over all 10 stages — signal-dependent (varies per input block).
//
// Interface for Vitis HLS synthesis:
//   in_re / in_im   — AXI master read  (input samples, natural order)
//   out_re / out_im — AXI master write (output bins, bit-reversed order)
//   blk_exp         — AXI-Lite scalar  (cumulative BFP exponent, dynamic)
// ---------------------------------------------------------------------------
void fft_serial(
    int16_t  in_re [FFT_N],
    int16_t  in_im [FFT_N],
    int16_t  out_re[FFT_N],
    int16_t  out_im[FFT_N],
    int8_t  *blk_exp
);
