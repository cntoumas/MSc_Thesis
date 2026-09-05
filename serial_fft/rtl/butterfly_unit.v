module butterfly_unit #(
  parameter DATA_WIDTH = 16,
  parameter TWIDDLE_WIDTH = 16
)(
  input wire clk,
  input wire signed [DATA_WIDTH-1:0] a_re,
  input wire signed [DATA_WIDTH-1:0] a_im,
  input wire signed [DATA_WIDTH-1:0] b_re,
  input wire signed [DATA_WIDTH-1:0] b_im,
  input wire signed [TWIDDLE_WIDTH-1:0] w_re,
  input wire signed [TWIDDLE_WIDTH-1:0] w_im,
  output reg signed [DATA_WIDTH:0] a_prime_re,
  output reg signed [DATA_WIDTH:0] a_prime_im,
  output reg signed [DATA_WIDTH:0] b_prime_re,
  output reg signed [DATA_WIDTH:0] b_prime_im
);

  reg signed [DATA_WIDTH-1:0] a_re_delay [0:3];
  reg signed [DATA_WIDTH-1:0] a_im_delay [0:3];
  wire signed [DATA_WIDTH+TWIDDLE_WIDTH:0] wb_re_raw;
  wire signed [DATA_WIDTH+TWIDDLE_WIDTH:0] wb_im_raw;
  wire signed [DATA_WIDTH:0] wb_re_scaled;
  wire signed [DATA_WIDTH:0] wb_im_scaled;

  complex_mult #(
    .DATA_WIDTH(DATA_WIDTH),
    .TWIDDLE_WIDTH(TWIDDLE_WIDTH)
    ) u_complex_mult (
    .clk(clk),
    .a_re(b_re),
    .a_im(b_im),
    .w_re(w_re),
    .w_im(w_im),
    .prod_re(wb_re_raw),
    .prod_im(wb_im_raw)
  );

  // Extracting the useful bits. In Q1.15 x Q1.15, the lower 15 bits are fractional dust.
  // We extract 17 bits (DATA_WIDTH + 1) to account for potential 1-bit growth.
  assign wb_re_scaled = wb_re_raw[DATA_WIDTH+TWIDDLE_WIDTH-1 : TWIDDLE_WIDTH-1];
  assign wb_im_scaled = wb_im_raw[DATA_WIDTH+TWIDDLE_WIDTH-1 : TWIDDLE_WIDTH-1];

  // Delay A-path to line up with W*B.
  always @(posedge clk) begin : DELAY_PIPELINE_A
    a_re_delay[0] <= a_re;
    a_re_delay[1] <= a_re_delay[0];
    a_re_delay[2] <= a_re_delay[1];
    a_re_delay[3] <= a_re_delay[2];

    a_im_delay[0] <= a_im;
    a_im_delay[1] <= a_im_delay[0];
    a_im_delay[2] <= a_im_delay[1];
    a_im_delay[3] <= a_im_delay[2];
  end

  // Final butterfly add/sub.
  always @(posedge clk) begin : STAGE_5_BUTTERFLY_ADD
    // Sign-extend delayed A to match the 17-bit scaled product
    a_prime_re <= $signed(a_re_delay[3]) + wb_re_scaled;
    a_prime_im <= $signed(a_im_delay[3]) + wb_im_scaled;
    
    b_prime_re <= $signed(a_re_delay[3]) - wb_re_scaled;
    b_prime_im <= $signed(a_im_delay[3]) - wb_im_scaled;
  end

endmodule