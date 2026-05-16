//! @brief True Dual-Port Ping-Pong Memory for FFT Data Storage.
//! @details This module instantiates two identical True Dual-Port memory banks
//! (Bank 0 and Bank 1) to support the "ping-pong" data flow of an in-place FFT.
//! During any given stage, one bank is strictly read from, while the other is
//! strictly written to. Port A handles the "A" arm of the butterfly,
//! and Port B handles the "B" arm.
//!
//! The preload (LOAD-state) and readout (UNLOAD-state) accesses are folded
//! into Port A's address mux to keep total port count at 2 per bank — required
//! for clean BRAM (RAMB36E1) inference in Vivado.
module RAM #(
    parameter N          = 1024,
    parameter LOG2_N     = 10,
    parameter DATA_WIDTH = 16
  )(
    input wire clk,

    input wire bank_sel_read,
    input wire bank_sel_write,
    input wire we,

    input wire [LOG2_N-1:0] read_addr_a,
    input wire [LOG2_N-1:0] read_addr_b,
    input wire [LOG2_N-1:0] write_addr_a,
    input wire [LOG2_N-1:0] write_addr_b,

    input wire signed [DATA_WIDTH-1:0] din_a_re,
    input wire signed [DATA_WIDTH-1:0] din_a_im,
    input wire signed [DATA_WIDTH-1:0] din_b_re,
    input wire signed [DATA_WIDTH-1:0] din_b_im,

    output wire signed [DATA_WIDTH-1:0] dout_a_re,
    output wire signed [DATA_WIDTH-1:0] dout_a_im,
    output wire signed [DATA_WIDTH-1:0] dout_b_re,
    output wire signed [DATA_WIDTH-1:0] dout_b_im,

    // Preload port (LOAD state — writes to Bank 0)
    input wire                         preload_en,
    input wire [LOG2_N-1:0]            preload_addr,
    input wire signed [DATA_WIDTH-1:0] preload_re,
    input wire signed [DATA_WIDTH-1:0] preload_im,

    // Readout port (UNLOAD state — 1-cycle registered latency)
    input wire                          readout_en,
    input wire [LOG2_N-1:0]             readout_addr,
    input wire                          readout_bank_sel,
    output wire signed [DATA_WIDTH-1:0] readout_re,
    output wire signed [DATA_WIDTH-1:0] readout_im
  );

  // ==========================================
  // Memory Arrays
  // ==========================================
  (* ram_style = "block" *) reg signed [DATA_WIDTH-1:0] bank0_re [0:N-1];
  (* ram_style = "block" *) reg signed [DATA_WIDTH-1:0] bank0_im [0:N-1];
  (* ram_style = "block" *) reg signed [DATA_WIDTH-1:0] bank1_re [0:N-1];
  (* ram_style = "block" *) reg signed [DATA_WIDTH-1:0] bank1_im [0:N-1];

  // ==========================================
  // Per-bank write enables and Port A muxing
  // ==========================================
  // The FSM in fft_axi_top guarantees these signals are mutually exclusive:
  //   * preload_en is high only during ST_LOAD (we, readout_en both low)
  //   * we is high only during ST_COMPUTE (preload_en, readout_en both low)
  //   * readout_en is high only during ST_UNLOAD (we, preload_en both low)
  // So a single Port A address mux is safe.

  wire we_0 = bank_sel_write ? we : 1'b0;
  wire we_1 = bank_sel_write ? 1'b0 : we;

  // ---- Bank 0 Port A (handles AGU read/write A, preload, and Bank-0 readout) ----
  wire [LOG2_N-1:0] b0_a_addr =
        preload_en                                           ? preload_addr  :
        (readout_en & (readout_bank_sel == 1'b0))            ? readout_addr  :
        we_0                                                 ? write_addr_a  :
                                                               read_addr_a;
  wire b0_a_we = we_0 | preload_en;
  wire signed [DATA_WIDTH-1:0] b0_a_din_re = preload_en ? preload_re : din_a_re;
  wire signed [DATA_WIDTH-1:0] b0_a_din_im = preload_en ? preload_im : din_a_im;

  reg signed [DATA_WIDTH-1:0] dout0_a_re, dout0_a_im;
  always @(posedge clk) begin : BANK_0_PORT_A
    if (b0_a_we) begin
      bank0_re[b0_a_addr] <= b0_a_din_re;
      bank0_im[b0_a_addr] <= b0_a_din_im;
    end
    dout0_a_re <= bank0_re[b0_a_addr];
    dout0_a_im <= bank0_im[b0_a_addr];
  end

  // ---- Bank 0 Port B (AGU read/write B only) ----
  wire [LOG2_N-1:0] b0_b_addr = we_0 ? write_addr_b : read_addr_b;
  reg signed [DATA_WIDTH-1:0] dout0_b_re, dout0_b_im;
  always @(posedge clk) begin : BANK_0_PORT_B
    if (we_0) begin
      bank0_re[b0_b_addr] <= din_b_re;
      bank0_im[b0_b_addr] <= din_b_im;
    end
    dout0_b_re <= bank0_re[b0_b_addr];
    dout0_b_im <= bank0_im[b0_b_addr];
  end

  // ---- Bank 1 Port A (AGU read/write A and Bank-1 readout) ----
  wire [LOG2_N-1:0] b1_a_addr =
        (readout_en & (readout_bank_sel == 1'b1))            ? readout_addr  :
        we_1                                                 ? write_addr_a  :
                                                               read_addr_a;
  reg signed [DATA_WIDTH-1:0] dout1_a_re, dout1_a_im;
  always @(posedge clk) begin : BANK_1_PORT_A
    if (we_1) begin
      bank1_re[b1_a_addr] <= din_a_re;
      bank1_im[b1_a_addr] <= din_a_im;
    end
    dout1_a_re <= bank1_re[b1_a_addr];
    dout1_a_im <= bank1_im[b1_a_addr];
  end

  // ---- Bank 1 Port B (AGU read/write B only) ----
  wire [LOG2_N-1:0] b1_b_addr = we_1 ? write_addr_b : read_addr_b;
  reg signed [DATA_WIDTH-1:0] dout1_b_re, dout1_b_im;
  always @(posedge clk) begin : BANK_1_PORT_B
    if (we_1) begin
      bank1_re[b1_b_addr] <= din_b_re;
      bank1_im[b1_b_addr] <= din_b_im;
    end
    dout1_b_re <= bank1_re[b1_b_addr];
    dout1_b_im <= bank1_im[b1_b_addr];
  end

  // ==========================================
  // Output Routing
  // ==========================================
  // FFT compute outputs: select bank based on bank_sel_read
  assign dout_a_re = bank_sel_read ? dout1_a_re : dout0_a_re;
  assign dout_a_im = bank_sel_read ? dout1_a_im : dout0_a_im;
  assign dout_b_re = bank_sel_read ? dout1_b_re : dout0_b_re;
  assign dout_b_im = bank_sel_read ? dout1_b_im : dout0_b_im;

  // Readout port: select bank based on readout_bank_sel
  // (the data is already in dout0_a_re / dout1_a_re due to the Port A mux above)
  assign readout_re = readout_bank_sel ? dout1_a_re : dout0_a_re;
  assign readout_im = readout_bank_sel ? dout1_a_im : dout0_a_im;

endmodule
