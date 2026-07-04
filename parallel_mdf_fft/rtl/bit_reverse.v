// =============================================================================
// bit_reverse.v — Output bit-reversal reorder buffer for P=4 MDF FFT
//
// The DIF FFT produces output samples in bit-reversed order.  This module
// collects one full N-point block (N/P = 256 clock cycles × P=4 samples),
// then outputs the block with indices reordered to natural order.
//
// Implementation:
//   Dual-buffer ping-pong scheme (two banks of depth N/P = 256 words).
//   While bank A is being written (by the FFT pipeline), bank B is being
//   read (in bit-reversed read order), and vice versa.
//
//   Write address:   wr_cnt    = 0..255 (natural, sequential)
//   Read address:    bit_rev(wr_cnt)  — the write address reversed gives
//                    the natural-order read address for each output word.
//
// Detail (P=4, N=1024):
//   The DIF FFT pipeline produces, at write clock t (8-bit count), four
//   samples on paths p=0..3 whose natural-order frequency-bin indices are
//
//       bin(t,p) = bit_rev_10( t*P + p )
//                = (bit_rev_2(p) << 8) | bit_rev_8(t)
//
//   i.e. the 2-bit path index becomes the *upper* 2 bits of the bin index
//   after a 10-bit reversal.  Mapping bit_rev_2: 0→0, 1→2, 2→1, 3→3.
//
//   We write each cycle's 4 samples at write address t (no permutation in
//   storage), and read back at address bit_rev_8(rd_cnt) so that the
//   per-clock 8-bit "t" component becomes natural again.
//
//   After that, the 4 paths within a read word still carry bins in the
//   *bit-reversed-path* order {0, 2, 1, 3} × N/P + rd_cnt.  We swap paths
//   1 ↔ 2 at the output mux so that path p of dout maps cleanly to
//
//       output bin = rd_cnt + p * (N/P)
//
//   i.e. the four parallel outputs are stride-(N/P) streams in natural
//   order: stream 0 covers bins 0..255, stream 1 covers 256..511, stream 2
//   covers 512..767, stream 3 covers 768..1023.  They are NOT four
//   consecutive bins per clock — the verification script must reassemble
//   accordingly.
//
// Parameters:
//   DATA_W — data width per complex component (signed), default 16
//   P      — parallelism, default 4  (P=4 is assumed in bit-reverse logic)
//   N      — FFT size, default 1024
//            WORDS = N/P = 256 (number of clock cycles per FFT block)
//            ADDR_W = $clog2(WORDS) = 8
//
// Ports:
//   clk          — system clock
//   rst          — synchronous reset
//   in_valid     — input data valid (one cycle per P samples from pipeline)
//   din          — P complex inputs (packed, same as FFT stage output)
//   out_valid    — output data valid (asserted for WORDS cycles after a fill)
//   dout         — P complex outputs (natural order)
//
// Latency:  N/P = 256 clock cycles (one full block delay).
// =============================================================================
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

    // ---------------------------------------------------------------
    // Ping-pong buffer: two banks, each WORDS entries
    // (Two separate 1D arrays for iverilog compat — no 2D arrays)
    // ---------------------------------------------------------------
    reg [BUS_W-1:0] bank0[0:WORDS-1];
    reg [BUS_W-1:0] bank1[0:WORDS-1];

    // ---------------------------------------------------------------
    // Write side
    // ---------------------------------------------------------------
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

    // ---------------------------------------------------------------
    // Read side (reads from the bank not currently being written)
    // Read in bit-reversed address order.
    // ---------------------------------------------------------------
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

    // -----------------------------------------------------------------
    // Path permutation: swap paths 1 ↔ 2 so dout streams are
    //   path0 → bins {rd_cnt + 0*N/P}     (0..255)
    //   path1 → bins {rd_cnt + 1*N/P}     (256..511)
    //   path2 → bins {rd_cnt + 2*N/P}     (512..767)
    //   path3 → bins {rd_cnt + 3*N/P}     (768..1023)
    // (Raw layout was {p0,p2,p1,p3} due to the bit_rev_2 of the path index.)
    // -----------------------------------------------------------------
    localparam PW = 2 * DATA_W;     // bits per complex path (re+im)
    assign dout[0*PW +: PW] = raw[0*PW +: PW];
    assign dout[1*PW +: PW] = raw[2*PW +: PW];
    assign dout[2*PW +: PW] = raw[1*PW +: PW];
    assign dout[3*PW +: PW] = raw[3*PW +: PW];

endmodule
