// =============================================================================
// block_scaler.v — Fixed-Scaling Unit (Conservative)
// =============================================================================
`timescale 1ns/1ps

module block_scaler #(
    parameter integer DATA_W = 16,
    parameter integer P      = 4,
    parameter integer EXP_W  = 4
) (
    input  wire                       clk,
    input  wire                       rst,
    input  wire                       blk_rst,

    input  wire [P*4*(DATA_W+1)-1:0]  data_in,
    input  wire                       overflow,  // ignored in fixed scaling
    output wire [P*4*DATA_W-1:0]      data_out,
    output wire [EXP_W-1:0]           blk_exp
);

    // In conservative scaling, we ALWAYS shift right by 1 at every stage
    // to prevent any possibility of overflow.
    assign blk_exp = 4'd1;

    genvar i;
    generate
        for (i = 0; i < P*4; i = i + 1) begin : g_scale
            wire signed [DATA_W:0] v = $signed(data_in[i*(DATA_W+1) +: DATA_W+1]);

            // Round-to-even shift right by 1
            // v[0] is the bit being dropped.
            // v[1] is the new LSB.
            wire rnd = v[0] & v[1];
            wire signed [DATA_W-1:0] shifted = v[DATA_W:1] + rnd;

            assign data_out[i*DATA_W +: DATA_W] = shifted;
        end
    endgenerate

endmodule
