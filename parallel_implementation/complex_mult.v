//! @brief Parameterized Complex Multiplier (3-Multiplier Karatsuba).
//! Combinational version for SDF pipeline alignment.
module complex_mult #(
    parameter DATA_WIDTH = 33,
    parameter TWIDDLE_WIDTH = 32
  )(
    input wire clk, // Kept for port compatibility but unused
    input wire rst,
    input wire signed [DATA_WIDTH-1:0] a_re,
    input wire signed [DATA_WIDTH-1:0] a_im,
    input wire signed [TWIDDLE_WIDTH-1:0] w_re,
    input wire signed [TWIDDLE_WIDTH-1:0] w_im,
    output wire signed [DATA_WIDTH+TWIDDLE_WIDTH:0] prod_re,
    output wire signed [DATA_WIDTH+TWIDDLE_WIDTH:0] prod_im
  );

  // Widths for Karatsuba intermediate products
  localparam K12_WIDTH = DATA_WIDTH + TWIDDLE_WIDTH;
  localparam K3_WIDTH  = DATA_WIDTH + TWIDDLE_WIDTH + 2; 

  wire signed [DATA_WIDTH:0] a_sum = a_re + a_im;
  wire signed [TWIDDLE_WIDTH:0] w_sum = w_re + w_im;

  wire signed [K12_WIDTH-1:0] k1 = a_re * w_re;
  wire signed [K12_WIDTH-1:0] k2 = a_im * w_im;
  wire signed [K3_WIDTH-1:0] k3 = a_sum * w_sum;

  wire signed [K3_WIDTH-1:0] k12_sum = k1 + k2;

  assign prod_re = k1 - k2;
  wire signed [K3_WIDTH-1:0] prod_im_wide = k3 - k12_sum;
  assign prod_im = prod_im_wide[DATA_WIDTH+TWIDDLE_WIDTH:0];

endmodule
