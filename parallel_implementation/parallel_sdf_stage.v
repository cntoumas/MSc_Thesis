//! @brief Parallel SDF Stage (Spatial, unified complex butterfly).
//! FIX (Bug 2): The original module had TWO register stages on the data path
//! (out_re_2d register + a second always @(posedge clk) FLATTEN register) but
//! only ONE register stage on valid_out. This meant valid_out was asserted one
//! cycle before the data it was supposed to qualify, causing the testbench to
//! capture stale/incorrect samples.
//!
//! Fix: The FLATTEN stage is now purely combinational (continuous assign).
//! Data path: 1 register (out_re_2d). valid_out path: 1 register. Aligned.
//! The output ports data_out_re_flat / data_out_im_flat are changed from
//! 'output reg' to 'output wire' to reflect this.
module parallel_sdf_stage #(
    parameter FFT_SIZE    = 4096,
    parameter STAGE_INDEX = 9,
    parameter DATA_WIDTH  = 32,
    parameter TWIDDLE_WIDTH = 16,
    parameter P           = 16
)(
    input  wire clk,
    input  wire rst,
    input  wire valid_in,
    input  wire [(P * DATA_WIDTH)-1:0] data_in_re_flat,
    input  wire [(P * DATA_WIDTH)-1:0] data_in_im_flat,
    input  wire signed [7:0] exp_in,
    output reg  valid_out,
    // Changed from 'output reg' to 'output wire': driven by combinational
    // assign from out_re/im_2d so there is only ONE register on the data path.
    output wire [(P * DATA_WIDTH)-1:0] data_out_re_flat,
    output wire [(P * DATA_WIDTH)-1:0] data_out_im_flat,
    output reg  signed [7:0] exp_out
);
 
    localparam GLOBAL_DEPTH = FFT_SIZE / (2**(STAGE_INDEX + 1));
    localparam NUM_BF = P / 2;
 
    // ---------------------------------------------------------------
    // Butterfly combinational outputs
    // ---------------------------------------------------------------
    wire signed [DATA_WIDTH-1:0] bf_a_re [0:NUM_BF-1];
    wire signed [DATA_WIDTH-1:0] bf_a_im [0:NUM_BF-1];
    wire signed [DATA_WIDTH-1:0] bf_b_re [0:NUM_BF-1];
    wire signed [DATA_WIDTH-1:0] bf_b_im [0:NUM_BF-1];
 
    // Elaboration-time lane index constants exposed as wires
    wire [31:0] lane_a_idx [0:NUM_BF-1];
    wire [31:0] lane_b_idx [0:NUM_BF-1];
 
    genvar b;
    generate
        for (b = 0; b < NUM_BF; b = b + 1) begin : BF_GEN
            localparam BANK   = b / GLOBAL_DEPTH;
            localparam LANE_A = (BANK * 2 * GLOBAL_DEPTH) + (b % GLOBAL_DEPTH);
            localparam LANE_B = LANE_A + GLOBAL_DEPTH;
 
            assign lane_a_idx[b] = LANE_A;
            assign lane_b_idx[b] = LANE_B;
 
            wire [31:0] n_idx = b % GLOBAL_DEPTH;
            wire [31:0] k_seq = (n_idx * (2**STAGE_INDEX)) % FFT_SIZE;
            wire signed [TWIDDLE_WIDTH-1:0] w_re, w_im;
 
            twiddle_rom #(
                .N(FFT_SIZE), .WIDTH(TWIDDLE_WIDTH)
            ) u_twiddle (
                .clk(clk), .rst(rst),
                .k(k_seq[11:0]),
                .w_re(w_re), .w_im(w_im)
            );
 
            butterfly_unit #(
                .DATA_WIDTH(DATA_WIDTH), .TWIDDLE_WIDTH(TWIDDLE_WIDTH)
            ) u_bf (
                .clk(clk), .rst(rst),
                .a_re(data_in_re_flat[(LANE_A*DATA_WIDTH) +: DATA_WIDTH]),
                .a_im(data_in_im_flat[(LANE_A*DATA_WIDTH) +: DATA_WIDTH]),
                .b_re(data_in_re_flat[(LANE_B*DATA_WIDTH) +: DATA_WIDTH]),
                .b_im(data_in_im_flat[(LANE_B*DATA_WIDTH) +: DATA_WIDTH]),
                .w_re(w_re), .w_im(w_im),
                .a_prime_re(bf_a_re[b]), .a_prime_im(bf_a_im[b]),
                .b_prime_re(bf_b_re[b]), .b_prime_im(bf_b_im[b])
            );
        end
    endgenerate
 
    // ---------------------------------------------------------------
    // Single register stage: route butterfly outputs into 2D array.
    // valid_out and exp_out share the same single register depth.
    // ---------------------------------------------------------------
    reg signed [DATA_WIDTH-1:0] out_re_2d [0:P-1];
    reg signed [DATA_WIDTH-1:0] out_im_2d [0:P-1];
 
    integer i, j;
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < P; i = i + 1) begin
                out_re_2d[i] <= 0;
                out_im_2d[i] <= 0;
            end
            valid_out <= 0;
            exp_out   <= 0;
        end else begin
            // Default: zero all lanes (handles lanes not driven this cycle)
            for (i = 0; i < P; i = i + 1) begin
                out_re_2d[i] <= 0;
                out_im_2d[i] <= 0;
            end
 
            // Route each butterfly's two outputs to their destination lanes
            for (j = 0; j < NUM_BF; j = j + 1) begin
                out_re_2d[lane_a_idx[j]] <= bf_a_re[j];
                out_im_2d[lane_a_idx[j]] <= bf_a_im[j];
                out_re_2d[lane_b_idx[j]] <= bf_b_re[j];
                out_im_2d[lane_b_idx[j]] <= bf_b_im[j];
            end
 
            valid_out <= valid_in;
            exp_out   <= exp_in + 1;
        end
    end
 
    // ---------------------------------------------------------------
    // Combinational flatten: out_re/im_2d -> data_out_re/im_flat.
    // NO extra register here — this is the fix for the double-
    // registration bug. Data and valid_out now have matching latency.
    // ---------------------------------------------------------------
    genvar k;
    generate
        for (k = 0; k < P; k = k + 1) begin : FLATTEN
            assign data_out_re_flat[(k*DATA_WIDTH) +: DATA_WIDTH] = out_re_2d[k];
            assign data_out_im_flat[(k*DATA_WIDTH) +: DATA_WIDTH] = out_im_2d[k];
        end
    endgenerate
 
endmodule