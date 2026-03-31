//! @brief Karatsuba Complex Multiplier with 4-stage pipeline.
//! This module performs complex multiplication using the Karatsuba
//! algorithm, reducing the required number of hardware multipliers from 4 to 3
//! at the cost of additional adders. It utilizes a 4-clock-cycle latency
//! pipeline to ensure high maximum operating frequency (Fmax) by breaking
//! the arithmetic routing into isolated registered stages.
//! Output bit-width is extended to prevent overflow before the subsequent
//! Block Floating Point (BFP) scaling stage.
module complex_mult #(
    parameter DATA_WIDTH = 16, //! Bit-width of the incoming data (A).
    parameter TWIDDLE_WIDTH = 16 //! Bit-width of the incoming twiddle factor (W).
  )(
    input wire clk,  //! System clock.
    input wire signed [DATA_WIDTH-1:0] a_re, //! Real part of the data input (A_r).
    input wire signed [DATA_WIDTH-1:0] a_im, //! Imaginary part of the data input (A_i).
    input wire signed [TWIDDLE_WIDTH-1:0] w_re, //! Real part of the twiddle factor (W_r).
    input wire signed [TWIDDLE_WIDTH-1:0] w_im, //! Imaginary part of the twiddle factor (W_i).
    output reg signed [DATA_WIDTH+TWIDDLE_WIDTH:0] prod_re, //! Real part of the multiplied output. Width allows for bit growth.
    output reg signed [DATA_WIDTH+TWIDDLE_WIDTH:0] prod_im //! Imaginary part of the multiplied output. Width allows for bit growth.
  );

  localparam OUT_WIDTH = DATA_WIDTH + TWIDDLE_WIDTH + 1;

  reg signed [DATA_WIDTH:0] a_sum;  //! Sum of A's real and imaginary parts. Needs 1 extra bit for overflow.
  reg signed [TWIDDLE_WIDTH:0] w_sum; //! Sum of W's real and imaginary parts. Needs 1 extra bit for overflow.
  reg signed [DATA_WIDTH-1:0] a_re_reg; //! Pipelined delay register for a_re.
  reg signed [DATA_WIDTH-1:0] a_im_reg; //! Pipelined delay register for a_im.
  reg signed [TWIDDLE_WIDTH-1:0] w_re_reg; //! Pipelined delay register for w_re.
  reg signed [TWIDDLE_WIDTH-1:0] w_im_reg; //! Pipelined delay register for w_im.
  reg signed [DATA_WIDTH+TWIDDLE_WIDTH-1:0] k1; //! Multiplier 1 output: A_r * W_r.
  reg signed [DATA_WIDTH+TWIDDLE_WIDTH-1:0] k2; //! Multiplier 2 output: A_i * W_i.
  reg signed [DATA_WIDTH+TWIDDLE_WIDTH+1:0] k3; //! Multiplier 3 output: (A_r + A_i) * (W_r + W_i).
  reg signed [OUT_WIDTH-1:0] prod_re_reg; //! Intermediate register for the Real output calculation (k1 - k2).
  reg signed [OUT_WIDTH-1:0] k12_sum; //! Intermediate register for the sum of k1 and k2.
  reg signed [DATA_WIDTH+TWIDDLE_WIDTH+1:0] k3_reg; //! Pipelined delay register for k3 to align with Stage 4.

  //! **Stage 1: Pre-additions and Input Registration.**
  //! Calculates the sums required for the Karatsuba k3 multiplier
  //! while passing the base inputs through delay registers to keep them
  //! aligned in time.
  always @(posedge clk)
  begin : STAGE_1_PRE_ADD
    // Explicit sign extension to force 17-bit adder inference!
    a_sum    <= {a_re[DATA_WIDTH-1], a_re} + {a_im[DATA_WIDTH-1], a_im};
    w_sum    <= {w_re[TWIDDLE_WIDTH-1], w_re} + {w_im[TWIDDLE_WIDTH-1], w_im};
    a_re_reg <= a_re;
    a_im_reg <= a_im;
    w_re_reg <= w_re;
    w_im_reg <= w_im;
  end

  //! **Stage 2: Hardware Multiplications.**
  //! Executes the three core multiplications. Synthesis tools will
  //! infer DSP slices (e.g., DSP48E1) for these operations.
  always @(posedge clk)
  begin : STAGE_2_MULT
    k1 <= a_re_reg * w_re_reg;
    k2 <= a_im_reg * w_im_reg;
    k3 <= a_sum * w_sum;
  end

  //! **Stage 3: First Post-Addition.**
  //! Completes the Real output calculation (k1 - k2) and pre-calculates
  //! the (k1 + k2) component needed for the Imaginary output. Delays k3.
  always @(posedge clk)
  begin : STAGE_3_POST_ADD_1
    // Explicit sign extension to force 33-bit algebraic tracking
    prod_re_reg <= {k1[DATA_WIDTH+TWIDDLE_WIDTH-1], k1} - {k2[DATA_WIDTH+TWIDDLE_WIDTH-1], k2};
    k12_sum     <= {k1[DATA_WIDTH+TWIDDLE_WIDTH-1], k1} + {k2[DATA_WIDTH+TWIDDLE_WIDTH-1], k2};
    k3_reg      <= k3;
  end

  //! **Stage 4: Final Post-Addition and Output.**
  //! Completes the Imaginary output calculation (k3 - (k1 + k2))
  //! and registers the Real output to align their latencies.
  always @(posedge clk)
  begin : STAGE_4_POST_ADD_2
    prod_re <= prod_re_reg;
    prod_im <= k3_reg - k12_sum;
  end

endmodule
