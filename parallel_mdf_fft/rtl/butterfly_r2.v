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