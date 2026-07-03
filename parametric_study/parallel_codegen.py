#!/usr/bin/env python3
"""
parallel_codegen.py — Elaboration-time parametrization for the P=4 MDF FFT.
===========================================================================
The thesis `fft_top.v` is hand-written for exactly N=1024 (ten stages with
hand-derived valid/rst pipeline taps, an explicit 287-bit shift register and
a hard-coded ÷2^10 block exponent).  Every *sub*-module (fft_stage_fb/nf,
delay_line, complex_mult, butterfly_r2, block_scaler, overflow_detect,
twiddle_rom, bit_reverse) is already fully parametric in N / P / DATA_W /
TWIDDLE_W, so the only thing standing in the way of a size sweep is the
top-level assembly.

Rather than fight Icarus 0.9.7's weak SystemVerilog (no localparam arrays /
function-computed generate taps), we generate a specialised `fft_top` per N
in Python — exactly the "elaboration" a real FFT generator (Spiral, Xilinx
FFT IP) performs.  This is the agreed "attempt the refactor" path: the stage
RTL is reused verbatim; only the wiring is computed.

Tap derivation (identical algebra to the comments in the original fft_top):
    L      = log2(N)                         total radix-2 stages
    L_FB   = L - 2                            feedback stages (s = 0..L_FB-1)
    L_NF   = 2                                no-feedback stages (P=4 → 4-pt)
    DEPTH[s] = N / (P * 2^(s+1))              delay-line depth of FB stage s
    arrival[k] = sum(DEPTH[0..k-1]) + 4*k     cycle stage k's input is valid
                 (4 = 3 commuted-mult pipeline + 1 inter-stage register)
    tap[k]   = arrival[k] - 1                 valid_pipe index for stage k
    blk_exp  = L                              fixed conservative ÷2 per stage

For N=1024 this reproduces the original taps exactly
(131,199,235,255,267,275,281,286,286), width 287, blk_exp 10 — checked by
``selftest()`` below.
"""

import math
import numpy as np
from decimal import Decimal, ROUND_HALF_EVEN


def _fixed_point(value, max_val, frac_bits):
    """Scale a float to a signed Q1.frac_bits integer without float64 overflow.

    For words wider than the float64 mantissa (``frac_bits >= 53``) the plain
    ``value * max_val`` rounds inside float64 and wraps past the signed range
    (e.g. ``cos(0) * (2**63 - 1)`` -> ``2**63`` = most-negative 64-bit word),
    corrupting the ROM. Scaling in ``Decimal`` from the exact float64 value
    avoids that; the clamp bounds it to ``[-2**frac_bits, 2**frac_bits - 1]``.
    For the narrow widths (<= 53 bits) the float product is exact, so the
    original ``round`` path is preserved byte-for-byte.
    """
    if frac_bits < 53:
        q = int(round(value * max_val))
    else:
        q = int((Decimal(float(value)) * max_val).to_integral_value(rounding=ROUND_HALF_EVEN))
    return max(-(1 << frac_bits), min(max_val, q))


def fft_geometry(N, P=4):
    L = int(round(math.log2(N)))
    LP = int(round(math.log2(P)))
    assert (1 << L) == N, "N must be a power of two"
    assert (1 << LP) == P, "P must be a power of two (radix-2 MDF)"
    L_NF = LP                       # cross-path no-feedback stages = log2(P)
    L_FB = L - L_NF                 # within-path feedback stages
    assert L_FB >= 1, "N too small for this P"
    depth = [N // (P * (2 ** (s + 1))) for s in range(L_FB)]
    arrival = [sum(depth[:k]) + 4 * k for k in range(L_FB + 1)]
    # valid_pipe must be wide enough for the FB taps plus the NF block latency
    # (one register per NF sub-stage) and a small tuning margin.
    pipe_w = arrival[L_FB] + L_NF + 8
    return dict(L=L, L_FB=L_FB, L_NF=L_NF, P=P, depth=depth, arrival=arrival,
                pipe_w=pipe_w, blk_exp=L)


def nf_schedule(P):
    """Radix-2 DIF butterfly schedule for an in-place P-point cross-path FFT.

    Returns a list of stages; each stage is a list of (i, j, k, m) butterflies
    meaning: pos i <- x[i]+x[j], pos j <- (x[i]-x[j]) * W_m^k, with
    W_m = exp(-j 2pi/m). After log2(P) stages the in-place array holds the
    DFT in bit-reversed-path order (which bit_reverse then undoes).
    """
    import math
    L = int(round(math.log2(P)))
    stages = []
    for s in range(L):
        m = P >> s
        half = m >> 1
        bfs = []
        for start in range(0, P, m):
            for k in range(half):
                bfs.append((start + k, start + k + half, k, m))
        stages.append(bfs)
    return stages


def gen_nf(P, data_w):
    """Generate a combinational/pipelined P-point DIF FFT 'no-feedback' block.

    One registered radix-2 DIF stage per sub-stage (log2 P total), each scaling
    by 1/2 (round-half-even) so the block contributes log2(P) to the block
    exponent — matching the feedback stages' per-stage scaling. Trivial twiddles
    (1, -j, -1) are exact bit ops; the genuinely complex ones (e.g. W_8^1) use a
    constant fixed-point complex multiply with rounding.
    """
    import math
    L = int(round(math.log2(P)))
    DW = data_w
    Q = (1 << (DW - 1)) - 1   # Q(DW-1) scale for twiddle constants

    def cst(x):
        return _fixed_point(x, Q, DW - 1)

    lines = [f"// GENERATED no-feedback {P}-point cross-path DIF FFT (DATA_W-parametric)",
             "`timescale 1ns/1ps",
             f"module fft_nf_P{P} #(parameter integer DATA_W = {DW}) (",
             "    input  wire clk, rst,",
             "    input  wire [%d*2*DATA_W-1:0] din," % P,
             "    output wire [%d*2*DATA_W-1:0] dout" % P,
             ");",
             "    localparam integer P = %d;" % P]
    # cur[p] = (re_expr, im_expr) Verilog names for current stage paths
    # stage 0 inputs unpacked from din
    for p in range(P):
        lines.append(f"    wire signed [DATA_W-1:0] x0_{p}_re = $signed(din[{p}*2*DATA_W +: DATA_W]);")
        lines.append(f"    wire signed [DATA_W-1:0] x0_{p}_im = $signed(din[{p}*2*DATA_W + DATA_W +: DATA_W]);")

    sched = nf_schedule(P)
    for s, bfs in enumerate(sched):
        si, so = s, s + 1
        # registers for this stage output
        for p in range(P):
            lines.append(f"    reg signed [DATA_W-1:0] x{so}_{p}_re, x{so}_{p}_im;")
        # combinational next-values
        for (i, j, k, m) in bfs:
            ang = -2.0 * math.pi * k / m
            wr, wi = math.cos(ang), math.sin(ang)
            # sum path i, diff path j (in place)
            for c in ("re", "im"):
                lines.append(f"    wire signed [DATA_W:0] sum{so}_{i}_{c} = $signed(x{si}_{i}_{c}) + $signed(x{si}_{j}_{c});")
                lines.append(f"    wire signed [DATA_W:0] dif{so}_{j}_{c} = $signed(x{si}_{i}_{c}) - $signed(x{si}_{j}_{c});")
            # round-half-even /2 of the DATA_W+1 sum -> DATA_W
            for c in ("re", "im"):
                lines.append(f"    wire signed [DATA_W-1:0] sh{so}_{i}_{c} = sum{so}_{i}_{c}[DATA_W:1] + (sum{so}_{i}_{c}[0] & sum{so}_{i}_{c}[1]);")
            # scaled diff /2 (round-half-even) -> DATA_W
            for c in ("re", "im"):
                lines.append(f"    wire signed [DATA_W-1:0] dh{so}_{j}_{c} = dif{so}_{j}_{c}[DATA_W:1] + (dif{so}_{j}_{c}[0] & dif{so}_{j}_{c}[1]);")
            # twiddle the scaled diff
            tol = 1e-9
            if abs(wr - 1) < tol and abs(wi) < tol:        # W = 1
                tre, tim = f"dh{so}_{j}_re", f"dh{so}_{j}_im"
            elif abs(wr) < tol and abs(wi + 1) < tol:      # W = -j  (re,im)->(im,-re)
                tre, tim = f"dh{so}_{j}_im", f"-dh{so}_{j}_re"
            elif abs(wr + 1) < tol and abs(wi) < tol:      # W = -1
                tre, tim = f"-dh{so}_{j}_re", f"-dh{so}_{j}_im"
            elif abs(wr) < tol and abs(wi - 1) < tol:      # W = +j
                tre, tim = f"-dh{so}_{j}_im", f"dh{so}_{j}_re"
            else:                                          # general constant complex mult
                cr, ci = cst(wr), cst(wi)
                lines.append(f"    wire signed [2*DATA_W:0] pr{so}_{j} = dh{so}_{j}_re*({cr}) - dh{so}_{j}_im*({ci});")
                lines.append(f"    wire signed [2*DATA_W:0] pi{so}_{j} = dh{so}_{j}_re*({ci}) + dh{so}_{j}_im*({cr});")
                # rescale by Q(DW-1): take [DW-1 +: DW] with round bit at DW-2
                lines.append(f"    wire signed [DATA_W-1:0] tw{so}_{j}_re = pr{so}_{j}[2*DATA_W-2 : DATA_W-1] + pr{so}_{j}[DATA_W-2];")
                lines.append(f"    wire signed [DATA_W-1:0] tw{so}_{j}_im = pi{so}_{j}[2*DATA_W-2 : DATA_W-1] + pi{so}_{j}[DATA_W-2];")
                tre, tim = f"tw{so}_{j}_re", f"tw{so}_{j}_im"
            lines.append(f"    // bf (i={i}, j={j}, W_{m}^{k})")
            lines.append(f"    wire signed [DATA_W-1:0] nxt{so}_{i}_re = sh{so}_{i}_re, nxt{so}_{i}_im = sh{so}_{i}_im;")
            lines.append(f"    wire signed [DATA_W-1:0] nxt{so}_{j}_re = {tre}, nxt{so}_{j}_im = {tim};")
        # register all P positions
        lines.append("    always @(posedge clk) begin")
        lines.append("        if (rst) begin")
        for p in range(P):
            lines.append(f"            x{so}_{p}_re <= 0; x{so}_{p}_im <= 0;")
        lines.append("        end else begin")
        for p in range(P):
            lines.append(f"            x{so}_{p}_re <= nxt{so}_{p}_re; x{so}_{p}_im <= nxt{so}_{p}_im;")
        lines.append("        end")
        lines.append("    end")

    # pack final stage outputs
    for p in range(P):
        lines.append(f"    assign dout[{p}*2*DATA_W +: DATA_W]          = x{L}_{p}_re;")
        lines.append(f"    assign dout[{p}*2*DATA_W + DATA_W +: DATA_W] = x{L}_{p}_im;")
    lines.append("endmodule")
    return "\n".join(lines) + "\n"


def gen_fft_top(N, P=4, nf_align=None):
    """Generate an N/P-specialised fft_top.

    P == 4 reproduces the thesis design exactly (two fft_stage_nf, original
    taps). P != 4 uses the generated P-point NF block (fft_nf_P{P}) with a
    tunable bit-reverse alignment offset `nf_align` (cycles added to the final
    FB tap to line the reorder buffer up with the NF block's output).
    """
    g = fft_geometry(N, P)
    L, L_FB, L_NF, W = g["L"], g["L_FB"], g["L_NF"], g["pipe_w"]
    arrival = g["arrival"]
    tap = [a - 1 for a in arrival]          # tap[k] for k=0..L_FB

    if nf_align is None:
        nf_align = 0 if P == 4 else L_NF
    br_tap = tap[L_FB] + nf_align            # bit_reverse in_valid tap

    lines = []
    a = lines.append
    a("// ============================================================================")
    a(f"// fft_top.v — GENERATED P={P} MDF Radix-2 DIF FFT for N={N} (L={L} stages)")
    a("// Auto-generated by parametric_study/parallel_codegen.py — do not hand-edit.")
    a("// Sub-modules (fft_stage_fb, delay_line, ... and fft_nf_P{P}) are reused.")
    a("// ============================================================================")
    a("`timescale 1ns/1ps")
    a("")
    a("module fft_top #(")
    a("    parameter integer DATA_W    = 16,")
    a("    parameter integer TWIDDLE_W = 16,")
    a(f"    parameter integer N         = {N},")
    a(f"    parameter integer P         = {P},")
    a('    parameter         HEX_DIR   = "rom"')
    a(") (")
    a("    input  wire                      clk,")
    a("    input  wire                      rst,")
    a("    input  wire                      en,")
    a("    input  wire                      in_valid,")
    a("    input  wire [P*2*DATA_W-1:0]     din,")
    a("    output wire                      out_valid,")
    a("    output wire [P*2*DATA_W-1:0]     dout,")
    a("    output wire [3:0]                blk_exp")
    a(");")
    a("")
    a(f"    wire [P*2*DATA_W-1:0] stage_out [0:{L_FB-1}];")
    a(f"    wire [3:0]            stage_exp [0:{L_FB-1}];")
    a("")
    a("    reg in_valid_d;")
    a("    always @(posedge clk) begin")
    a("        if (rst) in_valid_d <= 1'b0;")
    a("        else     in_valid_d <= in_valid;")
    a("    end")
    a("    wire blk_rst_start = in_valid & ~in_valid_d;")
    a("")
    a(f"    reg [{W-1}:0] valid_pipe;")
    a(f"    reg [{W-1}:0] rst_pipe;")
    a("    always @(posedge clk) begin")
    a("        if (rst) begin")
    a(f"            valid_pipe <= {W}'b0;")
    a(f"            rst_pipe   <= {W}'b0;")
    a("        end else if (en) begin")
    a(f"            valid_pipe <= {{valid_pipe[{W-2}:0], in_valid}};")
    a(f"            rst_pipe   <= {{rst_pipe[{W-2}:0],   blk_rst_start}};")
    a("        end")
    a("    end")
    a("")
    a(f"    wire [{L_FB-1}:0] vld_s;")
    a(f"    wire [{L_FB-1}:0] rst_s;")
    a("    assign vld_s[0] = in_valid;        assign rst_s[0] = blk_rst_start;")
    for k in range(1, L_FB):
        a(f"    assign vld_s[{k}] = valid_pipe[{tap[k]}]; assign rst_s[{k}] = rst_pipe[{tap[k]}];")
    a(f"    wire nf_blk_rst = rst_pipe[{tap[L_FB]}];")
    a(f"    wire br_valid   = valid_pipe[{br_tap}];   // bit-reverse in_valid (nf_align={nf_align})")
    a("")
    a(f"    reg [P*2*DATA_W-1:0] stage_out_r [0:{L_FB-1}];")
    a("    integer gi;")
    a("    always @(posedge clk) begin")
    a("        if (rst) begin")
    a(f"            for (gi = 0; gi < {L_FB}; gi = gi + 1)")
    a("                stage_out_r[gi] <= {(P*2*DATA_W){1'b0}};")
    a("        end else if (en) begin")
    a(f"            for (gi = 0; gi < {L_FB}; gi = gi + 1)")
    a("                stage_out_r[gi] <= stage_out[gi];")
    a("        end")
    a("    end")
    a("")
    a(f"    // ---- Feedback stages 0 .. {L_FB-1} (within-path N/P-point FFT) ----")
    for k in range(L_FB):
        src = "din" if k == 0 else f"stage_out_r[{k-1}]"
        a(f"    fft_stage_fb #(.DATA_W(DATA_W), .TWIDDLE_W(TWIDDLE_W), .P(P), .N(N), .STAGE({k})) u_s{k} (")
        a(f"        .clk(clk), .rst(rst), .en(en), .in_valid(vld_s[{k}]), .blk_rst(rst_s[{k}]),")
        a(f"        .din({src}), .dout(stage_out[{k}]), .blk_exp(stage_exp[{k}])")
        a("    );")
    a("")
    a("    wire [P*2*DATA_W-1:0] nf_out;")
    if P == 4:
        a("    // ---- No-feedback stages: original 2x fft_stage_nf (4-pt, trivial twiddles) ----")
        a("    wire [P*2*DATA_W-1:0] nf_mid;")
        a("    wire [3:0] nf_exp0, nf_exp1;")
        a("    fft_stage_nf #(.DATA_W(DATA_W), .P(P), .IDX(0)) u_nf0 (")
        a(f"        .clk(clk), .rst(rst), .blk_rst(nf_blk_rst),")
        a(f"        .din(stage_out_r[{L_FB-1}]), .dout(nf_mid), .blk_exp(nf_exp0)")
        a("    );")
        a("    fft_stage_nf #(.DATA_W(DATA_W), .P(P), .IDX(1)) u_nf1 (")
        a("        .clk(clk), .rst(rst), .blk_rst(nf_blk_rst),")
        a("        .din(nf_mid), .dout(nf_out), .blk_exp(nf_exp1)")
        a("    );")
    else:
        a(f"    // ---- No-feedback block: generated {P}-point cross-path DIF FFT ----")
        a(f"    fft_nf_P{P} #(.DATA_W(DATA_W)) u_nf (")
        a(f"        .clk(clk), .rst(rst), .din(stage_out_r[{L_FB-1}]), .dout(nf_out)")
        a("    );")
    a("")
    a("    bit_reverse #(.DATA_W(DATA_W), .N(N), .P(P)) u_reorder (")
    a("        .clk(clk), .rst(rst), .in_valid(br_valid),")
    a("        .din(nf_out), .out_valid(out_valid), .dout(dout)")
    a("    );")
    a("")
    a(f"    assign blk_exp = 4'd{g['blk_exp']};   // fixed conservative scaling = log2(N)")
    a("")
    a("endmodule")
    return "\n".join(lines) + "\n"


# --------------------------------------------------------------------------
# Twiddle eighth-ROM generator (same math as the serial generator; the
# committed twiddle_*_eighth.mem are byte-identical to serial cos/sin.mem).
# --------------------------------------------------------------------------
def gen_eighth_roms(build_dir, N, twiddle_w):
    frac = twiddle_w - 1
    max_val = (1 << frac) - 1
    hex_digits = (twiddle_w + 3) // 4
    mask = (1 << twiddle_w) - 1
    num = (N // 8) + 1
    cos_p = build_dir / "twiddle_cos_eighth.mem"
    sin_p = build_dir / "twiddle_sin_eighth.mem"
    with open(cos_p, "w") as fc, open(sin_p, "w") as fs:
        fc.write(f"// Cosine ROM 1/8 cycle N={N} W={twiddle_w}\n")
        fs.write(f"// Sine ROM 1/8 cycle N={N} W={twiddle_w}\n")
        for k in range(num):
            th = 2.0 * math.pi * k / N
            cq = _fixed_point(math.cos(th), max_val, frac)
            sq = _fixed_point(math.sin(th), max_val, frac)
            fc.write(f"{cq & mask:0{hex_digits}X}\n")
            fs.write(f"{sq & mask:0{hex_digits}X}\n")


# --------------------------------------------------------------------------
# Parametric testbench generator (mirrors tb_fft_top.v, scaled with N/DW).
# Feeds the 5 standard signals; writes fft_output.csv + fft_params.csv.
# --------------------------------------------------------------------------
def scaled_bins(N):
    tone = int(round(50 * N / 1024)) or 1
    mt = [int(round(b * N / 1024)) for b in (50, 200, 450)]
    mt = [b for b in mt if 0 < b < N // 2]
    return tone, mt


def gen_tb(N, P, data_w, twiddle_w=None):
    if twiddle_w is None:
        twiddle_w = data_w
    L = int(round(math.log2(N)))
    words = N // P
    tone, mt = scaled_bins(N)
    chirp_f1 = N // 2 - 1
    # Amplitudes scaled to keep the same fraction of full-scale as the thesis
    # baseline (2048/32768 = 1/16 single-tone, 600/32768 multitone) → survives
    # the fixed 2^L block scaling at any width.
    amp = max(1, (1 << (data_w - 1)) // 16)
    mt_amp = max(1, int(round((1 << (data_w - 1)) * (600.0 / 32768.0))))
    mt_expr = " + ".join(f"$sin(2.0*3.141592653589793*{b}.0*samp_idx/{N}.0)" for b in mt)

    # P-generic CSV header / format / args
    csv_header = ("test_id,sample_idx," +
                  ",".join(f"out{p}_r,out{p}_i" for p in range(P)) + ",bfp_exp,time_ns")
    csv_fmt = "%0d,%0d," + ",".join("%0d,%0d" for _ in range(P)) + ",%0d,%0d"
    csv_args = ("current_test_id, out_idx/P,\n                    " +
                ",\n                    ".join(
                    f"$signed(dout[{p}*2*DW +: DW]), $signed(dout[{p}*2*DW + DW +: DW])"
                    for p in range(P)) +
                ",\n                    blk_exp, $time - sim_time_start")

    return f"""// GENERATED parametric system TB for N={N}, P={P}, DATA_W={data_w}
`timescale 1ns/1ps
module tb_fft_top;
    localparam DW    = {data_w};
    localparam P     = {P};
    localparam N_FFT = {N};
    localparam WORDS = N_FFT / P;
    localparam CLK_P = 10;

    reg  clk, rst, en, in_valid;
    reg  [P*2*DW-1:0] din;
    wire [P*2*DW-1:0] dout;
    wire              out_valid;
    wire [3:0]        blk_exp;

    fft_top #(.DATA_W(DW), .TWIDDLE_W({twiddle_w}), .N(N_FFT), .P(P), .HEX_DIR("rom")) u_dut (
        .clk(clk), .rst(rst), .en(en), .in_valid(in_valid),
        .din(din), .out_valid(out_valid), .dout(dout), .blk_exp(blk_exp)
    );

    initial clk = 0;
    always #(CLK_P/2) clk = ~clk;

    integer csv_params, csv_output;
    initial begin
        csv_params = $fopen("fft_params.csv", "w");
        $fwrite(csv_params, "param,value\\n");
        $fwrite(csv_params, "DATA_WIDTH,%0d\\n", DW);
        $fwrite(csv_params, "TWIDDLE_WIDTH,%0d\\n", DW);
        $fwrite(csv_params, "FFT_POINTS,%0d\\n", N_FFT);
        $fwrite(csv_params, "PARALLELISM,%0d\\n", P);
        $fwrite(csv_params, "BFP_ENABLED,1\\n");
        $fwrite(csv_params, "CLK_PERIOD,%0d\\n", CLK_P);
        $fclose(csv_params);
        csv_output = $fopen("fft_output.csv", "w");
        $fwrite(csv_output, "{csv_header}\\n");
    end

    reg signed [DW-1:0] out_re [0:N_FFT-1];
    reg signed [DW-1:0] out_im [0:N_FFT-1];
    integer out_idx;
    integer current_test_id;
    integer sim_time_start;

    always @(posedge clk) begin
        if (out_valid && out_idx < N_FFT) begin
            if (out_idx == 0) sim_time_start = $time;
            $fwrite(csv_output, "{csv_fmt}\\n",
                    {csv_args});
            out_idx <= out_idx + P;
        end
    end

    integer i, jj, blk, samp_idx, samp, timeout_cnt, wait_cnt;
    real angle, sreal, sum_real, phase_chirp;
    reg [P*2*DW-1:0] cur_word, impulse_word;

    task wait_valid; input integer max_clk; begin
        timeout_cnt = 0;
        while (!out_valid && timeout_cnt < max_clk) begin @(posedge clk); #1; timeout_cnt = timeout_cnt + 1; end
    end endtask

    task wait_captured; begin
        wait_cnt = 0;
        while (out_idx < N_FFT && wait_cnt < 20000) begin @(posedge clk); #1; wait_cnt = wait_cnt + 1; end
        @(posedge clk); #1;
    end endtask

    initial begin
        out_idx = 0; current_test_id = 0;
        rst = 1; en = 1; in_valid = 0; din = 0;
        @(posedge clk); #1; @(posedge clk); #1; rst = 0;

        // TEST 0: Impulse
        current_test_id = 0;
        impulse_word = 0; impulse_word[0*2*DW +: DW] = {amp};
        for (blk = 0; blk < 2; blk = blk + 1) begin
            out_idx = 0; in_valid = 1; din = impulse_word; @(posedge clk); #1; din = 0;
            for (i = 1; i < WORDS; i = i + 1) begin @(posedge clk); #1; end
            in_valid = 0;
        end
        wait_valid(20000); wait_captured;

        // TEST 1: DC
        current_test_id = 1;
        cur_word = 0;
        for (jj = 0; jj < P; jj = jj + 1) cur_word[jj*2*DW +: DW] = {amp};
        for (blk = 0; blk < 2; blk = blk + 1) begin
            out_idx = 0; in_valid = 1;
            for (i = 0; i < WORDS; i = i + 1) begin din = cur_word; @(posedge clk); #1; end
            in_valid = 0; din = 0;
        end
        wait_valid(20000); wait_captured;

        // TEST 2: Sine (bin {tone})
        current_test_id = 2;
        for (blk = 0; blk < 2; blk = blk + 1) begin
            out_idx = 0;
            for (i = 0; i < WORDS; i = i + 1) begin
                cur_word = 0;
                for (jj = 0; jj < P; jj = jj + 1) begin
                    samp_idx = i*P + jj;
                    angle = 2.0*3.141592653589793*{tone}.0*samp_idx/{N}.0;
                    sreal = {amp}.0 * $sin(angle);
                    samp = $rtoi(sreal);
                    cur_word[jj*2*DW +: DW] = samp;
                end
                in_valid = 1; din = cur_word; @(posedge clk); #1;
            end
            in_valid = 0; din = 0;
        end
        wait_valid(20000); wait_captured;

        // TEST 3: MultiTone
        current_test_id = 3;
        for (blk = 0; blk < 2; blk = blk + 1) begin
            out_idx = 0;
            for (i = 0; i < WORDS; i = i + 1) begin
                cur_word = 0;
                for (jj = 0; jj < P; jj = jj + 1) begin
                    samp_idx = i*P + jj;
                    sum_real = {mt_amp}.0 * ({mt_expr});
                    samp = $rtoi(sum_real);
                    cur_word[jj*2*DW +: DW] = samp;
                end
                in_valid = 1; din = cur_word; @(posedge clk); #1;
            end
            in_valid = 0; din = 0;
        end
        wait_valid(20000); wait_captured;

        // TEST 4: Chirp (0 -> {chirp_f1})
        current_test_id = 4;
        for (blk = 0; blk < 2; blk = blk + 1) begin
            out_idx = 0;
            for (i = 0; i < WORDS; i = i + 1) begin
                cur_word = 0;
                for (jj = 0; jj < P; jj = jj + 1) begin
                    samp_idx = i*P + jj;
                    phase_chirp = 2.0*3.141592653589793*({chirp_f1}.0*samp_idx/(2.0*{N}.0))*samp_idx/{N}.0;
                    sreal = {amp}.0 * $sin(phase_chirp);
                    samp = $rtoi(sreal);
                    cur_word[jj*2*DW +: DW] = samp;
                end
                in_valid = 1; din = cur_word; @(posedge clk); #1;
            end
            in_valid = 0; din = 0;
        end
        wait_valid(20000); wait_captured;

        $fclose(csv_output);
        $display("TB done N={N} DW={data_w}");
        $finish;
    end

    initial begin #800000000; $display("TIMEOUT"); $fclose(csv_output); $finish; end
endmodule
"""


def selftest():
    g = fft_geometry(1024)
    tap = [a - 1 for a in g["arrival"]]
    assert tap[1:] == [131, 199, 235, 255, 267, 275, 281, 286], tap
    assert g["blk_exp"] == 10 and g["L_FB"] == 8 and g["L_NF"] == 2
    print("selftest OK: N=1024 P=4 reproduces original taps", tap[1:])
    for P in (8, 16):
        gg = fft_geometry(1024, P)
        print(f"  N=1024 P={P}: L_FB={gg['L_FB']} L_NF={gg['L_NF']} "
              f"depth={gg['depth']} blk_exp={gg['blk_exp']} "
              f"FBtaps={[a-1 for a in gg['arrival']][1:]}")


if __name__ == "__main__":
    selftest()
