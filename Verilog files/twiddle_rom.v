//! @brief Twiddle Factor ROM utilizing 1/8 cycle compression.
//! @details This module generates complex twiddle factors for a Radix-2 FFT.
//!
//! **1/8 Cycle Compression:**
//! To conserve storage space, it takes advantage of the periodicity and
//! symmetry properties of twiddle factors. Specifically, only the first
//! 1/8 cycle (0 to pi/4) of the sine and cosine values needs to be
//! stored in the ROM. The remaining values are derived through rotation,
//! translation, and symmetry operations.
//!
//! **Timing and Area Optimization:**
//! For data with negative actual output values, their stored values'
//! one's complement (bitwise negation, ~) is used to approximate
//! the actual output. As the numerical difference is exactly 1 LSB,
//! this does not significantly affect overall accuracy but effectively
//! shortens the timing path by avoiding carry-propagate adders.
module twiddle_rom #(
    parameter N = 2048, //! Number of FFT points, must be a power of 2.
    parameter WIDTH = 16 //! Bit width for the fixed-point representation.
  )(
    input  wire clk, //! System clock.
    input  wire [$clog2(N)-2:0] k, //! Twiddle factor index (0 to N/2-1). The top 2 bits determine the octant, and the rest determine the offset within that octant.
    output reg signed [WIDTH-1:0] w_re, //! Real part of the twiddle factor (Cosine).
    output reg signed [WIDTH-1:0] w_im //! Imaginary part of the twiddle factor (Sine).
  );

  localparam LOG2_N = $clog2(N); //! Log base 2 of the number of FFT points.
  localparam ROM_DEPTH = (N / 8) + 1; //! ROM Depth: Stores only 1/8 of the cycle plus the boundary.
  localparam ADDR_WIDTH = $clog2(ROM_DEPTH); //! Address Width: Calculated to fit the ROM_DEPTH.
  reg signed [WIDTH-1:0] cos_rom [0:ROM_DEPTH-1]; //! Block RAM inference for Cosine values (0 to pi/4).
  reg signed [WIDTH-1:0] sin_rom [0:ROM_DEPTH-1]; //! Block RAM inference for Sine values (0 to pi/4).

  initial
  begin
    $readmemh("cos.mem", cos_rom);
    $readmemh("sin.mem", sin_rom);
  end

  wire [1:0] octant = k[LOG2_N-2 : LOG2_N-3]; //! The top 2 bits of k determine the octant (0 to 3). Each octant corresponds to a specific 45-degree segment of the unit circle. The ROM stores values for the first octant (0 to pi/4), and the remaining octants are derived from these values using symmetry properties.
  wire [LOG2_N-4 : 0] offset = k[LOG2_N-4 : 0]; //! The lower bits of k determine the offset within the octant, which is used to index into the ROM. Since the ROM only stores 1/8 of the cycle, the offset directly corresponds to the address for fetching the cosine and sine values.
  reg [ADDR_WIDTH-1:0] rom_addr; //! Address register for ROM access. It is calculated based on the octant and offset. For odd octants (1 and 3), the address is reflected to account for the backward sweep of angles, while for even octants (0 and 2), it directly corresponds to the offset.
  reg [1:0] octant_stage1; //! Registered octant state for Pipeline Stage 1. This is used to keep track of the octant across pipeline stages, ensuring that the correct symmetry operations are applied in later stages based on the original octant of the input index k.

  //!**Pipeline Stage 1: Address Mapping.**
  //! Maps the incoming linear index to the folded 1/8 cycle ROM address.
  //! For odd octants (1 and 3), the angle sweeps backward, so the address is reflected.
  always @(posedge clk)
  begin : STAGE_1_ADDRESS_MAPPING
    octant_stage1 <= octant;

    if (octant == 2'b01 || octant == 2'b11)
    begin
      rom_addr <= (N/8) - offset;
    end
    else
    begin
      rom_addr <= offset;
    end
  end

  reg signed [WIDTH-1:0] cos_val; //! Registered cosine value fetched from ROM.
  reg signed [WIDTH-1:0] sin_val; //! Registered sine value fetched from ROM.
  reg [1:0] octant_stage2; //! Registered octant state for Pipeline Stage 2. This is used to ensure that the correct symmetry operations are applied in the next stage based on the original octant of the input index k.

  //! **Pipeline Stage 2: Memory Fetch.**
  //! Synchronous read from the inferred Block RAM.
  always @(posedge clk)
  begin : STAGE_2_MEMORY_FETCH
    cos_val <= cos_rom[rom_addr];
    sin_val <= sin_rom[rom_addr];
    octant_stage2 <= octant_stage1;
  end

  //! **Pipeline Stage 3: Symmetry Reconstruction.**
  //! Reconstructs the full twiddle factor based on the octant using trigonometric identities.
  //! Uses one's complement (~val) to approximate negative values for timing optimization.
  always @(posedge clk)
  begin : STAGE_3_SYMMETRY_RECONSTRUCTION
    case (octant_stage2)
      2'b00:
      begin // 0 ~ pi/4
        w_re <= cos_val;
        w_im <= ~sin_val;
      end
      2'b01:
      begin // pi/4 ~ pi/2
        w_re <= sin_val;
        w_im <= ~cos_val;
      end
      2'b10:
      begin // pi/2 ~ 3pi/4
        w_re <= ~sin_val;
        w_im <= ~cos_val;
      end
      2'b11:
      begin // 3pi/4 ~ pi
        w_re <= ~cos_val;
        w_im <= ~sin_val;
      end
    endcase
  end

endmodule
