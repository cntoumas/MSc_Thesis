//! @brief Address Generation Unit (AGU) for Pipelined FFT.
//! @details This module acts as the master controller for the FFT hardware.
//! It tracks the current macroscopic algorithm stage and generates the
//! corresponding read and write addresses for the RAM using the
//! highly efficient "count-and-rotate" algorithm.
//! It manages the structural pipeline delay, ensuring that write addresses
//! and memory bank swapping are delayed by the exact latency of the
//! computational Butterfly Unit to prevent data corruption.
module AGU #(
    //! Number of FFT points
    parameter N = 2048,

    //! Number of bits for memory address.
    parameter LOG2_N = 11,

    //! Latency of the external Ping-Pong RAM.
    parameter RAM_LATENCY = 1,

    //! Latency of internal Twiddle ROM.
    parameter ROM_LATENCY = 3,

    //! The pipeline latency of the Butterfly Unit + BFP Shifter
    parameter BFU_LATENCY = 6
  )(
    //! System clock.
    input wire clk,

    //! Synchronous active-high reset.
    input wire rst,

    //! Enable signal to start/run the FFT processing.
    input wire enable,

    //! Read address for RAM Port A.
    output wire [LOG2_N-1:0] rd_addr_a,

    //! Read address for RAM Port B.
    output wire [LOG2_N-1:0] rd_addr_b,

    //! Address for the Twiddle Factor ROM.
    output reg [LOG2_N-2:0] twiddle_addr,

    //! Write address for RAM Port A (Delayed to match incoming computed data).
    output reg [LOG2_N-1:0] wr_addr_a,

    //! Write address for RAM Port B (Delayed to match incoming computed data).
    output reg [LOG2_N-1:0] wr_addr_b,

    //! Bank select flag. 0 = Read Bank 0 / Write Bank 1. 1 = Read Bank 1 / Write Bank 0.
    output wire bank_sel_read,

    //! Bank select flag for writes (delayed to match write cycle).
    output reg bank_sel_write,

    //! Write Enable flag for the RAM.
    output reg write_enable,

    //! Pulses high for 1 cycle when a new macroscopic FFT stage begins.
    output reg new_stage,

    //! Pulses high for 1 cycle when the entire FFT is completed and RAM writes are finished.
    output reg done
  );

  //! Counter for the number of butterflies processed in the current stage (0 to N/2 - 1).
  reg [LOG2_N-2:0] bfy_count;

  //! Counter for the current macroscopic FFT stage (0 to LOG2_N - 1).
  reg [$clog2(LOG2_N)-1:0] stage_idx;

  //! Tracks if the AGU is currently actively generating reads.
  //! Separated into two flags so the write-side pipeline drains correctly
  //! after the last butterfly without propagating a stale reading=1.
  reg reading;   //! High while read addresses are being generated.

  //! Tracks the current state of ping-pong memory bank selection.
  reg bank_state;

  localparam ST_PROCESS = 1'b0; //! Processing state
  localparam ST_DRAIN   = 1'b1; //! Drain state
  reg state; //! State of the AGU
  reg [3:0] drain_cnt; //! Counter for the drain state

  //! Compute necessary compensation shift delay based on hardware fetch latencies
  localparam DELAY_READ = (ROM_LATENCY > RAM_LATENCY) ? (ROM_LATENCY - RAM_LATENCY) : 0; //! Delay for the read addresses
  localparam TOTAL_WRITE_DELAY = ((ROM_LATENCY > RAM_LATENCY) ? ROM_LATENCY : RAM_LATENCY) + BFU_LATENCY; //! Total delay for the write addresses

  wire [LOG2_N-1:0] base_a = {bfy_count, 1'b0}; //! Base address for RAM Port A
  wire [LOG2_N-1:0] base_b = {bfy_count, 1'b1}; //! Base address for RAM Port B

  //! @brief Dynamic Left-Rotate Function.
  //! @details Synthesizes into a barrel shifter to rotate the bits left by 'stage_idx'.
  function [LOG2_N-1:0] rotate_left(input [LOG2_N-1:0] val, input [$clog2(LOG2_N)-1:0] shift);
    begin
      if (shift == 0)
        rotate_left = val;
      else
        rotate_left = (val << shift) | (val >> (LOG2_N - shift));
    end
  endfunction

  wire [LOG2_N-1:0] raw_rd_addr_a = rotate_left(base_a, stage_idx); //! Raw read address for RAM Port A
  wire [LOG2_N-1:0] raw_rd_addr_b = rotate_left(base_b, stage_idx); //! Raw read address for RAM Port B

  //! Pipeline registers to align RAM fetching with Twiddle ROM fetching
  reg [LOG2_N-1:0] rd_a_pipe [0 : DELAY_READ]; //! Pipeline register for RAM Port A
  reg [LOG2_N-1:0] rd_b_pipe [0 : DELAY_READ]; //! Pipeline register for RAM Port B
  reg bsel_read_pipe [0 : DELAY_READ]; //! Pipeline register for bank select


  integer i;
  //! @brief Main AGU State Machine (Read Side).
  //! @details Increments the butterfly counter and stage index, and calculates
  //! the real-time read addresses for the memory and twiddle ROM.
  always @(posedge clk)
  begin : READ_ADDRESS_GENERATOR
    if (rst)
    begin
      bfy_count     <= 0;
      stage_idx     <= 0;
      reading       <= 0;
      done          <= 0;
      new_stage     <= 0;
      bank_state    <= 0;
      state         <= ST_PROCESS;
      drain_cnt     <= 0;
      twiddle_addr  <= 0;
      for (i = 0; i <= DELAY_READ; i = i + 1)
      begin
        rd_a_pipe[i] <= 0;
        rd_b_pipe[i] <= 0;
        bsel_read_pipe[i] <= 0;
      end
    end
    else if (enable)
    begin
      if (state == ST_PROCESS)
      begin
        reading   <= 1;
        done      <= 0;
        new_stage <= 0; //! Default to 0, pulse high when needed

        //! Capture the mathematically correct memory read addresses
        rd_a_pipe[0] <= raw_rd_addr_a;
        rd_b_pipe[0] <= raw_rd_addr_b;

        //! Twiddle Address: Singleton/Pease Decimation-in-Time (DIT) Rotation Scheduling.
        //! The rotation geometry clusters identical twiddles into monotonically sequential blocks
        //! driven by the upper MSB bits. Masking out the LSBs perfectly replicates the DIT sequence!
        twiddle_addr <= (bfy_count >> (LOG2_N - 1 - stage_idx)) << (LOG2_N - 1 - stage_idx);

        //! Increment the Butterfly Counter
        if (bfy_count == (N/2) - 1)
        begin
          bfy_count <= 0;
          //! Trigger the pipeline flush at the end of EVERY stage, including the final one.
          reading   <= 0;
          state     <= ST_DRAIN;
          drain_cnt <= (TOTAL_WRITE_DELAY + 2); //! +2: +1 for write_enable output register, +1 for RAM write commit
          bsel_read_pipe[0] <= bank_state;
        end
        else
        begin
          bfy_count <= bfy_count + 1;
          bsel_read_pipe[0] <= bank_state;
        end
      end
      else
      begin //! ST_DRAIN
        reading <= 0;
        new_stage <= 0;
        done <= 0; //! default state

        if (drain_cnt == 1)
        begin
          state      <= ST_PROCESS;
          stage_idx  <= stage_idx + 1;
          bank_state <= ~bank_state;
          new_stage  <= 1; //! Pulse high to align scanner reset precisely

          if (stage_idx == LOG2_N - 1)
          begin
            //! Pulse done to true for 1 cycle strictly after the pipeline finishes draining
            done <= 1;
            new_stage <= 0; //! Omit 'new_stage' since we are finished
          end
        end
        else
        begin
          drain_cnt <= drain_cnt - 1;
        end
      end

      //! Shift the Read Compensation Pipeline Forward
      for (i = 1; i <= DELAY_READ; i = i + 1)
      begin
        rd_a_pipe[i] <= rd_a_pipe[i-1];
        rd_b_pipe[i] <= rd_b_pipe[i-1];
        bsel_read_pipe[i] <= bsel_read_pipe[i-1];
      end
    end
  end

  //! Expose the delayed versions strictly as wires connected straight to the output array end
  //! Removing the extra synchronous posedge assignment collapses the fatal +1 hardware cycle slippage.
  assign rd_addr_a = rd_a_pipe[DELAY_READ];
  assign rd_addr_b = rd_b_pipe[DELAY_READ];
  assign bank_sel_read = bsel_read_pipe[DELAY_READ];

  //! Shift register to delay the Write Enable signal.
  reg [TOTAL_WRITE_DELAY-1:0] we_delay;

  //! Shift array to delay Address A.
  reg [LOG2_N-1:0] write_addr_a_delay [0:TOTAL_WRITE_DELAY-1];

  //! Shift array to delay Address B.
  reg [LOG2_N-1:0] write_addr_b_delay [0:TOTAL_WRITE_DELAY-1];

  //! Shift register to delay the Bank Select signal.
  reg [TOTAL_WRITE_DELAY-1:0] bank_sel_delay;


  integer j;
  //! @brief Latency Compensation Pipeline.
  //! @details Delays the mathematically generated addresses by exactly TOTAL_WRITE_DELAY
  //! clock cycles so that the write request arrives at the RAM on the exact same
  //! cycle that the corresponding data emerges from the processing back-end.
  always @(posedge clk)
  begin : WRITE_LATENCY_PIPELINE
    if (rst)
    begin
      we_delay       <= 0;
      bank_sel_delay <= 0;
      write_enable   <= 0;
      bank_sel_write <= 0;
      wr_addr_a      <= 0;
      wr_addr_b      <= 0;
      for (j = 0; j < TOTAL_WRITE_DELAY; j = j + 1)
      begin
        write_addr_a_delay[j] <= 0;
        write_addr_b_delay[j] <= 0;
      end
    end
    else
    begin
      //! 'reading' is set via non-blocking assign (reading <= 1), so it's 1 cycle late.
      //! 'state' is ST_PROCESS from reset, so (state == ST_PROCESS) is true on cycle 0
      //! when the first butterfly address is generated — correct same-cycle alignment.
      //! Must AND with 'enable' since state is ST_PROCESS even before FFT starts.
      we_delay <= {we_delay[TOTAL_WRITE_DELAY-2:0], (enable && state == ST_PROCESS)};

      //! Shift the root ping-pong active bank state into the delay line
      bank_sel_delay <= {bank_sel_delay[TOTAL_WRITE_DELAY-2:0], bank_state};

      // Enter the raw calculated addresses into the start of the write-side delay path
      write_addr_a_delay[0] <= raw_rd_addr_a;
      write_addr_b_delay[0] <= raw_rd_addr_b;

      for (i = 1; i < TOTAL_WRITE_DELAY; i = i + 1)
      begin
        write_addr_a_delay[i] <= write_addr_a_delay[i-1];
        write_addr_b_delay[i] <= write_addr_b_delay[i-1];
      end

      //! Expose the final delayed outputs to drive the RAM write ports
      write_enable   <= we_delay[TOTAL_WRITE_DELAY-1];
      bank_sel_write <= bank_sel_delay[TOTAL_WRITE_DELAY-1];
      wr_addr_a      <= write_addr_a_delay[TOTAL_WRITE_DELAY-1];
      wr_addr_b      <= write_addr_b_delay[TOTAL_WRITE_DELAY-1];
    end
  end

endmodule
