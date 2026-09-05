`timescale 1ns/1ps
module fft_axi_top #(
    parameter N          = 1024,
    parameter DATA_WIDTH = 16,
    parameter LOG2_N     = 10
  )(
    input  wire clk,
    input  wire rst,

    input  wire [2*DATA_WIDTH-1:0] s_axis_tdata,
    (* mark_debug = "true" *) input  wire s_axis_tvalid,
    (* mark_debug = "true" *) input  wire s_axis_tlast,
    (* mark_debug = "true" *) output wire s_axis_tready,

    (* mark_debug = "true" *) output reg [2*DATA_WIDTH-1:0] m_axis_tdata,
    (* mark_debug = "true" *) output reg m_axis_tvalid,
    (* mark_debug = "true" *) input  wire m_axis_tready,
    (* mark_debug = "true" *) output reg m_axis_tlast,
    (* mark_debug = "true" *) output reg [7:0] m_axis_tuser
  );

  localparam ST_IDLE    = 2'd0;
  localparam ST_LOAD    = 2'd1;
  localparam ST_COMPUTE = 2'd2;
  localparam ST_UNLOAD  = 2'd3;

  // Result bank: Bank 0 when LOG2_N is even, Bank 1 when LOG2_N is odd.
  // Each butterfly stage swaps the active bank; starting from Bank 0 preload,
  // after LOG2_N stages the result is in Bank (LOG2_N % 2).
  localparam RESULT_BANK = LOG2_N[0];


  (* mark_debug = "true" *) reg [1:0] state;


  (* mark_debug = "true" *) reg [LOG2_N-1:0] load_cnt;
  (* mark_debug = "true" *) reg [LOG2_N-1:0] unload_cnt;

  // Same-cycle preload address/data alignment.
  wire                       preload_en   = s_axis_tvalid & s_axis_tready;
  wire [LOG2_N-1:0]          preload_addr = (state == ST_IDLE)
                                              ? {LOG2_N{1'b0}}
                                              : bit_reverse(load_cnt);

  wire signed [DATA_WIDTH:0] preload_re =
      {s_axis_tdata[2*DATA_WIDTH-1], s_axis_tdata[2*DATA_WIDTH-1:DATA_WIDTH]};

  wire signed [DATA_WIDTH:0] preload_im =
      {s_axis_tdata[DATA_WIDTH-1], s_axis_tdata[DATA_WIDTH-1:0]};


  reg                        readout_en;
  reg  [LOG2_N-1:0]          readout_addr;

  wire                        readout_bank_sel = RESULT_BANK[0];

  wire signed [DATA_WIDTH:0] readout_re;
  wire signed [DATA_WIDTH:0] readout_im;


  (* mark_debug = "true" *) wire fft_done;
  wire start_fft = (state == ST_COMPUTE) & ~fft_done;

  wire signed [7:0] final_exponent;

  reg  [7:0] latched_exponent;
  reg readout_valid_d1;

  // Reverse address bit order for output reordering.
  function [LOG2_N-1:0] bit_reverse;
    input [LOG2_N-1:0] addr;
    integer k;
    begin
      for (k = 0; k < LOG2_N; k = k + 1)
        bit_reverse[k] = addr[LOG2_N-1-k];
    end
  endfunction


  assign s_axis_tready = ((state == ST_IDLE) & !(m_axis_tvalid & ~m_axis_tready))
                       | (state == ST_LOAD);


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
      // Default: clear pulse-type signals.
      // readout_valid_d1 always tracks whether a readout was issued last cycle.
      readout_en       <= 1'b0;
      readout_valid_d1 <= readout_en;

      case (state)

        ST_IDLE: begin
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

        ST_LOAD: begin
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

        ST_COMPUTE: begin
          // start_fft is driven combinatorially; no register action needed here.
          // Wait for fft_done to pulse.
          m_axis_tvalid <= 1'b0;

          if (fft_done) begin
            latched_exponent <= final_exponent;
            unload_cnt       <= {LOG2_N{1'b0}};

            // Issue the first BRAM read address now so that data is
            // available 1 cycle later (BRAM read latency = 1 cycle).
            // DIT outputs the FFT spectrum in natural order in BRAM, so we
            // simply walk addresses 0..N-1 sequentially — no bit_reverse here.
            readout_en       <= 1'b1;
            readout_addr     <= {LOG2_N{1'b0}};

            state <= ST_UNLOAD;
          end
        end

        ST_UNLOAD: begin
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
              // FFT result is already in natural order in BRAM (DIT core),
              // so the readout walks 0, 1, 2, ..., N-1 without bit_reverse.
              unload_cnt   <= unload_cnt + 1'b1;
              readout_en   <= 1'b1;
              readout_addr <= unload_cnt + 1'b1;
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