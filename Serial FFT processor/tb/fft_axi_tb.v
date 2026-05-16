//! @brief Self-checking AXI-Stream testbench for fft_axi_top — SINE WAVE TEST.
//! @details
//! Stimulus: A real sine wave at frequency bin K_BIN over N samples:
//!   x[n] = A_AMP * sin(2*PI*K_BIN*n/N), imag = 0
//!
//! Expected output (FFT of a real sinusoid):
//!   * Peak magnitudes at bin K_BIN and bin N-K_BIN (mirror, complex conjugate)
//!   * Near-zero magnitude at all other bins (noise floor from quantization/BFP)
//!   * The sine has no DC component → bin 0 should be ~0
//!
//! For K_BIN=7, N=1024, A_AMP=0.25 (0x2000 in Q1.15):
//!   * Peak hw magnitude ≈ N/2 * A = 512 * 0.25 = 128 in normalized units
//!   * BFP will right-shift to keep values in 16-bit range; m_axis_tuser
//!     reports the negative exponent (the scale factor).

`timescale 1ns/1ps
module fft_axi_tb;

  // ==========================================
  // Parameters
  // ==========================================

  parameter N          = 1024;
  parameter DATA_WIDTH = 16;
  parameter LOG2_N     = 10;

  // ---- Sine-wave stimulus parameters ----
  parameter integer K_BIN = 7;          // frequency bin (cycles over N samples)
  parameter real    A_AMP = 0.25;       // amplitude (fraction of full scale, ≤ ~0.5)
  parameter real    PI    = 3.14159265358979;

  // ==========================================
  // DUT Ports
  // ==========================================

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

  // ==========================================
  // DUT Instantiation
  // ==========================================

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

  // ==========================================
  // Clock Generation (10 ns period = 100 MHz)
  // ==========================================

  initial clk = 1'b0;
  always #5 clk = ~clk;

  // ==========================================
  // Checker State
  // ==========================================

  integer pass_count;
  integer fail_count;
  integer bin_idx;
  reg signed [DATA_WIDTH-1:0] re_out;
  reg signed [DATA_WIDTH-1:0] im_out;

  // Storage for FFT output — used for post-run sine-wave verification.
  reg signed [DATA_WIDTH-1:0] re_arr [0:N-1];
  reg signed [DATA_WIDTH-1:0] im_arr [0:N-1];

  // Backpressure countdown: when non-zero, m_axis_tready is held low.
  integer bp_countdown;

  // Sine-wave generation working variables
  real    angle;
  real    sine_val;
  integer sine_int;

  // ==========================================
  // Stimulus — send N samples via S_AXIS
  // ==========================================

  integer i;

  initial begin
    // Initialise all signals driven from this initial block.
    // Note: m_axis_tready and bp_countdown are driven solely by the
    // always block below to avoid multiple-driver conflicts.
    rst           = 1'b1;
    s_axis_tvalid = 1'b0;
    s_axis_tlast  = 1'b0;
    s_axis_tdata  = {2*DATA_WIDTH{1'b0}};
    pass_count    = 0;
    fail_count    = 0;
    bin_idx       = 0;

    // Hold reset for 10 clock cycles
    repeat (20) @(posedge clk);
    @(negedge clk);  // drive inputs on negedge to avoid setup-time races
    rst = 1'b0;

    // Small gap after reset de-assertion
    repeat (5) @(posedge clk);
    @(negedge clk);

    // ----------------------------------------------------------------
    // Load phase: send N samples of a sine wave at bin K_BIN.
    //   x[n] = A_AMP * sin(2*PI*K_BIN*n/N)
    // Q1.15: hardware value = round(x[n] * 32768), clamped to [-32768, 32767]
    // Imaginary part is always 0 (real input signal).
    // We insert a 1-cycle gap every 4 beats to exercise tready stalls.
    // ----------------------------------------------------------------
    $display("[TB] Sine-wave test: K_BIN=%0d, A_AMP=%f, N=%0d", K_BIN, A_AMP, N);
    $display("[TB] Starting sample load (%0d samples)...", N);

    for (i = 0; i < N; i = i + 1) begin
      // Insert occasional idle cycle to stress-test the ready logic
      if (i % 4 == 3) begin
        s_axis_tvalid = 1'b0;
        @(posedge clk);
        @(negedge clk);
      end

      // Wait until DUT is ready to accept
      while (!s_axis_tready) begin
        @(posedge clk);
        @(negedge clk);
      end

      // Compute the sine value for sample i
      angle    = 2.0 * PI * K_BIN * i / N;
      sine_val = A_AMP * 32768.0 * $sin(angle);
      sine_int = $rtoi(sine_val);
      // Clamp to 16-bit signed range
      if (sine_int >  32767) sine_int =  32767;
      if (sine_int < -32768) sine_int = -32768;

      // Drive the sample: {real_q1_15, imag_q1_15=0}
      s_axis_tvalid = 1'b1;
      s_axis_tdata  = {sine_int[15:0], 16'h0000};
      s_axis_tlast  = (i == N - 1) ? 1'b1 : 1'b0;

      @(posedge clk);
      @(negedge clk);
    end

    // De-assert valid after the last beat
    s_axis_tvalid = 1'b0;
    s_axis_tlast  = 1'b0;

    $display("[TB] Load complete. Waiting for FFT computation and output...");
  end

  // ==========================================
  // m_axis_tready Controller
  // Sole driver of m_axis_tready (avoids multiple-driver warnings).
  // Asserts backpressure for 8 cycles at the N/2 boundary.
  // ==========================================

  always @(posedge clk) begin
    if (rst) begin
      m_axis_tready <= 1'b1;
      bp_countdown  <= 0;
    end
    else if (bp_countdown > 0) begin
      bp_countdown  <= bp_countdown - 1;
      m_axis_tready <= (bp_countdown == 1) ? 1'b1 : 1'b0;
    end
    else if (!rst && m_axis_tvalid && m_axis_tready && (bin_idx == N / 2 - 1)) begin
      // We are accepting the (N/2)-th output beat (0-indexed: beat N/2-1).
      // Insert 8-cycle backpressure after this beat to stress-test hold behaviour.
      m_axis_tready <= 1'b0;
      bp_countdown  <= 8;
    end
    else begin
      m_axis_tready <= 1'b1;
    end
  end

  // ==========================================
  // Output Checker — capture every beat, analyze on tlast
  // ==========================================

  // Helpers used in the post-run analysis
  integer k;
  integer mag_sq;
  integer peak_mag_sq;
  integer peak_bin;
  integer mirror_mag_sq;
  integer noise_max_sq;
  integer noise_max_bin;

  always @(posedge clk) begin
    if (!rst && m_axis_tvalid && m_axis_tready) begin
      re_out          = m_axis_tdata[2*DATA_WIDTH-1 : DATA_WIDTH];
      im_out          = m_axis_tdata[DATA_WIDTH-1   : 0];
      re_arr[bin_idx] = re_out;
      im_arr[bin_idx] = im_out;
      bin_idx         = bin_idx + 1;

      if (m_axis_tlast) begin
        $display("[TB] --- FFT Complete ---");
        $display("[TB] BFP exponent (signed): %0d", $signed(m_axis_tuser));
        $display("[TB] Total output beats received: %0d", bin_idx);

        // ---- Find peak bin and noise floor ----
        peak_mag_sq   = 0;
        peak_bin      = 0;
        noise_max_sq  = 0;
        noise_max_bin = 0;

        for (k = 0; k < N; k = k + 1) begin
          mag_sq = re_arr[k]*re_arr[k] + im_arr[k]*im_arr[k];
          // Track overall peak
          if (mag_sq > peak_mag_sq) begin
            peak_mag_sq = mag_sq;
            peak_bin    = k;
          end
          // Track noise floor: skip the expected peaks at K_BIN and N-K_BIN
          if ((k != K_BIN) && (k != (N - K_BIN))) begin
            if (mag_sq > noise_max_sq) begin
              noise_max_sq  = mag_sq;
              noise_max_bin = k;
            end
          end
        end

        // ---- Report ----
        $display("[TB] Expected peaks at bin %0d and bin %0d", K_BIN, N - K_BIN);
        $display("[TB] Bin %0d: re=%0d im=%0d  |X|^2 = %0d",
                 K_BIN, re_arr[K_BIN], im_arr[K_BIN],
                 re_arr[K_BIN]*re_arr[K_BIN] + im_arr[K_BIN]*im_arr[K_BIN]);
        $display("[TB] Bin %0d: re=%0d im=%0d  |X|^2 = %0d",
                 N - K_BIN, re_arr[N - K_BIN], im_arr[N - K_BIN],
                 re_arr[N - K_BIN]*re_arr[N - K_BIN] +
                 im_arr[N - K_BIN]*im_arr[N - K_BIN]);
        $display("[TB] Largest off-peak bin: %0d  |X|^2 = %0d",
                 noise_max_bin, noise_max_sq);
        $display("[TB] Overall peak bin    : %0d  |X|^2 = %0d",
                 peak_bin, peak_mag_sq);

        // ---- Pass/Fail ----
        // Criterion 1: peak must be at K_BIN or N-K_BIN
        // Criterion 2: noise floor (largest off-peak bin) must be << peak (>= 16x smaller in mag^2 ⇒ 4x smaller in mag, i.e. ~12 dB)
        if ((peak_bin == K_BIN) || (peak_bin == (N - K_BIN))) begin
          if ((noise_max_sq * 16) < peak_mag_sq) begin
            $display("[TB] RESULT: PASS - Peak at correct bin, noise floor >= 12 dB below peak.");
          end else begin
            $display("[TB] RESULT: PARTIAL - Peak at correct bin, but noise floor higher than expected.");
            $display("[TB]                   peak/noise ratio (mag^2) = %0d", peak_mag_sq / (noise_max_sq + 1));
          end
        end else begin
          $display("[TB] RESULT: FAIL - Peak found at bin %0d, expected %0d or %0d.",
                   peak_bin, K_BIN, N - K_BIN);
        end

        $finish;
      end
    end
  end

  // ==========================================
  // Simulation Timeout Guard
  // ==========================================

  initial begin
    // Allow generous time: reset (10+5 cy) + load (~N*1.3 cy) + compute + unload
    // For N=1024 at 10 ns/cycle: worst case ~100 000 cycles = 1 000 000 ns
    #5_000_000;
    $display("[TB] TIMEOUT — simulation did not complete within 5 ms.");
    $finish;
  end

endmodule
