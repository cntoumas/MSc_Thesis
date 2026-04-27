`timescale 1ns / 1ps

module fft_tb_debug;

    parameter N = 4096;
    parameter P = 8;
    parameter DATA_WIDTH = 17; 
    parameter TWIDDLE_WIDTH = 16;

    reg clk;
    reg rst;
    
    reg [DATA_WIDTH-1:0] stim_re [0:N-1];
    reg [DATA_WIDTH-1:0] stim_im [0:N-1];

    reg valid_in;
    reg [(P * DATA_WIDTH)-1:0] data_in_re_flat;
    reg [(P * DATA_WIDTH)-1:0] data_in_im_flat;
    
    wire valid_out;
    wire [(P * DATA_WIDTH)-1:0] data_out_re_flat;
    wire [(P * DATA_WIDTH)-1:0] data_out_im_flat;
    wire signed [7:0] exp_out;

    integer f_out_csv;
    integer f_out_exp;
    integer f_debug;
    integer f_stage0_re, f_stage0_im;
    integer f_stage1_re, f_stage1_im;

    // Clock Generation (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // DUT Instantiation
    parallel_fft_top #(
        .FFT_SIZE(N),
        .P(P),
        .DATA_WIDTH(DATA_WIDTH),
        .TWIDDLE_WIDTH(TWIDDLE_WIDTH)
    ) uut (
        .clk(clk),
        .rst(rst),
        .valid_in(valid_in),
        .data_in_re_flat(data_in_re_flat),
        .data_in_im_flat(data_in_im_flat),
        .valid_out(valid_out),
        .data_out_re_flat(data_out_re_flat),
        .data_out_im_flat(data_out_im_flat),
        .global_exp_out(exp_out)
    );

    // Main test logic
    integer i, j;
    
    initial begin
        // Load stimulus
        $readmemh("stimulus_re.mem", stim_re);
        $readmemh("stimulus_im.mem", stim_im);
        
        // Open output files
        f_out_csv = $fopen("hw_output.csv", "w");
        f_out_exp = $fopen("hw_exponent.txt", "w");
        f_debug = $fopen("debug_trace.txt", "w");
        f_stage0_re = $fopen("stage0_re.csv", "w");
        f_stage0_im = $fopen("stage0_im.csv", "w");
        f_stage1_re = $fopen("stage1_re.csv", "w");
        f_stage1_im = $fopen("stage1_im.csv", "w");

        if (f_out_csv == 0 || f_debug == 0) begin
            $display("[!] Error: Could not open output files.");
            $finish;
        end

        // Initialize and Reset
        valid_in = 0;
        data_in_re_flat = 0;
        data_in_im_flat = 0;
        rst = 1;
        #100;
        rst = 0;
        #20;

        // Feed the data
        $display("[*] Feeding %0d samples to the Parallel FFT (8 lanes per cycle)...", N);
        
        for (i = 0; i < N; i = i + P) begin
            @(posedge clk);
            valid_in <= 1'b1;
            
            for (j = 0; j < P; j = j + 1) begin
                data_in_re_flat[(j * DATA_WIDTH) +: DATA_WIDTH] <= stim_re[i + j];
                data_in_im_flat[(j * DATA_WIDTH) +: DATA_WIDTH] <= stim_im[i + j];
            end
        end
        
        @(posedge clk);
        valid_in <= 1'b0;
        
        // Wait for pipeline to flush
        #100000;
        $display("[!] Timeout reached without collecting all output samples.");
        $fclose(f_out_csv);
        $fclose(f_out_exp);
        $fclose(f_debug);
        $fclose(f_stage0_re);
        $fclose(f_stage0_im);
        $fclose(f_stage1_re);
        $fclose(f_stage1_im);
        $finish;
    end

    // Output capture logic
    integer out_count = 0;
    reg signed [DATA_WIDTH-1:0] signed_re;
    reg signed [DATA_WIDTH-1:0] signed_im;
    integer k;
    integer cycle_count = 0;

    always @(posedge clk) begin
        cycle_count = cycle_count + 1;
        
        // Debug: check for undefined values in valid_out signal
        if (valid_out === 1'bx) begin
            $fwrite(f_debug, "Cycle %0d: valid_out is UNDEFINED!\n", cycle_count);
        end
        
        if (valid_out) begin
            // Unpack and write output
            for (k = 0; k < P; k = k + 1) begin
                signed_re = data_out_re_flat[(k * DATA_WIDTH) +: DATA_WIDTH];
                signed_im = data_out_im_flat[(k * DATA_WIDTH) +: DATA_WIDTH];
                
                // Check for undefined values
                if (signed_re === 17'bx || signed_im === 17'bx) begin
                    $fwrite(f_debug, "Cycle %0d, Lane %0d: OUTPUT IS UNDEFINED\n", cycle_count, k);
                    $fwrite(f_out_csv, "X,X\n");
                end else begin
                    $fwrite(f_out_csv, "%0d,%0d\n", signed_re, signed_im);
                end
                
                out_count = out_count + 1;
            end
            
            if (out_count >= N) begin
                $display("[+] All %0d points collected from %0d parallel lanes.", N, P);
                $display("[+] Final BFP Exponent: %0d", exp_out);
                $display("[+] Total cycles: %0d", cycle_count);
                
                $fwrite(f_out_exp, "%0d\n", exp_out);
                
                $fclose(f_out_csv);
                $fclose(f_out_exp);
                $fclose(f_debug);
                $fclose(f_stage0_re);
                $fclose(f_stage0_im);
                $fclose(f_stage1_re);
                $fclose(f_stage1_im);
                $display("=== Simulation Complete ===");
                $finish;
            end
        end
    end

    // Debug: Monitor key stage outputs
    always @(posedge clk) begin
        if (cycle_count > 100 && cycle_count < 200) begin
            // Sample stage 0 output (will require hierarchy access)
            $fwrite(f_debug, "Cycle %0d: valid_in=%b valid_out=%b exp_out=%d\n", 
                    cycle_count, valid_in, valid_out, exp_out);
        end
    end

endmodule
