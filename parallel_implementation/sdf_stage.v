//! @brief Radix-2^2 SDF Stage.
//! Latency: 1 cycle (output register).
module sdf_stage #(
    parameter FFT_SIZE = 4096,
    parameter STAGE_INDEX = 0,
    parameter DATA_WIDTH = 32,
    parameter TWIDDLE_WIDTH = 16,
    parameter P = 16,
    parameter LANE_INDEX = 0
  )(
    input wire clk,
    input wire rst,
    input wire valid_in,
    input wire signed [DATA_WIDTH-1:0] data_in_re,
    input wire signed [DATA_WIDTH-1:0] data_in_im,
    input wire signed [7:0] exp_in,
    output wire valid_out,
    output wire signed [DATA_WIDTH-1:0] data_out_re,
    output wire signed [DATA_WIDTH-1:0] data_out_im,
    output wire signed [7:0] exp_out,
    output wire signed [DATA_WIDTH-1:0] debug_re
  );

  localparam DATA_SIZE = FFT_SIZE / P;
  localparam DEPTH = DATA_SIZE / (2**(STAGE_INDEX + 1));
  localparam IS_COMPLEX_STAGE = (STAGE_INDEX % 2 == 1);

  // 1. Unified Sample Counter
  reg [15:0] stage_cnt;
  always @(posedge clk)
  begin
    if (rst)
      stage_cnt <= 0;
    else if (valid_in)
      stage_cnt <= stage_cnt + 1;
  end

  // 2. Control
  // The commutator switches after the delay line is filled (DEPTH samples).
  wire sdf_sel = (stage_cnt % (2*DEPTH)) >= DEPTH;
  wire current_valid_out = valid_in && (stage_cnt >= DEPTH);

  // 3. Twiddle Logic
  wire signed [TWIDDLE_WIDTH-1:0] w_re, w_im;
  wire [11:0] k_twiddle;

  if (IS_COMPLEX_STAGE)
  begin : GEN_ROM
    // Twiddle for Radix-2^2 Stage 2k+1 is W_N^{n * 2^{2k}}
    wire [31:0] n_idx = (stage_cnt % DEPTH) * P + LANE_INDEX;
    assign k_twiddle = n_idx * (2**(STAGE_INDEX-1));
    twiddle_rom #(.N(FFT_SIZE), .WIDTH(TWIDDLE_WIDTH)) u_twiddle (
                  .clk(clk), .rst(rst), .k(k_twiddle[11:0]), .w_re(w_re), .w_im(w_im)
                );
  end
  else
  begin
    assign w_re = 0;
    assign w_im = 0;
    assign k_twiddle = 0;
  end

  // 4. Butterfly Units
  wire signed [DATA_WIDTH-1:0] del_re, del_im;
  wire signed [DATA_WIDTH-1:0] a_prime_re, a_prime_im, b_prime_re, b_prime_im;

  if (IS_COMPLEX_STAGE)
  begin : GEN_BF
    butterfly_unit #(.DATA_WIDTH(DATA_WIDTH), .TWIDDLE_WIDTH(TWIDDLE_WIDTH)) u_bf (
                     .clk(clk), .rst(rst),
                     .a_re(del_re), .a_im(del_im),
                     .b_re(data_in_re), .b_im(data_in_im),
                     .w_re(w_re), .w_im(w_im),
                     .a_prime_re(a_prime_re), .a_prime_im(a_prime_im),
                     .b_prime_re(b_prime_re), .b_prime_im(b_prime_im)
                   );
  end
  else
  begin : GEN_BF2
    wire [31:0] n_idx = (stage_cnt % DEPTH) * P + LANE_INDEX;
    wire [31:0] k_trivial = n_idx * (2**STAGE_INDEX);
    wire sel_j = ((k_trivial % (FFT_SIZE/2)) >= (FFT_SIZE/4));

    bf2_unit #(.DATA_WIDTH(DATA_WIDTH)) u_bf2 (
               .clk(clk), .rst(rst),
               .a_re(del_re), .a_im(del_im),
               .b_re(data_in_re), .b_im(data_in_im),
               .sel_j(sel_j),
               .res_a_re(a_prime_re), .res_a_im(a_prime_im),
               .res_b_re(b_prime_re), .res_b_im(b_prime_im)
             );
  end

  // 5. Commutator (Switching)
  wire signed [DATA_WIDTH-1:0] raw_fb_re  = sdf_sel ? b_prime_re : data_in_re;
  wire signed [DATA_WIDTH-1:0] raw_fb_im  = sdf_sel ? b_prime_im : data_in_im;
  wire signed [DATA_WIDTH-1:0] raw_out_re = sdf_sel ? a_prime_re : del_re;
  wire signed [DATA_WIDTH-1:0] raw_out_im = sdf_sel ? a_prime_im : del_im;

  // 6. Delay Line
  delay_line #(.DATA_WIDTH(2*DATA_WIDTH), .DEPTH(DEPTH)) u_delay (
               .clk(clk), .rst(rst), .we(valid_in),
               .data_in({raw_fb_re, raw_fb_im}),
               .data_out({del_re, del_im})
             );

  // 7. Output Registration
  reg signed [DATA_WIDTH-1:0] out_re_reg, out_im_reg;
  reg signed [7:0] exp_out_reg;
  reg valid_out_reg;

  always @(posedge clk)
  begin
    if (rst)
    begin
      out_re_reg <= 0;
      out_im_reg <= 0;
      valid_out_reg <= 0;
      exp_out_reg <= 0;
    end
    else
    begin
      out_re_reg <= raw_out_re;
      out_im_reg <= raw_out_im;
      valid_out_reg <= current_valid_out;
      exp_out_reg <= exp_in + 1; // Static BFP scaling
    end
  end

  assign data_out_re = out_re_reg;
  assign data_out_im = out_im_reg;
  assign valid_out   = valid_out_reg;
  assign exp_out     = exp_out_reg;
  assign debug_re    = data_out_re;

endmodule
