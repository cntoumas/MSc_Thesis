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

    // Phase counter: 0..DEPTH-1 = load phase, DEPTH..2*DEPTH-1 = butterfly phase
    reg [$clog2(2*DEPTH):0] phase_cnt;
    always @(posedge clk) begin
        if (rst) phase_cnt <= 0;
        else if (en && in_valid) begin
            if (phase_cnt == 2*DEPTH - 1) phase_cnt <= 0;
            else phase_cnt <= phase_cnt + 1;
        end
    end

    wire butterfly_phase = (phase_cnt >= DEPTH);

    // Twiddle ROM address for the current phase.
    wire [AW-1:0] rom_addr_w = phase_cnt[AW-1:0];

    //   Load phase    : contains diff_scaled from the previous butterfly
    //   Butterfly phase: contains DIN from the previous load phase
    wire [P*2*DATA_W-1:0] dl_out;

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

    // Overflow detect + block scaler (in the feedback loop, diff path only)
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

    wire signed [TWIDDLE_W-1:0] tw_re [0:P-1];
    wire signed [TWIDDLE_W-1:0] tw_im [0:P-1];
    wire [P*2*DATA_W-1:0] tw_out;

    twiddle_rom #(.N(N), .P(P), .STAGE(STAGE), .PATH(0), .ADDR_W(AW)) u_rom0 (.addr(rom_addr_w), .re_out(tw_re[0]), .im_out(tw_im[0]));
    twiddle_rom #(.N(N), .P(P), .STAGE(STAGE), .PATH(1), .ADDR_W(AW)) u_rom1 (.addr(rom_addr_w), .re_out(tw_re[1]), .im_out(tw_im[1]));
    twiddle_rom #(.N(N), .P(P), .STAGE(STAGE), .PATH(2), .ADDR_W(AW)) u_rom2 (.addr(rom_addr_w), .re_out(tw_re[2]), .im_out(tw_im[2]));
    twiddle_rom #(.N(N), .P(P), .STAGE(STAGE), .PATH(3), .ADDR_W(AW)) u_rom3 (.addr(rom_addr_w), .re_out(tw_re[3]), .im_out(tw_im[3]));

    // Commuted multiplier path with pipeline delay.
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

    // Feedback path keeps the loop compact and timing-safe.
    wire [P*2*DATA_W-1:0] dl_in = butterfly_phase ? diff_bus_scaled : din;

    delay_line #(.DATA_W(DATA_W), .P(P), .DEPTH(DEPTH)) u_dline (
        .clk(clk), .rst(rst), .en(en && in_valid),
        .din(dl_in), .dout(dl_out)
    );

    // 3-stage delay pipeline to align the output mux with PIPE_STGS=3 latency
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

    // Output mux selects the correctly delayed path.
    assign dout = bp_d3 ? sum_d3 : tw_out;

endmodule