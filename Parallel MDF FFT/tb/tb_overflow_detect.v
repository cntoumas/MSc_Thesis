// =============================================================================
// tb_overflow_detect.v — Self-checking testbench for overflow_detect
//
// Tests (DATA_W=16, P=4, SW=17 bits per signal, 16 signals total):
//  1. All zeros           → no overflow
//  2. All max positive    → 17'sh7FFF  (top 2 bits = 0,0) → no overflow
//  3. All min negative    → 17'sh8000  (top 2 bits = 1,0) → OVERFLOW
//  4. One signal at +32767 (0_0111...111, top 2 bits 0,0) → no overflow
//  5. One signal at +32768 (0_1000...000, top 2 bits 0,1) → OVERFLOW
//     (largest positive that still overflows when stored as Q15+1)
//  6. One signal at -32769 (1_0111...111, top 2 bits 1,0) → OVERFLOW
//  7. Mix: 15 safe + 1 overflow → still overflow
//  8. All safe values with different signs → no overflow
// =============================================================================
`timescale 1ns/1ps

module tb_overflow_detect;

    localparam DW  = 16;
    localparam P   = 4;
    localparam SW  = DW + 1;                 // 17
    localparam N   = P * 4;                  // 16 signals
    localparam BUS = N * SW;                 // 272 bits

    reg  [BUS-1:0] data_in;
    wire            overflow;

    overflow_detect #(.DATA_W(DW), .P(P)) u_dut (
        .data_in(data_in),
        .overflow(overflow)
    );

    integer fail_count;
    integer j;

    // -------------------------------------------------------------------------
    // Helper: fill all N signals with the same SW-bit value
    // -------------------------------------------------------------------------
    task fill_all;
        input [SW-1:0] val;
        integer j;
        begin
            data_in = 0;
            for (j = 0; j < N; j = j + 1)
                data_in[j*SW +: SW] = val;
        end
    endtask

    // -------------------------------------------------------------------------
    // Helper: set only signal k to val, rest to safe value 17'sh0
    // -------------------------------------------------------------------------
    task fill_one;
        input integer    k;
        input [SW-1:0]   val;
        integer j;
        begin
            data_in = 0;
            // All signals = 0 (safe)
            for (j = 0; j < N; j = j + 1)
                data_in[j*SW +: SW] = {SW{1'b0}};
            // Overwrite signal k
            data_in[k*SW +: SW] = val;
        end
    endtask

    // -------------------------------------------------------------------------
    // Check helper
    // -------------------------------------------------------------------------
    task check;
        input expected;
        input [255:0] lbl;
        begin
            #1;
            if (overflow !== expected) begin
                $display("FAIL [%s]: overflow=%b, expected=%b", lbl, overflow, expected);
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        fail_count = 0;

        // ------------------------------------------------------------------
        // Test 1: All zeros — no overflow
        //   17'h00000 top 2 bits = 0,0 → safe
        // ------------------------------------------------------------------
        fill_all(17'h00000);
        check(1'b0, "all_zero");

        // ------------------------------------------------------------------
        // Test 2: All +32767 (17'sh00_7FFF) — no overflow
        //   top 2 bits = 0, 0 (sign=0, next=0) → safe
        // ------------------------------------------------------------------
        fill_all(17'sh0_7FFF);
        check(1'b0, "all_max_safe");

        // ------------------------------------------------------------------
        // Test 3: All 17'sh0_FFFF (-1 in 17-bit signed = 1_1111...1111)
        //   top 2 bits = 1,1 → safe (no overflow)
        // ------------------------------------------------------------------
        fill_all(17'sh1_FFFF);    // all ones = -1
        check(1'b0, "all_neg1_safe");

        // ------------------------------------------------------------------
        // Test 4: All 17'sh1_8000 (most negative 17-bit = -65536? No...)
        //   Actually the OVERFLOW case: top 2 bits differ.
        //   17'h1_0000 = 17'b1_0000_0000_0000_0000
        //   bit[16]=1 (sign), bit[15]=0 → they differ → OVERFLOW
        // ------------------------------------------------------------------
        fill_all(17'h1_0000);
        check(1'b1, "all_overflow_neg");

        // ------------------------------------------------------------------
        // Test 5: All 17'sh0_8000 = 17'b0_1000_0000_0000_0000
        //   bit[16]=0, bit[15]=1 → they differ → OVERFLOW
        // ------------------------------------------------------------------
        fill_all(17'sh0_8000);
        check(1'b1, "all_overflow_pos");

        // ------------------------------------------------------------------
        // Test 6: Only signal 0 overflows (0_1000...000), rest = 0
        // ------------------------------------------------------------------
        fill_one(0, 17'sh0_8000);
        check(1'b1, "one_overflow_sig0");

        // ------------------------------------------------------------------
        // Test 7: Only signal 15 (last) overflows
        // ------------------------------------------------------------------
        fill_one(N-1, 17'sh0_8000);
        check(1'b1, "one_overflow_sig_last");

        // ------------------------------------------------------------------
        // Test 8: Only signal 7 (middle) overflows
        // ------------------------------------------------------------------
        fill_one(7, 17'h1_0000);
        check(1'b1, "one_overflow_sig_mid");

        // ------------------------------------------------------------------
        // Test 9: 15 safe + 1 with value 17'h0_7FFF (safe) — no overflow
        // ------------------------------------------------------------------
        fill_all(17'sh0_7FFF);     // all safe
        check(1'b0, "fifteen_safe_one_safe");

        // ------------------------------------------------------------------
        // Test 10: Mix of positive and negative safe values
        //   17'sh1_C000 = 17'b1_1100_0000_0000_0000 → top 2 bits: 1,1 → safe
        //   17'sh0_3FFF = 17'b0_0011_1111_1111_1111 → top 2 bits: 0,0 → safe
        // ------------------------------------------------------------------
        begin
            data_in = 0;
            for (j = 0; j < N; j = j + 1) begin
                if (j[0])
                    data_in[j*SW +: SW] = 17'sh1_C000;   // -16384 in Q15+1, safe
                else
                    data_in[j*SW +: SW] = 17'sh0_3FFF;   // +16383, safe
            end
        end
        check(1'b0, "mix_pos_neg_safe");

        // ------------------------------------------------------------------
        // RESULT
        // ------------------------------------------------------------------
        if (fail_count == 0)
            $display("PASS: tb_overflow_detect — all tests passed");
        else
            $display("FAIL: tb_overflow_detect — %0d test(s) failed", fail_count);

        $finish;
    end

endmodule
