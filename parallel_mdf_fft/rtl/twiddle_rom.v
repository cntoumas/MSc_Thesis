// =============================================================================
// twiddle_rom.v — 1/8-cycle compressed twiddle-factor ROM (combinational read)
//
// Generates complex twiddle factors W_N^{n(k)} = e^{-j2*pi*n/N} for the
// P-path MDF FFT using the same 1/8-cycle symmetry principle as the serial
// twiddle_rom.  Only N/8+1 values are stored; all other octants are derived
// through reflection and sign-symmetry operations.
//
// For stage s, path p, ROM address k (0..DEPTH-1):
//   DEPTH = N / (P * 2^(s+1))
//   n(k)  = (k * P + PATH) * 2^STAGE    always in [0, N/2-1]
//
// n is decomposed as:
//   octant = n[LOG2_N-2 : LOG2_N-3]   (top 2 bits of the N/2-1 range)
//   offset = n[LOG2_N-4 : 0]          (bottom LOG2_N-3 bits)
//
// ROM address mapping:
//   even octant : rom_addr = offset
//   odd  octant : rom_addr = N/8 - offset   (backward sweep reflection)
//
// Symmetry reconstruction (1's-complement for negation, same as serial ROM):
//   oct 0 (0..pi/4):      w_re =  cos_val   w_im = ~sin_val
//   oct 1 (pi/4..pi/2):   w_re =  sin_val   w_im = ~cos_val
//   oct 2 (pi/2..3pi/4):  w_re = ~sin_val   w_im = ~cos_val
//   oct 3 (3pi/4..pi):    w_re = ~cos_val   w_im = ~sin_val
//
// Read latency: 0 cycles (purely combinational, distributed LUT RAM on FPGA).
//
// Parameters:
//   N        — FFT size (power of 2, default 1024)
//   WIDTH    — sample bit-width, Q15 (default 16)
//   P        — path count / parallelism (default 4)
//   STAGE    — feedback stage index (0..L_FB-1)
//   PATH     — path index (0..P-1)
//   ADDR_W   — address width = ceil(log2(DEPTH)), forwarded from fft_stage_fb
//   COS_FILE — 16-bit hex file with N/8+1 cosine values  (0..pi/4)
//   SIN_FILE — 16-bit hex file with N/8+1 sine   values  (0..pi/4)
// =============================================================================
`timescale 1ns/1ps

module twiddle_rom #(
    parameter integer N        = 1024,
    parameter integer WIDTH    = 16,
    parameter integer P        = 4,
    parameter integer STAGE    = 0,
    parameter integer PATH     = 0,
    parameter integer ADDR_W   = 7,
    parameter         COS_FILE = "twiddle_cos_eighth.mem",
    parameter         SIN_FILE = "twiddle_sin_eighth.mem"
) (
    input  wire [ADDR_W-1:0]       addr,
    output wire signed [WIDTH-1:0] re_out,
    output wire signed [WIDTH-1:0] im_out
);

    localparam LOG2_N    = $clog2(N);        // 10 for N=1024
    localparam N_EIGHTH  = N / 8;            // 128
    localparam ROM_DEPTH = N_EIGHTH + 1;     // 129 entries (index 0..128)
    localparam ROM_AW    = $clog2(ROM_DEPTH); // 8 bits

    (* ram_style = "distributed" *)
    reg signed [WIDTH-1:0] cos_rom [0:ROM_DEPTH-1];
    (* ram_style = "distributed" *)
    reg signed [WIDTH-1:0] sin_rom [0:ROM_DEPTH-1];

    initial begin
        $readmemh(COS_FILE, cos_rom);
        $readmemh(SIN_FILE, sin_rom);
    end

    // -----------------------------------------------------------------------
    // Compute effective twiddle index: n = (addr * P + PATH) << STAGE
    // Mathematical proof that n always fits in LOG2_N-1 bits:
    //   max n = (DEPTH-1)*P + (P-1)) << STAGE = N/2 - 2^STAGE <= N/2-1 < 2^(LOG2_N-1)
    // -----------------------------------------------------------------------
    wire [LOG2_N-2:0] n_pre = addr * P + PATH;   // 0 .. N/2^(STAGE+1) - 1
    wire [LOG2_N-2:0] n     = n_pre << STAGE;    // 0 .. N/2 - 1

    // -----------------------------------------------------------------------
    // Octant (top 2 bits) and offset (bottom LOG2_N-3 bits)
    // -----------------------------------------------------------------------
    wire [1:0]        octant = n[LOG2_N-2 : LOG2_N-3];
    wire [LOG2_N-4:0] offset = n[LOG2_N-4 : 0];

    // -----------------------------------------------------------------------
    // Reflect address for odd octants (backward angular sweep)
    // -----------------------------------------------------------------------
    wire [ROM_AW-1:0] rom_addr = octant[0] ? (N_EIGHTH[ROM_AW-1:0] - offset)
                                            : {{(ROM_AW - LOG2_N + 3){1'b0}}, offset};

    // -----------------------------------------------------------------------
    // Combinational ROM read (distributed LUT RAM, zero latency)
    // -----------------------------------------------------------------------
    wire signed [WIDTH-1:0] cos_val = cos_rom[rom_addr];
    wire signed [WIDTH-1:0] sin_val = sin_rom[rom_addr];

    // -----------------------------------------------------------------------
    // Symmetry reconstruction — 1's complement for negative values
    // (1 LSB approximation, identical to the serial twiddle_rom convention)
    // -----------------------------------------------------------------------
    reg signed [WIDTH-1:0] re_r, im_r;
    always @(*) begin
        case (octant)
            2'b00: begin re_r =  cos_val; im_r = ~sin_val; end  // 0     .. pi/4
            2'b01: begin re_r =  sin_val; im_r = ~cos_val; end  // pi/4  .. pi/2
            2'b10: begin re_r = ~sin_val; im_r = ~cos_val; end  // pi/2  .. 3pi/4
            2'b11: begin re_r = ~cos_val; im_r = ~sin_val; end  // 3pi/4 .. pi
        endcase
    end

    assign re_out = re_r;
    assign im_out = im_r;

endmodule
