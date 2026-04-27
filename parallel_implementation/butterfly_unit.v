module butterfly_unit #(
    parameter DATA_WIDTH = 32,
    parameter TWIDDLE_WIDTH = 16
)(
    input wire clk,
    input wire rst,
    input wire signed [DATA_WIDTH-1:0] a_re,
    input wire signed [DATA_WIDTH-1:0] a_im,
    input wire signed [DATA_WIDTH-1:0] b_re,
    input wire signed [DATA_WIDTH-1:0] b_im,
    input wire signed [TWIDDLE_WIDTH-1:0] w_re,
    input wire signed [TWIDDLE_WIDTH-1:0] w_im,
    output wire signed [DATA_WIDTH-1:0] a_prime_re,
    output wire signed [DATA_WIDTH-1:0] a_prime_im,
    output wire signed [DATA_WIDTH-1:0] b_prime_re,
    output wire signed [DATA_WIDTH-1:0] b_prime_im
);

    wire signed [DATA_WIDTH:0] sum_re  = a_re + b_re;
    wire signed [DATA_WIDTH:0] sum_im  = a_im + b_im;
    wire signed [DATA_WIDTH:0] diff_re = a_re - b_re;
    wire signed [DATA_WIDTH:0] diff_im = a_im - b_im;

    // A path: signed divide by 2
    assign a_prime_re = {sum_re[DATA_WIDTH], sum_re[DATA_WIDTH-1:1]};
    assign a_prime_im = {sum_im[DATA_WIDTH], sum_im[DATA_WIDTH-1:1]};

    wire signed [DATA_WIDTH:0] diff_re_ext = diff_re;
    wire signed [DATA_WIDTH:0] diff_im_ext = diff_im;

    wire signed [DATA_WIDTH+TWIDDLE_WIDTH+1:0] prod_re, prod_im;
    complex_mult #(
        .DATA_WIDTH(DATA_WIDTH+1),
        .TWIDDLE_WIDTH(TWIDDLE_WIDTH)
    ) u_complex_mult (
        .clk(clk), .rst(rst),
        .a_re(diff_re_ext), .a_im(diff_im_ext),
        .w_re(w_re), .w_im(w_im),
        .prod_re(prod_re), .prod_im(prod_im)
    );

    // B path: signed divide by 2^TWIDDLE_WIDTH, truncate to DATA_WIDTH
    localparam PROD_WIDTH = DATA_WIDTH + TWIDDLE_WIDTH + 2;
    wire signed [PROD_WIDTH-1:0] prod_re_shifted = prod_re >>> TWIDDLE_WIDTH;
    wire signed [PROD_WIDTH-1:0] prod_im_shifted = prod_im >>> TWIDDLE_WIDTH;

    assign b_prime_re = prod_re_shifted;
    assign b_prime_im = prod_im_shifted;

endmodule