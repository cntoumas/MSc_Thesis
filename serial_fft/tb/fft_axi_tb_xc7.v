//! @brief AXI-Stream testbench for fft_axi_top — file-driven, full CSV output.
//! @details Reads natural-order stimulus from stimulus_re.mem / stimulus_im.mem,
//!          streams it into the FFT through S_AXIS, captures all N output
//!          bins from M_AXIS, and writes hw_output.csv + hw_exponent.txt.
//!          This avoids the bank0-only read limitation of fft_tb.v, since
//!          fft_axi_top streams all bins sequentially via M_AXIS.
//!
//! Stimulus format: 17-bit hex per line, lower 16 bits = signed Q1.15 sample.
//! Stimulus order : natural (sample 0, 1, ..., N-1). No bit-reversal in Python.

`timescale 1ns/1ps
module fft_axi_tb_xc7;

  parameter N          = 1024;
  parameter DATA_WIDTH = 16;
  parameter LOG2_N     = 10;

  reg clk;
  reg rst;

  // S_AXIS (input to DUT)
  reg  [2*DATA_WIDTH-1:0] s_axis_tdata;
  reg                     s_axis_tvalid;
  reg                     s_axis_tlast;
  wire                    s_axis_tready;

  // M_AXIS (output from DUT)
  wire [2*DATA_WIDTH-1:0] m_axis_tdata;
  wire                    m_axis_tvalid;
  wire                    m_axis_tlast;
  reg                     m_axis_tready;
  wire [7:0]              m_axis_tuser;

  fft_axi_top #(
    .N(N),
    .DATA_WIDTH(DATA_WIDTH),
    .LOG2_N(LOG2_N)
  ) dut (
    .clk            (clk),
    .rst            (rst),
    .s_axis_tdata   (s_axis_tdata),
    .s_axis_tvalid  (s_axis_tvalid),
    .s_axis_tlast   (s_axis_tlast),
    .s_axis_tready  (s_axis_tready),
    .m_axis_tdata   (m_axis_tdata),
    .m_axis_tvalid  (m_axis_tvalid),
    .m_axis_tready  (m_axis_tready),
    .m_axis_tlast   (m_axis_tlast),
    .m_axis_tuser   (m_axis_tuser)
  );

  initial clk = 1'b0;
  always #5 clk = ~clk;

  // Stimulus storage — full 17-bit mem-file width; mask to 16 on the wire
  reg [16:0] test_re [0:N-1];
  reg [16:0] test_im [0:N-1];

  // Output capture
  reg signed [DATA_WIDTH-1:0] re_arr [0:N-1];
  reg signed [DATA_WIDTH-1:0] im_arr [0:N-1];
  integer bin_idx;
  integer i;
  integer fd;
  reg signed [7:0] final_exp;
  // The AXI top holds m_axis_tdata stable for ~2 cycles per bin (BRAM read
  // bubble): every other accepted handshake is a duplicate. Capture only on
  // the first of each pair via a toggling phase flag.
  reg sample_phase;

  // m_axis_tready always asserted (no backpressure for this verification TB)
  initial m_axis_tready = 1'b1;

  // Stimulus driver
  initial begin
    rst           = 1'b1;
    s_axis_tvalid = 1'b0;
    s_axis_tlast  = 1'b0;
    s_axis_tdata  = {2*DATA_WIDTH{1'b0}};
    bin_idx       = 0;
    final_exp     = 8'sd0;
    sample_phase  = 1'b0;

    $readmemh("stimulus_re.mem", test_re);
    $readmemh("stimulus_im.mem", test_im);

    repeat (20) @(posedge clk);
    @(negedge clk);
    rst = 1'b0;
    repeat (5) @(posedge clk);
    @(negedge clk);

    $display(">>> AXI TB: streaming %0d samples through fft_axi_top ...", N);

    for (i = 0; i < N; i = i + 1) begin
      while (!s_axis_tready) begin
        @(posedge clk);
        @(negedge clk);
      end
      s_axis_tvalid = 1'b1;
      s_axis_tdata  = {test_re[i][DATA_WIDTH-1:0], test_im[i][DATA_WIDTH-1:0]};
      s_axis_tlast  = (i == N - 1) ? 1'b1 : 1'b0;
      @(posedge clk);
      @(negedge clk);
    end

    s_axis_tvalid = 1'b0;
    s_axis_tlast  = 1'b0;

    $display(">>> AXI TB: %0d samples sent. Waiting for output ...", N);
  end

  // Output capture — sample only the first of each 2-cycle handshake pair
  reg done_pending;
  always @(posedge clk) begin
    if (rst) begin
      sample_phase <= 1'b0;
      done_pending <= 1'b0;
    end
    else if (m_axis_tvalid && m_axis_tready) begin
      if (!sample_phase && bin_idx < N) begin
        re_arr[bin_idx] <= m_axis_tdata[2*DATA_WIDTH-1:DATA_WIDTH];
        im_arr[bin_idx] <= m_axis_tdata[DATA_WIDTH-1:0];
        final_exp       <= $signed(m_axis_tuser);
        bin_idx         <= bin_idx + 1;
        // Latch end-of-stream on the same handshake that brings tlast
        if (m_axis_tlast) done_pending <= 1'b1;
      end
      sample_phase <= ~sample_phase;
    end
  end

  // Dump the CSV one clock after the last sample lands in re_arr/im_arr
  always @(posedge clk) begin
    if (done_pending) begin
      $display(">>> AXI TB: captured %0d unique bins, BFP exp = %0d",
               bin_idx, final_exp);
      fd = $fopen("hw_exponent.txt", "w");
      $fwrite(fd, "%0d\n", final_exp);
      $fclose(fd);
      fd = $fopen("hw_output.csv", "w");
      for (i = 0; i < N; i = i + 1) begin
        $fwrite(fd, "%0d,%0d\n", $signed(re_arr[i]), $signed(im_arr[i]));
      end
      $fclose(fd);
      $display(">>> AXI TB: wrote %0d bins to hw_output.csv", N);
      $display(">>> AXI TB: Simulation Finished.");
      $finish;
    end
  end

  // Timeout guard — 5 ms simulated
  initial begin
    #5_000_000;
    $display("[TB] TIMEOUT — AXI sim did not complete within 5 ms");
    $finish;
  end

endmodule
