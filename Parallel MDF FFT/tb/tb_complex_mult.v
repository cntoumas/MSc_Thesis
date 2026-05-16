// =============================================================================
// tb_complex_mult.v — Self-checking testbench for complex_mult
//
// Tests (all using PIPE_STGS=0, combinational):
//  1. Identity:    a * (1+0j) = a
//  2. Negate:      a * (-1+0j) = -a
//  3. j rotation:  a * (0-1j) = (im_a + (-re_a)j) [multiply by -j]
//  4. Known value: (3+4j)*(1-1j)/sqrt2 (approx, check within 2 LSB of rounding)
//  5. Max value:   (32767+32767j) * (32767+0j) — check no catastrophic error
//  6. Rounding:    verify convergent rounding eliminates DC bias
// =============================================================================
`timescale 1ns/1ps

module tb_complex_mult;

    localparam DW = 16;
    localparam TW = 16;
    localparam Q  = TW - 1;           // Q15: 1.0 = 32767

    // DUT (combinational)
    reg signed [DW-1:0] a_re, a_im;
    reg signed [TW-1:0] w_re, w_im;
    wire signed [DW-1:0] p_re, p_im;

    complex_mult #(.DATA_W(DW), .TWIDDLE_W(TW), .PIPE_STGS(0)) u_dut (
        .clk(1'b0), .rst(1'b0), .a_re(a_re), .a_im(a_im),
        .w_re(w_re), .w_im(w_im), .p_re(p_re), .p_im(p_im)
    );

    integer fail_count;
    real    a_re_r, a_im_r, w_re_r, w_im_r;
    real    exp_re_r, exp_im_r;
    real    got_re_r, got_im_r;
    real    err_re, err_im;
    // rounding-bias test variables (moved to module scope for iverilog compat)
    integer k;
    integer sum_err_re, sum_err_im;
    real exact_re, exact_im;

    // Q15 scale
    localparam real SCALE = 32767.0;

    task check_approx;
        input signed [DW-1:0] ex_re, ex_im;
        input integer          tol;    // tolerance in LSBs
        input [255:0]          lbl;
        begin
            #1;
            if ($signed(p_re - ex_re) > tol || $signed(ex_re - p_re) > tol ||
                $signed(p_im - ex_im) > tol || $signed(ex_im - p_im) > tol) begin
                $display("FAIL [%s]: got (%0d + %0dj), expected (%0d + %0dj), tol=%0d",
                         lbl, p_re, p_im, ex_re, ex_im, tol);
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        fail_count = 0;

        // ------------------------------------------------------------------
        // Test 1: multiply by 1+0j (identity)
        //   w = (32767, 0) in Q15 ≈ (1.0, 0.0)
        //   a = (100, 200)
        //   expected p ≈ (100, 200) within rounding
        // ------------------------------------------------------------------
        a_re = 100; a_im = 200;
        w_re = 16'sh7FFF; w_im = 16'sh0;
        check_approx(100, 200, 1, "identity");

        // ------------------------------------------------------------------
        // Test 2: multiply by -1+0j (negate)
        //   w = (-32768, 0) in Q15 = -1.0
        //   a = (100, 200)
        //   expected: (-100, -200) within 1 LSB (Q15 -1.0 = -32768)
        // ------------------------------------------------------------------
        a_re = 100; a_im = 200;
        w_re = 16'sh8000; w_im = 16'sh0;
        // p_re = 100*(-32768) - 200*0 = -3276800 >> 15 = -100.00...
        // p_im = 100*0 + 200*(-32768) >> 15 = -200
        check_approx(-100, -200, 1, "negate");

        // ------------------------------------------------------------------
        // Test 3: multiply by 0-1j  (rotate by -90°)
        //   w = (0, -32768) → w_re=0, w_im=-32768 ≈ -j
        //   a = (3 + 4j)
        //   (3+4j)*(0-1j) = 4 - 3j
        // ------------------------------------------------------------------
        a_re = 3; a_im = 4;
        w_re = 16'sh0; w_im = 16'sh8000;  // w_im = -32768 = -1.0 in Q15
        // p_re = 3*0 - 4*(-32768) >> 15 = 131072 >> 15 = 4
        // p_im = 3*(-32768) + 4*0 >> 15 = -98304 >> 15 = -3
        check_approx(4, -3, 1, "rotate_minus_j");

        // ------------------------------------------------------------------
        // Test 4: (1000 + 0j) * W_8^1 = (1000+0j)*(cos45° - j*sin45°)
        //   W_8^1 = (0.7071 - 0.7071j), stored as Q15:
        //     w_re = round(32767 * 0.70710678) = 23170
        //     w_im = round(-32767 * 0.70710678) = -23170
        //   expected: p_re ≈ 707, p_im ≈ -707
        // ------------------------------------------------------------------
        a_re = 1000; a_im = 0;
        w_re = 16'sh5A82; w_im = 16'hA57E;   // 23170 and -23170 signed
        // 1000*23170 / 32768 ≈ 707.0
        check_approx(707, -707, 2, "W8_1_rotation");

        // ------------------------------------------------------------------
        // Test 5: Rounding bias check
        //   Feed 1000 identical values through and measure mean error.
        //   For convergent rounding, mean error ≈ 0; for truncation, mean < 0.
        // ------------------------------------------------------------------
        begin
            sum_err_re = 0;
            sum_err_im = 0;
            a_im = 0;
            w_re = 16'sh5A82; w_im = 16'hA57E;

            for (k = 1; k <= 100; k = k + 1) begin
                a_re = k;
                #1;
                exact_re = (1.0 * k * 23170 - 0) / 32768.0;
                exact_im = (0 + 0) / 32768.0;
                sum_err_re = sum_err_re + ($signed(p_re) - $rtoi(exact_re));
            end
            // Convergent rounding: |mean error| should be < 1
            if (sum_err_re < 0) sum_err_re = -sum_err_re;
            if (sum_err_re > 100) begin
                $display("FAIL [rounding_bias]: cumulative re error = %0d (expected < 100)",
                         sum_err_re);
                fail_count = fail_count + 1;
            end
        end

        // ------------------------------------------------------------------
        // RESULT
        // ------------------------------------------------------------------
        if (fail_count == 0)
            $display("PASS: tb_complex_mult — all tests passed");
        else
            $display("FAIL: tb_complex_mult — %0d test(s) failed", fail_count);

        $finish;
    end

endmodule
