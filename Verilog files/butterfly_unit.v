//! @brief Pipelined Radix-2 Decimation-In-Time (DIT) Butterfly Unit.
//! This module performs the core FFT butterfly calculation:
//! A' = A + W * B and B' = A - W * B.
//! It instantiates a 4-cycle latency Karatsuba complex multiplier for the
//! W * B operation. To maintain data alignment, the 'A' input is passed
//! through a 4-stage delay pipeline. The multiplier product is scaled back
//! to the base format, and the final addition/subtraction expands the
//! bit-width by 1 bit to prevent overflow, preparing the data for the
//! subsequent Block Floating Point (BFP) analysis. Total latency is 5 cycles.
module butterfly_unit #(
    parameter DATA_WIDTH = 16, //! Bit-width of the incoming data samples (A and B).
    parameter TWIDDLE_WIDTH = 16 //! Bit-width of the incoming twiddle factor (W).
  )(
    input wire clk, //! System clock.
    input wire signed [DATA_WIDTH-1:0] a_re, //! Real part of input A.
    input wire signed [DATA_WIDTH-1:0] a_im, //! Imaginary part of input A.
    input wire signed [DATA_WIDTH-1:0] b_re, //! Real part of input B.
    input wire signed [DATA_WIDTH-1:0] b_im, //! Imaginary part of input B.
    input wire signed [TWIDDLE_WIDTH-1:0] w_re, //! Real part of the twiddle factor W.
    input wire signed [TWIDDLE_WIDTH-1:0] w_im, //! Imaginary part of the twiddle factor W.
    output reg signed [DATA_WIDTH:0] a_prime_re, //! Real part of output A' (A + W*B). Width expanded by 1 bit for growth.
    output reg signed [DATA_WIDTH:0] a_prime_im, //! Imaginary part of output A' (A + W*B). Width expanded by 1 bit for growth.
    output reg signed [DATA_WIDTH:0] b_prime_re, //! Real part of output B' (A - W*B). Width expanded by 1 bit for growth.
    output reg signed [DATA_WIDTH:0] b_prime_im //! Imaginary part of output B' (A - W*B). Width expanded by 1 bit for growth.
  );

  reg signed [DATA_WIDTH-1:0] a_re_delay [0:3]; //! 4-stage shift register to delay the Real part of A.
  reg signed [DATA_WIDTH-1:0] a_im_delay [0:3]; //! 4-stage shift register to delay the Imaginary part of A.
  wire signed [DATA_WIDTH+TWIDDLE_WIDTH:0] wb_re_raw; //! Raw 33-bit real output from the complex multiplier.
  wire signed [DATA_WIDTH+TWIDDLE_WIDTH:0] wb_im_raw; //! Raw 33-bit imaginary output from the complex multiplier.
  wire signed [DATA_WIDTH:0] wb_re_scaled; //! Scaled real product. Drops the lower fractional bits to align with A.
  wire signed [DATA_WIDTH:0] wb_im_scaled; //! Scaled imaginary product. Drops the lower fractional bits to align with A.

  //! **Multiplier Instantiation (Stages 1 to 4).**
  //! Computes W * B with a 4-clock-cycle latency.
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

  //! **Extracting the useful bits.**
  //! In Q1.15 x Q1.15, the lower 15 bits are fractional dust.
  //! We extract 17 bits (DATA_WIDTH + 1) to account for potential 1-bit growth.
  assign wb_re_scaled = wb_re_raw[DATA_WIDTH+TWIDDLE_WIDTH-1 : TWIDDLE_WIDTH-1];
  assign wb_im_scaled = wb_im_raw[DATA_WIDTH+TWIDDLE_WIDTH-1 : TWIDDLE_WIDTH-1];

  //! **A-Path Delay Pipeline.**
  //! Delays the A input so it arrives at the final adders exactly
  //! when the W * B product emerges from the complex multiplier.
  always @(posedge clk)
  begin : DELAY_PIPELINE_A
    a_re_delay[0] <= a_re;
    a_re_delay[1] <= a_re_delay[0];
    a_re_delay[2] <= a_re_delay[1];
    a_re_delay[3] <= a_re_delay[2];

    a_im_delay[0] <= a_im;
    a_im_delay[1] <= a_im_delay[0];
    a_im_delay[2] <= a_im_delay[1];
    a_im_delay[3] <= a_im_delay[2];
  end

  //! **Stage 5: Final Butterfly Add/Sub.**
  //! Computes A +/- (W*B) using the delayed A and the scaled product.
  //! Output expands by 1 bit to securely hold the maximum possible values
  //! for the Block Floating Point unit.
  always @(posedge clk)
  begin : STAGE_5_BUTTERFLY_ADD
    // Sign-extend delayed A to match the 17-bit scaled product
    a_prime_re <= $signed(a_re_delay[3]) + wb_re_scaled;
    a_prime_im <= $signed(a_im_delay[3]) + wb_im_scaled;

    b_prime_re <= $signed(a_re_delay[3]) - wb_re_scaled;
    b_prime_im <= $signed(a_im_delay[3]) - wb_im_scaled;
  end

endmodule
