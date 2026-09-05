`timescale 1ns/1ps

module bit_reverse #(
    parameter integer DATA_W = 16,
    parameter integer P      = 4,
    parameter integer N      = 1024
) (
    input  wire                      clk,
    input  wire                      rst,

    input  wire                      in_valid,
    input  wire [P*2*DATA_W-1:0]     din,

    output reg                       out_valid,
    output wire [P*2*DATA_W-1:0]     dout
);

    localparam WORDS   = N / P;              // 256 words per block
    localparam ADDR_W  = $clog2(WORDS);      // 8 bits
    localparam BUS_W   = P * 2 * DATA_W;    // 128 bits per word

    // Ping-pong buffer: two banks, each WORDS entries
    // (Two separate 1D arrays for iverilog compat — no 2D arrays)
    reg [BUS_W-1:0] bank0[0:WORDS-1];
    reg [BUS_W-1:0] bank1[0:WORDS-1];

    reg [ADDR_W-1:0] wr_cnt;    // 0..WORDS-1
    reg              wr_bank;   // which bank is currently being written

    always @(posedge clk) begin
        if (rst) begin
            wr_cnt  <= {ADDR_W{1'b0}};
            wr_bank <= 1'b0;
        end else if (in_valid) begin
            if (wr_bank == 1'b0) bank0[wr_cnt] <= din;
            else                 bank1[wr_cnt] <= din;
            if (wr_cnt == WORDS - 1) begin
                wr_cnt  <= {ADDR_W{1'b0}};
                wr_bank <= ~wr_bank;        // switch banks when block complete
            end else begin
                wr_cnt <= wr_cnt + 1'b1;
            end
        end
    end

    reg [ADDR_W-1:0] rd_cnt;
    reg              rd_bank;
    reg              rd_active;

    // Bit-reverse function for ADDR_W=8 bits
    function [ADDR_W-1:0] bit_rev;
        input [ADDR_W-1:0] x;
        integer j;
        begin
            bit_rev = 0;
            for (j = 0; j < ADDR_W; j = j + 1)
                bit_rev[ADDR_W-1-j] = x[j];
        end
    endfunction

    wire [ADDR_W-1:0] rd_addr = bit_rev(rd_cnt);

    always @(posedge clk) begin
        if (rst) begin
            rd_cnt    <= {ADDR_W{1'b0}};
            rd_bank   <= 1'b1;     // initially reads from bank 1 (written second)
            rd_active <= 1'b0;
            out_valid <= 1'b0;
        end else begin
            // Start reading when write bank flips (i.e., a full block just completed)
            if (wr_cnt == WORDS - 1 && in_valid && !rd_active) begin
                rd_active <= 1'b1;
                rd_bank   <= wr_bank;   // read the bank just finished writing
                rd_cnt    <= {ADDR_W{1'b0}};
                out_valid <= 1'b1;
            end else if (rd_active) begin
                if (rd_cnt == WORDS - 1) begin
                    rd_cnt    <= {ADDR_W{1'b0}};
                    rd_active <= 1'b0;
                    out_valid <= 1'b0;
                end else begin
                    rd_cnt <= rd_cnt + 1'b1;
                end
            end else begin
                out_valid <= 1'b0;
            end
        end
    end

    // Async read from the read bank
    wire [BUS_W-1:0] raw = (rd_bank == 1'b0) ? bank0[rd_addr] : bank1[rd_addr];

    // Path permutation: swap paths 1 ↔ 2 so dout streams are
    //   path0 → bins {rd_cnt + 0*N/P}     (0..255)
    //   path1 → bins {rd_cnt + 1*N/P}     (256..511)
    //   path2 → bins {rd_cnt + 2*N/P}     (512..767)
    //   path3 → bins {rd_cnt + 3*N/P}     (768..1023)
    // (Raw layout was {p0,p2,p1,p3} due to the bit_rev_2 of the path index.)
    localparam PW = 2 * DATA_W;     // bits per complex path (re+im)
    assign dout[0*PW +: PW] = raw[0*PW +: PW];
    assign dout[1*PW +: PW] = raw[2*PW +: PW];
    assign dout[2*PW +: PW] = raw[1*PW +: PW];
    assign dout[3*PW +: PW] = raw[3*PW +: PW];

endmodule