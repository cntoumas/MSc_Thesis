// =============================================================================
// overflow_detect.v — Block Floating Point overflow detector
//
// For each of the P*4 butterfly outputs (DATA_W+1 bits wide), overflow
// occurs when the value cannot be represented in DATA_W signed bits.
// This happens when the two MSBs differ:
//
//   bit[DATA_W] != bit[DATA_W-1]
//   i.e., (bit[DATA_W] XOR bit[DATA_W-1]) == 1
//
// A value v in DATA_W+1 signed bits fits in DATA_W signed bits iff
//   v[DATA_W] == v[DATA_W-1]  (sign bit == next bit = no overflow)
//
// The module ORs the overflow flags from all P*4 values (P paths,
// each with sum_re, sum_im, diff_re, diff_im) and outputs a single
// overflow pulse.  This single bit drives block_scaler.
//
// Interface (flat bus packing — matches fft_stage_fb packing):
//
//   data_in[(p*4 + c)*(DATA_W+1) +: DATA_W+1]
//     p = 0..P-1  (path index)
//     c = 0: sum_re,  1: sum_im,  2: diff_re,  3: diff_im
//
// Parameters:
//   DATA_W — input data width (butterfly inputs), default 16
//   P      — parallelism (number of butterfly units), default 4
// =============================================================================
`timescale 1ns/1ps

module overflow_detect #(
    parameter DATA_W = 16,
    parameter P      = 4
) (
    // P butterflies × 4 components (sum_re, sum_im, diff_re, diff_im)
    // each DATA_W+1 bits wide
    input  wire [P*4*(DATA_W+1)-1:0] data_in,

    output wire                       overflow
);

    localparam N_SIGS = P * 4;             // total number of signals to check
    localparam SW     = DATA_W + 1;        // signal width (butterfly output)

    // Per-signal overflow flags
    wire [N_SIGS-1:0] ovf;

    genvar i;
    generate
        for (i = 0; i < N_SIGS; i = i + 1) begin : g_chk
            wire [SW-1:0] val = data_in[i*SW +: SW];
            // Overflow: sign bit differs from next bit
            assign ovf[i] = val[SW-1] ^ val[SW-2];
        end
    endgenerate

    // Any overflow across all signals → assert overflow
    assign overflow = |ovf;

endmodule
