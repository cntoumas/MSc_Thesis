// =============================================================================
// tb_fft_axi_power.v — Continuous multi-tone stimulus for power estimation
//
// Feeds 5 real sine tones at bins 17, 73, 157, 293, 401 (mixed amplitudes)
// continuously for NUM_BLOCKS FFT frames with no gaps between frames.
// Keeping s_axis_tvalid high maximises DSP and logic switching activity,
// giving a realistic worst-case power estimate when paired with SAIF logging.
//
// Tones (real input, im=0):
//   Bin  17 : amplitude 5000
//   Bin  73 : amplitude 4000
//   Bin 157 : amplitude 3500
//   Bin 293 : amplitude 3000
//   Bin 401 : amplitude 2500
//   Peak sum ~18000, well within 16-bit signed range.
//
// Usage (Vivado Tcl — run inside post-impl timing sim):
//   close_saif
//   open_saif fft_power.saif
//   log_saif [get_objects -r /tb_fft_axi_power/dut/*]
//   run 5000000ns
//   close_saif
// =============================================================================
`timescale 1ns/1ps

module tb_fft_axi_power;

    localparam integer DATA_W    = 16;
    localparam integer P         = 4;
    localparam integer N         = 1024;
    localparam integer WORDS     = N / P;      // 256 beats per block
    localparam integer CLK_P     = 10;         // 100 MHz
    localparam integer NUM_BLOCKS = 64;        // blocks to stream

    // ---------------------------------------------------------------
    // Pre-computed multi-tone LUT (generated once in initial block)
    // ---------------------------------------------------------------
    reg signed [DATA_W-1:0] sine_lut [0:N-1];

    real two_pi;
    integer lut_n;
    real sample_val;

    initial begin : gen_lut
        two_pi = 2.0 * 3.14159265358979323846;
        for (lut_n = 0; lut_n < N; lut_n = lut_n + 1) begin
            sample_val =
                5000.0 * $cos(two_pi * 17  * lut_n / N) +
                4000.0 * $cos(two_pi * 73  * lut_n / N) +
                3500.0 * $cos(two_pi * 157 * lut_n / N) +
                3000.0 * $cos(two_pi * 293 * lut_n / N) +
                2500.0 * $cos(two_pi * 401 * lut_n / N);
            sine_lut[lut_n] = $rtoi(sample_val);
        end
    end

    // ---------------------------------------------------------------
    // Signals
    // ---------------------------------------------------------------
    reg                     aclk;
    reg                     aresetn;

    reg  [P*2*DATA_W-1:0]   s_axis_tdata;
    reg                     s_axis_tvalid;
    wire                    s_axis_tready;
    reg                     s_axis_tlast;

    wire [P*2*DATA_W-1:0]   m_axis_tdata;
    wire                    m_axis_tvalid;
    reg                     m_axis_tready;
    wire                    m_axis_tlast;
    wire [3:0]              m_axis_tuser;

    // ---------------------------------------------------------------
    // DUT
    // ---------------------------------------------------------------
    fft_axi_top #(
        .DATA_W   (DATA_W),
        .TWIDDLE_W(DATA_W),
        .N        (N),
        .P        (P),
        .HEX_DIR  ("rom")
    ) dut (
        .aclk          (aclk),
        .aresetn       (aresetn),
        .s_axis_tdata  (s_axis_tdata),
        .s_axis_tvalid (s_axis_tvalid),
        .s_axis_tready (s_axis_tready),
        .s_axis_tlast  (s_axis_tlast),
        .m_axis_tdata  (m_axis_tdata),
        .m_axis_tvalid (m_axis_tvalid),
        .m_axis_tready (m_axis_tready),
        .m_axis_tlast  (m_axis_tlast),
        .m_axis_tuser  (m_axis_tuser)
    );

    // ---------------------------------------------------------------
    // Clock
    // ---------------------------------------------------------------
    initial aclk = 1'b0;
    always #(CLK_P/2) aclk = ~aclk;

    // ---------------------------------------------------------------
    // Task: stream one full block of multi-tone sine samples
    //   beat b carries samples b*P .. b*P+P-1 (real, im=0)
    // ---------------------------------------------------------------
    task feed_sine_block;
        integer b;
        begin
            for (b = 0; b < WORDS; b = b + 1) begin
                s_axis_tdata[0*2*DATA_W          +: DATA_W] = sine_lut[b*P + 0];
                s_axis_tdata[0*2*DATA_W + DATA_W +: DATA_W] = {DATA_W{1'b0}};
                s_axis_tdata[1*2*DATA_W          +: DATA_W] = sine_lut[b*P + 1];
                s_axis_tdata[1*2*DATA_W + DATA_W +: DATA_W] = {DATA_W{1'b0}};
                s_axis_tdata[2*2*DATA_W          +: DATA_W] = sine_lut[b*P + 2];
                s_axis_tdata[2*2*DATA_W + DATA_W +: DATA_W] = {DATA_W{1'b0}};
                s_axis_tdata[3*2*DATA_W          +: DATA_W] = sine_lut[b*P + 3];
                s_axis_tdata[3*2*DATA_W + DATA_W +: DATA_W] = {DATA_W{1'b0}};

                s_axis_tvalid = 1'b1;
                s_axis_tlast  = (b == WORDS - 1);

                @(posedge aclk); #1;
                while (!s_axis_tready) begin @(posedge aclk); #1; end
            end
        end
    endtask

    // ---------------------------------------------------------------
    // Main stimulus
    // ---------------------------------------------------------------
    integer blk;

    initial begin
        aresetn       = 1'b0;
        s_axis_tdata  = {(P*2*DATA_W){1'b0}};
        s_axis_tvalid = 1'b0;
        s_axis_tlast  = 1'b0;
        m_axis_tready = 1'b1;

        // Hold reset for 4 cycles
        repeat (4) @(posedge aclk);
        #1;
        aresetn = 1'b1;

        $display("[PWR-TB] Reset released — streaming %0d multi-tone blocks", NUM_BLOCKS);

        // Stream NUM_BLOCKS frames back-to-back (no gaps)
        for (blk = 0; blk < NUM_BLOCKS; blk = blk + 1) begin
            feed_sine_block();
        end

        s_axis_tvalid = 1'b0;
        s_axis_tlast  = 1'b0;

        $display("[PWR-TB] Done: %0d blocks streamed. Close SAIF and run report_power.",
                 NUM_BLOCKS);

        // Keep running so SAIF capture window stays open during output flush
        repeat (1024) @(posedge aclk);
        $finish;
    end

    // ---------------------------------------------------------------
    // Watchdog
    // ---------------------------------------------------------------
    initial begin
        #50000000;
        $display("[PWR-TB] TIMEOUT (watchdog)");
        $finish;
    end

endmodule
