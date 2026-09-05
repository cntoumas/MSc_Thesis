module complex_mult #(
    parameter DATA_WIDTH = 16,
    parameter TWIDDLE_WIDTH = 16
  )(
    input wire clk,
    input wire signed [DATA_WIDTH-1:0] a_re,
    input wire signed [DATA_WIDTH-1:0] a_im,
    input wire signed [TWIDDLE_WIDTH-1:0] w_re,
    input wire signed [TWIDDLE_WIDTH-1:0] w_im,
    output reg signed [DATA_WIDTH+TWIDDLE_WIDTH:0] prod_re,
    output reg signed [DATA_WIDTH+TWIDDLE_WIDTH:0] prod_im
  );

  localparam OUT_WIDTH = DATA_WIDTH + TWIDDLE_WIDTH + 1;

  reg signed [DATA_WIDTH:0] a_sum;
  reg signed [TWIDDLE_WIDTH:0] w_sum;
  reg signed [DATA_WIDTH-1:0] a_re_reg;
  reg signed [DATA_WIDTH-1:0] a_im_reg;
  reg signed [TWIDDLE_WIDTH-1:0] w_re_reg;
  reg signed [TWIDDLE_WIDTH-1:0] w_im_reg;
  reg signed [DATA_WIDTH+TWIDDLE_WIDTH-1:0] k1;
  reg signed [DATA_WIDTH+TWIDDLE_WIDTH-1:0] k2;
  reg signed [DATA_WIDTH+TWIDDLE_WIDTH+1:0] k3;
  reg signed [OUT_WIDTH-1:0] prod_re_reg;
  reg signed [OUT_WIDTH-1:0] k12_sum;
  reg signed [DATA_WIDTH+TWIDDLE_WIDTH+1:0] k3_reg;

  // Karatsuba pre-adds and pipeline alignment.
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

  // Hardware multiplications.
  always @(posedge clk)
  begin : STAGE_2_MULT
    k1 <= a_re_reg * w_re_reg;
    k2 <= a_im_reg * w_im_reg;
    k3 <= a_sum * w_sum;
  end

  // First post-add.
  always @(posedge clk)
  begin : STAGE_3_POST_ADD_1
    // Explicit sign extension to force 33-bit algebraic tracking
    prod_re_reg <= {k1[DATA_WIDTH+TWIDDLE_WIDTH-1], k1} - {k2[DATA_WIDTH+TWIDDLE_WIDTH-1], k2};
    k12_sum     <= {k1[DATA_WIDTH+TWIDDLE_WIDTH-1], k1} + {k2[DATA_WIDTH+TWIDDLE_WIDTH-1], k2};
    k3_reg      <= k3;
  end

  // Final post-add and output register.
  always @(posedge clk)
  begin : STAGE_4_POST_ADD_2
    prod_re <= prod_re_reg;
    prod_im <= k3_reg - k12_sum;
  end

endmodule