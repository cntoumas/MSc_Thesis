//! @brief High-Level Parallel FFT Architecture.
//! @details 4096-Point Radix-2^2 SDF FFT with 4-parallel processing lanes.
module parallel_fft_top #(
    parameter FFT_SIZE = 4096,
    parameter P = 16,
    parameter DATA_WIDTH = 32,
    parameter TWIDDLE_WIDTH = 16
  )(
    input wire clk,
    input wire rst,
    input wire valid_in,
    input wire [(P * DATA_WIDTH)-1:0] data_in_re_flat,
    input wire [(P * DATA_WIDTH)-1:0] data_in_im_flat,
    output wire valid_out,
    output wire [(P * DATA_WIDTH)-1:0] data_out_re_flat,
    output wire [(P * DATA_WIDTH)-1:0] data_out_im_flat,
    output wire signed [7:0] global_exp_out
  );

  localparam NUM_STAGES = $clog2(FFT_SIZE);
  localparam SPATIAL_START = $clog2(FFT_SIZE / P); // Stage 10 for 4096/4

  wire [(P * DATA_WIDTH)-1:0] stage_re [0:NUM_STAGES];
  wire [(P * DATA_WIDTH)-1:0] stage_im [0:NUM_STAGES];
  wire signed [7:0]           stage_exp [0:NUM_STAGES];
  wire                        stage_valid [0:NUM_STAGES];

  assign stage_re[0]    = data_in_re_flat;
  assign stage_im[0]    = data_in_im_flat;
  assign stage_valid[0] = valid_in;
  assign stage_exp[0]   = 8'sd0;

  genvar g, l;
  generate
    for (g = 0; g < NUM_STAGES; g = g + 1)
    begin : FFT_STAGE_CASCADE
      if (g < SPATIAL_START)
      begin : TEMPORAL_SECTION
        // Temporal stages: Each lane processes its data independently
        for (l = 0; l < P; l = l + 1)
        begin : LANES
          wire lane_valid_out;
          wire [7:0] lane_exp_out;
          sdf_stage #(
                      .FFT_SIZE(FFT_SIZE),
                      .STAGE_INDEX(g),
                      .DATA_WIDTH(DATA_WIDTH),
                      .TWIDDLE_WIDTH(TWIDDLE_WIDTH),
                      .P(P),
                      .LANE_INDEX(l)
                    ) u_sdf (
                      .clk(clk), .rst(rst),
                      .valid_in(stage_valid[g]),
                      .data_in_re(stage_re[g][(l*DATA_WIDTH) +: DATA_WIDTH]),
                      .data_in_im(stage_im[g][(l*DATA_WIDTH) +: DATA_WIDTH]),
                      .exp_in(stage_exp[g]),
                      .valid_out(lane_valid_out),
                      .data_out_re(stage_re[g+1][(l*DATA_WIDTH) +: DATA_WIDTH]),
                      .data_out_im(stage_im[g+1][(l*DATA_WIDTH) +: DATA_WIDTH]),
                      .exp_out(lane_exp_out),
                      .debug_re()
                    );
          if (l == 0)
          begin
            assign stage_valid[g+1] = lane_valid_out;
            assign stage_exp[g+1]   = lane_exp_out;
          end
        end
      end
      else
      begin : SPATIAL_SECTION
        // Spatial stages: Lanes interact with each other
        parallel_sdf_stage #(
                             .FFT_SIZE(FFT_SIZE),
                             .STAGE_INDEX(g),
                             .DATA_WIDTH(DATA_WIDTH),
                             .TWIDDLE_WIDTH(TWIDDLE_WIDTH),
                             .P(P)
                           ) u_para (
                             .clk(clk), .rst(rst),
                             .valid_in(stage_valid[g]),
                             .data_in_re_flat(stage_re[g]),
                             .data_in_im_flat(stage_im[g]),
                             .exp_in(stage_exp[g]),
                             .valid_out(stage_valid[g+1]),
                             .data_out_re_flat(stage_re[g+1]),
                             .data_out_im_flat(stage_im[g+1]),
                             .exp_out(stage_exp[g+1])
                           );
      end
    end
  endgenerate

  assign data_out_re_flat = stage_re[NUM_STAGES];
  assign data_out_im_flat = stage_im[NUM_STAGES];
  assign valid_out        = stage_valid[NUM_STAGES];
  assign global_exp_out   = stage_exp[NUM_STAGES];

  // Debugging monitors
  genvar m;
  generate
    for (m = 0; m <= NUM_STAGES; m = m + 1)
    begin : DEBUG_MONITOR
      always @(posedge clk)
      begin
        if (stage_valid[m])
        begin
          if (stage_re[m][DATA_WIDTH-1:0] === 1'bx)
            $display("[!] X detected at Stage %0d, Lane 0", m);
        end
      end
    end
  endgenerate

endmodule
