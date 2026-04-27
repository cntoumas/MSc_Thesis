//! @brief Twiddle Factor ROM with 1/8 cycle symmetry.
//! Combinational read.
module twiddle_rom #(
    parameter N = 4096,
    parameter WIDTH = 16
  )(
    input wire clk, // Unused
    input wire rst,
    input wire [11:0] k,
    output reg signed [WIDTH-1:0] w_re,
    output reg signed [WIDTH-1:0] w_im
  );

  // ROM to store 1/8 cycle of sine and cosine (0 to pi/4)
  reg signed [WIDTH-1:0] cos_mem [0:512];
  reg signed [WIDTH-1:0] sin_mem [0:512];

  initial
  begin
    $readmemh("cos.mem", cos_mem);
    $readmemh("sin.mem", sin_mem);
  end

  // Stage 1: Address calculation and Quad/Octant detection
  wire [1:0] quad = k[11:10];
  wire       oct  = k[9];
  wire [8:0] addr = k[9] ? (512 - k[8:0]) : k[8:0];

  // Stage 2: Memory read (Combinational)
  wire signed [WIDTH-1:0] c_val = cos_mem[addr];
  wire signed [WIDTH-1:0] s_val = sin_mem[addr];

  // Stage 3: Symmetry reconstruction
  // The objective is to produce W_N^k = cos(2*pi*k/N) - j*sin(2*pi*k/N)
  always @(*)
  begin
    case (quad)
      2'b00:
      begin // 0–90°: cos positive, sin positive
        w_re =  (oct ? s_val : c_val);
        w_im = -(oct ? c_val : s_val);
      end
      2'b01:
      begin // 90–180°: cos negative, sin positive
        w_re = -(oct ? s_val : c_val);  // BUG WAS: -c_val or -s_val (swapped)
        w_im = -(oct ? c_val : s_val);  // BUG WAS: -s_val or -c_val (swapped)
      end
      2'b10:
      begin // 180–270°: cos negative, sin negative
        w_re = -(oct ? s_val : c_val);
        w_im =  (oct ? c_val : s_val);
      end
      2'b11:
      begin // 270–360°: cos positive, sin negative
        w_re =  (oct ? s_val : c_val);
        w_im =  (oct ? c_val : s_val);  // BUG WAS: s_val or c_val (wrong sign)
      end
    endcase
  end

endmodule
