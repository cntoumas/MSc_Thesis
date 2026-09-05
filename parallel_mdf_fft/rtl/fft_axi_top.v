`timescale 1ns/1ps

module fft_axi_top #(
    parameter integer DATA_W    = 16,
    parameter integer TWIDDLE_W = 16,
    parameter integer N         = 1024,
    parameter integer P         = 4,
    parameter         HEX_DIR   = "rom"
) (
    input  wire                     aclk,
    input  wire                     aresetn,    // active-low

    // Slave AXI-Stream (input)
    input  wire [P*2*DATA_W-1:0]    s_axis_tdata,
    input  wire                     s_axis_tvalid,
    output wire                     s_axis_tready,
    input  wire                     s_axis_tlast,

    // Master AXI-Stream (output)
    output wire [P*2*DATA_W-1:0]    m_axis_tdata,
    output wire                     m_axis_tvalid,
    input  wire                     m_axis_tready,
    output wire                     m_axis_tlast,
    output wire [3:0]               m_axis_tuser    // = blk_exp
);

    localparam integer WORDS = N / P;             // 256
    localparam integer CNT_W = (WORDS > 1) ? $clog2(WORDS) : 1;

    wire rst = ~aresetn;

    // AXI passthrough: output consumer must keep ready asserted during the block.
    wire en = 1'b1;
    assign s_axis_tready = en;
    wire   fft_in_valid  = s_axis_tvalid & s_axis_tready;

    wire                     fft_out_valid;
    wire [P*2*DATA_W-1:0]    fft_dout;
    wire [3:0]               fft_blk_exp;

    fft_top #(
        .DATA_W   (DATA_W),
        .TWIDDLE_W(TWIDDLE_W),
        .N        (N),
        .P        (P),
        .HEX_DIR  (HEX_DIR)
    ) u_fft (
        .clk      (aclk),
        .rst      (rst),
        .en       (en),
        .in_valid (fft_in_valid),
        .din      (s_axis_tdata),
        .out_valid(fft_out_valid),
        .dout     (fft_dout),
        .blk_exp  (fft_blk_exp)
    );

    reg [CNT_W-1:0] out_cnt;
    always @(posedge aclk) begin
        if (rst) begin
            out_cnt <= {CNT_W{1'b0}};
        end else if (en) begin
            if (m_axis_tvalid & m_axis_tready) begin
                if (out_cnt == WORDS-1)
                    out_cnt <= {CNT_W{1'b0}};
                else
                    out_cnt <= out_cnt + 1'b1;
            end
        end
    end

    assign m_axis_tdata  = fft_dout;
    assign m_axis_tvalid = fft_out_valid;
    assign m_axis_tuser  = fft_blk_exp;
    assign m_axis_tlast  = fft_out_valid & (out_cnt == WORDS-1);

endmodule