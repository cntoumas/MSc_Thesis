//! @brief Block Floating Point Barrel Shifter and Exponent Tracker.
module bfp_shifter #(
    parameter INPUT_WIDTH = 17,
    parameter OUTPUT_WIDTH = 16
  )(
    input wire clk,
    input wire rst,
    input wire signed [INPUT_WIDTH-1:0] a_in_re,
    input wire signed [INPUT_WIDTH-1:0] a_in_im,
    input wire signed [INPUT_WIDTH-1:0] b_in_re,
    input wire signed [INPUT_WIDTH-1:0] b_in_im,
    input wire [3:0] block_clz,
    input wire signed [7:0] exp_in,
    output reg signed [OUTPUT_WIDTH-1:0] a_out_re,
    output reg signed [OUTPUT_WIDTH-1:0] a_out_im,
    output reg signed [OUTPUT_WIDTH-1:0] b_out_re,
    output reg signed [OUTPUT_WIDTH-1:0] b_out_im,
    output reg signed [7:0] exp_out
  );

  always @(posedge clk) begin
    if (rst) begin
      a_out_re <= 0; a_out_im <= 0;
      b_out_re <= 0; b_out_im <= 0;
      exp_out  <= 0;
    end else begin
      // Fixed scaling: Divide by 2 to prevent overflow at every stage
      // This is more robust than dynamic left-shifting without a frame buffer
      a_out_re <= a_in_re[INPUT_WIDTH-1 : 1];
      a_out_im <= a_in_im[INPUT_WIDTH-1 : 1];
      b_out_re <= b_in_re[INPUT_WIDTH-1 : 1];
      b_out_im <= b_in_im[INPUT_WIDTH-1 : 1];
      exp_out  <= exp_in + 1;
    end
  end

endmodule
