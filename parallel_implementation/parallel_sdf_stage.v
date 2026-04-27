//! @brief Parallel SDF Stage (Spatial, unified complex butterfly).
//! Every stage uses a full complex twiddle: W_N^(n * 2^STAGE_INDEX).
//! Latency: 1 cycle (output register).
module parallel_sdf_stage #(
    parameter FFT_SIZE = 4096,
    parameter STAGE_INDEX = 9,
    parameter DATA_WIDTH = 32,
    parameter TWIDDLE_WIDTH = 16,
    parameter P = 16
)(
    input wire clk,
    input wire rst,
    input wire valid_in,
    input wire [(P * DATA_WIDTH)-1:0] data_in_re_flat,
    input wire [(P * DATA_WIDTH)-1:0] data_in_im_flat,
    input wire signed [7:0] exp_in,
    output wire valid_out,
    output reg [(P * DATA_WIDTH)-1:0] data_out_re_flat,
    output reg [(P * DATA_WIDTH)-1:0] data_out_im_flat,
    output wire signed [7:0] exp_out
);

    localparam GLOBAL_DEPTH = (FFT_SIZE / (2**(STAGE_INDEX + 1)));

    wire signed [DATA_WIDTH-1:0] raw_a_re [0:P/2-1], raw_a_im [0:P/2-1];
    wire signed [DATA_WIDTH-1:0] raw_b_re [0:P/2-1], raw_b_im [0:P/2-1];

    genvar b;
    generate
        for (b = 0; b < P/2; b = b + 1) begin : BUTTERFLY_BANK
            localparam bank = b / GLOBAL_DEPTH;
            localparam LANE_A = (bank * 2 * GLOBAL_DEPTH) + (b % GLOBAL_DEPTH);
            localparam LANE_B = LANE_A + GLOBAL_DEPTH;

            // Twiddle: W_N^(n * 2^STAGE_INDEX) where n is the lane position
            wire [31:0] n_idx = LANE_B % (2 * GLOBAL_DEPTH);
            wire [31:0] k_seq = (n_idx * (2**STAGE_INDEX)) % FFT_SIZE;
            wire [TWIDDLE_WIDTH-1:0] w_re, w_im;
            twiddle_rom #(.N(FFT_SIZE), .WIDTH(TWIDDLE_WIDTH)) u_twiddle (
                .clk(clk), .rst(rst), .k(k_seq[11:0]), .w_re(w_re), .w_im(w_im)
            );

            butterfly_unit #(.DATA_WIDTH(DATA_WIDTH), .TWIDDLE_WIDTH(TWIDDLE_WIDTH)) u_bf (
                .clk(clk), .rst(rst),
                .a_re(data_in_re_flat[(LANE_A*DATA_WIDTH) +: DATA_WIDTH]), .a_im(data_in_im_flat[(LANE_A*DATA_WIDTH) +: DATA_WIDTH]),
                .b_re(data_in_re_flat[(LANE_B*DATA_WIDTH) +: DATA_WIDTH]), .b_im(data_in_im_flat[(LANE_B*DATA_WIDTH) +: DATA_WIDTH]),
                .w_re(w_re), .w_im(w_im),
                .a_prime_re(raw_a_re[b]), .a_prime_im(raw_a_im[b]),
                .b_prime_re(raw_b_re[b]), .b_prime_im(raw_b_im[b])
            );

            wire [(P * DATA_WIDTH)-1:0] flat_re_wire, flat_im_wire;
            assign flat_re_wire[(LANE_A * DATA_WIDTH) +: DATA_WIDTH] = raw_a_re[b];
            assign flat_im_wire[(LANE_A * DATA_WIDTH) +: DATA_WIDTH] = raw_a_im[b];
            assign flat_re_wire[(LANE_B * DATA_WIDTH) +: DATA_WIDTH] = raw_b_re[b];
            assign flat_im_wire[(LANE_B * DATA_WIDTH) +: DATA_WIDTH] = raw_b_im[b];
            
            always @(posedge clk) begin
                if (rst) begin
                    data_out_re_flat[(LANE_A * DATA_WIDTH) +: DATA_WIDTH] <= 0;
                    data_out_im_flat[(LANE_A * DATA_WIDTH) +: DATA_WIDTH] <= 0;
                    data_out_re_flat[(LANE_B * DATA_WIDTH) +: DATA_WIDTH] <= 0;
                    data_out_im_flat[(LANE_B * DATA_WIDTH) +: DATA_WIDTH] <= 0;
                end else begin
                    data_out_re_flat[(LANE_A * DATA_WIDTH) +: DATA_WIDTH] <= flat_re_wire[(LANE_A * DATA_WIDTH) +: DATA_WIDTH];
                    data_out_im_flat[(LANE_A * DATA_WIDTH) +: DATA_WIDTH] <= flat_im_wire[(LANE_A * DATA_WIDTH) +: DATA_WIDTH];
                    data_out_re_flat[(LANE_B * DATA_WIDTH) +: DATA_WIDTH] <= flat_re_wire[(LANE_B * DATA_WIDTH) +: DATA_WIDTH];
                    data_out_im_flat[(LANE_B * DATA_WIDTH) +: DATA_WIDTH] <= flat_im_wire[(LANE_B * DATA_WIDTH) +: DATA_WIDTH];
                end
            end
        end
    endgenerate

    reg valid_out_reg;
    reg signed [7:0] exp_out_reg;
    always @(posedge clk) begin
        if (rst) begin
            valid_out_reg <= 0;
            exp_out_reg <= 0;
        end else begin
            valid_out_reg <= valid_in;
            exp_out_reg <= exp_in + 1; // Static BFP scaling
        end
    end
    assign valid_out = valid_out_reg;
    assign exp_out   = exp_out_reg;

endmodule