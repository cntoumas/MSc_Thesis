// =============================================================================
// fft_top.v — Top-level 1024-point P=4 MDF Radix-2 DIF FFT
// =============================================================================
`timescale 1ns/1ps

module fft_top #(
    parameter integer DATA_W    = 16,
    parameter integer TWIDDLE_W = 16,
    parameter integer N         = 1024,
    parameter integer P         = 4,
    parameter         HEX_DIR   = "rom"
) (
    input  wire                      clk,
    input  wire                      rst,
    input  wire                      en,
    input  wire                      in_valid,

    input  wire [P*2*DATA_W-1:0]     din,

    output wire                      out_valid,
    output wire [P*2*DATA_W-1:0]     dout,
    output wire [3:0]                blk_exp
);

    // ---------------------------------------------------------------
    // Stage interconnect buses
    // ---------------------------------------------------------------
    wire [P*2*DATA_W-1:0] stage_out [0:9];
    wire [3:0]            stage_exp [0:9];

    reg in_valid_d;
    always @(posedge clk) begin
        if (rst) in_valid_d <= 1'b0;
        else     in_valid_d <= in_valid;
    end
    wire blk_rst_start = in_valid & ~in_valid_d;

    // ---------------------------------------------------------------
    // Pipelined Control Signals
    //
    // The commuted fft_stage_fb architecture moves complex_mult (PIPE_STGS=3)
    // outside the feedback loop onto the dl_out read path.  This adds 3 cycles
    // of output latency per FB stage.  Downstream stages see their inputs
    // 3*k cycles later, where k is the number of upstream FB stages.
    //
    // Tap derivation (cumulative from in_valid):
    //   Stage k input arrives at: sum(DEPTH[0..k-1]) + 4*k cycles
    //     (DEPTH[i] = 128 >> i for i=0..7; 4 = 3 mult pipeline + 1 stage_out_r)
    //   valid_pipe[N] fires N+1 cycles after in_valid, so tap = arrival - 1.
    //
    //   DEPTH sums:  s0=0, s1=128, s2=192, s3=224, s4=240, s5=248, s6=252,
    //                s7=254, s8=255 (all 8 FB stages)
    //   Arrivals:    132, 200, 236, 256, 268, 276, 282, 287, 287
    //   Taps:        131, 199, 235, 255, 267, 275, 281, 286, 286
    //
    // valid_pipe width: 287 bits (indices 0..286).
    // ---------------------------------------------------------------
    reg [286:0] valid_pipe;
    reg [286:0] rst_pipe;

    always @(posedge clk) begin
        if (rst) begin
            valid_pipe <= 287'b0;
            rst_pipe   <= 287'b0;
        end else if (en) begin
            valid_pipe <= {valid_pipe[285:0], in_valid};
            rst_pipe   <= {rst_pipe[285:0],   blk_rst_start};
        end
    end

    wire [9:0] vld_s;
    wire [9:0] rst_s;
    assign vld_s[0] = in_valid;           assign rst_s[0] = blk_rst_start;
    assign vld_s[1] = valid_pipe[131];    assign rst_s[1] = rst_pipe[131];
    assign vld_s[2] = valid_pipe[199];    assign rst_s[2] = rst_pipe[199];
    assign vld_s[3] = valid_pipe[235];    assign rst_s[3] = rst_pipe[235];
    assign vld_s[4] = valid_pipe[255];    assign rst_s[4] = rst_pipe[255];
    assign vld_s[5] = valid_pipe[267];    assign rst_s[5] = rst_pipe[267];
    assign vld_s[6] = valid_pipe[275];    assign rst_s[6] = rst_pipe[275];
    assign vld_s[7] = valid_pipe[281];    assign rst_s[7] = rst_pipe[281];
    assign vld_s[8] = valid_pipe[286];    assign rst_s[8] = rst_pipe[286];
    assign vld_s[9] = valid_pipe[286];    assign rst_s[9] = rst_pipe[286];

    // ---------------------------------------------------------------
    // Inter-stage pipeline registers (added for timing closure).
    //
    // The FB stages have a tight internal feedback loop
    //   (butterfly -> block_scaler -> complex_mult -> delay_line),
    // so inserting a register *inside* the stage breaks the algorithm.
    // Instead, we register the data path BETWEEN stages: each FB stage's
    // output is latched into stage_out_r[k] before being driven into
    // stage k+1.  This breaks the long combinational chain that runs
    // s0 -> s1 -> ... -> s7 and lets each stage close timing at 100 MHz.
    //
    // The valid/rst taps above already account for the +k cycle delay
    // that this introduces (one extra cycle per FB stage).
    // ---------------------------------------------------------------
    reg [P*2*DATA_W-1:0] stage_out_r [0:7];

    integer gi;
    always @(posedge clk) begin
        if (rst) begin
            for (gi = 0; gi < 8; gi = gi + 1)
                stage_out_r[gi] <= {(P*2*DATA_W){1'b0}};
        end else if (en) begin
            for (gi = 0; gi < 8; gi = gi + 1)
                stage_out_r[gi] <= stage_out[gi];
        end
    end

    // ---------------------------------------------------------------
    // FFT Stages 0-7: Radix-2 Feedback (SDF/MDF)
    // ---------------------------------------------------------------
    fft_stage_fb #(.DATA_W(DATA_W), .P(P), .N(N), .STAGE(0)) u_s0 (
        .clk(clk), .rst(rst), .en(en), .in_valid(vld_s[0]), .blk_rst(rst_s[0]),
        .din(din), .dout(stage_out[0]), .blk_exp(stage_exp[0])
    );

    fft_stage_fb #(.DATA_W(DATA_W), .P(P), .N(N), .STAGE(1)) u_s1 (
        .clk(clk), .rst(rst), .en(en), .in_valid(vld_s[1]), .blk_rst(rst_s[1]),
        .din(stage_out_r[0]), .dout(stage_out[1]), .blk_exp(stage_exp[1])
    );

    fft_stage_fb #(.DATA_W(DATA_W), .P(P), .N(N), .STAGE(2)) u_s2 (
        .clk(clk), .rst(rst), .en(en), .in_valid(vld_s[2]), .blk_rst(rst_s[2]),
        .din(stage_out_r[1]), .dout(stage_out[2]), .blk_exp(stage_exp[2])
    );

    fft_stage_fb #(.DATA_W(DATA_W), .P(P), .N(N), .STAGE(3)) u_s3 (
        .clk(clk), .rst(rst), .en(en), .in_valid(vld_s[3]), .blk_rst(rst_s[3]),
        .din(stage_out_r[2]), .dout(stage_out[3]), .blk_exp(stage_exp[3])
    );

    fft_stage_fb #(.DATA_W(DATA_W), .P(P), .N(N), .STAGE(4)) u_s4 (
        .clk(clk), .rst(rst), .en(en), .in_valid(vld_s[4]), .blk_rst(rst_s[4]),
        .din(stage_out_r[3]), .dout(stage_out[4]), .blk_exp(stage_exp[4])
    );

    fft_stage_fb #(.DATA_W(DATA_W), .P(P), .N(N), .STAGE(5)) u_s5 (
        .clk(clk), .rst(rst), .en(en), .in_valid(vld_s[5]), .blk_rst(rst_s[5]),
        .din(stage_out_r[4]), .dout(stage_out[5]), .blk_exp(stage_exp[5])
    );

    fft_stage_fb #(.DATA_W(DATA_W), .P(P), .N(N), .STAGE(6)) u_s6 (
        .clk(clk), .rst(rst), .en(en), .in_valid(vld_s[6]), .blk_rst(rst_s[6]),
        .din(stage_out_r[5]), .dout(stage_out[6]), .blk_exp(stage_exp[6])
    );

    fft_stage_fb #(.DATA_W(DATA_W), .P(P), .N(N), .STAGE(7)) u_s7 (
        .clk(clk), .rst(rst), .en(en), .in_valid(vld_s[7]), .blk_rst(rst_s[7]),
        .din(stage_out_r[6]), .dout(stage_out[7]), .blk_exp(stage_exp[7])
    );

    // ---------------------------------------------------------------
    // FFT Stages 8-9: No-Feedback (combinational twiddles)
    // ---------------------------------------------------------------
    fft_stage_nf #(.DATA_W(DATA_W), .P(P), .IDX(0)) u_s8 (
        .clk(clk), .rst(rst), .blk_rst(rst_s[8]),
        .din(stage_out_r[7]), .dout(stage_out[8]), .blk_exp(stage_exp[8])
    );

    fft_stage_nf #(.DATA_W(DATA_W), .P(P), .IDX(1)) u_s9 (
        .clk(clk), .rst(rst), .blk_rst(rst_s[9]),
        .din(stage_out[8]), .dout(stage_out[9]), .blk_exp(stage_exp[9])
    );

    wire delayed_valid = vld_s[9];

    // ---------------------------------------------------------------
    // Output Reordering (Bit-reversal for P=4 parallel)
    // ---------------------------------------------------------------
    bit_reverse #(.DATA_W(DATA_W), .N(N), .P(P)) u_reorder (
        .clk       (clk),
        .rst       (rst),
        .in_valid  (vld_s[9]),
        .din       (stage_out[9]),
        .out_valid (out_valid),
        .dout      (dout)
    );

    // ---------------------------------------------------------------
    // Block Floating Point Exponent Reporting
    // Total exponent is always 10 with fixed conservative scaling
    // ---------------------------------------------------------------
    assign blk_exp = 4'd10;

endmodule
