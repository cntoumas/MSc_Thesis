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

    // Circular delay buffer with async read.
    
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