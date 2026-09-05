module twiddle_rom #(
    parameter N = 1024,
    parameter WIDTH = 16
)(
    input  wire clk,
    input  wire [$clog2(N)-2:0] k,
    output reg signed [WIDTH-1:0] w_re,
    output reg signed [WIDTH-1:0] w_im
);

    localparam LOG2_N = $clog2(N);
    localparam ROM_DEPTH = (N / 8) + 1;
    localparam ADDR_WIDTH = $clog2(ROM_DEPTH);
    reg signed [WIDTH-1:0] cos_rom [0:ROM_DEPTH-1];
    reg signed [WIDTH-1:0] sin_rom [0:ROM_DEPTH-1];

    initial begin
        $readmemh("cos.mem", cos_rom);
        $readmemh("sin.mem", sin_rom);
    end

    wire [1:0] octant = k[LOG2_N-2 : LOG2_N-3];
    wire [LOG2_N-4 : 0] offset = k[LOG2_N-4 : 0];
    reg [ADDR_WIDTH-1:0] rom_addr;
    reg [1:0] octant_stage1;

    // Fold input index into 1/8-cycle ROM address.
    always @(posedge clk) begin : STAGE_1_ADDRESS_MAPPING
        octant_stage1 <= octant;

        if (octant == 2'b01 || octant == 2'b11) begin
            rom_addr <= (N/8) - offset;
        end else begin
            rom_addr <= offset;
        end
    end

    reg signed [WIDTH-1:0] cos_val;
    reg signed [WIDTH-1:0] sin_val;
    reg [1:0] octant_stage2;

    // ROM fetch.
    always @(posedge clk) begin : STAGE_2_MEMORY_FETCH
        cos_val <= cos_rom[rom_addr];
        sin_val <= sin_rom[rom_addr];
        octant_stage2 <= octant_stage1;
    end

    // Reconstruct full twiddle from symmetry.
    always @(posedge clk) begin : STAGE_3_SYMMETRY_RECONSTRUCTION
        case (octant_stage2)
            2'b00: begin // 0 ~ pi/4
                w_re <= cos_val;
                w_im <= ~sin_val;
            end
            2'b01: begin // pi/4 ~ pi/2
                w_re <= sin_val;
                w_im <= ~cos_val;
            end
            2'b10: begin // pi/2 ~ 3pi/4
                w_re <= ~sin_val;
                w_im <= ~cos_val;
            end
            2'b11: begin // 3pi/4 ~ pi
                w_re <= ~cos_val;
                w_im <= ~sin_val;
            end
        endcase
    end

endmodule