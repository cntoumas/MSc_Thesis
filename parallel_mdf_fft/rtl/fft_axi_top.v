// =============================================================================
// fft_axi_top.v - AXI-Stream wrapper for the 1024-pt P=4 MDF Radix-2 DIF FFT
//
// AXI-Stream interface (128-bit TDATA = 4 parallel complex samples / beat):
//
//   TDATA[127:0] = { path3_im, path3_re,    // bits 127:112 / 111:96
//                    path2_im, path2_re,    // bits  95:80  /  79:64
//                    path1_im, path1_re,    // bits  63:48  /  47:32
//                    path0_im, path0_re }   // bits  31:16  /  15:0
//
// One FFT block = N/P = 256 AXI beats. TLAST is expected on the last beat
// of each input block, and is generated on the last beat of each output
// block.  The master TUSER[3:0] carries the per-block BFP exponent so the
// receiver can reconstruct true magnitudes = TDATA * 2^TUSER.
//
// Output bin layout (stride N/P = 256 per path):
//   beat k, path p  ->  FFT bin (k + p * 256), k in 0..255, p in 0..3
//
// REQUIRED USAGE PATTERN -- canonical MDF stimulus
// -----------------------------------------------------------------------
// Drive at least two contiguous input blocks (2 * 256 = 512 beats) per
// FFT result wanted.  The output bit-reverse buffer (rtl/bit_reverse.v)
// is a single ping-pong stage whose read trigger ignores subsequent
// boundaries while a read is in progress.  As a result, exactly ONE
// output block (256 beats) is emitted, corresponding to the FIRST input
// block.  The second input block is necessary to keep the FFT pipeline
// in steady-state through the entire output window.
//
// Concretely:
//   master sends 256 beats (block A)            <-- becomes the result
//   master sends 256 beats (block B, contiguous)
//   wrapper emits 256 beats of output for block A (one TLAST)
//
// Protocol behaviour
// -----------------------------------------------------------------------
//   * Slave side: TREADY follows `en` (currently tied high). The wrapper
//     passes the AXI handshake straight through; do NOT insert TVALID
//     gaps within a block, and keep blocks back-to-back.
//   * Master side: backpressure is NOT internally absorbed. The MDF FFT
//     is a streaming pipeline that produces one beat per cycle. The
//     consumer is expected to keep TREADY asserted; for full backpressure
//     support, place an AXI-Stream FIFO at the master port.
// =============================================================================
`timescale 1ns/1ps

module fft_axi_top #(
    parameter integer DATA_W    = 16,
    parameter integer TWIDDLE_W = 16,
    parameter integer N         = 1024,
    parameter integer P         = 4,
    parameter         HEX_DIR   = "rom"
) (
    input  wire                     aclk,
    input  wire                     aresetn,    // active-low

    // Slave AXI-Stream (input)
    input  wire [P*2*DATA_W-1:0]    s_axis_tdata,
    input  wire                     s_axis_tvalid,
    output wire                     s_axis_tready,
    input  wire                     s_axis_tlast,

    // Master AXI-Stream (output)
    output wire [P*2*DATA_W-1:0]    m_axis_tdata,
    output wire                     m_axis_tvalid,
    input  wire                     m_axis_tready,
    output wire                     m_axis_tlast,
    output wire [3:0]               m_axis_tuser    // = blk_exp
);

    localparam integer WORDS = N / P;             // 256
    localparam integer CNT_W = (WORDS > 1) ? $clog2(WORDS) : 1;

    wire rst = ~aresetn;

    // ------------------------------------------------------------------
    // Pipeline enable
    // ------------------------------------------------------------------
    // No internal backpressure: en is tied high.  Consumer must keep
    // TREADY asserted while output beats are produced.  (See header.)
    wire en = 1'b1;

    // ------------------------------------------------------------------
    // Input handling
    // ------------------------------------------------------------------
    // The FFT core has a single rising-edge block-start detector on
    // in_valid and an internal modulo-WORDS counter that aligns all
    // subsequent block boundaries off that first edge.  Blocks must
    // therefore be fed back-to-back (no in_valid gaps), otherwise a
    // spurious mid-pipeline blk_rst corrupts in-flight data.
    //
    // The wrapper passes the AXI handshake straight through:
    //   * TREADY is always asserted (when en is high)
    //   * in_valid follows TVALID & TREADY
    //   * TLAST is accepted but unused internally; consumers can rely
    //     on the corresponding TLAST that we emit on the master side.
    //
    // The caller's responsibility:
    //   * Drive exactly WORDS = N/P consecutive beats per FFT block
    //   * Do NOT insert TVALID gaps inside a block
    //   * Back-to-back blocks must be contiguous (no idle cycle between
    //     the last beat of block N and the first beat of block N+1)
    assign s_axis_tready = en;
    wire   fft_in_valid  = s_axis_tvalid & s_axis_tready;

    // ------------------------------------------------------------------
    // FFT core instantiation
    // ------------------------------------------------------------------
    wire                     fft_out_valid;
    wire [P*2*DATA_W-1:0]    fft_dout;
    wire [3:0]               fft_blk_exp;

    fft_top #(
        .DATA_W   (DATA_W),
        .TWIDDLE_W(TWIDDLE_W),
        .N        (N),
        .P        (P),
        .HEX_DIR  (HEX_DIR)
    ) u_fft (
        .clk      (aclk),
        .rst      (rst),
        .en       (en),
        .in_valid (fft_in_valid),
        .din      (s_axis_tdata),
        .out_valid(fft_out_valid),
        .dout     (fft_dout),
        .blk_exp  (fft_blk_exp)
    );

    // ------------------------------------------------------------------
    // Output block bookkeeping
    // ------------------------------------------------------------------
    // Count output beats 0..WORDS-1 to drive TLAST.
    reg [CNT_W-1:0] out_cnt;
    always @(posedge aclk) begin
        if (rst) begin
            out_cnt <= {CNT_W{1'b0}};
        end else if (en) begin
            if (m_axis_tvalid & m_axis_tready) begin
                if (out_cnt == WORDS-1)
                    out_cnt <= {CNT_W{1'b0}};
                else
                    out_cnt <= out_cnt + 1'b1;
            end
        end
    end

    assign m_axis_tdata  = fft_dout;
    assign m_axis_tvalid = fft_out_valid;
    assign m_axis_tuser  = fft_blk_exp;
    assign m_axis_tlast  = fft_out_valid & (out_cnt == WORDS-1);

endmodule
