// =============================================================================
// fft_stage_fb.v — MDF Radix-2 DIF Feedback Stage (parallel, P=4 paths)
//
// Commuted architecture for 100 MHz timing closure:
//
//   Standard MDF writes (diff × twiddle) back to the delay line, placing the
//   complex multiplier inside the feedback loop:
//       dl_out → butterfly → scaler → complex_mult → dl_in
//   The full combinational path (LUTRAM + adders + 3 DSP48s + adders) is
//   ~15 ns and fails timing at 100 MHz.
//
//   This commuted version instead:
//     1. Writes raw diff_scaled back to the delay line — no multiplier in the loop.
//     2. Reads diff_scaled from dl_out during the LOAD phase and multiplies
//        by the twiddle factor then (pipelined, PIPE_STGS=3).
//     3. Delays butterfly_phase and sum_bus_scaled by 3 cycles so the output
//        mux stays aligned with the pipelined multiplier output.
//
//   Feedback loop is now: dl_out → butterfly → scaler → dl_in
//   (additions and shifts only, closes comfortably at 100 MHz).
//
//   Each stage's output latency increases by 3 cycles vs the standard MDF.
//   fft_top.v compensates by shifting valid_pipe/rst_pipe taps by +3 per
//   upstream FB stage (cumulative: +3k for stage k).
// =============================================================================
`timescale 1ns/1ps

module fft_stage_fb #(
    parameter integer DATA_W    = 16,
    parameter integer TWIDDLE_W = 16,
    parameter integer N         = 1024,
    parameter integer P         = 4,
    parameter integer STAGE     = 0
) (
    input  wire                  clk,
    input  wire                  rst,
    input  wire                  en,
    input  wire                  in_valid,
    input  wire                  blk_rst,

    input  wire [P*2*DATA_W-1:0] din,
    output wire [P*2*DATA_W-1:0] dout,
    output wire [3:0]            blk_exp
);

    localparam DEPTH = N / (P * (2**(STAGE+1)));
    localparam AW    = (DEPTH <= 1) ? 1 : $clog2(DEPTH);
    localparam SW    = DATA_W + 1;

    // -------------------------------------------------------------------------
    // Phase counter: 0..DEPTH-1 = load phase, DEPTH..2*DEPTH-1 = butterfly phase
    // -------------------------------------------------------------------------
    reg [$clog2(2*DEPTH):0] phase_cnt;
    always @(posedge clk) begin
        if (rst) phase_cnt <= 0;
        else if (en && in_valid) begin
            if (phase_cnt == 2*DEPTH - 1) phase_cnt <= 0;
            else phase_cnt <= phase_cnt + 1;
        end
    end

    wire butterfly_phase = (phase_cnt >= DEPTH);

    // -------------------------------------------------------------------------
    // Twiddle ROM address: phase_cnt[AW-1:0]
    //   Load phase  (0..DEPTH-1)    : correct index for the diff output path
    //   Butterfly phase (DEPTH..2*DEPTH-1) : wraps to 0..DEPTH-1; multiplier
    //                                        output is discarded (bp_d3 selects
    //                                        sum_d3 instead), so address is a don't-care
    // -------------------------------------------------------------------------
    wire [AW-1:0] rom_addr_w = phase_cnt[AW-1:0];

    // -------------------------------------------------------------------------
    // Delay line output (async-read circular buffer)
    //   Load phase    : contains diff_scaled from the previous butterfly
    //   Butterfly phase: contains DIN from the previous load phase
    // -------------------------------------------------------------------------
    wire [P*2*DATA_W-1:0] dl_out;

    // -------------------------------------------------------------------------
    // Radix-2 DIF butterfly (purely combinational)
    // -------------------------------------------------------------------------
    wire [P*4*SW-1:0] bf_out;

    genvar p;
    generate
        for (p = 0; p < P; p = p + 1) begin : g_bf
            butterfly_r2 #(.DATA_W(DATA_W)) u_bf (
                .a_re($signed(dl_out[p*2*DATA_W          +: DATA_W])),
                .a_im($signed(dl_out[p*2*DATA_W + DATA_W +: DATA_W])),
                .b_re($signed(din[p*2*DATA_W          +: DATA_W])),
                .b_im($signed(din[p*2*DATA_W + DATA_W +: DATA_W])),
                .sum_re (bf_out[(p*4+0)*SW +: SW]),
                .sum_im (bf_out[(p*4+1)*SW +: SW]),
                .diff_re(bf_out[(p*4+2)*SW +: SW]),
                .diff_im(bf_out[(p*4+3)*SW +: SW])
            );
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Overflow detect + block scaler (in the feedback loop, diff path only)
    // -------------------------------------------------------------------------
    wire overflow;
    wire overflow_gated = overflow & butterfly_phase;
    wire [P*4*DATA_W-1:0] scaled;

    overflow_detect #(.DATA_W(DATA_W), .P(P)) u_ovf (
        .data_in(bf_out), .overflow(overflow)
    );

    block_scaler #(.DATA_W(DATA_W), .P(P), .EXP_W(4)) u_scaler (
        .clk(clk), .rst(rst), .blk_rst(blk_rst),
        .data_in(bf_out), .overflow(overflow_gated),
        .data_out(scaled), .blk_exp(blk_exp)
    );

    wire [P*2*DATA_W-1:0] sum_bus_scaled;
    wire [P*2*DATA_W-1:0] diff_bus_scaled;
    generate
        for (p = 0; p < P; p = p + 1) begin : g_scaled
            assign sum_bus_scaled [p*2*DATA_W +: 2*DATA_W] = scaled[(p*4+0)*DATA_W +: 2*DATA_W];
            assign diff_bus_scaled[p*2*DATA_W +: 2*DATA_W] = scaled[(p*4+2)*DATA_W +: 2*DATA_W];
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Twiddle ROMs
    // -------------------------------------------------------------------------
    wire signed [TWIDDLE_W-1:0] tw_re [0:P-1];
    wire signed [TWIDDLE_W-1:0] tw_im [0:P-1];
    wire [P*2*DATA_W-1:0] tw_out;

    twiddle_rom #(.N(N), .P(P), .STAGE(STAGE), .PATH(0), .ADDR_W(AW)) u_rom0 (.addr(rom_addr_w), .re_out(tw_re[0]), .im_out(tw_im[0]));
    twiddle_rom #(.N(N), .P(P), .STAGE(STAGE), .PATH(1), .ADDR_W(AW)) u_rom1 (.addr(rom_addr_w), .re_out(tw_re[1]), .im_out(tw_im[1]));
    twiddle_rom #(.N(N), .P(P), .STAGE(STAGE), .PATH(2), .ADDR_W(AW)) u_rom2 (.addr(rom_addr_w), .re_out(tw_re[2]), .im_out(tw_im[2]));
    twiddle_rom #(.N(N), .P(P), .STAGE(STAGE), .PATH(3), .ADDR_W(AW)) u_rom3 (.addr(rom_addr_w), .re_out(tw_re[3]), .im_out(tw_im[3]));

    // -------------------------------------------------------------------------
    // Commuted complex multiplier: reads dl_out, PIPE_STGS=3
    //
    //   Load phase   : dl_out = diff_scaled → tw_out = diff_scaled × twiddle
    //                  This is the correct output to pass to the next stage.
    //   Butterfly phase: dl_out = old DIN → tw_out = DIN × twiddle (discarded;
    //                  bp_d3 selects sum_d3 during butterfly phase).
    //
    // With PIPE_STGS=3 the DSP48 path is split into three registered stages,
    // breaking the ~15 ns combinational timing path at the cost of 3 cycles of
    // output latency (compensated in fft_top.v valid_pipe taps).
    // -------------------------------------------------------------------------
    generate
        for (p = 0; p < P; p = p + 1) begin : g_mult
            complex_mult #(
                .DATA_W(DATA_W), .TWIDDLE_W(TWIDDLE_W), .PIPE_STGS(3)
            ) u_mult (
                .clk(clk),
                .rst(rst),
                .a_re($signed(dl_out[p*2*DATA_W          +: DATA_W])),
                .a_im($signed(dl_out[p*2*DATA_W + DATA_W +: DATA_W])),
                .w_re(tw_re[p]), .w_im(tw_im[p]),
                .p_re(tw_out[p*2*DATA_W          +: DATA_W]),
                .p_im(tw_out[p*2*DATA_W + DATA_W +: DATA_W])
            );
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Feedback path: write diff_scaled (NOT tw_out) back to delay line.
    // The multiplier is now outside the loop — the loop contains only:
    //   dl_out → butterfly → overflow_detect → block_scaler → dl_in
    // -------------------------------------------------------------------------
    wire [P*2*DATA_W-1:0] dl_in = butterfly_phase ? diff_bus_scaled : din;

    delay_line #(.DATA_W(DATA_W), .P(P), .DEPTH(DEPTH)) u_dline (
        .clk(clk), .rst(rst), .en(en && in_valid),
        .din(dl_in), .dout(dl_out)
    );

    // -------------------------------------------------------------------------
    // 3-stage delay pipeline to align the output mux with PIPE_STGS=3 latency
    // -------------------------------------------------------------------------
    reg bp_d1, bp_d2, bp_d3;
    always @(posedge clk) begin
        if (rst) {bp_d3, bp_d2, bp_d1} <= 3'b0;
        else if (en && in_valid) begin
            bp_d1 <= butterfly_phase;
            bp_d2 <= bp_d1;
            bp_d3 <= bp_d2;
        end
    end

    reg [P*2*DATA_W-1:0] sum_d1, sum_d2, sum_d3;
    always @(posedge clk) begin
        if (rst) begin
            sum_d1 <= {(P*2*DATA_W){1'b0}};
            sum_d2 <= {(P*2*DATA_W){1'b0}};
            sum_d3 <= {(P*2*DATA_W){1'b0}};
        end else if (en && in_valid) begin
            sum_d1 <= sum_bus_scaled;
            sum_d2 <= sum_d1;
            sum_d3 <= sum_d2;
        end
    end

    // -------------------------------------------------------------------------
    // Output mux (both paths arrive with 3-cycle latency):
    //   butterfly mode (bp_d3=1) → sum_d3  (butterfly sum, delayed 3 cycles)
    //   load mode      (bp_d3=0) → tw_out  (diff_scaled × twiddle, from pipeline)
    // -------------------------------------------------------------------------
    assign dout = bp_d3 ? sum_d3 : tw_out;

endmodule
