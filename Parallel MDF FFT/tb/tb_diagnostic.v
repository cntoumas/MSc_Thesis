// Diagnostic test for FFT pipeline
`timescale 1ns/1ps

module tb_diagnostic;

    localparam DW    = 16;
    localparam P     = 4;
    localparam N_FFT = 1024;
    localparam WORDS = N_FFT / P;  // 256
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

    integer cycle_count = 0;
    integer timeout_count = 0;
    always @(posedge clk) cycle_count = cycle_count + 1;

    initial begin
        $display("[DIAG] Starting diagnostic test");
        rst = 1; en = 1; in_valid = 0; din = 0;

        repeat (5) @(posedge clk);
        rst = 0;
        $display("[DIAG] Reset released at cycle %0d", cycle_count);

        // Send a single impulse on path 0
        in_valid = 1;
        din = 0;
        din[0*2*DW +: DW] = 16'sd1000;  // Real part of path 0
        @(posedge clk);
        $display("[DIAG] Sent impulse at cycle %0d", cycle_count);

        // Send zeros for the rest of the block
        in_valid = 1;
        din = 0;
        repeat (WORDS - 1) @(posedge clk);

        in_valid = 0;
        din = 0;
        $display("[DIAG] Input block complete at cycle %0d", cycle_count);

        // Wait for outputs with timeout
        timeout_count = 0;
        while (!out_valid && timeout_count < 5000) begin
            @(posedge clk);
            timeout_count = timeout_count + 1;
            cycle_count = cycle_count + 1;  // Update cycle_count here too
            if (timeout_count % 500 == 0)
                $display("[DIAG] Waiting... cycle %0d, timeout_count %0d, out_valid=%b", cycle_count, timeout_count, out_valid);
        end

        if (timeout_count >= 5000) begin
            $display("[DIAG] TIMEOUT: No output after 5000 cycles");
            $finish;
        end

        $display("[DIAG] SUCCESS: First output at cycle %0d, blk_exp=%h", cycle_count, blk_exp);
        $display("[DIAG] dout[31:0]=%h", dout[31:0]);
        $finish;
    end

endmodule