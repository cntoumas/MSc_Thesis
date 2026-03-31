//! @brief Block Floating Point (BFP) Stage Scanner with Early Termination.
//! This module analyzes the output of the Butterfly Unit across an
//! entire FFT stage to determine the optimal scaling factor.
//! To save area and power, it employs an OR-reduction tree on only the upper
//! 9 bits of the incoming data, utilizing one's complement to approximate
//! the magnitude of negative values. It features an early-termination
//! mechanism that power-gates the scanning logic once the maximum possible
//! bit-growth is detected.
module bfp_scanner #(

    parameter INPUT_WIDTH = 17 //! Bit-width of the incoming data from the Butterfly Unit (typically 17)
  )(
    input wire clk, //! System clock
    input wire rst, //! Active-high synchronous reset
    input wire new_stage, //! High for one clock cycle at the start of a new FFT stage to reset the scanner state
    input wire valid_in, //! High when the incoming data samples are valid. The scanner processes data only when this is high.
    input wire signed [INPUT_WIDTH-1:0] a_prime_re, //! Real part of Butterfly output A'.
    input wire signed [INPUT_WIDTH-1:0] a_prime_im, //! Imaginary part of Butterfly output A'.
    input wire signed [INPUT_WIDTH-1:0] b_prime_re, //! Real part of Butterfly output B'.
    input wire signed [INPUT_WIDTH-1:0] b_prime_im, //! Imaginary part of Butterfly output B'.
    output reg [3:0] block_shift_amount, //! The calculated number of bits to shift the data right (0 to 8).
    output reg early_stop //! High when the scanner has detected that the maximum bit-growth has been reached, allowing downstream logic to skip further scanning and directly apply the worst-case shift.
  );


  reg [7:0] running_or_mask; //! The accumulated bitwise OR of all magnitudes in the current stage.
  wire [7:0] mag_a_re; //! The 8-bit approximated magnitude of a_prime_re.
  wire [7:0] mag_a_im; //! The 8-bit approximated magnitude of a_prime_im.
  wire [7:0] mag_b_re; //! The 8-bit approximated magnitude of b_prime_re.
  wire [7:0] mag_b_im; //! The 8-bit approximated magnitude of b_prime_im.
  wire [7:0] cycle_or_mask; //! The combined OR-mask for the current clock cycle, derived from the magnitudes of all 4 inputs.

  //! We only examine the upper 9 bits: INPUT_WIDTH-1 is the sign bit.
  //! INPUT_WIDTH-2 down to INPUT_WIDTH-9 are the top 8 magnitude bits.
  //! If the number is negative (sign bit == 1), we take the one's complement.
  assign mag_a_re = a_prime_re[INPUT_WIDTH-1] ? ~a_prime_re[INPUT_WIDTH-2 : INPUT_WIDTH-9]
         :  a_prime_re[INPUT_WIDTH-2 : INPUT_WIDTH-9];

  assign mag_a_im = a_prime_im[INPUT_WIDTH-1] ? ~a_prime_im[INPUT_WIDTH-2 : INPUT_WIDTH-9]
         :  a_prime_im[INPUT_WIDTH-2 : INPUT_WIDTH-9];

  assign mag_b_re = b_prime_re[INPUT_WIDTH-1] ? ~b_prime_re[INPUT_WIDTH-2 : INPUT_WIDTH-9]
         :  b_prime_re[INPUT_WIDTH-2 : INPUT_WIDTH-9];

  assign mag_b_im = b_prime_im[INPUT_WIDTH-1] ? ~b_prime_im[INPUT_WIDTH-2 : INPUT_WIDTH-9]
         :  b_prime_im[INPUT_WIDTH-2 : INPUT_WIDTH-9];

  //! Combine all 4 magnitudes of this clock cycle into a single mask
  assign cycle_or_mask = mag_a_re | mag_a_im | mag_b_re | mag_b_im;

  //! @brief Stage Mask Accumulator.
  //! @details Accumulates the OR-mask of all samples in the stage.
  //! If the highest bit becomes 1, early_stop is asserted and further
  //! accumulation is halted to save switching power.
  always @(posedge clk)
  begin : MASK_ACCUMULATOR
    if (rst)
    begin
      running_or_mask <= 8'b0;
      early_stop <= 1'b0;
    end
    else if (new_stage)
    begin
      // Reset for the new FFT stage
      running_or_mask <= 8'b0;
      early_stop <= 1'b0;
    end
    else if (valid_in && !early_stop)
    begin
      //! Accumulate the mask only if we haven't hit the worst-case
      running_or_mask <= running_or_mask | cycle_or_mask;

      //! Early termination check: if bit 7 is 1, a sample has reached max amplitude.
      //! The shift amount will definitely be 0, so we can stop scanning.
      if ((running_or_mask | cycle_or_mask) & 8'h80)
      begin
        early_stop <= 1'b1;
      end
    end
  end

  //! Holds the combinational result of the Count Leading Zeros calculation.
  reg [3:0] final_clz;

  //! @brief Priority Encoder for Count Leading Zeros (CLZ).
  //! @details Examines the accumulated 8-bit mask at the end of the stage
  //! to determine how many redundant sign bits exist. This dictates the
  //! safe left-shift amount.
  always @(*)
  begin : CLZ_DECODER
    if      (running_or_mask[7])
      final_clz = 4'd0;
    else if (running_or_mask[6])
      final_clz = 4'd1;
    else if (running_or_mask[5])
      final_clz = 4'd2;
    else if (running_or_mask[4])
      final_clz = 4'd3;
    else if (running_or_mask[3])
      final_clz = 4'd4;
    else if (running_or_mask[2])
      final_clz = 4'd5;
    else if (running_or_mask[1])
      final_clz = 4'd6;
    else if (running_or_mask[0])
      final_clz = 4'd7;
    else
      final_clz = 4'd8; // All top 8 bits are zero
  end


  //! @brief Output Register.
  //! @details Latches the calculated shift amount. In a real system, this
  //! is latched exactly at the end of the stage computation.
  always @(posedge clk)
  begin : OUTPUT_REGISTER
    if (rst)
    begin
      block_shift_amount <= 4'd0;
    end
    else
    begin
      block_shift_amount <= final_clz;
    end
  end
endmodule
