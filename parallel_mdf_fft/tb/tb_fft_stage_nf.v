// =============================================================================
// tb_fft_stage_nf.v — Self-checking testbench for fft_stage_nf
//
// Tests both IDX=0 (stage 8, pairs 0-2 and 1-3) and IDX=1 (stage 9):
//
// IDX=0 tests:
//  1. Identity: input (a,0,b,0) — paths 1 and 3 are zero.
//     BF pair A: sum0=a+b, diff0=a-b  (×W_4^0=1)
//     BF pair B: sum1=0+0=0, diff1=(0-0)×(-j)=0
//     Expected outputs: path0=a+b, path1=0, path2=a-b, path3=0
//
//  2. j-rotation: input (0,0,0,1+0j) — only path 3 non-zero.
//     BF pair B: a=path1=0, b=path3=(1+0j)
//       sum1  = 0 + (1+0j) = 1+0j
//       diff1 = 0 - (1+0j) = -1+0j → ×(-j) → re=+im=-0j=0, im=-re=+1
//     Expected: path0=0, path1=1+0j, path2=0, path3=0+1j
//
//  3. Zero input → zero output.
//
// IDX=1 tests:
//  4. Basic: input (a,b,0,0), pairs (0,1) and (2,3).
//     BF pair A: sum=a+b, diff=a-b (×1)
//     BF pair B: sum=0,   diff=0
//     Expected: path0=a+b, path1=a-b, path2=0, path3=0
//
//  5. Zero input → zero output.
//
// (blk_exp is tested implicitly — it must be 0 for small inputs.)
// =============================================================================
`timescale 1ns/1ps

module tb_fft_stage_nf;

    localparam DW = 16;
    localparam P  = 4;
    localparam CLK_P = 10;

    // Two DUT instances: IDX=0 and IDX=1
    reg  clk, rst;
    reg  [P*2*DW-1:0] din0, din1;
    wire [P*2*DW-1:0] dout0, dout1;
    wire [3:0]         bexp0, bexp1;

    fft_stage_nf #(.DATA_W(DW), .P(P), .IDX(0)) u_dut0 (
        .clk(clk), .rst(rst), .din(din0), .dout(dout0), .blk_exp(bexp0)
    );
    fft_stage_nf #(.DATA_W(DW), .P(P), .IDX(1)) u_dut1 (
        .clk(clk), .rst(rst), .din(din1), .dout(dout1), .blk_exp(bexp1)
    );

    initial clk = 0;
    always #(CLK_P/2) clk = ~clk;

    integer fail_count;

    // -------------------------------------------------------------------------
    // Helpers
    // -------------------------------------------------------------------------
    function signed [DW-1:0] re_of;
        input [P*2*DW-1:0] bus;
        input integer pp;
        re_of = $signed(bus[pp*2*DW          +: DW]);
    endfunction

    function signed [DW-1:0] im_of;
        input [P*2*DW-1:0] bus;
        input integer pp;
        im_of = $signed(bus[pp*2*DW + DW +: DW]);
    endfunction

    task set_path;
        input [P*2*DW-1:0] bus;     // modified by reference via din0/din1
        input integer pp;
        input signed [DW-1:0] re, im;
        begin end
    endtask

    // Inline helper: build a bus with one path set
    function [P*2*DW-1:0] mk_bus;
        input integer pp;
        input signed [DW-1:0] re, im;
        integer j;
        begin
            mk_bus = 0;
            mk_bus[pp*2*DW          +: DW] = re;
            mk_bus[pp*2*DW + DW     +: DW] = im;
        end
    endfunction

    task check_path;
        input [P*2*DW-1:0] bus;
        input integer pp;
        input signed [DW-1:0] exp_re, exp_im;
        input integer tol;
        input [255:0] lbl;
        begin
            #1;
            if (($signed(re_of(bus,pp) - exp_re) > tol) || ($signed(exp_re - re_of(bus,pp)) > tol) ||
                ($signed(im_of(bus,pp) - exp_im) > tol) || ($signed(exp_im - im_of(bus,pp)) > tol)) begin
                $display("FAIL [%s] path%0d: got (%0d+%0dj), expected (%0d+%0dj), tol=%0d",
                         lbl, pp, re_of(bus,pp), im_of(bus,pp), exp_re, exp_im, tol);
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        fail_count = 0;
        rst  = 1;
        din0 = 0;
        din1 = 0;
        @(posedge clk); #1;
        rst = 0;

        // ================================================================
        // IDX=0: Test 1 — BF pair A only (paths 0 and 2)
        //   a=100+0j (path0), b=60+0j (path2), paths 1,3 = 0
        //   sum0  = 160, diff0 = 40  (×W_4^0=1 → 40+0j)
        //   sum1  = 0,   diff1 = 0   (×(-j) → 0)
        //   dout: p0=160, p1=0, p2=40, p3=0
        // ================================================================
        din0 = 0;
        din0[0*2*DW          +: DW] = 16'sd100;   // path0 re
        din0[2*2*DW          +: DW] = 16'sd60;    // path2 re
        #1;
        check_path(dout0, 0, 16'sd160, 16'sd0,   1, "idx0_pair_A_sum");
        check_path(dout0, 2, 16'sd40,  16'sd0,   1, "idx0_pair_A_diff");
        check_path(dout0, 1, 16'sd0,   16'sd0,   1, "idx0_pair_B_zero_sum");
        check_path(dout0, 3, 16'sd0,   16'sd0,   1, "idx0_pair_B_zero_diff");

        // ================================================================
        // IDX=0: Test 2 — j-rotation from path3 only
        //   path1=(0,0), path3=(1+0j)
        //   BF pair B: a=0, b=(1+0j)
        //     sum1  = 0+1 = 1+0j
        //     diff1 = 0-1 = -1+0j → ×(-j): re=+im=-0=0, im=-re=+1 → (0+1j)
        //   dout: p0=0, p1=(1+0j), p2=0, p3=(0+1j)
        // ================================================================
        din0 = 0;
        din0[3*2*DW +: DW] = 16'sd1;     // path3 re = 1
        #1;
        check_path(dout0, 0, 16'sd0,  16'sd0, 1, "idx0_jrot_p0");
        check_path(dout0, 1, 16'sd1,  16'sd0, 1, "idx0_jrot_p1_sum");
        check_path(dout0, 2, 16'sd0,  16'sd0, 1, "idx0_jrot_p2");
        check_path(dout0, 3, 16'sd0,  16'sd1, 1, "idx0_jrot_p3_diff_rotated");

        // ================================================================
        // IDX=0: Test 3 — Zero input
        // ================================================================
        din0 = 0;
        #1;
        check_path(dout0, 0, 16'sd0, 16'sd0, 0, "idx0_zero_p0");
        check_path(dout0, 1, 16'sd0, 16'sd0, 0, "idx0_zero_p1");
        check_path(dout0, 2, 16'sd0, 16'sd0, 0, "idx0_zero_p2");
        check_path(dout0, 3, 16'sd0, 16'sd0, 0, "idx0_zero_p3");

        // ================================================================
        // IDX=1: Test 4 — BF pairs (0,1) and (2,3)
        //   a=200+0j (path0), b=80+0j (path1)
        //   sum=280, diff=120 (×W_2^0=1)
        //   paths 2,3 = 0 → sum=0, diff=0
        // ================================================================
        din1 = 0;
        din1[0*2*DW +: DW] = 16'sd200;
        din1[1*2*DW +: DW] = 16'sd80;
        #1;
        check_path(dout1, 0, 16'sd280, 16'sd0, 1, "idx1_pair_A_sum");
        check_path(dout1, 1, 16'sd120, 16'sd0, 1, "idx1_pair_A_diff");
        check_path(dout1, 2, 16'sd0,   16'sd0, 1, "idx1_pair_B_zero");
        check_path(dout1, 3, 16'sd0,   16'sd0, 1, "idx1_pair_B_zero_d");

        // ================================================================
        // IDX=1: Test 5 — Zero input
        // ================================================================
        din1 = 0;
        #1;
        check_path(dout1, 0, 16'sd0, 16'sd0, 0, "idx1_zero_p0");
        check_path(dout1, 1, 16'sd0, 16'sd0, 0, "idx1_zero_p1");
        check_path(dout1, 2, 16'sd0, 16'sd0, 0, "idx1_zero_p2");
        check_path(dout1, 3, 16'sd0, 16'sd0, 0, "idx1_zero_p3");

        // ================================================================
        // RESULT
        // ================================================================
        if (fail_count == 0)
            $display("PASS: tb_fft_stage_nf — all tests passed");
        else
            $display("FAIL: tb_fft_stage_nf — %0d test(s) failed", fail_count);

        $finish;
    end

    // Timeout
    initial begin
        #100000;
        $display("TIMEOUT: tb_fft_stage_nf");
        $finish;
    end

endmodule
