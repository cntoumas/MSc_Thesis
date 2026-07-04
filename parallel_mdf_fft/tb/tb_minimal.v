// Minimal test for FFT top level
`timescale 1ns/1ps

module tb_minimal;

    localparam DW    = 16;
    localparam P     = 4;
    localparam N_FFT = 1024;
    localparam WORDS = N_FFT / P;
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

    // Simple CSV output
    integer csv_file;
    integer out_count = 0;

    initial begin
        csv_file = $fopen("fft_output.csv", "w");
        $fwrite(csv_file, "test_id,sample_idx,out0_r,out0_i,out1_r,out1_i,out2_r,out2_i,out3_r,out3_i,bfp_exp,time_ns\n");
        $fflush(csv_file);
    end

    always @(posedge clk) begin
        if (out_valid) begin
            $fwrite(csv_file, "0,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d\n",
                    out_count,
                    $signed(dout[0*2*DW +: DW]), $signed(dout[0*2*DW + DW +: DW]),
                    $signed(dout[1*2*DW +: DW]), $signed(dout[1*2*DW + DW +: DW]),
                    $signed(dout[2*2*DW +: DW]), $signed(dout[2*2*DW + DW +: DW]),
                    $signed(dout[3*2*DW +: DW]), $signed(dout[3*2*DW + DW +: DW]),
                    blk_exp, $time);
            out_count = out_count + P;
            if (out_count >= N_FFT) $fclose(csv_file);
        end
    end

    // Send zeros after impulse
    reg [31:0] i;
    
    initial begin
        $display("[TB] Starting");
        rst = 1; en = 1; in_valid = 0; din = 0;
        
        repeat (2) @(posedge clk);
        rst = 0;
        $display("[TB] Reset released");
        
        // Simple impulse input
        in_valid = 1;
        din = 0;
        din[0*2*DW +: DW] = 16'sd1000;  // Put impulse on path 0
        @(posedge clk);
        $display("[TB] Sent impulse");
        
        // Send zeros
        in_valid = 1;
        din = 0;
        for (i = 1; i < WORDS; i = i + 1) begin
            @(posedge clk);
        end
        in_valid = 0;
        din = 0;
        $display("[TB] Input complete, sent %0d cycles", WORDS);
        
        // Wait for outputs (need latency + output time)
        // Latency is ~10 stages + 256 output cycles = ~266 cycles minimum
        // Plus extra margin
        #1000000;  // 100 microseconds = 10000 cycles
        $display("[TB] Finished - outputs received: %0d samples", out_count);
        $finish;
    end

endmodule
