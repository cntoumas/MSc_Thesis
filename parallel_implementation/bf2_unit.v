//! @brief Combinational Trivial Butterfly Unit (BF2) for Radix-2^2 SDF.
//! Applies a -j rotation if sel_j is high.
module bf2_unit #(
    parameter DATA_WIDTH = 32
  )(
    input wire clk, // Kept for port compatibility but unused
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

  assign res_a_re = (sum_re >>> 1) + (sum_re[1] & sum_re[0]);
  assign res_a_im = (sum_im >>> 1) + (sum_im[1] & sum_im[0]);

  assign res_b_re = sel_j ? ((diff_im >>> 1) + (diff_im[1] & diff_im[0])) 
                          : ((diff_re >>> 1) + (diff_re[1] & diff_re[0]));
                          
  assign res_b_im = sel_j ? ((neg_diff_re >>> 1) + (neg_diff_re[1] & neg_diff_re[0]))
                          : ((diff_im >>> 1) + (diff_im[1] & diff_im[0]));

endmodule