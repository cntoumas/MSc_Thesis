// =============================================================================
// tb_delay_line.v — Self-checking testbench for delay_line
//
// Tests:
//  1. DEPTH=4:  ramp input, verify dout delayed by exactly 4 cycles
//  2. DEPTH=1:  single-register behaviour
//  3. Enable gating: en=0 freezes the delay line
// =============================================================================
`timescale 1ns/1ps

module tb_delay_line;

    // -------------------------------------------------------------------------
    // Parameters
    // -------------------------------------------------------------------------
    localparam DATA_W = 16;
    localparam P      = 4;
    localparam CLK_P  = 10; // 100 MHz

    // -------------------------------------------------------------------------
    // DUT helpers — we test two instances with different DEPTH
    // -------------------------------------------------------------------------

    // ---- Test 1: DEPTH=4 ----
    localparam DEPTH4 = 4;
    reg  clk, en4;
    reg  [P*2*DATA_W-1:0] din4;
    wire [P*2*DATA_W-1:0] dout4;

    delay_line #(.DATA_W(DATA_W), .P(P), .DEPTH(DEPTH4)) u_dut4 (
        .clk(clk), .en(en4), .din(din4), .dout(dout4)
    );

    // ---- Test 2: DEPTH=1 ----
    localparam DEPTH1 = 1;
    reg  en1;
    reg  [P*2*DATA_W-1:0] din1;
    wire [P*2*DATA_W-1:0] dout1;

    delay_line #(.DATA_W(DATA_W), .P(P), .DEPTH(DEPTH1)) u_dut1 (
        .clk(clk), .en(en1), .din(din1), .dout(dout1)
    );

    // ---- Test 3: DEPTH=128 with en gating ----
    localparam DEPTH128 = 128;
    reg  en128;
    reg  [P*2*DATA_W-1:0] din128;
    wire [P*2*DATA_W-1:0] dout128;

    delay_line #(.DATA_W(DATA_W), .P(P), .DEPTH(DEPTH128)) u_dut128 (
        .clk(clk), .en(en128), .din(din128), .dout(dout128)
    );

    // -------------------------------------------------------------------------
    // Clock
    // -------------------------------------------------------------------------
    initial clk = 0;
    always #(CLK_P/2) clk = ~clk;

    // -------------------------------------------------------------------------
    // Test stimulus
    // -------------------------------------------------------------------------
    integer fail_count;
    integer i, j;
    reg [P*2*DATA_W-1:0] expected_queue4 [0:DEPTH4-1]; // circular reference buffer
    reg [P*2*DATA_W-1:0] ref_val;

    // Simple counter to generate unique test values per cycle
    reg [31:0] cycle_ctr;
    always @(posedge clk) cycle_ctr <= cycle_ctr + 1;

    initial begin
        fail_count = 0;
        cycle_ctr  = 0;
        en4   = 0; din4   = 0;
        en1   = 0; din1   = 0;
        en128 = 0; din128 = 0;

        // Initialise reference queues
        for (i = 0; i < DEPTH4; i = i + 1)
            expected_queue4[i] = 0;

        // =====================================================================
        // TEST 1: DEPTH=4 ramp — verify exact 4-cycle delay
        // =====================================================================
        @(posedge clk); #1;
        en4 = 1;

        // Push DEPTH4+10 = 14 values and check each output
        for (i = 0; i < DEPTH4 + 10; i = i + 1) begin
            // Build a unique input pattern: pack path index into each 16-bit slot
            din4 = 0;
            for (j = 0; j < P*2; j = j + 1)
                din4[j*DATA_W +: DATA_W] = i * (P*2) + j + 1; // unique, non-zero

            @(posedge clk); #1;

            // After DEPTH4 writes the oldest value should emerge
            if (i >= DEPTH4) begin
                ref_val = 0;
                for (j = 0; j < P*2; j = j + 1)
                    ref_val[j*DATA_W +: DATA_W] = (i - DEPTH4) * (P*2) + j + 1;

                if (dout4 !== ref_val) begin
                    $display("FAIL [DEPTH=4] cycle %0d: got %h, expected %h",
                             i, dout4, ref_val);
                    fail_count = fail_count + 1;
                end
            end
        end
        en4 = 0;

        // =====================================================================
        // TEST 2: DEPTH=1 — single register
        // =====================================================================
        @(posedge clk); #1;
        en1 = 1;
        din1 = 128'hDEAD_BEEF_0000_0001_DEAD_BEEF_0000_0001;
        @(posedge clk); #1;
        // Now dout1 should equal the value we wrote 1 cycle ago
        if (dout1 !== 128'hDEAD_BEEF_0000_0001_DEAD_BEEF_0000_0001) begin
            $display("FAIL [DEPTH=1]: got %h, expected DEAD...0001", dout1);
            fail_count = fail_count + 1;
        end
        din1 = 128'hCAFE_BABE_0000_0002_CAFE_BABE_0000_0002;
        @(posedge clk); #1;
        if (dout1 !== 128'hCAFE_BABE_0000_0002_CAFE_BABE_0000_0002) begin
            $display("FAIL [DEPTH=1] second write: got %h", dout1);
            fail_count = fail_count + 1;
        end
        en1 = 0;

        // =====================================================================
        // TEST 3: en gating — line should freeze when en=0
        // =====================================================================
        @(posedge clk); #1;
        en4  = 1;
        din4 = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
        repeat (DEPTH4 + 1) @(posedge clk); // fill + one flush so dout_r = AAAA
        #1;
        // Now gate en off, change din — dout should not change
        en4  = 0;
        din4 = 128'hBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB;
        repeat (2) @(posedge clk); #1;
        if (dout4 !== 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA) begin
            $display("FAIL [en gating]: dout changed while en=0, got %h", dout4);
            fail_count = fail_count + 1;
        end

        // =====================================================================
        // RESULT
        // =====================================================================
        if (fail_count == 0)
            $display("PASS: tb_delay_line — all tests passed");
        else
            $display("FAIL: tb_delay_line — %0d test(s) failed", fail_count);

        $finish;
    end

    // Timeout watchdog
    initial begin
        #500000;
        $display("TIMEOUT: tb_delay_line did not finish");
        $finish;
    end

endmodule
