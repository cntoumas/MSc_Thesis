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