`timescale 1ns / 1ps

module fft_tb;

    // ========================================================
    // Thesis Parameters: 4096-point FFT, 8-Parallel Lanes
    // ========================================================
    parameter N = 4096;
    parameter P = 16;
    parameter DATA_WIDTH = 32; 
    parameter TWIDDLE_WIDTH = 24;

    // ========================================================
    // Signals
    // ========================================================
    reg clk;
    reg rst;
    
    // Stimulus memory arrays (Full N depth)
    reg [DATA_WIDTH-1:0] stim_re [0:N-1];
    reg [DATA_WIDTH-1:0] stim_im [0:N-1];

    // DUT Interface Signals
    reg valid_in;
    reg [(P * DATA_WIDTH)-1:0] data_in_re_flat;
    reg [(P * DATA_WIDTH)-1:0] data_in_im_flat;
    
    wire valid_out;
    wire [(P * DATA_WIDTH)-1:0] data_out_re_flat;
    wire [(P * DATA_WIDTH)-1:0] data_out_im_flat;
    wire signed [7:0] exp_out;

    // File handles
    integer f_out_csv;
    integer f_out_exp;

    // ========================================================
    // Clock Generation (100 MHz)
    // ========================================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // ========================================================
    // DUT Instantiation (Parallel FFT Top)
    // ========================================================
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

    // ========================================================
    // Stimulus and Control Logic
    // ========================================================
    integer i, j;
    
    initial begin
        // 1. Load the generated stimulus files
        $readmemh("stimulus_re.mem", stim_re);
        $readmemh("stimulus_im.mem", stim_im);
        
        // 2. Open output files for Python to read
        f_out_csv = $fopen("hw_output.csv", "w");
        f_out_exp = $fopen("hw_exponent.txt", "w");

        if (f_out_csv == 0 || f_out_exp == 0) begin
            $display("[!] Error: Could not open output files.");
            $finish;
        end

        // 3. Initialize and Reset
        valid_in = 0;
        data_in_re_flat = 0;
        data_in_im_flat = 0;
        rst = 1;
        #100;
        rst = 0;
        #20;

        // 4. Feed the data to the FFT in chunks of P=8
        $display("[*] Feeding %0d samples to the Parallel FFT (16 lanes per cycle)...", N);
        
        // Keep valid_in high for the entire simulation
        // Pre-load the first sample so it is available on the first valid clock edge
        for (j = 0; j < P; j = j + 1) begin
            data_in_re_flat[(j * DATA_WIDTH) +: DATA_WIDTH] = stim_re[j];
            data_in_im_flat[(j * DATA_WIDTH) +: DATA_WIDTH] = stim_im[j];
        end

        valid_in = 1'b1;
        
        for (i = 0; i < N; i = i + P) begin
            @(posedge clk);
            
            // Prepare the NEXT sample
            if (i + P < N) begin
                for (j = 0; j < P; j = j + 1) begin
                    data_in_re_flat[(j * DATA_WIDTH) +: DATA_WIDTH] <= stim_re[i + P + j];
                    data_in_im_flat[(j * DATA_WIDTH) +: DATA_WIDTH] <= stim_im[i + P + j];
                end
            end else begin
                data_in_re_flat <= 0;
                data_in_im_flat <= 0;
            end
        end
        
        // Keep feeding zeros to let the pipeline drain
        // Increased drain time for deep parallel pipeline
        for (i = 0; i < N * 10; i = i + P) begin
            @(posedge clk);
            // Keep valid_in high, feed zeros
            data_in_re_flat <= 0;
            data_in_im_flat <= 0;
        end
        
        @(posedge clk);
        valid_in <= 1'b0;
        
        // Wait for pipeline to flush
        #100000;
        $display("[!] Timeout reached without collecting all output samples.");
        $finish;
    end

    // ========================================================
    // Output Capture Logic
    // ========================================================
    integer out_count = 0;
    reg signed [DATA_WIDTH-1:0] signed_re;
    reg signed [DATA_WIDTH-1:0] signed_im;
    integer k;

    always @(posedge clk) begin
        // Capture output only when valid_out is high
        if (valid_out) begin
            // Unpack the 8 parallel lanes back into sequential CSV lines
            for (k = 0; k < P; k = k + 1) begin
                signed_re = data_out_re_flat[(k * DATA_WIDTH) +: DATA_WIDTH];
                signed_im = data_out_im_flat[(k * DATA_WIDTH) +: DATA_WIDTH];
                
                if (signed_re != 0) $display("[TB] Captured non-zero: %d", signed_re);
                $fwrite(f_out_csv, "%0d,%0d\n", signed_re, signed_im);
                out_count = out_count + 1;
            end
            
            // Stop when we have captured exactly N samples
            if (out_count >= N) begin
                $display("[+] Captured %0d samples.", out_count);
                $display("[+] Final BFP Exponent: %0d", exp_out);
                
                $fwrite(f_out_exp, "%0d\n", exp_out);
                
                $fclose(f_out_csv);
                $fclose(f_out_exp);
                $display("=== Simulation Complete ===");
                $finish;
            end
        end
    end

    // ========================================================
    // Waveform Dumping
    // ========================================================
    initial begin
        $dumpfile("fft_waves.vcd");
        $dumpvars(0, fft_tb);
    end

endmodule