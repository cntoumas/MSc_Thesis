//! @brief Parameterized Delay Line for SDF FFT Pipeline.
//! @details This module acts as the feedback FIFO for the SDF architecture.
//! It is explicitly coded to infer Block RAM (BRAM) on modern FPGAs (Xilinx/Intel)
//! for large depths, while gracefully mapping to a standard register for a depth of 1.
//! It uses a single-pointer read-before-write circular buffer strategy to minimize
//! memory utilization (requiring only N-1 total memory words across the FFT).
module delay_line #(
    parameter DATA_WIDTH = 34, //! Combined bit-width of real and imaginary parts (e.g., 17 + 17).
    parameter DEPTH = 1024     //! Number of clock cycles to delay the data.
  )(
    input wire clk,            //! System clock.
    input wire rst,            //! Synchronous active-high reset.
    input wire we,             //! Write enable (used to stall the pipeline if data is invalid).
    input wire [DATA_WIDTH-1:0] data_in,  //! Incoming data to be delayed.
    output wire [DATA_WIDTH-1:0] data_out //! Data delayed by exactly DEPTH cycles.
  );

  generate
    if (DEPTH == 0)
    begin : GEN_NO_DELAY
      //! @brief Edge case: 0 depth.
      //! In highly parallel implementations, the final stages might have a
      //! calculated depth of 0. This gracefully passes the data through.
      assign data_out = data_in;
    end
    else if (DEPTH == 1)
    begin : GEN_REG_DELAY
      //! @brief Edge case: Depth of 1.
      //! A depth of 1 cannot use BRAM efficiently and causes issues with $clog2(1) == 0
      //! in some synthesizers. We safely map this to a standard fabric flip-flop.
      reg [DATA_WIDTH-1:0] delay_reg;

      always @(posedge clk)
      begin
        if (rst)
        begin
          delay_reg <= {DATA_WIDTH{1'b0}};
        end
        else if (we)
        begin
          delay_reg <= data_in;
        end
      end

      assign data_out = delay_reg;
    end
    else
    begin : GEN_BRAM_DELAY
      //! @brief Standard case: Depth > 1.
      //! Infers a synchronous RAM block. Xilinx/Intel tools will map this
      //! read-before-write logic to BRAM/M20K macros.

      // The memory array. Synthesis tools will pack this into embedded RAM.
      reg [DATA_WIDTH-1:0] ram [0:DEPTH-1];

      // Circular buffer pointer. $clog2 calculates the exact number of bits needed.
      reg [$clog2(DEPTH)-1:0] ptr;

      // Output register to ensure synchronous BRAM read behavior.
      reg [DATA_WIDTH-1:0] data_out_reg;

      integer k;
      initial
      begin
        for (k = 0; k < DEPTH; k = k + 1)
          ram[k] = 0;
      end

      wire [$clog2(DEPTH)-1:0] next_ptr = (ptr == DEPTH - 1) ? 0 : ptr + 1;

      always @(posedge clk)
      begin
        if (rst)
        begin
          ptr <= 0;
          data_out_reg <= {DATA_WIDTH{1'b0}};
        end
        else if (we)
        begin
          //! 1. Read from the next pointer (read-ahead for exactly DEPTH latency)
          data_out_reg <= ram[next_ptr];

          //! 2. Write the newest data into the current pointer
          ram[ptr] <= data_in;

          //! 3. Manage the circular pointer
          ptr <= next_ptr;
        end
      end

      assign data_out = data_out_reg;
    end
  endgenerate
endmodule

//! @brief Parameterized Delay Line for SDF FFT Pipeline.
//! @details This module acts as the feedback FIFO for the SDF architecture.
//! It is explicitly coded to infer Block RAM (BRAM) on modern FPGAs (Xilinx/Intel)
//! for large depths, while gracefully mapping to a standard register for a depth of 1.
//! It uses a single-pointer read-before-write circular buffer strategy to minimize
//! memory utilization (requiring only N-1 total memory words across the FFT).
module delay_line #(
    parameter DATA_WIDTH = 34, //! Combined bit-width of real and imaginary parts (e.g., 17 + 17).
    parameter DEPTH = 1024     //! Number of clock cycles to delay the data.
  )(
    input wire clk,            //! System clock.
    input wire rst,            //! Synchronous active-high reset.
    input wire we,             //! Write enable (used to stall the pipeline if data is invalid).
    input wire [DATA_WIDTH-1:0] data_in,  //! Incoming data to be delayed.
    output wire [DATA_WIDTH-1:0] data_out //! Data delayed by exactly DEPTH cycles.
  );

  generate
    if (DEPTH == 0)
    begin : GEN_NO_DELAY
      //! @brief Edge case: 0 depth.
      //! In highly parallel implementations, the final stages might have a
      //! calculated depth of 0. This gracefully passes the data through.
      assign data_out = data_in;
    end
    else if (DEPTH == 1)
    begin : GEN_REG_DELAY
      //! @brief Edge case: Depth of 1.
      //! A depth of 1 cannot use BRAM efficiently and causes issues with $clog2(1) == 0
      //! in some synthesizers. We safely map this to a standard fabric flip-flop.
      reg [DATA_WIDTH-1:0] delay_reg;

      always @(posedge clk)
      begin
        if (rst)
        begin
          delay_reg <= {DATA_WIDTH{1'b0}};
        end
        else if (we)
        begin
          delay_reg <= data_in;
        end
      end

      assign data_out = delay_reg;
    end
    else
    begin : GEN_BRAM_DELAY
      //! @brief Standard case: Depth > 1.
      //! Infers a synchronous RAM block. Xilinx/Intel tools will map this
      //! read-before-write logic to BRAM/M20K macros.

      // The memory array. Synthesis tools will pack this into embedded RAM.
      reg [DATA_WIDTH-1:0] ram [0:DEPTH-1];

      // Circular buffer pointer. $clog2 calculates the exact number of bits needed.
      reg [$clog2(DEPTH)-1:0] ptr;

      // Output register to ensure synchronous BRAM read behavior.
      reg [DATA_WIDTH-1:0] data_out_reg;

      integer k;
      initial
      begin
        for (k = 0; k < DEPTH; k = k + 1)
          ram[k] = 0;
      end

      wire [$clog2(DEPTH)-1:0] next_ptr = (ptr == DEPTH - 1) ? 0 : ptr + 1;

      always @(posedge clk)
      begin
        if (rst)
        begin
          ptr <= 0;
          data_out_reg <= {DATA_WIDTH{1'b0}};
        end
        else if (we)
        begin
          //! 1. Read from the next pointer (read-ahead for exactly DEPTH latency)
          data_out_reg <= ram[next_ptr];

          //! 2. Write the newest data into the current pointer
          ram[ptr] <= data_in;

          //! 3. Manage the circular pointer
          ptr <= next_ptr;
        end
      end

      assign data_out = data_out_reg;
    end
  endgenerate
endmodule
