module bfp_scanner #(
    parameter INPUT_WIDTH = 17
  )(
    input wire clk,
    input wire rst,
    input wire new_stage,
    input wire valid_in,
    input wire signed [INPUT_WIDTH-1:0] a_prime_re,
    input wire signed [INPUT_WIDTH-1:0] a_prime_im,
    input wire signed [INPUT_WIDTH-1:0] b_prime_re,
    input wire signed [INPUT_WIDTH-1:0] b_prime_im,
    output reg [3:0] block_shift_amount,
    output reg early_stop
  );

  reg [7:0] running_or_mask;
  wire [7:0] mag_a_re;
  wire [7:0] mag_a_im;
  wire [7:0] mag_b_re;
  wire [7:0] mag_b_im;
  wire [7:0] cycle_or_mask;

  // We only examine the upper 9 bits: INPUT_WIDTH-1 is the sign bit.
  // INPUT_WIDTH-2 down to INPUT_WIDTH-9 are the top 8 magnitude bits.
  // If the number is negative (sign bit == 1), we take the one's complement.

  assign mag_a_re = a_prime_re[INPUT_WIDTH-1] ? ~a_prime_re[INPUT_WIDTH-2 : INPUT_WIDTH-9]
         :  a_prime_re[INPUT_WIDTH-2 : INPUT_WIDTH-9];

  assign mag_a_im = a_prime_im[INPUT_WIDTH-1] ? ~a_prime_im[INPUT_WIDTH-2 : INPUT_WIDTH-9]
         :  a_prime_im[INPUT_WIDTH-2 : INPUT_WIDTH-9];

  assign mag_b_re = b_prime_re[INPUT_WIDTH-1] ? ~b_prime_re[INPUT_WIDTH-2 : INPUT_WIDTH-9]
         :  b_prime_re[INPUT_WIDTH-2 : INPUT_WIDTH-9];

  assign mag_b_im = b_prime_im[INPUT_WIDTH-1] ? ~b_prime_im[INPUT_WIDTH-2 : INPUT_WIDTH-9]
         :  b_prime_im[INPUT_WIDTH-2 : INPUT_WIDTH-9];

  // Combine all 4 magnitudes of this clock cycle into a single mask
  assign cycle_or_mask = mag_a_re | mag_a_im | mag_b_re | mag_b_im;

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
      // Accumulate the mask only if we haven't hit the worst-case
      running_or_mask <= running_or_mask | cycle_or_mask;

      // Early termination check: if bit 7 is 1, a sample has reached max amplitude.
      // The shift amount will definitely be 0, so we can stop scanning.
      if ((running_or_mask | cycle_or_mask) & 8'h80)
      begin
        early_stop <= 1'b1;
      end
    end
  end

  reg [3:0] final_clz;

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