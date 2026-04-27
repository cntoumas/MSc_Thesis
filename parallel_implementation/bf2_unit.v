module bf2_unit #(
    parameter DATA_WIDTH = 32
)(
    input wire clk,
    input wire rst,
    input wire sel_j,
    input wire signed [DATA_WIDTH-1:0] a_re,
    input wire signed [DATA_WIDTH-1:0] a_im,
    input wire signed [DATA_WIDTH-1:0] b_re,
    input wire signed [DATA_WIDTH-1:0] b_im,
    output wire signed [DATA_WIDTH-1:0] res_a_re,
    output wire signed [DATA_WIDTH-1:0] res_a_im,
    output wire signed [DATA_WIDTH-1:0] res_b_re,
    output wire signed [DATA_WIDTH-1:0] res_b_im
);

    wire signed [DATA_WIDTH:0] sum_re  = a_re + b_re;
    wire signed [DATA_WIDTH:0] sum_im  = a_im + b_im;
    wire signed [DATA_WIDTH:0] diff_re = a_re - b_re;
    wire signed [DATA_WIDTH:0] diff_im = a_im - b_im;
    wire signed [DATA_WIDTH:0] neg_diff_re = -diff_re;

    // Signed right shift by 1: {sign_bit, upper_bits_dropping_LSB}
    assign res_a_re = {sum_re[DATA_WIDTH], sum_re[DATA_WIDTH-1:1]};
    assign res_a_im = {sum_im[DATA_WIDTH], sum_im[DATA_WIDTH-1:1]};

    assign res_b_re = sel_j ? {diff_im[DATA_WIDTH], diff_im[DATA_WIDTH-1:1]}
                            : {diff_re[DATA_WIDTH], diff_re[DATA_WIDTH-1:1]};
                            
    assign res_b_im = sel_j ? {neg_diff_re[DATA_WIDTH], neg_diff_re[DATA_WIDTH-1:1]}
                            : {diff_im[DATA_WIDTH], diff_im[DATA_WIDTH-1:1]};

endmodule