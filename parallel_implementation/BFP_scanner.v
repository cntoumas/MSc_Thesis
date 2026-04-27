//! @brief Block Floating Point (BFP) Stage Scanner with Early Termination.
//! CORRECTED: Priority encoder now finds the FIRST set bit from MSB (true CLZ).
module bfp_scanner #(
    parameter INPUT_WIDTH = 32
)(
    input  wire clk,
    input  wire rst,
    input  wire new_stage,
    input  wire valid_in,
    input  wire signed [INPUT_WIDTH-1:0] a_prime_re,
    input  wire signed [INPUT_WIDTH-1:0] a_prime_im,
    input  wire signed [INPUT_WIDTH-1:0] b_prime_re,
    input  wire signed [INPUT_WIDTH-1:0] b_prime_im,
    output reg  [5:0] block_shift_amount,
    output reg        early_stop
);

    localparam MAG_WIDTH = INPUT_WIDTH - 1;
    reg [MAG_WIDTH-1:0] running_or_mask;

    wire [MAG_WIDTH-1:0] mag_a_re, mag_a_im, mag_b_re, mag_b_im;
    wire [MAG_WIDTH-1:0] cycle_or_mask;

    assign mag_a_re = a_prime_re[INPUT_WIDTH-1] ? ~a_prime_re[MAG_WIDTH-1:0] : a_prime_re[MAG_WIDTH-1:0];
    assign mag_a_im = a_prime_im[INPUT_WIDTH-1] ? ~a_prime_im[MAG_WIDTH-1:0] : a_prime_im[MAG_WIDTH-1:0];
    assign mag_b_re = b_prime_re[INPUT_WIDTH-1] ? ~b_prime_re[MAG_WIDTH-1:0] : b_prime_re[MAG_WIDTH-1:0];
    assign mag_b_im = b_prime_im[INPUT_WIDTH-1] ? ~b_prime_im[MAG_WIDTH-1:0] : b_prime_im[MAG_WIDTH-1:0];

    assign cycle_or_mask = mag_a_re | mag_a_im | mag_b_re | mag_b_im;

    always @(posedge clk) begin
        if (rst) begin
            running_or_mask <= 0;
            early_stop      <= 0;
        end else if (new_stage) begin
            running_or_mask <= 0;
            early_stop      <= 0;
        end else if (valid_in && !early_stop) begin
            running_or_mask <= running_or_mask | cycle_or_mask;
            if ((running_or_mask | cycle_or_mask) & (1'b1 << (MAG_WIDTH-1)))
                early_stop <= 1'b1;
        end
    end

    // ---------------------------------------------------------------------
    // CORRECTED: Priority encoder searches MSB -> LSB so the FIRST hit
    // (the highest-order set bit) determines the CLZ.
    // ---------------------------------------------------------------------
    integer k;
    reg        found;
    reg [5:0]  clz_val;

    always @(*) begin
        clz_val = MAG_WIDTH[5:0];   // Default: all-zero case
        found   = 1'b0;
        for (k = MAG_WIDTH-1; k >= 0; k = k - 1) begin
            if (!found && running_or_mask[k]) begin
                clz_val = (MAG_WIDTH - 1 - k);
                found   = 1'b1;
            end
        end
    end

    always @(posedge clk) begin
        if (rst) block_shift_amount <= 0;
        else     block_shift_amount <= clz_val;
    end

endmodule