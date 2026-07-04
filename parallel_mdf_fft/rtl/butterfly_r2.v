// =============================================================================
// butterfly_r2.v — Radix-2 DIF butterfly unit (combinational)
//
// Computes the standard radix-2 DIF butterfly:
//   sum  = a + b       (forwarded to next FFT stage)
//   diff = a - b       (goes to twiddle multiplier, then delay-line feedback)
//
// This is PURELY COMBINATIONAL — no clock port.
// No twiddle multiplication is done here; that is handled by complex_mult.
//
// Bit growth: output is DATA_W+1 bits to accommodate the 1-bit growth from
// addition/subtraction (e.g., 0x7FFF + 0x7FFF = 0x0FFFE requires 17 bits).
// The caller (fft_stage_fb / block_scaler) reduces back to DATA_W bits.
//
// Parameters:
//   DATA_W — input bit width (signed 2's complement, default 16)
//
// Ports:
//   a_re, a_im  — complex input A (DATA_W bits, signed)
//   b_re, b_im  — complex input B (DATA_W bits, signed)
//   sum_re/im   — A+B (DATA_W+1 bits, signed)
//   diff_re/im  — A-B (DATA_W+1 bits, signed)
// =============================================================================
`timescale 1ns/1ps

module butterfly_r2 #(
    parameter DATA_W = 16
) (
    input  wire signed [DATA_W-1:0]   a_re,
    input  wire signed [DATA_W-1:0]   a_im,
    input  wire signed [DATA_W-1:0]   b_re,
    input  wire signed [DATA_W-1:0]   b_im,

    output wire signed [DATA_W:0]     sum_re,
    output wire signed [DATA_W:0]     sum_im,
    output wire signed [DATA_W:0]     diff_re,
    output wire signed [DATA_W:0]     diff_im
);

    // Sign-extend to DATA_W+1 bits before arithmetic to prevent overflow loss
    wire signed [DATA_W:0] a_re_ext = {{1{a_re[DATA_W-1]}}, a_re};
    wire signed [DATA_W:0] a_im_ext = {{1{a_im[DATA_W-1]}}, a_im};
    wire signed [DATA_W:0] b_re_ext = {{1{b_re[DATA_W-1]}}, b_re};
    wire signed [DATA_W:0] b_im_ext = {{1{b_im[DATA_W-1]}}, b_im};

    assign sum_re  = a_re_ext + b_re_ext;
    assign sum_im  = a_im_ext + b_im_ext;
    assign diff_re = a_re_ext - b_re_ext;
    assign diff_im = a_im_ext - b_im_ext;

endmodule
