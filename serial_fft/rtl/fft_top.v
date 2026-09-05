module fft_top #(
    parameter N = 1024,
    parameter DATA_WIDTH = 16,
    parameter LOG2_N = 10
  )(
    input wire clk,
    input wire rst,
    input wire start_fft,
    output wire signed [7:0] final_exponent,
    output wire fft_done,

    input  wire                        preload_en,
    input  wire [LOG2_N-1:0]           preload_addr,
    input  wire signed [DATA_WIDTH:0]  preload_re,
    input  wire signed [DATA_WIDTH:0]  preload_im,

    input  wire                        readout_en,
    input  wire [LOG2_N-1:0]           readout_addr,
    input  wire                        readout_bank_sel,
    output wire signed [DATA_WIDTH:0]  readout_re,
    output wire signed [DATA_WIDTH:0]  readout_im
  );

  localparam RESULT_BANK = LOG2_N[0];


  wire [LOG2_N-1:0] rd_addr_a, rd_addr_b;
  wire [LOG2_N-1:0] wr_addr_a, wr_addr_b;
  wire [LOG2_N-2:0] twiddle_addr;
  wire bank_sel_read, bank_sel_write, write_enable, new_stage;

  wire signed [DATA_WIDTH:0] ram_out_a_re, ram_out_a_im;
  wire signed [DATA_WIDTH:0] ram_out_b_re, ram_out_b_im;

  wire signed [DATA_WIDTH-1:0] w_re, w_im;

  wire signed [DATA_WIDTH-1:0] shifted_a_re, shifted_a_im;
  wire signed [DATA_WIDTH-1:0] shifted_b_re, shifted_b_im;

  wire signed [DATA_WIDTH:0] bfu_out_a_re, bfu_out_a_im;
  wire signed [DATA_WIDTH:0] bfu_out_b_re, bfu_out_b_im;

  wire [3:0] block_shift_amount;
  wire early_stop;

  AGU #(
        .N(N),
        .LOG2_N(LOG2_N),
        .RAM_LATENCY(1),
        .ROM_LATENCY(3),
        .BFU_LATENCY(6) // 1 (Shifter) + 5 (BFU: 4 mult + 1 add) = 6 cycles
      ) u_agu (
        .clk(clk),
        .rst(rst),
        .enable(start_fft),
        .rd_addr_a(rd_addr_a),
        .rd_addr_b(rd_addr_b),
        .twiddle_addr(twiddle_addr),
        .wr_addr_a(wr_addr_a),
        .wr_addr_b(wr_addr_b),
        .bank_sel_read(bank_sel_read),
        .bank_sel_write(bank_sel_write),
        .write_enable(write_enable),
        .new_stage(new_stage),
        .done(fft_done)
      );

  twiddle_rom #(
                .N(N),
                .WIDTH(DATA_WIDTH)
              ) u_twiddle_rom (
                .clk(clk),
                .k(twiddle_addr),
                .w_re(w_re),
                .w_im(w_im)
              );

  RAM #(
        .N(N),
        .LOG2_N(LOG2_N),
        .DATA_WIDTH(DATA_WIDTH + 1) 
      ) u_ram (
        .clk(clk),
        .bank_sel_read(bank_sel_read),
        .bank_sel_write(bank_sel_write),
        .we(write_enable),
        .read_addr_a(rd_addr_a),
        .read_addr_b(rd_addr_b),
        .write_addr_a(wr_addr_a),
        .write_addr_b(wr_addr_b),
        // Write the full expanded vectors to prevent any silent saturation clipping
        .din_a_re(bfu_out_a_re), 
        .din_a_im(bfu_out_a_im),
        .din_b_re(bfu_out_b_re),
        .din_b_im(bfu_out_b_im),
        .dout_a_re(ram_out_a_re),
        .dout_a_im(ram_out_a_im),
        .dout_b_re(ram_out_b_re),
        .dout_b_im(ram_out_b_im),
        // Preload port — active only during LOAD state (before FFT)
        .preload_en      (preload_en),
        .preload_addr    (preload_addr),
        .preload_re      (preload_re[DATA_WIDTH:0]),
        .preload_im      (preload_im[DATA_WIDTH:0]),
        // Readout port — active only during UNLOAD state (after fft_done)
        .readout_en      (readout_en),
        .readout_addr    (readout_addr),
        .readout_bank_sel(readout_bank_sel),
        .readout_re      (readout_re),
        .readout_im      (readout_im)
      );

  
  reg [3:0] latched_shift_amount;
  reg signed [7:0] current_exponent;

  // Delay taps for stage-boundary timing.
  reg [8:0] new_stage_delay_pipe;
  always @(posedge clk)
  begin : NEW_STAGE_DELAY
    if (rst)
      new_stage_delay_pipe <= 0;
    else
      new_stage_delay_pipe <= {new_stage_delay_pipe[7:0], new_stage};
  end

  wire bfp_latch_trigger  = new_stage_delay_pipe[2]; // For tracker: latch shift before data arrives
  wire scanner_reset_trigger = new_stage_delay_pipe[8]; // For scanner: reset after old writes drain
  always @(posedge clk) begin : BFP_TRACKER
    if (rst) begin
        latched_shift_amount <= 4'd1; // Neutral baseline shift
        current_exponent     <= 8'sd0;
    end else if (bfp_latch_trigger) begin
        // Latch the scanner's per-stage shift result at each macro-stage boundary.
        latched_shift_amount <= block_shift_amount;

        case (block_shift_amount)
           4'd0: current_exponent <= current_exponent + 8'sd1;
           4'd1: current_exponent <= current_exponent;
           4'd2: current_exponent <= current_exponent - 8'sd1;
           4'd3: current_exponent <= current_exponent - 8'sd2;
           4'd4: current_exponent <= current_exponent - 8'sd3;
           4'd5: current_exponent <= current_exponent - 8'sd4;
           4'd6: current_exponent <= current_exponent - 8'sd5;
           4'd7: current_exponent <= current_exponent - 8'sd6;
           default: current_exponent <= current_exponent - 8'sd7;
        endcase
    end
  end

  bfp_shifter #(
                .INPUT_WIDTH(DATA_WIDTH + 1), // Takes 17-bit natively stored RAM values 
                .OUTPUT_WIDTH(DATA_WIDTH)     // Reduces it precisely back down to 16 for logic handling 
              ) u_shifter (
                .clk(clk),
                .rst(rst),
                .a_in_re(ram_out_a_re),
                .a_in_im(ram_out_a_im),
                .b_in_re(ram_out_b_re),
                .b_in_im(ram_out_b_im),
                .block_clz(latched_shift_amount), // Use the coherent single-stage locked shift param!
                .exp_in(8'sd0), // Ties off recursive accumulator natively inside shifter
                .a_out_re(shifted_a_re),
                .a_out_im(shifted_a_im),
                .b_out_re(shifted_b_re),
                .b_out_im(shifted_b_im),
                .exp_out() // Explicitly float recursive accumulator out port
              );


  // Match RAM and twiddle timing into the butterfly stage.
  reg signed [DATA_WIDTH-1:0] w_re_aligned, w_im_aligned;

  always @(posedge clk)
  begin : TWIDDLE_ALIGNMENT_DELAY
    w_re_aligned <= w_re;
    w_im_aligned <= w_im;
  end


  butterfly_unit #(
                   .DATA_WIDTH(DATA_WIDTH),
                   .TWIDDLE_WIDTH(DATA_WIDTH)
                 ) u_bfu (
                   .clk(clk),
                   .a_re(shifted_a_re),
                   .a_im(shifted_a_im),
                   .b_re(shifted_b_re),
                   .b_im(shifted_b_im),
                   .w_re(w_re_aligned),
                   .w_im(w_im_aligned),
                   .a_prime_re(bfu_out_a_re),
                   .a_prime_im(bfu_out_a_im),
                   .b_prime_re(bfu_out_b_re),
                   .b_prime_im(bfu_out_b_im)
                 );

  bfp_scanner #(
                .INPUT_WIDTH(DATA_WIDTH + 1) // 17 bits natively generated logic boundaries
              ) u_scanner (
                .clk(clk),
                .rst(rst),
                .new_stage(scanner_reset_trigger), 
                .valid_in(write_enable),             // Only scan when writing valid data
                .a_prime_re(bfu_out_a_re),
                .a_prime_im(bfu_out_a_im),
                .b_prime_re(bfu_out_b_re),
                .b_prime_im(bfu_out_b_im),
                .block_shift_amount(block_shift_amount),
                .early_stop(early_stop)
              );



  // Expose final sideband data to the top level
  assign final_exponent = current_exponent;

endmodule