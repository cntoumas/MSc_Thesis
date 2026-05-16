// =============================================================================
// tb_fft_axi.v - Self-checking testbench for fft_axi_top
//
// Drives an impulse on the slave AXI-Stream port (x[0]=2048 on path 0,
// zeros elsewhere) and verifies the master AXI-Stream output magnitude is
// ~2048 at every bin (after BFP reconstruction).
//
// Reference DFT of an impulse A*delta[0]:  X[k] = A  for all k.
// Hardware emits 4 samples per beat, one per path, with stride N/P = 256.
//   beat k, path p   ->  FFT bin (k + p * 256)
//
// One full FFT block is driven; pipeline latency through the FFT and
// output bit-reverse buffer is ~2 * N/P cycles before the first output
// beat appears.
// =============================================================================
`timescale 1ns/1ps

module tb_fft_axi;

    localparam integer DATA_W = 16;
    localparam integer P      = 4;
    localparam integer N      = 1024;
    localparam integer WORDS  = N / P;          // 256
    localparam integer CLK_P  = 10;

    localparam integer IMPULSE_AMP = 2048;
    localparam integer TOL_LSB     = 4;         // tolerance in raw HW units

    reg                     aclk;
    reg                     aresetn;

    // Slave AXI-S
    reg  [P*2*DATA_W-1:0]   s_axis_tdata;
    reg                     s_axis_tvalid;
    wire                    s_axis_tready;
    reg                     s_axis_tlast;

    // Master AXI-S
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
    // CSV dump of all output beats (for offline inspection)
    // ---------------------------------------------------------------
    integer csv_axi;
    initial begin
        csv_axi = $fopen("fft_axi_output.csv", "w");
        $fwrite(csv_axi,
                "beat,path0_re,path0_im,path1_re,path1_im,path2_re,path2_im,path3_re,path3_im,tuser,tlast\n");
    end

    // ---------------------------------------------------------------
    // Output capture (one full block, captured into out_re/out_im)
    //   beat k, path p  ->  FFT bin (k + p * WORDS)
    // ---------------------------------------------------------------
    reg signed [DATA_W-1:0] out_re [0:N-1];
    reg signed [DATA_W-1:0] out_im [0:N-1];
    integer  beat_idx;
    reg      block_done;
    reg [3:0] captured_tuser;

    always @(posedge aclk) begin
        if (!aresetn) begin
            beat_idx       <= 0;
            block_done     <= 1'b0;
        end else if (m_axis_tvalid && m_axis_tready) begin
            // Dump every beat to CSV
            $fwrite(csv_axi, "%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d\n",
                    beat_idx,
                    $signed(m_axis_tdata[0*2*DATA_W +: DATA_W]),
                    $signed(m_axis_tdata[0*2*DATA_W + DATA_W +: DATA_W]),
                    $signed(m_axis_tdata[1*2*DATA_W +: DATA_W]),
                    $signed(m_axis_tdata[1*2*DATA_W + DATA_W +: DATA_W]),
                    $signed(m_axis_tdata[2*2*DATA_W +: DATA_W]),
                    $signed(m_axis_tdata[2*2*DATA_W + DATA_W +: DATA_W]),
                    $signed(m_axis_tdata[3*2*DATA_W +: DATA_W]),
                    $signed(m_axis_tdata[3*2*DATA_W + DATA_W +: DATA_W]),
                    m_axis_tuser, m_axis_tlast);

            // Always capture into the bin array (only one output block expected)
            out_re[beat_idx + 0*WORDS] <= $signed(m_axis_tdata[0*2*DATA_W +: DATA_W]);
            out_im[beat_idx + 0*WORDS] <= $signed(m_axis_tdata[0*2*DATA_W + DATA_W +: DATA_W]);
            out_re[beat_idx + 1*WORDS] <= $signed(m_axis_tdata[1*2*DATA_W +: DATA_W]);
            out_im[beat_idx + 1*WORDS] <= $signed(m_axis_tdata[1*2*DATA_W + DATA_W +: DATA_W]);
            out_re[beat_idx + 2*WORDS] <= $signed(m_axis_tdata[2*2*DATA_W +: DATA_W]);
            out_im[beat_idx + 2*WORDS] <= $signed(m_axis_tdata[2*2*DATA_W + DATA_W +: DATA_W]);
            out_re[beat_idx + 3*WORDS] <= $signed(m_axis_tdata[3*2*DATA_W +: DATA_W]);
            out_im[beat_idx + 3*WORDS] <= $signed(m_axis_tdata[3*2*DATA_W + DATA_W +: DATA_W]);
            captured_tuser <= m_axis_tuser;

            if (m_axis_tlast) begin
                block_done <= 1'b1;
                beat_idx   <= 0;
            end else begin
                beat_idx <= beat_idx + 1;
            end
        end
    end

    // ---------------------------------------------------------------
    // Stimulus task: feed one impulse block (impulse on path 0 word 0)
    // ---------------------------------------------------------------
    reg [P*2*DATA_W-1:0] impulse_word;
    integer fail_count;
    integer k;
    integer exp_scale;
    integer abs_re, abs_im;
    integer expect_mag;
    integer timeout_cnt;

    task feed_impulse_block;
        integer fi;
        begin
            impulse_word = {(P*2*DATA_W){1'b0}};
            impulse_word[0*2*DATA_W +: DATA_W] = IMPULSE_AMP[DATA_W-1:0];

            // Beat 0: impulse
            s_axis_tdata  = impulse_word;
            s_axis_tvalid = 1'b1;
            s_axis_tlast  = (WORDS == 1);
            @(posedge aclk); #1;
            while (!s_axis_tready) begin @(posedge aclk); #1; end

            // Beats 1..WORDS-1: zeros
            s_axis_tdata = {(P*2*DATA_W){1'b0}};
            for (fi = 1; fi < WORDS; fi = fi + 1) begin
                s_axis_tlast = (fi == WORDS-1);
                @(posedge aclk); #1;
                while (!s_axis_tready) begin @(posedge aclk); #1; end
            end
            s_axis_tvalid = 1'b0;
            s_axis_tlast  = 1'b0;
            s_axis_tdata  = {(P*2*DATA_W){1'b0}};
        end
    endtask

    // ---------------------------------------------------------------
    // Main test
    // ---------------------------------------------------------------
    initial begin
        // Init
        aresetn       = 1'b0;
        s_axis_tdata  = {(P*2*DATA_W){1'b0}};
        s_axis_tvalid = 1'b0;
        s_axis_tlast  = 1'b0;
        m_axis_tready = 1'b1;        // always ready (no backpressure test)
        fail_count    = 0;

        // Reset
        @(posedge aclk); #1;
        @(posedge aclk); #1;
        aresetn = 1'b1;
        $display("[TB-AXI] Reset released, driving 2 impulse blocks (back-to-back)");

        // Drive two contiguous blocks (matches the canonical MDF stimulus
        // pattern: the first feeds the pipeline; the bit_reverse buffer
        // emits one block of valid output that corresponds to the first
        // input block.)
        feed_impulse_block();
        feed_impulse_block();

        // Wait for the output block to complete (block_done asserted)
        timeout_cnt = 0;
        while (!block_done && timeout_cnt < 2000) begin
            @(posedge aclk); #1;
            timeout_cnt = timeout_cnt + 1;
        end
        if (!block_done) begin
            $display("[TB-AXI] FAIL: timed out waiting for output block (no TLAST)");
            $fclose(csv_axi);
            $finish;
        end
        // Let one more clock pass so the final beat's NB-assignments commit
        @(posedge aclk); #1;

        // -----------------------------------------------------------
        // Self-check: impulse FFT should be flat at IMPULSE_AMP
        // -----------------------------------------------------------
        exp_scale  = (1 << captured_tuser);
        expect_mag = IMPULSE_AMP;
        $display("[TB-AXI] Output block captured: BFP_exp = %0d  scale = %0d  expect |X[k]| ~ %0d",
                 captured_tuser, exp_scale, expect_mag);

        for (k = 0; k < N; k = k + 1) begin
            abs_re = (out_re[k] < 0) ? -out_re[k] : out_re[k];
            abs_im = (out_im[k] < 0) ? -out_im[k] : out_im[k];
            // After BFP scaling, re should be ~IMPULSE_AMP and im ~0.
            //   raw_re ~ IMPULSE_AMP / scale,  raw_im ~ 0
            // Tolerance is given in raw HW units, then converted.
            if ((abs_re * exp_scale > expect_mag + TOL_LSB * exp_scale) ||
                (abs_re * exp_scale < expect_mag - TOL_LSB * exp_scale) ||
                (abs_im * exp_scale > TOL_LSB * exp_scale)) begin
                if (fail_count < 8) begin
                    $display("  FAIL bin %0d: raw=(%0d, %0d) scaled=(%0d, %0d) expect (%0d, 0) +/-%0d",
                             k, out_re[k], out_im[k],
                             out_re[k] * exp_scale, out_im[k] * exp_scale,
                             expect_mag, TOL_LSB * exp_scale);
                end
                fail_count = fail_count + 1;
            end
        end

        $fclose(csv_axi);

        if (fail_count == 0) begin
            $display("[TB-AXI] PASS: all %0d bins within +/-%0d LSB of expected impulse magnitude",
                     N, TOL_LSB);
        end else begin
            $display("[TB-AXI] FAIL: %0d/%0d bins out of tolerance", fail_count, N);
        end

        $finish;
    end

    // ---------------------------------------------------------------
    // Timeout watchdog
    // ---------------------------------------------------------------
    initial begin
        #10000000;
        $display("[TB-AXI] TIMEOUT (watchdog)");
        $finish;
    end

endmodule
