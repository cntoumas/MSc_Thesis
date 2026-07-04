// =============================================================================
// complex_mult.v — Karatsuba Complex Multiplier
//
// Computes:  p = a * w   (complex multiplication)
//
//   p_re = a_re*w_re - a_im*w_im
//   p_im = a_re*w_im + a_im*w_re
//
// Uses 3 real multipliers (Karatsuba) instead of 4:
//   k1 = a_re * w_re
//   k2 = a_im * w_im
//   k3 = (a_re + a_im) * (w_re + w_im)
//   p_re = k1 - k2
//   p_im = k3 - k1 - k2
//
// This saves one DSP48 slice per instance at the cost of two extra adders.
// Convergent rounding (round-half-to-even) is applied before truncation.
//
// Pipeline options:
//   PIPE_STGS=0  — fully combinational (lowest latency, long timing path)
//   PIPE_STGS=1  — one output register  (~100 MHz if path before is short)
//   PIPE_STGS=3  — 3-stage pipeline (recommended for 100 MHz):
//                    Stage 1: pre-adders + input registers
//                    Stage 2: 3 DSP multiplications
//                    Stage 3: post-adders + rounding + output registers
//
//   NOTE: For PIPE_STGS > 0 the caller (fft_stage_fb) must align the
//         delay-line write address and butterfly_phase gate by the same
//         number of extra cycles.
//
// Parameters:
//   DATA_W    — width of a (signal data), default 16
//   TWIDDLE_W — width of w (twiddle), default 16
//   PIPE_STGS — pipeline stages: 0, 1, or 3
// =============================================================================
`timescale 1ns/1ps

module complex_mult #(
    parameter DATA_W    = 16,
    parameter TWIDDLE_W = 16,
    parameter PIPE_STGS = 0
) (
    input  wire                          clk,   // used when PIPE_STGS > 0
    input  wire                          rst,   // used when PIPE_STGS > 0 (active high, sync)

    input  wire signed [DATA_W-1:0]      a_re,
    input  wire signed [DATA_W-1:0]      a_im,
    input  wire signed [TWIDDLE_W-1:0]   w_re,
    input  wire signed [TWIDDLE_W-1:0]   w_im,

    output wire signed [DATA_W-1:0]      p_re,
    output wire signed [DATA_W-1:0]      p_im
);

    // -----------------------------------------------------------------
    // Bit-width book-keeping
    //   a_sum = a_re + a_im  : DATA_W+1 bits (signed)
    //   w_sum = w_re + w_im  : TWIDDLE_W+1 bits (signed)
    //   k1, k2 (16×16)       : DATA_W + TWIDDLE_W bits = 32 bits
    //   k3 (17×17)           : DATA_W + TWIDDLE_W + 2 bits = 34 bits
    //   raw_re (k1-k2)       : DATA_W + TWIDDLE_W + 1 bits = 33 bits
    //   raw_im (k3-k1-k2)    : DATA_W + TWIDDLE_W + 3 bits = 35 bits
    //   After >> FRAC bits, take DATA_W-bit result.
    // -----------------------------------------------------------------
    localparam FRAC    = TWIDDLE_W - 1;               // fractional bits to drop (15)
    localparam K12_W   = DATA_W + TWIDDLE_W;          // k1, k2 width (32)
    localparam K3_W    = DATA_W + TWIDDLE_W + 2;      // k3 width     (34)
    localparam RE_W    = K12_W + 1;                   // raw_re width  (33)
    localparam IM_W    = K3_W  + 1;                   // raw_im width  (35)

    // -----------------------------------------------------------------
    // Combinational Karatsuba core (used by all PIPE_STGS options)
    // -----------------------------------------------------------------

    // Pre-additions (sign-extend to avoid overflow)
    wire signed [DATA_W:0]    a_sum_c = {a_re[DATA_W-1], a_re} + {a_im[DATA_W-1], a_im};
    wire signed [TWIDDLE_W:0] w_sum_c = {w_re[TWIDDLE_W-1], w_re} + {w_im[TWIDDLE_W-1], w_im};

    // Three multiplications
    wire signed [K12_W-1:0]   k1_c = a_re   * w_re;
    wire signed [K12_W-1:0]   k2_c = a_im   * w_im;
    wire signed [K3_W-1:0]    k3_c = a_sum_c * w_sum_c;

    // Post-additions (sign-extend operands to common width IM_W)
    wire signed [RE_W-1:0] raw_re_c = {k1_c[K12_W-1], k1_c} - {k2_c[K12_W-1], k2_c};
    wire signed [IM_W-1:0] raw_im_c = {k3_c[K3_W-1], k3_c}
                                     - {{(IM_W-K12_W){k1_c[K12_W-1]}}, k1_c}
                                     - {{(IM_W-K12_W){k2_c[K12_W-1]}}, k2_c};

    // Convergent rounding (round-half-to-even) before right-shift by FRAC
    wire round_re_c = raw_re_c[FRAC-1] & raw_re_c[FRAC];
    wire round_im_c = raw_im_c[FRAC-1] & raw_im_c[FRAC];

    wire signed [RE_W-1:0] rnd_re_c = raw_re_c + round_re_c;
    wire signed [IM_W-1:0] rnd_im_c = raw_im_c + round_im_c;

    wire signed [DATA_W-1:0] comb_re = rnd_re_c[FRAC + DATA_W - 1 : FRAC];
    wire signed [DATA_W-1:0] comb_im = rnd_im_c[FRAC + DATA_W - 1 : FRAC];

    // -----------------------------------------------------------------
    // Pipeline selection
    // -----------------------------------------------------------------
    generate
        if (PIPE_STGS == 0) begin : g_comb
            // Fully combinational — no registers
            assign p_re = comb_re;
            assign p_im = comb_im;

        end else if (PIPE_STGS == 1) begin : g_pipe1
            // Single output register
            reg signed [DATA_W-1:0] r_re, r_im;
            always @(posedge clk) begin
                if (rst) begin
                    r_re <= {DATA_W{1'b0}};
                    r_im <= {DATA_W{1'b0}};
                end else begin
                    r_re <= comb_re;
                    r_im <= comb_im;
                end
            end
            assign p_re = r_re;
            assign p_im = r_im;

        end else begin : g_pipe3
            // 3-stage Karatsuba pipeline
            //   Stage 1: pre-adders + input capture
            //   Stage 2: three DSP multiplications
            //   Stage 3: post-adders + rounding + output
            //
            // All pipeline registers are synchronously reset to 0 to prevent
            // X propagation during simulation startup (the multipliers run
            // continuously regardless of upstream valid signals, so without
            // reset the output stage X-propagates through downstream logic).

            // Stage 1 registers
            reg signed [DATA_W-1:0]    s1_a_re, s1_a_im;
            reg signed [TWIDDLE_W-1:0] s1_w_re, s1_w_im;
            reg signed [DATA_W:0]      s1_a_sum;
            reg signed [TWIDDLE_W:0]   s1_w_sum;

            always @(posedge clk) begin
                if (rst) begin
                    s1_a_re  <= {DATA_W{1'b0}};
                    s1_a_im  <= {DATA_W{1'b0}};
                    s1_w_re  <= {TWIDDLE_W{1'b0}};
                    s1_w_im  <= {TWIDDLE_W{1'b0}};
                    s1_a_sum <= {(DATA_W+1){1'b0}};
                    s1_w_sum <= {(TWIDDLE_W+1){1'b0}};
                end else begin
                    s1_a_re  <= a_re;
                    s1_a_im  <= a_im;
                    s1_w_re  <= w_re;
                    s1_w_im  <= w_im;
                    s1_a_sum <= a_sum_c;
                    s1_w_sum <= w_sum_c;
                end
            end

            // Stage 2 registers (DSP multiplications)
            reg signed [K12_W-1:0] s2_k1, s2_k2;
            reg signed [K3_W-1:0]  s2_k3;

            always @(posedge clk) begin
                if (rst) begin
                    s2_k1 <= {K12_W{1'b0}};
                    s2_k2 <= {K12_W{1'b0}};
                    s2_k3 <= {K3_W{1'b0}};
                end else begin
                    s2_k1 <= s1_a_re  * s1_w_re;
                    s2_k2 <= s1_a_im  * s1_w_im;
                    s2_k3 <= s1_a_sum * s1_w_sum;
                end
            end

            // Stage 3: post-additions + rounding + output registers
            wire signed [RE_W-1:0] s3_raw_re =
                {s2_k1[K12_W-1], s2_k1} - {s2_k2[K12_W-1], s2_k2};

            wire signed [IM_W-1:0] s3_raw_im =
                {s2_k3[K3_W-1], s2_k3}
                - {{(IM_W-K12_W){s2_k1[K12_W-1]}}, s2_k1}
                - {{(IM_W-K12_W){s2_k2[K12_W-1]}}, s2_k2};

            wire s3_round_re = s3_raw_re[FRAC-1] & s3_raw_re[FRAC];
            wire s3_round_im = s3_raw_im[FRAC-1] & s3_raw_im[FRAC];

            wire signed [RE_W-1:0] s3_rnd_re = s3_raw_re + s3_round_re;
            wire signed [IM_W-1:0] s3_rnd_im = s3_raw_im + s3_round_im;

            reg signed [DATA_W-1:0] s3_re, s3_im;
            always @(posedge clk) begin
                if (rst) begin
                    s3_re <= {DATA_W{1'b0}};
                    s3_im <= {DATA_W{1'b0}};
                end else begin
                    s3_re <= s3_rnd_re[FRAC + DATA_W - 1 : FRAC];
                    s3_im <= s3_rnd_im[FRAC + DATA_W - 1 : FRAC];
                end
            end

            assign p_re = s3_re;
            assign p_im = s3_im;
        end
    endgenerate

endmodule
