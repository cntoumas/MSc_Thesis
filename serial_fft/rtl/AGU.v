module AGU #(
    parameter N = 1024,
    parameter LOG2_N = 10,
    parameter RAM_LATENCY = 1,
    parameter ROM_LATENCY = 3,
    parameter BFU_LATENCY = 6
  )(
    input wire clk,
    input wire rst,
    input wire enable,
    output wire [LOG2_N-1:0] rd_addr_a,
    output wire [LOG2_N-1:0] rd_addr_b,
    output reg [LOG2_N-2:0] twiddle_addr,
    output reg [LOG2_N-1:0] wr_addr_a,
    output reg [LOG2_N-1:0] wr_addr_b,
    output wire bank_sel_read,
    output reg bank_sel_write,
    output reg write_enable,
    output reg new_stage,
    output reg done
  );

  reg [LOG2_N-2:0] bfy_count;
  reg [$clog2(LOG2_N)-1:0] stage_idx;
  reg reading;
  reg bank_state;

  localparam ST_PROCESS = 1'b0;
  localparam ST_DRAIN   = 1'b1;
  reg state;
  reg [3:0] drain_cnt; 

  // Compute necessary compensation shift delay based on hardware fetch latencies
  localparam DELAY_READ = (ROM_LATENCY > RAM_LATENCY) ? (ROM_LATENCY - RAM_LATENCY) : 0;
  localparam TOTAL_WRITE_DELAY = ((ROM_LATENCY > RAM_LATENCY) ? ROM_LATENCY : RAM_LATENCY) + BFU_LATENCY;

  wire [LOG2_N-1:0] base_a = {bfy_count, 1'b0};
  wire [LOG2_N-1:0] base_b = {bfy_count, 1'b1};

  // Rotate by stage index.
  function [LOG2_N-1:0] rotate_left(input [LOG2_N-1:0] val, input [$clog2(LOG2_N)-1:0] shift);
    begin
      if (shift == 0)
        rotate_left = val;
      else
        rotate_left = (val << shift) | (val >> (LOG2_N - shift));
    end
  endfunction

  wire [LOG2_N-1:0] raw_rd_addr_a = rotate_left(base_a, stage_idx);
  wire [LOG2_N-1:0] raw_rd_addr_b = rotate_left(base_b, stage_idx);

  // Pipeline registers to align RAM fetching with Twiddle ROM fetching
  reg [LOG2_N-1:0] rd_a_pipe [0 : DELAY_READ];
  reg [LOG2_N-1:0] rd_b_pipe [0 : DELAY_READ];
  reg              bsel_read_pipe [0 : DELAY_READ];

  integer j;
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
      for (j = 0; j <= DELAY_READ; j = j + 1)
      begin
        rd_a_pipe[j] <= 0;
        rd_b_pipe[j] <= 0;
        bsel_read_pipe[j] <= 0;
      end
    end
    else if (enable)
    begin
      if (state == ST_PROCESS) begin
        reading   <= 1;
        done      <= 0;
        new_stage <= 0; // Default to 0, pulse high when needed

        // Capture the mathematically correct memory read addresses
        rd_a_pipe[0] <= raw_rd_addr_a;
        rd_b_pipe[0] <= raw_rd_addr_b;

        // Twiddle Address: Singleton/Pease Decimation-in-Time (DIT) Rotation Scheduling.
        // The rotation geometry clusters identical twiddles into monotonically sequential blocks
        // driven by the upper MSB bits. Masking out the LSBs perfectly replicates the DIT sequence!
        twiddle_addr <= (bfy_count >> (LOG2_N - 1 - stage_idx)) << (LOG2_N - 1 - stage_idx);

        // Increment the Butterfly Counter
        if (bfy_count == (N/2) - 1)
        begin
          bfy_count <= 0;
          // Trigger the pipeline flush at the end of EVERY stage, including the final one.
          reading   <= 0; 
          state     <= ST_DRAIN;
          drain_cnt <= (TOTAL_WRITE_DELAY + 2); // +2: +1 for write_enable output register, +1 for RAM write commit
          bsel_read_pipe[0] <= bank_state;
        end
        else
        begin
          bfy_count <= bfy_count + 1;
          bsel_read_pipe[0] <= bank_state;
        end
      end else begin // ST_DRAIN
        reading <= 0;
        new_stage <= 0;
        done <= 0; // default state
        
        if (drain_cnt == 1) begin
          state      <= ST_PROCESS;
          stage_idx  <= stage_idx + 1;
          bank_state <= ~bank_state;
          new_stage  <= 1; // Pulse high to align scanner reset precisely

          if (stage_idx == LOG2_N - 1) begin
            // Pulse done to true for 1 cycle strictly after the pipeline finishes draining!
            done <= 1;
            new_stage <= 0; // Omit 'new_stage' since we are finished
          end
        end else begin
          drain_cnt <= drain_cnt - 1;
        end
      end

      // Shift the Read Compensation Pipeline Forward
      for (j = 1; j <= DELAY_READ; j = j + 1)
      begin
        rd_a_pipe[j] <= rd_a_pipe[j-1];
        rd_b_pipe[j] <= rd_b_pipe[j-1];
        bsel_read_pipe[j] <= bsel_read_pipe[j-1];
      end
    end
  end

  // Expose the delayed versions strictly as wires connected straight to the output array end!
  // Removing the extra synchronous posedge assignment collapses the fatal +1 hardware cycle slippage.
  assign rd_addr_a = rd_a_pipe[DELAY_READ];
  assign rd_addr_b = rd_b_pipe[DELAY_READ];
  assign bank_sel_read = bsel_read_pipe[DELAY_READ];

  reg [TOTAL_WRITE_DELAY-1:0] we_delay;
  reg [LOG2_N-1:0] write_addr_a_delay [0:TOTAL_WRITE_DELAY-1];
  reg [LOG2_N-1:0] write_addr_b_delay [0:TOTAL_WRITE_DELAY-1];
  reg [TOTAL_WRITE_DELAY-1:0] bank_sel_delay;

  integer i;
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
      for (i = 0; i < TOTAL_WRITE_DELAY; i = i + 1)
      begin
        write_addr_a_delay[i] <= 0;
        write_addr_b_delay[i] <= 0;
      end
    end
    else
    begin
      // 'reading' is set via non-blocking assign (reading <= 1), so it's 1 cycle late.
      // 'state' is ST_PROCESS from reset, so (state == ST_PROCESS) is true on cycle 0
      // when the first butterfly address is generated — correct same-cycle alignment.
      // Must AND with 'enable' since state is ST_PROCESS even before FFT starts.
      we_delay <= {we_delay[TOTAL_WRITE_DELAY-2:0], (enable && state == ST_PROCESS)};

      // Shift the root ping-pong active bank state into the delay line
      bank_sel_delay <= {bank_sel_delay[TOTAL_WRITE_DELAY-2:0], bank_state};

      // Enter the raw calculated addresses into the start of the write-side delay path
      write_addr_a_delay[0] <= raw_rd_addr_a;
      write_addr_b_delay[0] <= raw_rd_addr_b;

      for (i = 1; i < TOTAL_WRITE_DELAY; i = i + 1)
      begin
        write_addr_a_delay[i] <= write_addr_a_delay[i-1];
        write_addr_b_delay[i] <= write_addr_b_delay[i-1];
      end

      // Expose the final delayed outputs to drive the RAM write ports
      write_enable   <= we_delay[TOTAL_WRITE_DELAY-1];
      bank_sel_write <= bank_sel_delay[TOTAL_WRITE_DELAY-1];
      wr_addr_a      <= write_addr_a_delay[TOTAL_WRITE_DELAY-1];
      wr_addr_b      <= write_addr_b_delay[TOTAL_WRITE_DELAY-1];
    end
  end

endmodule