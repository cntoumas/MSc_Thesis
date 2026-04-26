//! @brief Combinational Butterfly Unit for Radix-2^2 SDF.
//! Implements Convergent Rounding (Round-to-Nearest-Even).
module butterfly_unit #(
    parameter DATA_WIDTH = 32,
    parameter TWIDDLE_WIDTH = 16
  )(
    input wire clk, // Kept for port compatibility but unused
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

  // Butterfly (A+B, A-B)
  wire signed [DATA_WIDTH:0] sum_re  = a_re + b_re;
  wire signed [DATA_WIDTH:0] sum_im  = a_im + b_im;
  wire signed [DATA_WIDTH:0] diff_re = a_re - b_re;
  wire signed [DATA_WIDTH:0] diff_im = a_im - b_im;

  // Complex Multiplication
  wire signed [DATA_WIDTH+TWIDDLE_WIDTH+1:0] prod_re, prod_im;
  complex_mult #(
                 .DATA_WIDTH(DATA_WIDTH+1),
                 .TWIDDLE_WIDTH(TWIDDLE_WIDTH)
               ) u_complex_mult (
                 .clk(clk), .rst(rst),
                 .a_re(diff_re), .a_im(diff_im),
                 .w_re(w_re), .w_im(w_im),
                 .prod_re(prod_re), .prod_im(prod_im)
               );

  // Convergent Rounding (Round-to-Nearest-Even)
  // Total shift is TWIDDLE_WIDTH.
  localparam SHIFT_AMT = TWIDDLE_WIDTH;
  wire round_b_re = prod_re[SHIFT_AMT-1] & (prod_re[SHIFT_AMT] | (|prod_re[SHIFT_AMT-2:0]));
  wire round_b_im = prod_im[SHIFT_AMT-1] & (prod_im[SHIFT_AMT] | (|prod_im[SHIFT_AMT-2:0]));

  wire signed [DATA_WIDTH-1:0] b_re_rounded = (prod_re >>> SHIFT_AMT) + round_b_re;
  wire signed [DATA_WIDTH-1:0] b_im_rounded = (prod_im >>> SHIFT_AMT) + round_b_im;

  // Convergent Rounding for the Sum path (shift by 1)
  assign a_prime_re = (sum_re >>> 1) + (sum_re[1] & sum_re[0]);
  assign a_prime_im = (sum_im >>> 1) + (sum_im[1] & sum_im[0]);

  assign b_prime_re = b_re_rounded;
  assign b_prime_im = b_im_rounded;

endmodule
