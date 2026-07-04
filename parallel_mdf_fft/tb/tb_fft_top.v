// =============================================================================
// tb_fft_top.v — System-level self-checking testbench for fft_top
//
// Tests (N=1024, P=4, DATA_W=16):
//
//  1. Impulse response
//     Input:  x[0] = A on path 0, x[n]=0 for n>0.
//     Expected DFT: X[k] = A for all k.
//     True value = dout_sample * 2^blk_exp.  We check bins 0..31.
//
//  2. DC input
//     Input: x[n] = B for all n=0..1023 (all P paths, all WORDS clocks).
//     Expected: X[0] large, X[k!=0] ~= 0.
//     We check bins 1..15 are near zero.
//
// Verilog-2001 compatible (no SystemVerilog constructs).
// =============================================================================
`timescale 1ns/1ps

module tb_fft_top;

    localparam DW    = 16;
    localparam P     = 4;
    localparam N_FFT = 1024;
    localparam WORDS = N_FFT / P;     // 256 clocks per block
    localparam CLK_P = 10;

    reg  clk, rst, en, in_valid;
    reg  [P*2*DW-1:0] din;
    wire [P*2*DW-1:0] dout;
    wire               out_valid;
    wire [3:0]         blk_exp;

    fft_top #(
        .DATA_W   (DW),
        .TWIDDLE_W(DW),
        .N        (N_FFT),
        .P        (P),
        .HEX_DIR  ("rom")
    ) u_dut (
        .clk      (clk),
        .rst      (rst),
        .en       (en),
        .in_valid (in_valid),
        .din      (din),
        .out_valid(out_valid),
        .dout     (dout),
        .blk_exp  (blk_exp)
    );

    initial clk = 0;
    always #(CLK_P/2) clk = ~clk;

    // VCD dump — only dump stage 4 signals to keep file small
    initial begin
        $dumpfile("sim/debug_s4.vcd");
        $dumpvars(0, u_dut.u_s4.u_dline);
        $dumpvars(0, u_dut.u_s4.g_bf[0].u_bf);
        $dumpvars(1, u_dut.u_s4);
    end

    // -----------------------------------------------------------------------
    // CSV output for verification script
    // -----------------------------------------------------------------------
    integer csv_params, csv_output;
    initial begin
        csv_params = $fopen("fft_params.csv", "w");
        $fwrite(csv_params, "param,value\n");
        $fwrite(csv_params, "DATA_WIDTH,%0d\n", DW);
        $fwrite(csv_params, "TWIDDLE_WIDTH,%0d\n", DW);
        $fwrite(csv_params, "FFT_POINTS,%0d\n", N_FFT);
        $fwrite(csv_params, "PARALLELISM,%0d\n", P);
        $fwrite(csv_params, "BFP_ENABLED,1\n");
        $fwrite(csv_params, "CLK_PERIOD,%0d\n", CLK_P);
        $fclose(csv_params);
        
        csv_output = $fopen("fft_output.csv", "w");
        $fwrite(csv_output, "test_id,sample_idx,out0_r,out0_i,out1_r,out1_i,out2_r,out2_i,out3_r,out3_i,bfp_exp,time_ns\n");
    end

    // -----------------------------------------------------------------------
    // Output capture (one full block)
    // -----------------------------------------------------------------------
    reg signed [DW-1:0] out_re [0:N_FFT-1];
    reg signed [DW-1:0] out_im [0:N_FFT-1];
    integer out_idx;
    integer current_test_id;
    integer sim_time_start;

    always @(posedge clk) begin
        if (out_valid && out_idx < N_FFT) begin
            if (out_idx == 0) begin
                $display("  [DBG] out_valid pulse: dout[127:0]=%h  out_idx=%0d", dout, out_idx);
                sim_time_start = $time;
            end
            out_re[out_idx + 0] <= $signed(dout[0*2*DW          +: DW]);
            out_im[out_idx + 0] <= $signed(dout[0*2*DW + DW     +: DW]);
            out_re[out_idx + 1] <= $signed(dout[1*2*DW          +: DW]);
            out_im[out_idx + 1] <= $signed(dout[1*2*DW + DW     +: DW]);
            out_re[out_idx + 2] <= $signed(dout[2*2*DW          +: DW]);
            out_im[out_idx + 2] <= $signed(dout[2*2*DW + DW     +: DW]);
            out_re[out_idx + 3] <= $signed(dout[3*2*DW          +: DW]);
            out_im[out_idx + 3] <= $signed(dout[3*2*DW + DW     +: DW]);
            
            // Write to CSV
            $fwrite(csv_output, "%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d\n",
                    current_test_id, out_idx/P,
                    $signed(dout[0*2*DW +: DW]), $signed(dout[0*2*DW + DW +: DW]),
                    $signed(dout[1*2*DW +: DW]), $signed(dout[1*2*DW + DW +: DW]),
                    $signed(dout[2*2*DW +: DW]), $signed(dout[2*2*DW + DW +: DW]),
                    $signed(dout[3*2*DW +: DW]), $signed(dout[3*2*DW + DW +: DW]),
                    blk_exp, $time - sim_time_start);
            
            out_idx <= out_idx + P;
        end
    end

    // Monitor first delayed_valid cycle — show all intermediate stages
    reg dbg_done;
    initial dbg_done = 0;
    always @(posedge clk) begin
        if (u_dut.delayed_valid && !dbg_done) begin
            $display("  [DBG] First delayed_valid:");
            $display("    stage0.dout  = %h", u_dut.stage_out[0]);
            $display("    stage3.dout  = %h", u_dut.stage_out[3]);
            $display("    stage4.dout  = %h", u_dut.stage_out[4]);
            $display("    s4.tw_re[0]  = %h", u_dut.u_s4.tw_re[0]);
            $display("    s4.tw_im[0]  = %h", u_dut.u_s4.tw_im[0]);
            $display("    s4.diff_bus  = %h", u_dut.u_s4.diff_bus_scaled);
            $display("    s4.dl_out    = %h", u_dut.u_s4.dl_out);
            $display("    s4.bf_out    = %h", u_dut.u_s4.bf_out);
            $display("    stage7.dout  = %h", u_dut.stage_out[7]);
            $display("    s7.tw_re[0]  = %h", u_dut.u_s7.tw_re[0]);
            $display("    dl_s7.dout   = %h", u_dut.u_s7.u_dline.dout);
            dbg_done <= 1;
        end
    end

    // -----------------------------------------------------------------------
    // Control variables (module scope)
    // -----------------------------------------------------------------------
    integer fail_count;
    integer i, k;
    integer timeout_cnt, wait_cnt;
    integer exp_scale;
    integer true_re, true_im, tol, noise_tol;
    reg [P*2*DW-1:0] cur_word;
    reg [P*2*DW-1:0] impulse_word;
    integer jj;
    integer samp_idx;
    integer tone_bin;
    integer samp;
    real angle, sreal;
    // Multi-tone and chirp test variables
    real angle2, angle3, sum_real;
    real f0_norm, f1_norm, phase_chirp;

    initial begin
        out_idx = 0;
        current_test_id = 0;
        fail_count = 0;
    end

    // -----------------------------------------------------------------------
    // Tasks
    // -----------------------------------------------------------------------
    // Feed one block: first_word on clock 0, then zeros for WORDS-1 clocks
    task feed_impulse;
        input [P*2*DW-1:0] first_word;
        integer fi;
        begin
            in_valid = 1;
            din = first_word;
            @(posedge clk); #1;
            din = 0;
            for (fi = 1; fi < WORDS; fi = fi + 1) begin
                @(posedge clk); #1;
            end
            in_valid = 0;
        end
    endtask

    // Feed one block of a constant (all-paths) word for WORDS clocks
    task feed_const_block;
        input [P*2*DW-1:0] word;
        integer fi;
        begin
            in_valid = 1;
            for (fi = 0; fi < WORDS; fi = fi + 1) begin
                din = word;
                @(posedge clk); #1;
            end
            in_valid = 0;
            din = 0;
        end
    endtask

    // Wait up to N clocks for out_valid
    task wait_valid;
        input integer max_clk;
        begin
            timeout_cnt = 0;
            while (!out_valid && timeout_cnt < max_clk) begin
                @(posedge clk); #1;
                timeout_cnt = timeout_cnt + 1;
            end
        end
    endtask

    // Wait for out_idx to reach N_FFT (block captured), then consume the
    // final out_valid cycle so the always-block does not overwrite out[0..3]
    // after out_idx is reset for the next test.
    task wait_captured;
        begin
            wait_cnt = 0;
            while (out_idx < N_FFT && wait_cnt < 2000) begin
                @(posedge clk); #1;
                wait_cnt = wait_cnt + 1;
            end
            // One extra cycle: rd_cnt==WORDS-1 fires here (out_valid still 1,
            // out_idx==N_FFT so condition is false — no overwrite), then
            // out_valid deasserts.
            @(posedge clk); #1;
        end
    endtask

    // -----------------------------------------------------------------------
    // Main test sequence
    // -----------------------------------------------------------------------
    initial begin
        fail_count = 0;
        out_idx    = 0;
        rst = 1; en = 1; in_valid = 0; din = 0;
        
        $display("[TB] Starting FFT testbench...");

        @(posedge clk); #1;
        @(posedge clk); #1;
        rst = 0;
        $display("[TB] Reset released");

        // ================================================================
        // TEST 1: Impulse response  x[0]=1000, x[n>0]=0
        //   Expected DFT: X[k] = 1000 for all k
        //   True value = out_sample * 2^blk_exp  ~= 1000
        // ================================================================
        $display("TEST 1: Impulse (x[0]=1000)");
        current_test_id = 0;
        $display("[TB] Starting TEST 1");

        begin
            impulse_word = 0;
            // Amplitude 2048 survives 10 BFP shifts and fits in 16-bit signed.
            impulse_word[0*2*DW +: DW] = 16'sd2048;
            // Block 1 (warmup — pipeline fills; output is garbage/zeros)
            out_idx = 0;
            feed_impulse(impulse_word);
            // Block 2 (valid — pipeline now properly initialized)
            out_idx = 0;
            feed_impulse(impulse_word);
        end

        wait_valid(2000);
        if (!out_valid) begin
            $display("FAIL [impulse]: out_valid never asserted");
            fail_count = fail_count + 1;
        end

        wait_captured;

        // Check first 32 bins: true_re = out_re * 2^blk_exp ~= 1000
        exp_scale = 1 << blk_exp;
        tol = 50 * exp_scale;
        for (k = 0; k < 32; k = k + 1) begin
            true_re = $signed(out_re[k]) * exp_scale;
            true_im = $signed(out_im[k]) * exp_scale;
            if (true_re - 2048 > tol || 2048 - true_re > tol ||
                true_im        > tol || -true_im        > tol) begin
                $display("FAIL [impulse] bin %0d: true=(%0d+%0dj) expected (2048+0j) tol=%0d",
                         k, true_re, true_im, tol);
                fail_count = fail_count + 1;
                if (fail_count > 5) k = N_FFT;
            end
        end
        $display("  blk_exp = %0d  (scale = %0d)  X[0].re = %0d (true = %0d)",
                 blk_exp, exp_scale, $signed(out_re[0]),
                 $signed(out_re[0]) * exp_scale);

        // ================================================================
        // TEST 2: DC input  x[n]=100 for all n
        //   Expected: X[0] large, X[k!=0] ~= 0
        // ================================================================
        $display("TEST 2: DC input (x[n]=100)");
        current_test_id = 1;

        cur_word = 0;
        for (jj = 0; jj < P; jj = jj + 1)
            cur_word[jj*2*DW +: DW] = 16'sd2048;

        // Block 1 (warmup)
        out_idx = 0;
        feed_const_block(cur_word);
        // Block 2 (valid output)
        out_idx = 0;
        feed_const_block(cur_word);

        wait_valid(2000);
        if (!out_valid) begin
            $display("FAIL [dc]: out_valid never asserted");
            fail_count = fail_count + 1;
        end

        wait_captured;

        exp_scale = 1 << blk_exp;
        noise_tol = 100 * exp_scale;
        if ($signed(out_re[0]) === 16'sd0) begin
            $display("WARN [dc]: X[0] re=0 (may indicate pipeline issue)");
        end
        for (k = 1; k < 16; k = k + 1) begin
            true_re = $signed(out_re[k]) * exp_scale;
            true_im = $signed(out_im[k]) * exp_scale;
            if (true_re > noise_tol || -true_re > noise_tol ||
                true_im > noise_tol || -true_im > noise_tol) begin
                $display("FAIL [dc] bin %0d: true=(%0d+%0dj) expected ~0 tol=%0d",
                         k, true_re, true_im, noise_tol);
                fail_count = fail_count + 1;
            end
        end
        $display("  blk_exp = %0d  X[0].re = %0d (scaled = %0d)",
                 blk_exp, $signed(out_re[0]), $signed(out_re[0]) * exp_scale);

        // ================================================================
        // TEST 3: Single-tone sine wave (block)
        // ================================================================
        $display("TEST 3: Sine (single-tone)");
        current_test_id = 2;

        // Sine parameters: amplitude should be a multiple of 2^10 so it
        // survives the unconditional right-shifts in the pipeline.
        tone_bin = 50;  // Bin index for the sine wave (0..1023)
        samp_idx = 0;
        out_idx = 0;

        // Feed 2 blocks of the real sine wave (block 1 = warmup, block 2 = valid)
        begin : blk_sine
            integer blk;
            for (blk = 0; blk < 2; blk = blk + 1) begin
                out_idx = 0;
                for (i = 0; i < WORDS; i = i + 1) begin
                    cur_word = 0;
                    for (jj = 0; jj < P; jj = jj + 1) begin
                        samp_idx = i * P + jj;
                        angle = 2.0 * 3.141592653589793 * tone_bin * samp_idx / N_FFT;
                        sreal = 2048.0 * $sin(angle);
                        samp = $rtoi(sreal);
                        cur_word[jj*2*DW +: DW] = samp;
                    end
                    in_valid = 1;
                    din = cur_word;
                    @(posedge clk); #1;
                end
                in_valid = 0;
                din = 0;
            end
        end

        wait_valid(2000);
        if (!out_valid) begin
            $display("FAIL [sine]: out_valid never asserted");
            fail_count = fail_count + 1;
        end

        wait_captured;
        $display("  blk_exp = %0d  (sine block captured)", blk_exp);

        // ================================================================
        // TEST 4: Multi-tone (3 simultaneous sines at bins 50, 200, 450)
        //   Each tone amplitude = 600 → sum amplitude ≤ 1800 (fits 16-bit)
        // ================================================================
        $display("TEST 4: Multi-tone (bins 50, 200, 450)");
        current_test_id = 3;

        // Feed 2 blocks of the multi-tone signal (warmup + valid)
        begin : blk_multi
            integer blk;
            for (blk = 0; blk < 2; blk = blk + 1) begin
                out_idx = 0;
                for (i = 0; i < WORDS; i = i + 1) begin
                    cur_word = 0;
                    for (jj = 0; jj < P; jj = jj + 1) begin
                        samp_idx = i * P + jj;
                        angle  = 2.0 * 3.141592653589793 *  50.0 * samp_idx / N_FFT;
                        angle2 = 2.0 * 3.141592653589793 * 200.0 * samp_idx / N_FFT;
                        angle3 = 2.0 * 3.141592653589793 * 450.0 * samp_idx / N_FFT;
                        sum_real = 600.0 * ($sin(angle) + $sin(angle2) + $sin(angle3));
                        samp = $rtoi(sum_real);
                        cur_word[jj*2*DW +: DW] = samp;
                    end
                    in_valid = 1;
                    din = cur_word;
                    @(posedge clk); #1;
                end
                in_valid = 0;
                din = 0;
            end
        end

        wait_valid(2000);
        if (!out_valid) begin
            $display("FAIL [multi]: out_valid never asserted");
            fail_count = fail_count + 1;
        end
        wait_captured;
        $display("  blk_exp = %0d  (multi-tone block captured)", blk_exp);

        // ================================================================
        // TEST 5: Linear chirp (frequency sweep from bin 0 to bin 511)
        //   x[n] = A * sin(2π · (f0 + (f1-f0)·n/(2N)) · n / N)
        //   f0 = 0, f1 = 511, A = 2048
        // ================================================================
        $display("TEST 5: Chirp (0 -> 511 Hz over N samples)");
        current_test_id = 4;

        f0_norm = 0.0;
        f1_norm = 511.0;

        // Feed 2 blocks of the chirp signal (warmup + valid)
        begin : blk_chirp
            integer blk;
            for (blk = 0; blk < 2; blk = blk + 1) begin
                out_idx = 0;
                for (i = 0; i < WORDS; i = i + 1) begin
                    cur_word = 0;
                    for (jj = 0; jj < P; jj = jj + 1) begin
                        samp_idx = i * P + jj;
                        // Instantaneous frequency: f0 + (f1-f0) * n / (2N)
                        // Phase = 2π · (f0 + (f1-f0)·n/(2N)) · n / N
                        phase_chirp = 2.0 * 3.141592653589793 *
                                      (f0_norm + (f1_norm - f0_norm) *
                                       samp_idx / (2.0 * N_FFT)) *
                                      samp_idx / N_FFT;
                        sreal = 2048.0 * $sin(phase_chirp);
                        samp = $rtoi(sreal);
                        cur_word[jj*2*DW +: DW] = samp;
                    end
                    in_valid = 1;
                    din = cur_word;
                    @(posedge clk); #1;
                end
                in_valid = 0;
                din = 0;
            end
        end

        wait_valid(2000);
        if (!out_valid) begin
            $display("FAIL [chirp]: out_valid never asserted");
            fail_count = fail_count + 1;
        end
        wait_captured;
        $display("  blk_exp = %0d  (chirp block captured)", blk_exp);

        // ================================================================
        // RESULT
        // ================================================================
        if (fail_count == 0)
            $display("PASS: tb_fft_top — all tests passed");
        else
            $display("FAIL: tb_fft_top — %0d test(s) failed", fail_count);

        $fclose(csv_output);
        $finish;
    end

    // Timeout watchdog (5 tests × ~2 blocks × 256 cycles × 10 ns + slack)
    initial begin
        #80000000;
        $display("TIMEOUT: tb_fft_top");
        $finish;
    end

endmodule
