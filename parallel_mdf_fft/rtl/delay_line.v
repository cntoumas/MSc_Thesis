// =============================================================================
// delay_line.v — P-wide circular buffer delay line for MDF SDF FFT
//
// Implements an exact DEPTH-cycle delay for a P-path complex data bus.
// Uses an async-read circular buffer: the slot about to be overwritten is the
// oldest entry, so rd_ptr == wr_ptr (READ_FIRST semantics via async assign).
//
// For DEPTH=1: implemented as a single register bank.
// For DEPTH>1:  implemented as distributed-RAM circular buffer (inferred as
//               LUTRAM on Xilinx, Logic RAM on Intel).
//
// Timing: dout at cycle t contains din from cycle t-DEPTH.
//         dout is valid after DEPTH cycles of valid en pulses.
//         During the first DEPTH cycles, dout contains 0 (initialised).
//
// Parameters:
//   DATA_W  — bit width of one real or imaginary component (default 16)
//   P       — parallelisation factor (number of paths) (default 4)
//   DEPTH   — delay in clock cycles = N/(P*2^(STAGE+1))
//
// Bit layout of din/dout (same for both ports):
//   Bits  [1*DATA_W-1:0*DATA_W]         — path 0 real
//   Bits  [2*DATA_W-1:1*DATA_W]         — path 0 imaginary
//   Bits  [3*DATA_W-1:2*DATA_W]         — path 1 real
//   Bits  [4*DATA_W-1:3*DATA_W]         — path 1 imaginary
//   ...
//   Bits  [(2P)*DATA_W-1:(2P-1)*DATA_W] — path P-1 imaginary
// =============================================================================
`timescale 1ns/1ps

module delay_line #(
    parameter DATA_W = 16,
    parameter P      = 4,
    parameter DEPTH  = 128
) (
    input  wire                       clk,
    input  wire                       rst,
    input  wire                       en,
    input  wire [P*2*DATA_W-1:0]      din,
    output wire [P*2*DATA_W-1:0]      dout
);

    localparam TOTAL_W = P * 2 * DATA_W;
    localparam ADDR_W  = (DEPTH > 1) ? $clog2(DEPTH) : 1;

    // -----------------------------------------------------------------
    // Async-read circular buffer.  Works for any DEPTH ≥ 1.
    //
    // The slot about to be overwritten (mem[wr_ptr]) holds the value
    // written exactly DEPTH cycles ago.  Reading it asynchronously
    // (combinationally) gives an exact DEPTH-cycle delay from din to
    // dout, with read-before-write semantics on the same clock edge.
    //
    // For DEPTH=1: mem is a single slot.  dout combinationally reflects
    // mem[0], which is the value written on the previous active clock
    // edge — a 1-cycle delay register equivalent.
    //
    // For DEPTH>1: full circular buffer with async read maps to LUTRAM
    // on Xilinx (distributed RAM) and Logic RAM on Intel.
    //
    // All memory is initialised to 0 in the initial block so that
    // dout is guaranteed 0 before the pipeline fills (no 'x'
    // propagation through the feedback loop during pipeline warm-up).
    //
    // Synthesis attribute for Xilinx (distributed RAM):
    //   (* ram_style = "distributed" *)
    // -----------------------------------------------------------------
    
    reg [TOTAL_W-1:0] mem [0:DEPTH-1];
    reg [ADDR_W-1:0]  wr_ptr;

    // Async read: oldest slot (about to be overwritten) appears on dout.
    assign dout = mem[wr_ptr];

    integer i;
    initial begin
        wr_ptr = 0;
        for (i = 0; i < DEPTH; i = i + 1)
            mem[i] = 0;
    end

    always @(posedge clk) begin
        if (rst) begin
            wr_ptr <= {ADDR_W{1'b0}};
        end else if (en) begin
            mem[wr_ptr] <= din;
            wr_ptr      <= (wr_ptr == DEPTH - 1) ? {ADDR_W{1'b0}}
                                                 : wr_ptr + 1'b1;
        end
    end

endmodule
