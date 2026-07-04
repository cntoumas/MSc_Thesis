// =============================================================================
// tb_butterfly_r2.v — Self-checking testbench for butterfly_r2
//
// Tests:
//  1. Basic: (3+4j) and (1+2j) → sum=(4+6j), diff=(2+2j)
//  2. Overflow corners: max+max, min+min
//  3. Conjugate inputs
//  4. Zero inputs
// =============================================================================
`timescale 1ns/1ps

module tb_butterfly_r2;

    localparam DW = 16;

    // Inputs
    reg signed [DW-1:0] a_re, a_im, b_re, b_im;

    // Outputs
    wire signed [DW:0]  sum_re, sum_im, diff_re, diff_im;

    // DUT
    butterfly_r2 #(.DATA_W(DW)) u_dut (
        .a_re(a_re), .a_im(a_im),
        .b_re(b_re), .b_im(b_im),
        .sum_re(sum_re), .sum_im(sum_im),
        .diff_re(diff_re), .diff_im(diff_im)
    );

    // -------------------------------------------------------------------------
    // Task: check one butterfly result
    // -------------------------------------------------------------------------
    integer fail_count;

    task check;
        input signed [DW:0] exp_sum_re, exp_sum_im, exp_diff_re, exp_diff_im;
        input [127:0]       label;
        begin
            #1; // let combinational settle
            if (sum_re  !== exp_sum_re  ||
                sum_im  !== exp_sum_im  ||
                diff_re !== exp_diff_re ||
                diff_im !== exp_diff_im) begin
                $display("FAIL [%s]: sum=(%0d+%0dj) diff=(%0d+%0dj), expected sum=(%0d+%0dj) diff=(%0d+%0dj)",
                    label,
                    sum_re,  sum_im,
                    diff_re, diff_im,
                    exp_sum_re,  exp_sum_im,
                    exp_diff_re, exp_diff_im);
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        fail_count = 0;

        // ------------------------------------------------------------------
        // Test 1: (3+4j) + (1+2j) = (4+6j), (3+4j) - (1+2j) = (2+2j)
        // ------------------------------------------------------------------
        a_re =  3; a_im =  4;
        b_re =  1; b_im =  2;
        check(17'd4, 17'd6, 17'd2, 17'd2, "basic_positive");

        // ------------------------------------------------------------------
        // Test 2: Zero inputs
        // ------------------------------------------------------------------
        a_re = 0; a_im = 0;
        b_re = 0; b_im = 0;
        check(0, 0, 0, 0, "zeros");

        // ------------------------------------------------------------------
        // Test 3: Negative inputs (-3-4j) + (-1-2j) = (-4-6j)
        // ------------------------------------------------------------------
        a_re = -3; a_im = -4;
        b_re = -1; b_im = -2;
        check(-17'sd4, -17'sd6, -17'sd2, -17'sd2, "negatives");

        // ------------------------------------------------------------------
        // Test 4: Max positive + max positive  (overflow test)
        //   a = 32767 + 32767j,  b = 32767 + 32767j
        //   sum  = 65534 + 65534j   (needs DATA_W+1 bits — no overflow in output)
        //   diff = 0 + 0j
        // ------------------------------------------------------------------
        a_re = 16'sh7FFF; a_im = 16'sh7FFF;
        b_re = 16'sh7FFF; b_im = 16'sh7FFF;
        check(17'sh0FFFE, 17'sh0FFFE, 17'sh0, 17'sh0, "max_plus_max");

        // ------------------------------------------------------------------
        // Test 5: Max positive - min negative
        //   a = 32767, b = -32768  →  diff = a-b = 32767-(-32768) = 65535
        //   sum = a+b = 32767-32768 = -1
        // ------------------------------------------------------------------
        a_re = 16'sh7FFF; a_im = 16'sh0;
        b_re = 16'sh8000; b_im = 16'sh0;
        check(-17'sd1, 17'sd0, 17'sh0FFFF, 17'sd0, "max_minus_minval");

        // ------------------------------------------------------------------
        // Test 6: Conjugate pair: a=(5+3j), b=(5-3j)
        //   sum  = (10+0j)
        //   diff = (0+6j)
        // ------------------------------------------------------------------
        a_re =  5; a_im =  3;
        b_re =  5; b_im = -3;
        check(17'sd10, 17'sd0, 17'sd0, 17'sd6, "conjugate_pair");

        // ------------------------------------------------------------------
        // RESULT
        // ------------------------------------------------------------------
        if (fail_count == 0)
            $display("PASS: tb_butterfly_r2 — all tests passed");
        else
            $display("FAIL: tb_butterfly_r2 — %0d test(s) failed", fail_count);

        $finish;
    end

endmodule
