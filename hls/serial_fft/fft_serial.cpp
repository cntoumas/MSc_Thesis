#include "fft_serial.h"
#include "../twiddle_rom.h"

// ===========================================================================
// BFP helpers — faithfully match bfp_scanner.v + bfp_shifter.v
// ===========================================================================

// ---------------------------------------------------------------------------
// bfp_shift_16
// Apply the BFP scaling to a 17-bit Q2.15 value, producing a 16-bit Q1.15.
//
// Matches bfp_shifter.v case statement exactly:
//   clz=0  right shift 1 (overflow), convergent round-to-even, exponent +1
//   clz=1  no shift: drop the redundant 17th sign bit, exponent unchanged
//   clz=2  left shift 1, exponent -1
//   clz=k  left shift (k-1), exponent -(k-1)    for k in [3..8]
//   clz>8  clamped to left shift 7, exponent -7
// ---------------------------------------------------------------------------
static ap_int<16> bfp_shift_16(ap_int<17> v, int clz) {
#pragma HLS INLINE
    switch (clz) {
        case 0: {
            // Convergent round-right-shift-1: add (bit0 & bit1) then >>1
            ap_int<17> rounded = v + (ap_int<17>)(v[0] & v[1]);
            return (ap_int<16>)(rounded >> 1);
        }
        case 1:  return (ap_int<16>)v;                    // just drop bit[16]
        case 2:  return (ap_int<16>)(v << 1);
        case 3:  return (ap_int<16>)(v << 2);
        case 4:  return (ap_int<16>)(v << 3);
        case 5:  return (ap_int<16>)(v << 4);
        case 6:  return (ap_int<16>)(v << 5);
        case 7:  return (ap_int<16>)(v << 6);
        default: return (ap_int<16>)(v << 7);             // clz >= 8: max left shift
    }
}

// ---------------------------------------------------------------------------
// bfp_exp_delta
// Return the exponent change caused by the BFP shift for a given CLZ.
// Matches the case statement in fft_top.v BFP_TRACKER.
// ---------------------------------------------------------------------------
static int8_t bfp_exp_delta(int clz) {
#pragma HLS INLINE
    switch (clz) {
        case 0:  return  1;
        case 1:  return  0;
        case 2:  return -1;
        case 3:  return -2;
        case 4:  return -3;
        case 5:  return -4;
        case 6:  return -5;
        case 7:  return -6;
        default: return -7;
    }
}

// ---------------------------------------------------------------------------
// bfp_magnitude
// 8-bit approximated magnitude of a 17-bit signed value.
// Uses bits [15:8] with 1's complement for negatives —
// exact mirror of bfp_scanner.v mag_x assignments.
// ---------------------------------------------------------------------------
static ap_uint<8> bfp_magnitude(ap_int<17> v) {
#pragma HLS INLINE
    ap_uint<8> top8 = (ap_uint<8>)v.range(15, 8);
    return v[16] ? (ap_uint<8>)~top8 : top8;
}

// ---------------------------------------------------------------------------
// bfp_clz8
// Priority-encoder CLZ over an 8-bit OR mask.
// Matches bfp_scanner.v CLZ_DECODER block.
// ---------------------------------------------------------------------------
static int bfp_clz8(ap_uint<8> mask) {
#pragma HLS INLINE
    if      (mask[7]) return 0;
    else if (mask[6]) return 1;
    else if (mask[5]) return 2;
    else if (mask[4]) return 3;
    else if (mask[3]) return 4;
    else if (mask[2]) return 5;
    else if (mask[1]) return 6;
    else if (mask[0]) return 7;
    else              return 8;
}

// ===========================================================================
// Core helpers
// ===========================================================================

static int bit_rev10(int x) {
#pragma HLS INLINE
    int r = 0;
    for (int i = 0; i < FFT_LOG2_N; i++) {
#pragma HLS UNROLL
        r = (r << 1) | (x & 1);
        x >>= 1;
    }
    return r;
}

// ---------------------------------------------------------------------------
// One DIT stage with compile-time STRIDE = 2^STAGE.
//
// All three RTL operations merged into one butterfly loop:
//   1. BFP shift (17-bit → 16-bit) using clz_in  [bfp_shifter.v]
//   2. Radix-2 butterfly (16-bit in → 17-bit out) [butterfly_unit.v]
//   3. OR-mask accumulation for next stage CLZ      [bfp_scanner.v]
//
// clz_in  — shift determined by previous stage's scan (1 = neutral for stage 0)
// clz_out — CLZ found by scanning this stage's outputs; used by stage+1
//
// Data format:
//   re[]/im[] buffer holds 17-bit values (Q2.15) between stages, exactly as
//   the RTL stores DATA_WIDTH+1 = 17-bit values in the ping-pong RAM.
// ---------------------------------------------------------------------------
template<int STAGE>
static void fft_stage_bfp(ap_int<17> re[], ap_int<17> im[],
                           int clz_in, int* clz_out) {
#pragma HLS INLINE

    static const int STRIDE = 1 << STAGE;
    ap_uint<8> or_mask = 0;

    // -----------------------------------------------------------------------
    // Butterfly pass — pure feed-forward datapath (no loop-carried reduction),
    // so the scheduler can pipeline BFP-shift → multiply → add deeply and hit
    // the target clock with a registered DSP multiply.  The BFP magnitude scan
    // is done separately below to keep this path off the critical loop.
    // -----------------------------------------------------------------------
    bfly_loop: for (int bfly = 0; bfly < FFT_N / 2; bfly++) {
#pragma HLS PIPELINE II=1
#pragma HLS DEPENDENCE variable=re inter false
#pragma HLS DEPENDENCE variable=im inter false

        // ---------- index arithmetic (all shifts are compile-time) ----------
        int group = bfly >> STAGE;
        int j     = bfly &  (STRIDE - 1);
        int a_idx = (group << (STAGE + 1)) | j;
        int b_idx = a_idx | STRIDE;
        int tw_n  = j << (FFT_LOG2_N - STAGE - 1);

        // ---------- BFP shift: 17-bit → 16-bit (bfp_shifter.v) -------------
        ap_int<16> a_re = bfp_shift_16(re[a_idx], clz_in);
        ap_int<16> a_im = bfp_shift_16(im[a_idx], clz_in);
        ap_int<16> b_re = bfp_shift_16(re[b_idx], clz_in);
        ap_int<16> b_im = bfp_shift_16(im[b_idx], clz_in);

        // ---------- twiddle lookup ------------------------------------------
        short w_re, w_im;
        twiddle_get(tw_n, &w_re, &w_im);

        // ---------- butterfly: Q1.15 × Q1.15 → Q2.15 (butterfly_unit.v) ----
        // W*B: 16-bit × 16-bit → 33-bit Q2.30; extract [31:15] = 17-bit Q2.15
        // Bind each product to a 3-stage pipelined DSP so the multiply is
        // registered: this breaks the long shift→mul→add path and lets the
        // II=1 loop close timing at the 10 ns target.
        ap_int<33> p_rr = (ap_int<33>)b_re * w_re;
        ap_int<33> p_ii = (ap_int<33>)b_im * w_im;
        ap_int<33> p_ri = (ap_int<33>)b_re * w_im;
        ap_int<33> p_ir = (ap_int<33>)b_im * w_re;
#pragma HLS BIND_OP variable=p_rr op=mul impl=dsp latency=3
#pragma HLS BIND_OP variable=p_ii op=mul impl=dsp latency=3
#pragma HLS BIND_OP variable=p_ri op=mul impl=dsp latency=3
#pragma HLS BIND_OP variable=p_ir op=mul impl=dsp latency=3
        ap_int<33> wb_re = p_rr - p_ii;
        ap_int<33> wb_im = p_ri + p_ir;
        ap_int<17> wb_re_s = (ap_int<17>)(wb_re >> 15);
        ap_int<17> wb_im_s = (ap_int<17>)(wb_im >> 15);

        // A' = A + W*B,  B' = A - W*B  (17-bit Q2.15 result)
        ap_int<17> a_re_out = (ap_int<17>)a_re + wb_re_s;
        ap_int<17> a_im_out = (ap_int<17>)a_im + wb_im_s;
        ap_int<17> b_re_out = (ap_int<17>)a_re - wb_re_s;
        ap_int<17> b_im_out = (ap_int<17>)a_im - wb_im_s;

        // ---------- store 17-bit results back to buffer ---------------------
        re[a_idx] = a_re_out;  im[a_idx] = a_im_out;
        re[b_idx] = b_re_out;  im[b_idx] = b_im_out;
    }

    // -----------------------------------------------------------------------
    // BFP scan (bfp_scanner.v): OR-accumulate the 8-bit magnitudes of every
    // stage output.  Separated from the butterfly so the only loop-carried
    // dependency here is a short read → magnitude → OR path.
    // -----------------------------------------------------------------------
    scan_loop: for (int i = 0; i < FFT_N; i++) {
#pragma HLS PIPELINE II=1
        or_mask |= bfp_magnitude(re[i]) | bfp_magnitude(im[i]);
    }

    *clz_out = bfp_clz8(or_mask);
}

// ===========================================================================
// Top-level function
// ===========================================================================
void fft_serial(
    int16_t  in_re [FFT_N],
    int16_t  in_im [FFT_N],
    int16_t  out_re[FFT_N],
    int16_t  out_im[FFT_N],
    int8_t  *blk_exp
) {
#pragma HLS INTERFACE m_axi     port=in_re   bundle=AXI_IN
#pragma HLS INTERFACE m_axi     port=in_im   bundle=AXI_IN
#pragma HLS INTERFACE m_axi     port=out_re  bundle=AXI_OUT
#pragma HLS INTERFACE m_axi     port=out_im  bundle=AXI_OUT
#pragma HLS INTERFACE s_axilite port=blk_exp
#pragma HLS INTERFACE s_axilite port=return

    // 17-bit working buffer — matches RTL ping-pong RAM width (DATA_WIDTH+1=17)
    ap_int<17> re[FFT_N], im[FFT_N];
#pragma HLS ARRAY_PARTITION variable=re cyclic factor=2
#pragma HLS ARRAY_PARTITION variable=im cyclic factor=2

    // --- Load + bit-reverse permutation -------------------------------------
    load_loop: for (int i = 0; i < FFT_N; i++) {
#pragma HLS PIPELINE II=1
        int j = bit_rev10(i);
        re[j] = (ap_int<17>)in_re[i];   // sign-extend 16→17 bit
        im[j] = (ap_int<17>)in_im[i];
    }

    // --- BFP state ----------------------------------------------------------
    // clz = 1 (neutral, matches RTL latched_shift_amount initial value of 4'd1)
    // Exponent tracks cumulative scaling (matches RTL current_exponent).
    int     clz     = 1;
    int8_t  exponent = 0;
    int     clz_next;

    // --- 10 DIT stages with dynamic BFP ------------------------------------
    // After each stage, the scanner result (clz_next) is:
    //   • latched as the shift for the NEXT stage
    //   • used to update the running exponent
    // This exactly mirrors the RTL BFP_TRACKER update at bfp_latch_trigger.

    fft_stage_bfp<0>(re, im, clz, &clz_next);
    exponent += bfp_exp_delta(clz_next); clz = clz_next;

    fft_stage_bfp<1>(re, im, clz, &clz_next);
    exponent += bfp_exp_delta(clz_next); clz = clz_next;

    fft_stage_bfp<2>(re, im, clz, &clz_next);
    exponent += bfp_exp_delta(clz_next); clz = clz_next;

    fft_stage_bfp<3>(re, im, clz, &clz_next);
    exponent += bfp_exp_delta(clz_next); clz = clz_next;

    fft_stage_bfp<4>(re, im, clz, &clz_next);
    exponent += bfp_exp_delta(clz_next); clz = clz_next;

    fft_stage_bfp<5>(re, im, clz, &clz_next);
    exponent += bfp_exp_delta(clz_next); clz = clz_next;

    fft_stage_bfp<6>(re, im, clz, &clz_next);
    exponent += bfp_exp_delta(clz_next); clz = clz_next;

    fft_stage_bfp<7>(re, im, clz, &clz_next);
    exponent += bfp_exp_delta(clz_next); clz = clz_next;

    fft_stage_bfp<8>(re, im, clz, &clz_next);
    exponent += bfp_exp_delta(clz_next); clz = clz_next;

    fft_stage_bfp<9>(re, im, clz, &clz_next);
    exponent += bfp_exp_delta(clz_next);  // include last stage's scan in exponent

    // --- Store (truncate 17-bit Q2.15 → 16-bit Q1.15) ----------------------
    // Output data is the raw butterfly output from stage 9; the final clz_next
    // shift is reflected in the exponent sideband but not applied to the data
    // (same convention as the RTL final_exponent / readout port).
    store_loop: for (int i = 0; i < FFT_N; i++) {
#pragma HLS PIPELINE II=1
        out_re[i] = (int16_t)re[i];
        out_im[i] = (int16_t)im[i];
    }

    *blk_exp = exponent;
}
