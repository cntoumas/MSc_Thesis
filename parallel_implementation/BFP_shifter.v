//! @brief Block Floating Point Barrel Shifter and Exponent Tracker.
//! CORRECTED: Uses LEFT shifts for normalization and proper convergent rounding.
module bfp_shifter #(
    parameter INPUT_WIDTH  = 32,
    parameter OUTPUT_WIDTH = 16
)(
    input  wire clk,
    input  wire rst,
    input  wire signed [INPUT_WIDTH-1:0]  a_in_re,
    input  wire signed [INPUT_WIDTH-1:0]  a_in_im,
    input  wire signed [INPUT_WIDTH-1:0]  b_in_re,
    input  wire signed [INPUT_WIDTH-1:0]  b_in_im,
    input  wire [5:0] block_clz,
    input  wire signed [7:0] exp_in,
    output reg  signed [OUTPUT_WIDTH-1:0] a_out_re,
    output reg  signed [OUTPUT_WIDTH-1:0] a_out_im,
    output reg  signed [OUTPUT_WIDTH-1:0] b_out_re,
    output reg  signed [OUTPUT_WIDTH-1:0] b_out_im,
    output reg  signed [7:0] exp_out
);

    localparam DROP = INPUT_WIDTH - OUTPUT_WIDTH;  // Bits discarded during truncation

    // ---------------------------------------------------------------------
    // 1. Variable left-shift barrel (normalization toward MSB)
    // ---------------------------------------------------------------------
    wire signed [INPUT_WIDTH-1:0] a_shifted_re = a_in_re <<< block_clz;
    wire signed [INPUT_WIDTH-1:0] a_shifted_im = a_in_im <<< block_clz;
    wire signed [INPUT_WIDTH-1:0] b_shifted_re = b_in_re <<< block_clz;
    wire signed [INPUT_WIDTH-1:0] b_shifted_im = b_in_im <<< block_clz;

    // ---------------------------------------------------------------------
    // 2. Convergent rounding (Round-to-Nearest-Even) on truncation
    // ---------------------------------------------------------------------
    // After normalization we keep the top OUTPUT_WIDTH bits:
    //   final_val = shifted[INPUT_WIDTH-1 : DROP]
    //
    // Rounding looks at the discarded slice shifted[DROP-1 : 0]:
    //   half   = shifted[DROP-1]               // 0.5 LSB
    //   sticky = |shifted[DROP-2 : 0]           // any remainder < 0.5
    //   lsb    = shifted[DROP]                 // LSB of result before round
    //   round  = half & (sticky | lsb)
    // ---------------------------------------------------------------------
    wire [DROP-1:0] drop_a_re = a_shifted_re[DROP-1:0];
    wire [DROP-1:0] drop_a_im = a_shifted_im[DROP-1:0];
    wire [DROP-1:0] drop_b_re = b_shifted_re[DROP-1:0];
    wire [DROP-1:0] drop_b_im = b_shifted_im[DROP-1:0];

    wire half_a_re   = drop_a_re[DROP-1];
    wire sticky_a_re = (DROP > 1) ? |drop_a_re[DROP-2:0] : 1'b0;
    wire lsb_a_re    = a_shifted_re[DROP];
    wire round_a_re  = half_a_re & (sticky_a_re | lsb_a_re);

    wire half_a_im   = drop_a_im[DROP-1];
    wire sticky_a_im = (DROP > 1) ? |drop_a_im[DROP-2:0] : 1'b0;
    wire lsb_a_im    = a_shifted_im[DROP];
    wire round_a_im  = half_a_im & (sticky_a_im | lsb_a_im);

    wire half_b_re   = drop_b_re[DROP-1];
    wire sticky_b_re = (DROP > 1) ? |drop_b_re[DROP-2:0] : 1'b0;
    wire lsb_b_re    = b_shifted_re[DROP];
    wire round_b_re  = half_b_re & (sticky_b_re | lsb_b_re);

    wire half_b_im   = drop_b_im[DROP-1];
    wire sticky_b_im = (DROP > 1) ? |drop_b_im[DROP-2:0] : 1'b0;
    wire lsb_b_im    = b_shifted_im[DROP];
    wire round_b_im  = half_b_im & (sticky_b_im | lsb_b_im);

    // ---------------------------------------------------------------------
    // 3. Registered outputs
    // ---------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            a_out_re <= 0;  a_out_im <= 0;
            b_out_re <= 0;  b_out_im <= 0;
            exp_out  <= 0;
        end else begin
            a_out_re <= a_shifted_re[INPUT_WIDTH-1:DROP] + {{(OUTPUT_WIDTH-1){1'b0}}, round_a_re};
            a_out_im <= a_shifted_im[INPUT_WIDTH-1:DROP] + {{(OUTPUT_WIDTH-1){1'b0}}, round_a_im};
            b_out_re <= b_shifted_re[INPUT_WIDTH-1:DROP] + {{(OUTPUT_WIDTH-1){1'b0}}, round_b_re};
            b_out_im <= b_shifted_im[INPUT_WIDTH-1:DROP] + {{(OUTPUT_WIDTH-1){1'b0}}, round_b_im};
            exp_out  <= exp_in + block_clz;   // Scale factor tracks the left shift
        end
    end

endmodule