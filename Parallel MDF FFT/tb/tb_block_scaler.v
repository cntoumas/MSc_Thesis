// =============================================================================
// tb_block_scaler.v — Self-checking testbench for block_scaler
//
// Tests (DATA_W=16, P=4, EXP_W=4):
//  1. No overflow:  truncation applied, blk_exp stays 0
//  2. Overflow:     arithmetic right-shift, blk_exp increments to 1
//  3. Multiple overflows:  blk_exp accumulates correctly
//  4. Reset:        blk_exp resets to 0
//  5. Negative overflow value: arithmetic shift preserves sign
//  6. Zero input:  output stays zero regardless of overflow flag
// =============================================================================
`timescale 1ns/1ps

module tb_block_scaler;

    localparam DW    = 16;
    localparam P     = 4;
    localparam EXP_W = 4;
    localparam N     = P * 4;       // 16 signals
    localparam SW    = DW + 1;      // 17 bits in
    localparam CLK_P = 10;

    reg                      clk, rst, overflow;
    reg  [N*SW-1:0]          data_in;
    wire [N*DW-1:0]          data_out;
    wire [EXP_W-1:0]         blk_exp;

    block_scaler #(.DATA_W(DW), .P(P), .EXP_W(EXP_W)) u_dut (
        .clk(clk), .rst(rst),
        .data_in(data_in),
        .overflow(overflow),
        .data_out(data_out),
        .blk_exp(blk_exp)
    );

    initial clk = 0;
    always #(CLK_P/2) clk = ~clk;

    integer fail_count;

    // -------------------------------------------------------------------------
    // Helper: fill all N input signals with the same SW-bit value
    // -------------------------------------------------------------------------
    task fill_all_in;
        input [SW-1:0] val;
        integer j;
        begin
            for (j = 0; j < N; j = j + 1)
                data_in[j*SW +: SW] = val;
        end
    endtask

    // -------------------------------------------------------------------------
    // Helper: check that all N output signals equal expected DW-bit value
    // -------------------------------------------------------------------------
    task check_out_all;
        input signed [DW-1:0]  exp_val;
        input [EXP_W-1:0]      exp_exp;
        input [255:0]           lbl;
        integer j;
        begin
            #1;
            for (j = 0; j < N; j = j + 1) begin
                if ($signed(data_out[j*DW +: DW]) !== exp_val) begin
                    $display("FAIL [%s] signal %0d: got %0d, expected %0d",
                             lbl, j, $signed(data_out[j*DW +: DW]), exp_val);
                    fail_count = fail_count + 1;
                end
            end
            if (blk_exp !== exp_exp) begin
                $display("FAIL [%s] blk_exp: got %0d, expected %0d",
                         lbl, blk_exp, exp_exp);
                fail_count = fail_count + 1;
            end
        end
    endtask

    integer j;    // loop variable (module scope for iverilog compat)

    initial begin
        fail_count = 0;
        rst      = 1;
        overflow = 0;
        data_in  = 0;

        @(posedge clk); #1;
        rst = 0;

        // ------------------------------------------------------------------
        // Test 1: No overflow, truncation
        //   Input: 17'b0_0000_0001_0010_0011 = 17'd291
        //   top 2 bits: 0,0 → safe
        //   Expected output: 16'd291 (just [15:0])
        //   blk_exp: 0
        // ------------------------------------------------------------------
        fill_all_in(17'sh0_0123);  // +291
        overflow = 0;
        check_out_all(16'sh0123, 4'd0, "no_overflow_truncate");

        // ------------------------------------------------------------------
        // Test 2: Overflow, arithmetic right-shift
        //   Input: 17'sh0_8000 = 17'b0_1000_0000_0000_0000 = +32768
        //   top 2 bits: 0,1 → overflow
        //   Expected output: [16:1] = {0, 0_1000_0000_0000_000} = 16'sh4000
        //   blk_exp: 1 (after one posedge with overflow=1)
        // ------------------------------------------------------------------
        fill_all_in(17'sh0_8000);
        overflow = 1;
        // Check combinational output before clock
        #1;
        begin
            for (j = 0; j < N; j = j + 1) begin
                if ($signed(data_out[j*DW +: DW]) !== 16'sh4000) begin
                    $display("FAIL [overflow_shift] signal %0d: got %0d, expected %0d",
                             j, $signed(data_out[j*DW +: DW]), 16'sh4000);
                    fail_count = fail_count + 1;
                end
            end
        end
        @(posedge clk); #1;    // blk_exp should now be 1
        if (blk_exp !== 4'd1) begin
            $display("FAIL [overflow_blkexp1]: got %0d, expected 1", blk_exp);
            fail_count = fail_count + 1;
        end

        // ------------------------------------------------------------------
        // Test 3: Multiple overflows — blk_exp accumulates
        // ------------------------------------------------------------------
        overflow = 1;
        @(posedge clk); #1;   // blk_exp = 2
        @(posedge clk); #1;   // blk_exp = 3
        if (blk_exp !== 4'd3) begin
            $display("FAIL [accum_exp]: got %0d, expected 3", blk_exp);
            fail_count = fail_count + 1;
        end

        // ------------------------------------------------------------------
        // Test 4: Reset clears blk_exp
        // ------------------------------------------------------------------
        rst = 1;
        @(posedge clk); #1;
        rst = 0;
        if (blk_exp !== 4'd0) begin
            $display("FAIL [reset_exp]: got %0d, expected 0", blk_exp);
            fail_count = fail_count + 1;
        end

        // ------------------------------------------------------------------
        // Test 5: Negative value overflow — arithmetic shift preserves sign
        //   Input: 17'h1_0000 = 17'b1_0000_0000_0000_0000 = -65536 (17-bit)
        //   top 2 bits: 1,0 → overflow
        //   Expected output [16:1]: {1, 1_0000_0000_0000_000} = 16'sh8000 (-32768)
        //   i.e., arithmetic right-shift: -65536 >> 1 = -32768
        // ------------------------------------------------------------------
        fill_all_in(17'h1_0000);
        overflow = 1;
        #1;
        begin
            for (j = 0; j < N; j = j + 1) begin
                if ($signed(data_out[j*DW +: DW]) !== 16'sh8000) begin
                    $display("FAIL [neg_overflow_shift] sig %0d: got %0d, expected -32768",
                             j, $signed(data_out[j*DW +: DW]));
                    fail_count = fail_count + 1;
                end
            end
        end

        // ------------------------------------------------------------------
        // Test 6: Zero input → output zero regardless of overflow
        // ------------------------------------------------------------------
        fill_all_in(17'sh0_0000);
        overflow = 1;
        check_out_all(16'sh0000, 4'd0, "zero_in_overflow");

        overflow = 0;
        check_out_all(16'sh0000, 4'd0, "zero_in_no_overflow");

        // ------------------------------------------------------------------
        // RESULT
        // ------------------------------------------------------------------
        if (fail_count == 0)
            $display("PASS: tb_block_scaler — all tests passed");
        else
            $display("FAIL: tb_block_scaler — %0d test(s) failed", fail_count);

        $finish;
    end

    // Timeout
    initial begin
        #100000;
        $display("TIMEOUT: tb_block_scaler");
        $finish;
    end

endmodule
