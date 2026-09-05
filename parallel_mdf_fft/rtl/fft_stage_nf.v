`timescale 1ns/1ps

module fft_stage_nf #(
    parameter integer DATA_W = 16,
    parameter integer P      = 4,    // must be 4
    parameter integer IDX    = 0     // 0=stage8, 1=stage9
) (
    input  wire                  clk,
    input  wire                  rst,
    input  wire                  blk_rst,   // reset blk_exp at block boundary

    input  wire [P*2*DATA_W-1:0] din,
    output wire [P*2*DATA_W-1:0] dout,
    output wire [3:0]            blk_exp
);

    localparam SW = DATA_W + 1;      // butterfly output width

    wire signed [DATA_W-1:0] in_re [0:P-1];
    wire signed [DATA_W-1:0] in_im [0:P-1];

    genvar p;
    generate
        for (p = 0; p < P; p = p + 1) begin : g_unpack
            assign in_re[p] = $signed(din[p*2*DATA_W          +: DATA_W]);
            assign in_im[p] = $signed(din[p*2*DATA_W + DATA_W +: DATA_W]);
        end
    endgenerate

    // Butterfly outputs (before twiddle), DATA_W+1 wide
    wire signed [SW-1:0] sum_re [0:1];
    wire signed [SW-1:0] sum_im [0:1];
    wire signed [SW-1:0] diff_re[0:1];
    wire signed [SW-1:0] diff_im[0:1];

    // Stage 8 (IDX=0): pair (0,2) and (1,3)
    // Stage 9 (IDX=1): pair (0,1) and (2,3)
    generate
        if (IDX == 0) begin : g_stage8
            // Pair A: paths 0 and 2
            butterfly_r2 #(.DATA_W(DATA_W)) u_bf0 (
                .a_re(in_re[0]), .a_im(in_im[0]),
                .b_re(in_re[2]), .b_im(in_im[2]),
                .sum_re (sum_re[0]),  .sum_im (sum_im[0]),
                .diff_re(diff_re[0]), .diff_im(diff_im[0])
            );
            // Pair B: paths 1 and 3
            butterfly_r2 #(.DATA_W(DATA_W)) u_bf1 (
                .a_re(in_re[1]), .a_im(in_im[1]),
                .b_re(in_re[3]), .b_im(in_im[3]),
                .sum_re (sum_re[1]),  .sum_im (sum_im[1]),
                .diff_re(diff_re[1]), .diff_im(diff_im[1])
            );
        end else begin : g_stage9
            // Pair A: paths 0 and 1
            butterfly_r2 #(.DATA_W(DATA_W)) u_bf0 (
                .a_re(in_re[0]), .a_im(in_im[0]),
                .b_re(in_re[1]), .b_im(in_im[1]),
                .sum_re (sum_re[0]),  .sum_im (sum_im[0]),
                .diff_re(diff_re[0]), .diff_im(diff_im[0])
            );
            // Pair B: paths 2 and 3
            butterfly_r2 #(.DATA_W(DATA_W)) u_bf1 (
                .a_re(in_re[2]), .a_im(in_im[2]),
                .b_re(in_re[3]), .b_im(in_im[3]),
                .sum_re (sum_re[1]),  .sum_im (sum_im[1]),
                .diff_re(diff_re[1]), .diff_im(diff_im[1])
            );
        end
    endgenerate

    // Twiddle application (wire-only, no multiplier):
    //
    //   Stage 8 (IDX=0):
    //     pair A → diff0 × W_4^0 = diff0 × 1      : no-op
    //     pair B → diff1 × W_4^1 = diff1 × (-j)   : re_out=+im_in, im_out=-re_in
    //
    //   Stage 9 (IDX=1):
    //     both pairs → diff × W_2^0 = diff × 1    : no-op
    //
    // After twiddle, pack all 4 outputs into the BFP input bus.
    // Bus packing: [(p*4+c)*SW +: SW], c=0:sum_re, 1:sum_im, 2:diff_re, 3:diff_im
    // Paths: 0=sum_pair_A, 1=sum_pair_B, 2=diff_pair_A, 3=diff_pair_B
    wire [P*4*SW-1:0] bf_packed;

    generate
        if (IDX == 0) begin : g_tw8
            // Path 0 ← sum of pair A
            assign bf_packed[(0*4+0)*SW +: SW] = sum_re[0];
            assign bf_packed[(0*4+1)*SW +: SW] = sum_im[0];
            // Path 1 ← sum of pair B
            assign bf_packed[(1*4+0)*SW +: SW] = sum_re[1];
            assign bf_packed[(1*4+1)*SW +: SW] = sum_im[1];
            // Path 2 ← diff of pair A × W_4^0 = diff (no-op)
            assign bf_packed[(2*4+0)*SW +: SW] = diff_re[0];
            assign bf_packed[(2*4+1)*SW +: SW] = diff_im[0];
            // Path 3 ← diff of pair B × W_4^1 = diff × (-j):
            //   re_out = +im_diff,  im_out = -re_diff
            assign bf_packed[(3*4+0)*SW +: SW] =  diff_im[1];    // +im
            assign bf_packed[(3*4+1)*SW +: SW] = -diff_re[1];    // -re
            // Unused diff slots (overflow_detect ignores these fields)
            // We use sum/diff order for overflow_detect packing:
            // Actually the overflow_detect checks all P*4 fields.
            // For NF stages, bf_packed holds 4 OUTPUT paths × 2 (re+im) = 8
            // values but packed as if it were P=4 butterflies.
            // Assign diff slots to 0 (they won't create spurious overflow).
            assign bf_packed[(0*4+2)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(0*4+3)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(1*4+2)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(1*4+3)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(2*4+2)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(2*4+3)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(3*4+2)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(3*4+3)*SW +: SW] = {SW{1'b0}};
        end else begin : g_tw9
            // Path 0 ← sum of pair A
            assign bf_packed[(0*4+0)*SW +: SW] = sum_re[0];
            assign bf_packed[(0*4+1)*SW +: SW] = sum_im[0];
            // Path 1 ← diff of pair A × W_2^0 = diff (no-op)
            assign bf_packed[(1*4+0)*SW +: SW] = diff_re[0];
            assign bf_packed[(1*4+1)*SW +: SW] = diff_im[0];
            // Path 2 ← sum of pair B
            assign bf_packed[(2*4+0)*SW +: SW] = sum_re[1];
            assign bf_packed[(2*4+1)*SW +: SW] = sum_im[1];
            // Path 3 ← diff of pair B × W_2^0 = diff (no-op)
            assign bf_packed[(3*4+0)*SW +: SW] = diff_re[1];
            assign bf_packed[(3*4+1)*SW +: SW] = diff_im[1];
            // Unused diff slots
            assign bf_packed[(0*4+2)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(0*4+3)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(1*4+2)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(1*4+3)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(2*4+2)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(2*4+3)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(3*4+2)*SW +: SW] = {SW{1'b0}};
            assign bf_packed[(3*4+3)*SW +: SW] = {SW{1'b0}};
        end
    endgenerate

    // BFP: overflow detect + scale
    // Detect overflow across the 8 active output components
    // (only the first 2 slots per path are populated above)
    wire                  overflow;
    wire [P*4*DATA_W-1:0] scaled;

    overflow_detect #(.DATA_W(DATA_W), .P(P)) u_ovf (
        .data_in (bf_packed),
        .overflow(overflow)
    );

    block_scaler #(.DATA_W(DATA_W), .P(P), .EXP_W(4)) u_scaler (
        .clk      (clk),
        .rst      (rst),
        .blk_rst  (blk_rst),
        .data_in  (bf_packed),
        .overflow (overflow),
        .data_out (scaled),
        .blk_exp  (blk_exp)
    );

    // Extract output paths from scaled bus (using slot c=0 for re, c=1 for im)
    // scaled packing: [(p*4+c)*DATA_W +: DATA_W]
    generate
        for (p = 0; p < P; p = p + 1) begin : g_pack_out
            assign dout[p*2*DATA_W          +: DATA_W] = scaled[(p*4+0)*DATA_W +: DATA_W];
            assign dout[p*2*DATA_W + DATA_W +: DATA_W] = scaled[(p*4+1)*DATA_W +: DATA_W];
        end
    endgenerate

endmodule