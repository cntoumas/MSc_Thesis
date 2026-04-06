//! @brief True Dual-Port Ping-Pong Memory for FFT Data Storage.
//! @details This module instantiates two identical True Dual-Port memory banks
//! (Bank 0 and Bank 1) to support the "ping-pong" data flow of an in-place FFT.
//! During any given stage, one bank is strictly read from, while the other is
//! strictly written to. This prevents data corruption due to the pipeline latency
//! of the computational units. Port A handles the "A" arm of the butterfly,
//! and Port B handles the "B" arm.
module RAM #(
    //! Number of FFT points (e.g., 1024).
    parameter N = 2048,

    //! Bit width of the memory addresses. For N=1024, LOG2_N = 10.
    parameter LOG2_N = 11,

    //! Bit width of the data words (e.g., 16 bits for fixed-point).
    parameter DATA_WIDTH = 16
  )(
    //! System clock.
    input wire clk,

    //! Bank select flag from the AGU for reading. 0: Read Bank 0. 1: Read Bank 1.
    input wire bank_sel_read,

    //! Bank select flag from the AGU for writing. 0: Write Bank 1. 1: Write Bank 0.
    input wire bank_sel_write,

    //! Global write enable signal from the AGU (delayed to match BFU latency).
    input wire we,

    //! Read address for the 'A' data sample.
    input wire [LOG2_N-1:0] read_addr_a,

    //! Read address for the 'B' data sample.
    input wire [LOG2_N-1:0] read_addr_b,

    //! Write address for the 'A'' data sample.
    input wire [LOG2_N-1:0] write_addr_a,

    //! Write address for the 'B'' data sample.
    input wire [LOG2_N-1:0] write_addr_b,

    //! Real part of the data to be written to Port A.
    input wire signed [DATA_WIDTH-1:0] din_a_re,

    //! Imaginary part of the data to be written to Port A.
    input wire signed [DATA_WIDTH-1:0] din_a_im,

    //! Real part of the data to be written to Port B.
    input wire signed [DATA_WIDTH-1:0] din_b_re,

    //! Imaginary part of the data to be written to Port B.
    input wire signed [DATA_WIDTH-1:0] din_b_im,

    //! Real part of the data read from Port A.
    output wire signed [DATA_WIDTH-1:0] dout_a_re,

    //! Imaginary part of the data read from Port A.
    output wire signed [DATA_WIDTH-1:0] dout_a_im,

    //! Real part of the data read from Port B.
    output wire signed [DATA_WIDTH-1:0] dout_b_re,

    //! Imaginary part of the data read from Port B.
    output wire signed [DATA_WIDTH-1:0] dout_b_im
  );

  // ==========================================
  // Internal Memory Arrays (BRAM Inference)
  // ==========================================

  //! Bank 0 Memory Array (Real).
  reg signed [DATA_WIDTH-1:0] bank0_re [0:N-1];

  //! Bank 0 Memory Array (Imaginary).
  reg signed [DATA_WIDTH-1:0] bank0_im [0:N-1];

  //! Bank 1 Memory Array (Real).
  reg signed [DATA_WIDTH-1:0] bank1_re [0:N-1];

  //! Bank 1 Memory Array (Imaginary).
  reg signed [DATA_WIDTH-1:0] bank1_im [0:N-1];


  //! Write Enable for Bank 0. High only if AGU selects Bank 0 for writing.
  wire we_0 = (bank_sel_write == 1'b1) ? we : 1'b0;

  //! Write Enable for Bank 1. High only if AGU selects Bank 1 for writing.
  wire we_1 = (bank_sel_write == 1'b0) ? we : 1'b0;

  //! Dynamic Address Routing: Bank 0 Port A.
  wire [LOG2_N-1:0] addr0_a = we_0 ? write_addr_a : read_addr_a;

  //! Dynamic Address Routing: Bank 0 Port B.
  wire [LOG2_N-1:0] addr0_b = we_0 ? write_addr_b : read_addr_b;

  //! Dynamic Address Routing: Bank 1 Port A.
  wire [LOG2_N-1:0] addr1_a = we_1 ? write_addr_a : read_addr_a;

  //! Dynamic Address Routing: Bank 1 Port B.
  wire [LOG2_N-1:0] addr1_b = we_1 ? write_addr_b : read_addr_b;

  // Registers to hold the read outputs directly from the BRAM
  reg signed [DATA_WIDTH-1:0] dout0_a_re, dout0_a_im, dout0_b_re, dout0_b_im;
  reg signed [DATA_WIDTH-1:0] dout1_a_re, dout1_a_im, dout1_b_re, dout1_b_im;

  //! @brief Bank 0 Memory Port A.
  //! @details Handles either the 'read A' or 'write A' operation for Bank 0.
  always @(posedge clk)
  begin : BANK_0_PORT_A
    if (we_0)
    begin
      bank0_re[addr0_a] <= din_a_re;
      bank0_im[addr0_a] <= din_a_im;
    end
    dout0_a_re <= bank0_re[addr0_a];
    dout0_a_im <= bank0_im[addr0_a];
  end

  //! @brief Bank 0 Memory Port B.
  //! @details Handles either the 'read B' or 'write B' operation for Bank 0.
  always @(posedge clk)
  begin : BANK_0_PORT_B
    if (we_0)
    begin
      bank0_re[addr0_b] <= din_b_re;
      bank0_im[addr0_b] <= din_b_im;
    end
    dout0_b_re <= bank0_re[addr0_b];
    dout0_b_im <= bank0_im[addr0_b];
  end


  //! @brief Bank 1 Memory Port A.
  //! @details Handles either the 'read A' or 'write A' operation for Bank 1.
  always @(posedge clk)
  begin : BANK_1_PORT_A
    if (we_1)
    begin
      bank1_re[addr1_a] <= din_a_re;
      bank1_im[addr1_a] <= din_a_im;
    end
    dout1_a_re <= bank1_re[addr1_a];
    dout1_a_im <= bank1_im[addr1_a];
  end

  //! @brief Bank 1 Memory Port B.
  //! @details Handles either the 'read B' or 'write B' operation for Bank 1.
  always @(posedge clk)
  begin : BANK_1_PORT_B
    if (we_1)
    begin
      bank1_re[addr1_b] <= din_b_re;
      bank1_im[addr1_b] <= din_b_im;
    end
    dout1_b_re <= bank1_re[addr1_b];
    dout1_b_im <= bank1_im[addr1_b];
  end

  // The final output to the Butterfly Unit depends on which bank is currently in "read" mode.
  // If bank_sel_read == 0, Bank 0 is read. If bank_sel_read == 1, Bank 1 is read.
  assign dout_a_re = (bank_sel_read == 1'b0) ? dout0_a_re : dout1_a_re;
  assign dout_a_im = (bank_sel_read == 1'b0) ? dout0_a_im : dout1_a_im;

  assign dout_b_re = (bank_sel_read == 1'b0) ? dout0_b_re : dout1_b_re;
  assign dout_b_im = (bank_sel_read == 1'b0) ? dout0_b_im : dout1_b_im;

endmodule
