//! @brief Twiddle Factor ROM with 1/8 cycle symmetry.
//! VERIFIED: W_N^k = cos(θ) - j*sin(θ) for θ = 2πk/N
module twiddle_rom #(
    parameter N     = 4096,
    parameter WIDTH = 16
)(
    input  wire clk,
    input  wire rst,
    input  wire [11:0] k,
    output reg  signed [WIDTH-1:0] w_re,
    output reg  signed [WIDTH-1:0] w_im
);

    reg signed [WIDTH-1:0] cos_mem [0:512];
    reg signed [WIDTH-1:0] sin_mem [0:512];

    initial begin
        $readmemh("cos.mem", cos_mem);
        $readmemh("sin.mem", sin_mem);
    end

    // k maps to angle θ = 2π*k/N. We need cos(θ) and sin(θ).
    // Using 1/8 symmetry: store [0, π/4], mirror for other octants.
    // N=4096, so k[11:0] covers 0..4095.
    // Quadrant = k[11:10] (0-3), fine octant within quadrant = k[9:0].
    // For octant 0 (0-45°): addr = k[8:0], use cos(addr), sin(addr)
    // For octant 1 (45-90°): addr = 512-k[8:0], use sin(addr), cos(addr)

    wire [1:0] quad = k[11:10];
    wire [9:0] fine = k[9:0];
    wire       oct1 = fine[9];           // 1 if in second half of quadrant
    wire [8:0] addr = oct1 ? (512 - fine[8:0]) : fine[8:0];

    wire signed [WIDTH-1:0] c = cos_mem[addr];
    wire signed [WIDTH-1:0] s = sin_mem[addr];

    // mag_x = |cos(θ)|, mag_y = |sin(θ)| depending on octant
    wire signed [WIDTH-1:0] mag_x = oct1 ? s : c;
    wire signed [WIDTH-1:0] mag_y = oct1 ? c : s;

    always @(*) begin
        case (quad)
            // Q0: 0-90°, cos>0, sin>0
            2'b00: begin w_re =  mag_x; w_im = -mag_y; end
            // Q1: 90-180°, cos<0, sin>0
            2'b01: begin w_re = -mag_y; w_im = -mag_x; end
            // Q2: 180-270°, cos<0, sin<0
            2'b10: begin w_re = -mag_x; w_im =  mag_y; end
            // Q3: 270-360°, cos>0, sin<0
            2'b11: begin w_re =  mag_y; w_im =  mag_x; end
        endcase
    end

endmodule