`timescale 1ns/1ps

module tb_rom_load_test;
    // Quick test: verify ROM loads for stage 0 path 0 and stage 7 path 0
    reg [6:0] addr0;
    wire signed [15:0] s0p0_re, s0p0_im;
    wire signed [15:0] s7p0_re, s7p0_im;

    // Stage 0, path 0 (DEPTH=128, ADDR_W=7)
    twiddle_rom #(.DEPTH(128), .ADDR_W(7), .HEX_FILE("rom/tw_s0_p0.hex")) u_s0p0 (
        .addr(addr0),
        .re_out(s0p0_re),
        .im_out(s0p0_im)
    );

    // Stage 7, path 0 (DEPTH=1, ADDR_W=1)
    twiddle_rom #(.DEPTH(1), .ADDR_W(1), .HEX_FILE("rom/tw_s7_p0.hex")) u_s7p0 (
        .addr(addr0[0]),
        .re_out(s7p0_re),
        .im_out(s7p0_im)
    );

    initial begin
        addr0 = 0;
        #1;
        $display("[TB_ROM] s0p0[0] = re=%0d im=%0d", s0p0_re, s0p0_im);
        $display("[TB_ROM] s7p0[0] = re=%0d im=%0d", s7p0_re, s7p0_im);
        if (s0p0_re == 16'sd32767 && s0p0_im == 16'sd0)
            $display("[PASS] s0p0[0] = 1+0j");
        else
            $display("[FAIL] s0p0[0] = %0d + %0dj", s0p0_re, s0p0_im);

        if (s7p0_re == 16'sd32767 && s7p0_im == 16'sd0)
            $display("[PASS] s7p0[0] = 1+0j");
        else
            $display("[FAIL] s7p0[0] = %0d + %0dj", s7p0_re, s7p0_im);

        $finish;
    end
endmodule
