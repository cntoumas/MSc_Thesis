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

    // Compute effective twiddle index: n = (addr * P + PATH) << STAGE
    // Mathematical proof that n always fits in LOG2_N-1 bits:
    //   max n = (DEPTH-1)*P + (P-1)) << STAGE = N/2 - 2^STAGE <= N/2-1 < 2^(LOG2_N-1)
    wire [LOG2_N-2:0] n_pre = addr * P + PATH;   // 0 .. N/2^(STAGE+1) - 1
    wire [LOG2_N-2:0] n     = n_pre << STAGE;    // 0 .. N/2 - 1

    wire [1:0]        octant = n[LOG2_N-2 : LOG2_N-3];
    wire [LOG2_N-4:0] offset = n[LOG2_N-4 : 0];

    wire [ROM_AW-1:0] rom_addr = octant[0] ? (N_EIGHTH[ROM_AW-1:0] - offset)
                                            : {{(ROM_AW - LOG2_N + 3){1'b0}}, offset};

    // Combinational ROM read (distributed LUT RAM, zero latency)
    wire signed [WIDTH-1:0] cos_val = cos_rom[rom_addr];
    wire signed [WIDTH-1:0] sin_val = sin_rom[rom_addr];

    // Symmetry reconstruction — 1's complement for negative values
    // (1 LSB approximation, identical to the serial twiddle_rom convention)
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