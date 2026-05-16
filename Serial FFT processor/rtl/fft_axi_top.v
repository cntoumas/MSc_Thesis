//! @brief AXI-Stream Wrapper for the Serial FFT Processor.
//! @details Wraps fft_top with an AXI-Stream slave input and master output.
//!
//! Operation:
//!   IDLE    — waits for s_axis_tvalid; accepts first beat and moves to LOAD.
//!   LOAD    — streams N samples into Bank 0 via the preload port.
//!   COMPUTE — holds start_fft high until fft_done pulses; deasserts start_fft
//!             the same cycle fft_done fires (combinatorial gate).
//!   UNLOAD  — reads result bank in bit-reversed order and drives m_axis_tdata;
//!             handles the 1-cycle BRAM read latency and AXI-S backpressure.
//!
//! AXI-Stream compliance:
//!   - s_axis_tready is high in IDLE and LOAD states only.
//!   - Once m_axis_tvalid is asserted it stays high with stable data until
//!     m_axis_tready is seen (per AXI4-Stream spec, section 2.2.1).
//!   - m_axis_tlast pulses on the final output beat.
//!   - m_axis_tuser carries the latched BFP exponent, stable across all beats.
//!
//! Data packing: s_axis_tdata = {re[DATA_WIDTH-1:0], im[DATA_WIDTH-1:0]}
//!               m_axis_tdata = {re[DATA_WIDTH-1:0], im[DATA_WIDTH-1:0]}

`timescale 1ns/1ps
module fft_axi_top #(
    //! FFT size (must match LOG2_N = log2(N)).
    parameter N          = 1024,

    //! Data word width in bits (Q1.(DATA_WIDTH-1) fixed-point).
    parameter DATA_WIDTH = 16,

    //! log2(N) — number of address bits and butterfly stages.
    parameter LOG2_N     = 10
  )(
    //! System clock.
    input  wire clk,

    //! Synchronous active-high reset.
    input  wire rst,

    // ------------------------------------------------------------------
    // S_AXIS — AXI-Stream slave (FFT input samples)
    // ------------------------------------------------------------------

    //! Input sample data, packed as {re[DATA_WIDTH-1:0], im[DATA_WIDTH-1:0]}.
    input  wire [2*DATA_WIDTH-1:0] s_axis_tdata,

    //! Input valid flag.
    (* mark_debug = "true" *) input  wire                    s_axis_tvalid,

    //! Last-sample flag — must be asserted with the N-th sample.
    (* mark_debug = "true" *) input  wire                    s_axis_tlast,

    //! Ready flag driven by this module — high when accepting input.
    (* mark_debug = "true" *) output wire                    s_axis_tready,

    // ------------------------------------------------------------------
    // M_AXIS — AXI-Stream master (FFT output bins)
    // ------------------------------------------------------------------

    //! Output bin data, packed as {re[DATA_WIDTH-1:0], im[DATA_WIDTH-1:0]}.
    (* mark_debug = "true" *) output reg  [2*DATA_WIDTH-1:0] m_axis_tdata,

    //! Output valid flag.
    (* mark_debug = "true" *) output reg                     m_axis_tvalid,

    //! Downstream ready flag.
    (* mark_debug = "true" *) input  wire                    m_axis_tready,

    //! Last-sample flag — high on the final output beat.
    (* mark_debug = "true" *) output reg                     m_axis_tlast,

    //! Block floating-point exponent, stable across all output beats.
    (* mark_debug = "true" *) output reg  [7:0]              m_axis_tuser
  );

  // ==========================================
  // Local Parameters
  // ==========================================

  localparam ST_IDLE    = 2'd0;
  localparam ST_LOAD    = 2'd1;
  localparam ST_COMPUTE = 2'd2;
  localparam ST_UNLOAD  = 2'd3;

  // Result bank: Bank 0 when LOG2_N is even, Bank 1 when LOG2_N is odd.
  // Each butterfly stage swaps the active bank; starting from Bank 0 preload,
  // after LOG2_N stages the result is in Bank (LOG2_N % 2).
  localparam RESULT_BANK = LOG2_N[0];

  // ==========================================
  // FSM State Register
  // ==========================================

  (* mark_debug = "true" *) reg [1:0] state;

  // ==========================================
  // Counters
  // ==========================================

  //! Counts accepted S_AXIS beats during LOAD.
  (* mark_debug = "true" *) reg [LOG2_N-1:0] load_cnt;

  //! Counts output beats presented to M_AXIS during UNLOAD.
  (* mark_debug = "true" *) reg [LOG2_N-1:0] unload_cnt;

  // ==========================================
  // Preload Wiring (to fft_top / RAM Bank 0)
  // ==========================================

  // preload_en and preload_addr are now COMBINATIONAL (driven by the AXI handshake).
  // This guarantees they fire on the SAME cycle as s_axis_tdata is valid, fixing
  // the off-by-one that would otherwise write each sample to the previous address.
  wire                       preload_en   = s_axis_tvalid & s_axis_tready;
  wire [LOG2_N-1:0]          preload_addr = (state == ST_IDLE) ? {LOG2_N{1'b0}} : load_cnt;

  //! Sign-extend the 16-bit S_AXIS real field to 17 bits for the RAM preload port.
  wire signed [DATA_WIDTH:0] preload_re =
      {s_axis_tdata[2*DATA_WIDTH-1], s_axis_tdata[2*DATA_WIDTH-1:DATA_WIDTH]};

  //! Sign-extend the 16-bit S_AXIS imaginary field to 17 bits.
  wire signed [DATA_WIDTH:0] preload_im =
      {s_axis_tdata[DATA_WIDTH-1], s_axis_tdata[DATA_WIDTH-1:0]};

  // ==========================================
  // Readout Wiring (from fft_top / RAM result bank)
  // ==========================================

  reg                        readout_en;
  reg  [LOG2_N-1:0]          readout_addr;

  //! Selects the result bank (constant, derived from LOG2_N parity).
  wire                        readout_bank_sel = RESULT_BANK[0];

  wire signed [DATA_WIDTH:0] readout_re;
  wire signed [DATA_WIDTH:0] readout_im;

  // ==========================================
  // FFT Control Signals
  // ==========================================

  //! start_fft: asserted combinatorially while in COMPUTE and fft_done has not fired.
  //! De-asserts on the same clock edge that fft_done is sampled, preventing the AGU
  //! from running a phantom extra stage.
  (* mark_debug = "true" *) wire fft_done;
  wire start_fft = (state == ST_COMPUTE) & ~fft_done;

  wire signed [7:0] final_exponent;

  //! Latches the BFP exponent when fft_done pulses; held stable across all UNLOAD beats.
  reg  [7:0] latched_exponent;

  // ==========================================
  // BRAM Read Latency Pipeline
  // ==========================================

  //! 1-cycle pipeline bit: tracks whether a readout_en was issued last cycle,
  //! meaning new BRAM data will be present on the readout_re/im wires this cycle.
  reg readout_valid_d1;

  // ==========================================
  // Bit-Reversal Function
  // ==========================================

  //! Reverses the bit order of a LOG2_N-wide address.
  //! Used to reorder the naturally-ordered FFT output into sequential bin order.
  function [LOG2_N-1:0] bit_reverse;
    input [LOG2_N-1:0] addr;
    integer k;
    begin
      for (k = 0; k < LOG2_N; k = k + 1)
        bit_reverse[k] = addr[LOG2_N-1-k];
    end
  endfunction

  // ==========================================
  // AXI-Stream Input Ready
  // ==========================================

  //! Accept input samples while in IDLE (but only when not holding a pending
  //! M_AXIS output beat), and while actively loading in LOAD.
  //! De-assert during COMPUTE and UNLOAD.
  assign s_axis_tready = ((state == ST_IDLE) & !(m_axis_tvalid & ~m_axis_tready))
                       | (state == ST_LOAD);

  // ==========================================
  // Main FSM
  // ==========================================

  always @(posedge clk) begin
    if (rst) begin
      state            <= ST_IDLE;
      load_cnt         <= {LOG2_N{1'b0}};
      unload_cnt       <= {LOG2_N{1'b0}};
      readout_en       <= 1'b0;
      readout_addr     <= {LOG2_N{1'b0}};
      readout_valid_d1 <= 1'b0;
      latched_exponent <= 8'd0;
      m_axis_tvalid    <= 1'b0;
      m_axis_tlast     <= 1'b0;
      m_axis_tuser     <= 8'd0;
      m_axis_tdata     <= {2*DATA_WIDTH{1'b0}};
    end
    else begin
      // ------------------------------------------------------------------
      // Default: clear pulse-type signals.
      // readout_valid_d1 always tracks whether a readout was issued last cycle.
      // m_axis_tvalid is managed explicitly per state to satisfy hold requirement.
      // ------------------------------------------------------------------
      readout_en       <= 1'b0;
      readout_valid_d1 <= readout_en;

      case (state)

        // ----------------------------------------------------------------
        ST_IDLE: begin
        // ----------------------------------------------------------------
          load_cnt   <= {LOG2_N{1'b0}};
          unload_cnt <= {LOG2_N{1'b0}};

          // If we just came from UNLOAD with the last beat still pending
          // (tvalid high, tready not yet seen), hold tvalid until accepted.
          // This satisfies the AXI-Stream rule that tvalid must not be
          // de-asserted once raised until tready is observed.
          if (m_axis_tvalid && !m_axis_tready) begin
            // Hold: keep tvalid and data stable until downstream accepts.
            m_axis_tvalid <= 1'b1;
          end
          else begin
            // Either tvalid was never raised, or the beat was just accepted.
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;

            if (s_axis_tvalid) begin
              // Accept the first beat immediately (tready is high in IDLE).
              // preload_en/preload_addr are now combinational, so the RAM
              // captures sample[0] at addr 0 on this same clock edge.
              load_cnt     <= {{(LOG2_N-1){1'b0}}, 1'b1}; // = 1
              state        <= ST_LOAD;
            end
          end
        end

        // ----------------------------------------------------------------
        ST_LOAD: begin
        // ----------------------------------------------------------------
          m_axis_tvalid <= 1'b0;

          if (s_axis_tvalid) begin
            // preload_en/preload_addr are combinational; RAM writes load_cnt's
            // address with the current s_axis_tdata on this clock edge.
            load_cnt     <= load_cnt + 1'b1;

            if (s_axis_tlast) begin
              // All N samples received — begin FFT computation.
              state    <= ST_COMPUTE;
              load_cnt <= {LOG2_N{1'b0}};
            end
          end
        end

        // ----------------------------------------------------------------
        ST_COMPUTE: begin
        // ----------------------------------------------------------------
          // start_fft is driven combinatorially; no register action needed here.
          // Wait for fft_done to pulse.
          m_axis_tvalid <= 1'b0;

          if (fft_done) begin
            latched_exponent <= final_exponent;
            unload_cnt       <= {LOG2_N{1'b0}};

            // Issue the first BRAM read address now so that data is
            // available 1 cycle later (BRAM read latency = 1 cycle).
            readout_en       <= 1'b1;
            readout_addr     <= bit_reverse(0);

            state <= ST_UNLOAD;
          end
        end

        // ----------------------------------------------------------------
        ST_UNLOAD: begin
        // ----------------------------------------------------------------
          // Two-phase approach to handle 1-cycle BRAM read latency and
          // AXI-Stream backpressure simultaneously:
          //
          //   Phase A (readout_valid_d1 == 0):
          //     BRAM data for the current beat is not yet available.
          //     Stay here; data will be ready next cycle.
          //
          //   Phase B (readout_valid_d1 == 1 AND (tvalid==0 OR tready==1)):
          //     New data available and the M_AXIS output register is free
          //     (either nothing was presented, or the previous beat was
          //     accepted). Capture data, present to M_AXIS, and pre-fetch
          //     the next BRAM address (if any remain).
          //
          //   Phase C (tvalid==1 AND tready==0 — backpressure):
          //     Downstream is stalling. Re-hold m_axis_tvalid and all
          //     data registers unchanged. Do NOT issue a new readout_en.

          if (readout_valid_d1 && (!m_axis_tvalid || m_axis_tready)) begin
            // --- Phase B: latch BRAM output into M_AXIS output registers ---
            m_axis_tvalid <= 1'b1;
            m_axis_tdata  <= {readout_re[DATA_WIDTH-1:0],
                              readout_im[DATA_WIDTH-1:0]};
            m_axis_tuser  <= latched_exponent;
            m_axis_tlast  <= (unload_cnt == N - 1);

            if (unload_cnt == N - 1) begin
              // Last sample: present it, then return to IDLE.
              // (The transition happens next cycle when tready is seen, but
              //  we move to IDLE immediately since there is nothing more to
              //  unload — the output register holds valid data until accepted.)
              state <= ST_IDLE;
            end
            else begin
              // Advance counter and pre-fetch the next bin's BRAM address.
              unload_cnt   <= unload_cnt + 1'b1;
              readout_en   <= 1'b1;
              readout_addr <= bit_reverse(unload_cnt + 1'b1);
            end
          end
          else if (m_axis_tvalid && !m_axis_tready) begin
            // --- Phase C: backpressure — hold all M_AXIS outputs stable ---
            m_axis_tvalid <= 1'b1;
            // m_axis_tdata, m_axis_tlast, m_axis_tuser retain their
            // registered values automatically; no assignment needed.
          end
          // Phase A (readout_valid_d1==0 and not in backpressure): do nothing,
          // wait for BRAM pipeline to produce data next cycle.

        end

        default: state <= ST_IDLE;

      endcase
    end
  end

  // ==========================================
  // fft_top Instantiation
  // ==========================================

  fft_top #(
    .N(N),
    .DATA_WIDTH(DATA_WIDTH),
    .LOG2_N(LOG2_N)
  ) u_fft (
    .clk             (clk),
    .rst             (rst),
    .start_fft       (start_fft),
    .final_exponent  (final_exponent),
    .fft_done        (fft_done),
    .preload_en      (preload_en),
    .preload_addr    (preload_addr),
    .preload_re      (preload_re),
    .preload_im      (preload_im),
    .readout_en      (readout_en),
    .readout_addr    (readout_addr),
    .readout_bank_sel(readout_bank_sel),
    .readout_re      (readout_re),
    .readout_im      (readout_im)
  );

endmodule
