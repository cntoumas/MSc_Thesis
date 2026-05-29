#!/usr/bin/env python3
"""
Serial FFT Processor — Artix-7 Synthesis & Verification Report
================================================================
Target : Xilinx Artix-7 xc7a100tcsg324-1
Synth  : synthesis/yosys_xc7.log (Yosys synth_xilinx output)
Sim    : tb/fft_axi_tb_xc7.v driving fft_axi_top through 5 test cases
         (Impulse / DC / Sine / MultiTone / Chirp), captures all 1024 bins
         via M_AXIS.

Usage (from project root):
    python scripts/thesis_report_xc7.py
"""
import os, re, sys, subprocess
from pathlib import Path

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec

# Force UTF-8 stdout/stderr so Unicode chars don't crash on Windows cp1253
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

SRC_DIR  = os.path.dirname(os.path.abspath(__file__))
PROJ_DIR = os.path.dirname(SRC_DIR)
REPO_ROOT = os.path.dirname(PROJ_DIR)
RTL_DIR  = os.path.join(PROJ_DIR, "rtl")
SYN_DIR  = os.path.join(PROJ_DIR, "synthesis")
RESULTS_DIR = os.path.join(REPO_ROOT, "results", "serial")

# Shared utilization renderer
sys.path.insert(0, os.path.join(REPO_ROOT, "common"))
import util_plots  # noqa: E402
YOSYS_LOG = os.path.join(SYN_DIR, "yosys_xc7.log")
MEM_RE   = os.path.join(PROJ_DIR, "stimulus_re.mem")
MEM_IM   = os.path.join(PROJ_DIR, "stimulus_im.mem")
HW_CSV   = os.path.join(PROJ_DIR, "hw_output.csv")
HW_EXP   = os.path.join(PROJ_DIR, "hw_exponent.txt")
OUT_PNG  = os.path.join(PROJ_DIR, "thesis_report_xc7.png")
SIM_BIN  = os.path.join(PROJ_DIR, "fft_axi_sim_xc7")
TB_FILE  = os.path.join("tb", "fft_axi_tb_xc7.v")

N, LOG2_N, DATA_WIDTH = 1024, 10, 16
CLK_MHZ = 100.0

# xc7a100tcsg324-1 device totals
DEV_LUT6   = 63_400
DEV_FF     = 126_800
DEV_DSP    = 240
DEV_BRAM36 = 135

DARK, PANEL, GRID = "#0d1117", "#161b22", "#21262d"
BLUE, GREEN, ORANGE, PURPLE, RED, TEAL, YELLOW = (
    "#58a6ff", "#3fb950", "#ffa657", "#d2a8ff", "#f78166", "#56d364", "#e3b341")
TEXT, SUBTEXT, TITLE = "#e6edf3", "#8b949e", "#79c0ff"


def write_mem(path, data, width=17):
    mask = (1 << width) - 1
    with open(path, 'w') as f:
        for v in data: f.write(f"{int(v) & mask:05X}\n")


def parse_xc7_log(path):
    cells = {}
    raw = Path(path).read_text(encoding="utf-8", errors="replace")
    for line in raw.splitlines():
        m = re.match(r'\s+(\w+)\s+(\d+)\s*$', line)
        if m:
            cells[m.group(1)] = int(m.group(2))
    luts = sum(cells.get(f"LUT{i}", 0) for i in range(1, 7))
    ffs  = sum(cells.get(k, 0) for k in ("FDRE", "FDSE", "FDCE", "FDPE"))
    bram36 = cells.get("RAMB36E1", 0) + cells.get("RAMB18E1", 0) * 0.5
    total = 0
    for line in raw.splitlines():
        m = re.search(r'Number of cells:\s+(\d+)', line)
        if m: total = int(m.group(1))
    return {
        "luts": luts, "ffs": ffs,
        "dsp": cells.get("DSP48E1", 0),
        "bram36": bram36,
        "bram18": cells.get("RAMB18E1", 0),
        "bram36_native": cells.get("RAMB36E1", 0),
        "carry4": cells.get("CARRY4", 0),
        "muxf7": cells.get("MUXF7", 0), "muxf8": cells.get("MUXF8", 0),
        "srl16": cells.get("SRL16E", 0),
        "lut_by_size": {i: cells.get(f"LUT{i}", 0) for i in range(1, 7)},
        "total_cells": total,
    }


def setup_iverilog():
    if os.path.exists(SIM_BIN):
        return
    rtl_files = sorted(
        os.path.join("rtl", f) for f in os.listdir(RTL_DIR) if f.endswith('.v')
    )
    cmd = ["iverilog", "-o", SIM_BIN, TB_FILE] + rtl_files
    r = subprocess.run(cmd, cwd=PROJ_DIR, capture_output=True, text=True)
    if r.returncode != 0:
        print("[ERROR] iverilog compile failed:\n", r.stderr); sys.exit(1)


def make_signal(kind):
    n = np.arange(N)
    if kind == "Impulse":
        re = np.zeros(N, dtype=np.int32); re[0] = 10000
        im = np.zeros(N, dtype=np.int32)
    elif kind == "DC":
        re = np.full(N, 10000, dtype=np.int32)
        im = np.zeros(N, dtype=np.int32)
    elif kind == "Sine":
        re = np.round(10000 * np.sin(2*np.pi*50*n/N)).astype(np.int32)
        im = np.zeros(N, dtype=np.int32)
    elif kind == "MultiTone":
        re = np.round(sum(3000*np.sin(2*np.pi*b*n/N) for b in (50,200,450))).astype(np.int32)
        im = np.zeros(N, dtype=np.int32)
    elif kind == "Chirp":
        phi = 2*np.pi*(511*n/(2*N))*n/N
        re = np.round(10000*np.sin(phi)).astype(np.int32)
        im = np.zeros(N, dtype=np.int32)
    return re, im


def run_sim(re_in, im_in):
    # AXI top expects natural-order input.
    write_mem(MEM_RE, re_in.astype(np.int32))
    write_mem(MEM_IM, im_in.astype(np.int32))
    subprocess.run(["vvp", SIM_BIN], cwd=PROJ_DIR,
                   capture_output=True, text=True, timeout=120)
    hw_re, hw_im = [], []
    with open(HW_CSV) as f:
        for line in f:
            parts = line.strip().split(',')
            if len(parts) != 2: continue
            def _safe(v):
                v = v.strip().lower()
                if 'x' in v or 'z' in v or not v: return 0
                try: return int(v)
                except ValueError: return 0
            hw_re.append(_safe(parts[0]))
            hw_im.append(_safe(parts[1]))
    exp = int(Path(HW_EXP).read_text().strip()) if os.path.exists(HW_EXP) else 0
    hw = (np.array(hw_re) + 1j*np.array(hw_im)) * (2.0**exp)
    return hw


def _optimal_alpha(hw, ref):
    """Least-squares complex scale α that minimises ||hw - α·ref||² ."""
    denom = np.sum(np.abs(ref)**2)
    if denom <= 0: return 0.0
    return np.sum(np.conj(ref) * hw) / denom


def compute_sqnr(hw, ref):
    """SQNR with twiddle sign convention fallback (Serial FFT core uses +j,
    numpy uses -j), and least-squares magnitude+phase alignment so a constant
    scale or sign flip doesn't depress the score."""
    if np.max(np.abs(hw)) == 0 or np.max(np.abs(ref)) == 0: return 0.0
    def _fit(r):
        alpha = _optimal_alpha(hw, r)
        rs = alpha * r
        sig = np.sum(np.abs(rs)**2)
        noise = np.sum(np.abs(hw - rs)**2)
        return 120.0 if noise <= 0 else 10.0 * np.log10(sig / noise)
    return max(_fit(ref), _fit(np.conj(ref)))


def fit_ref(hw, ref):
    """Pick the reference (ref or conj(ref)) closest to hw and apply the
    optimal complex scale α so it can be plotted alongside the hw spectrum."""
    if np.max(np.abs(hw)) == 0 or np.max(np.abs(ref)) == 0: return ref
    cands = [ref, np.conj(ref)]
    best_r, best_noise = None, np.inf
    for r in cands:
        alpha = _optimal_alpha(hw, r)
        rs = alpha * r
        noise = np.sum(np.abs(hw - rs)**2)
        if noise < best_noise:
            best_noise, best_r = noise, rs
    return best_r if best_r is not None else ref


def run_all_sims():
    print("[1/2] Running 5 AXI-driven sims (all bins via M_AXIS) ...")
    setup_iverilog()
    cases = ["Impulse", "DC", "Sine", "MultiTone", "Chirp"]
    spectra, sqnr, peak_match = {}, {}, {}
    for name in cases:
        re_in, im_in = make_signal(name)
        ref = np.fft.fft(re_in.astype(np.float64) + 1j*im_in.astype(np.float64))
        hw  = run_sim(re_in, im_in)
        spectra[name]    = (hw, ref)
        sqnr[name]       = compute_sqnr(hw, ref)
        peak_match[name] = (np.argmax(np.abs(hw)) == np.argmax(np.abs(ref)))
        flag = "OK " if peak_match[name] else "PK!"
        print(f"  {name:10s} : SQNR={sqnr[name]:7.2f} dB  {flag}")
    return spectra, sqnr, peak_match


def assemble_utilization(area, latency):
    """Consolidate the Yosys synth_xilinx parse into the normalized util dict
    shared with the parallel report and the co-simulation. Fmax requires
    Vivado P&R (Yosys synth only), so it is reported as N/A. Serial design has
    no power model."""
    return {
        "arch": "serial",
        "device": "xc7a100tcsg324-1",
        "LUT": area["luts"],
        "LUT_total": DEV_LUT6,
        "FF": area["ffs"],
        "FF_total": DEV_FF,
        "DSP": area["dsp"],
        "DSP_total": DEV_DSP,
        "BRAM": area["bram36"],
        "BRAM_total": DEV_BRAM36,
        "Fmax_MHz": None,
        "power_mW": None,
        "throughput_msps": None,
        "notes": "Yosys synth_xilinx only — Vivado required for Fmax. "
                 "Artix-7 xc7a100t; compare absolute counts across devices.",
    }


def parse_utilization():
    """Standalone entry: parse the Yosys xc7 log and return the normalized
    utilization dict (used by the co-simulation when importing this module)."""
    if not os.path.exists(YOSYS_LOG):
        raise SystemExit(f"[ERROR] {YOSYS_LOG} not found. Run: yosys synthesis/synth_xc7.ys")
    area = parse_xc7_log(YOSYS_LOG)
    return assemble_utilization(area, compute_latency())


def emit_utilization_artifacts(util):
    os.makedirs(RESULTS_DIR, exist_ok=True)
    util_plots.write_utilization_csv(util, os.path.join(RESULTS_DIR, "utilization.csv"))
    util_plots.render_utilization_png(
        util,
        "Serial Radix-2 DIF FFT — FPGA Utilization (Artix-7 xc7a100t)",
        os.path.join(RESULTS_DIR, "utilization.png"))


def compute_latency():
    butterflies_per_stage = N // 2
    drain_cnt    = 11
    cycles_stage = butterflies_per_stage + drain_cnt
    total_cycles = LOG2_N * cycles_stage
    clk_ns       = 1000.0 / CLK_MHZ
    return {
        "cycles_per_stage": cycles_stage,
        "total_cycles":     total_cycles,
        "latency_us":       round(total_cycles * clk_ns / 1000.0, 2),
        "throughput_kfps":  round(CLK_MHZ * 1e6 / total_cycles / 1e3, 2),
    }


def make_report(area, spectra, sqnr, peak_match, latency):
    print("[2/2] Building Artix-7 thesis figure ...")
    fig = plt.figure(figsize=(20, 14), facecolor=DARK)
    fig.suptitle(
        "Serial 1024-pt FFT Processor — Artix-7 Synthesis & Verification Report\n"
        f"Target: Xilinx Artix-7 xc7a100tcsg324-1  ·  N={N}  ·  {DATA_WIDTH}-bit BFP  "
        f"·  Single time-multiplexed butterfly  ·  AXI-Stream",
        fontsize=13, color=TITLE, fontweight='bold', y=0.995)

    gs = GridSpec(3, 4, figure=fig, hspace=0.50, wspace=0.40,
                  left=0.05, right=0.98, top=0.95, bottom=0.05)

    def panel(r, c, span=1):
        ax = fig.add_subplot(gs[r, c:c+span])
        ax.set_facecolor(PANEL)
        ax.tick_params(colors=TEXT, labelsize=8)
        for s in ax.spines.values(): s.set_edgecolor(GRID)
        ax.grid(True, color=GRID, linewidth=0.5, linestyle='--', alpha=0.6)
        return ax

    # A: Resource utilization (log)
    ax = panel(0, 0)
    res = [
        ("LUTs",       area["luts"],   DEV_LUT6,  BLUE),
        ("FFs",        area["ffs"],    DEV_FF,    GREEN),
        ("DSP48E1",    area["dsp"],    DEV_DSP,   ORANGE),
        ("BRAM36 eq.", area["bram36"], DEV_BRAM36, PURPLE),
    ]
    labels = [r[0] for r in res]
    used   = [r[1] for r in res]; total  = [r[2] for r in res]
    colors = [r[3] for r in res]
    x = np.arange(len(labels))
    ax.bar(x, total, color=GRID, width=0.55, label="Device total")
    bars = ax.bar(x, used, color=colors, width=0.55, alpha=0.9, label="Used")
    for b, u, t in zip(bars, used, total):
        pct = 100*u/t if t else 0
        ax.text(b.get_x()+b.get_width()/2, b.get_height()+max(total)*0.01,
                f"{int(u):,}\n({pct:.2f}%)", ha='center', va='bottom',
                fontsize=7, color=TEXT)
    ax.set_yscale("log")
    ax.set_xticks(x); ax.set_xticklabels(labels, fontsize=8, color=TEXT)
    ax.set_ylabel("Count (log scale)", color=TEXT, fontsize=8)
    ax.set_title("Resource Utilization — xc7a100t",
                 color=TITLE, fontsize=9, fontweight='bold')
    ax.legend(fontsize=7, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT, loc='lower right')

    # B: Cell-type donut
    ax = panel(0, 1)
    breakdown = [
        (f"LUT1–6\n({area['luts']:,})",     area["luts"],   BLUE),
        (f"FFs\n({area['ffs']:,})",         area["ffs"],    GREEN),
        (f"CARRY4\n({area['carry4']:,})",   area["carry4"], TEAL),
        (f"DSP48E1\n({area['dsp']})",       max(area["dsp"], 1), ORANGE),
        (f"BRAM18/36\n({area['bram18']+area['bram36_native']})",
            max(area['bram18']+area['bram36_native'], 1), PURPLE),
        (f"MUXF7/8\n({area['muxf7']+area['muxf8']})",
            max(area['muxf7']+area['muxf8'], 1), YELLOW),
        (f"SRL16E\n({area['srl16']})",      max(area['srl16'], 1), RED),
    ]
    ax.pie([b[1] for b in breakdown], labels=[b[0] for b in breakdown],
           colors=[b[2] for b in breakdown], startangle=90,
           textprops={'color': TEXT, 'fontsize': 7},
           wedgeprops={'edgecolor': DARK, 'linewidth': 1.5, 'width': 0.35})
    ax.set_title(f"Synthesized Cells ({area['total_cells']:,} total)",
                 color=TITLE, fontsize=9, fontweight='bold')

    # C: Timing & Performance table
    ax = panel(0, 2); ax.axis('off')
    rows = [
        ["Metric",                "Value"],
        ["Target part",           "xc7a100tcsg324-1"],
        ["Synth tool",            "Yosys 0.56 (synth_xilinx)"],
        ["P&R / Fmax",            "Requires Vivado*"],
        ["Target clock",          f"{CLK_MHZ:.0f} MHz"],
        ["FFT points (N)",        f"{N}"],
        ["log2 N (stages)",       f"{LOG2_N}"],
        ["Butterflies / stage",   f"{N//2:,}"],
        ["Cycles / stage",        f"{latency['cycles_per_stage']:,}"],
        ["Total compute cycles",  f"{latency['total_cycles']:,}"],
        ["Latency @ 100 MHz",     f"{latency['latency_us']} µs"],
        ["Throughput",            f"{latency['throughput_kfps']:.2f} k-FFT/s"],
        ["DSP48E1 instances",     f"{area['dsp']}"],
        ["BRAM18 / BRAM36",       f"{area['bram18']} / {area['bram36_native']}"],
        ["LUT utilisation",       f"{100*area['luts']/DEV_LUT6:.2f}%"],
        ["DSP utilisation",       f"{100*area['dsp']/DEV_DSP:.1f}%"],
    ]
    tbl = ax.table(cellText=rows[1:], colLabels=rows[0],
                   cellLoc='left', loc='center', bbox=[0,0,1,1])
    tbl.auto_set_font_size(False); tbl.set_fontsize(7.5)
    for (r, c), cell in tbl.get_celld().items():
        cell.set_facecolor(PANEL if r % 2 == 0 else "#1c2128")
        cell.set_text_props(color=TITLE if r == 0 else TEXT)
        cell.set_edgecolor(GRID)
    ax.set_title("Timing & Performance",
                 color=TITLE, fontsize=9, fontweight='bold')
    ax.text(0.5, -0.02,
            "* Yosys synth only — Vivado required for Fmax / bitstream",
            transform=ax.transAxes, fontsize=6, color=SUBTEXT,
            ha='center', style='italic')

    # D: SQNR per case
    ax = panel(0, 3)
    order = ["Impulse", "DC", "Sine", "MultiTone", "Chirp"]
    names = [n for n in order if n in sqnr]
    vals  = [sqnr[n] for n in names]
    bar_cols = [BLUE, GREEN, PURPLE, ORANGE, TEAL][:len(names)]
    bars = ax.bar(range(len(names)), vals, color=bar_cols, width=0.55, alpha=0.9)
    ax.axhline(6.02*DATA_WIDTH+1.76, color=RED, linewidth=1.2, linestyle='--',
               label=f"Ideal {6.02*DATA_WIDTH+1.76:.0f} dB")
    for b, v in zip(bars, vals):
        ax.text(b.get_x()+b.get_width()/2, b.get_height()+1,
                f"{v:.1f}", ha='center', va='bottom', fontsize=7.5, color=TEXT)
    ax.set_xticks(range(len(names)))
    ax.set_xticklabels(names, fontsize=7, color=TEXT, rotation=15, ha='right')
    ax.set_ylabel("SQNR (dB)", color=TEXT, fontsize=8)
    ax.set_title("SQNR by Test Case", color=TITLE, fontsize=9, fontweight='bold')
    ax.legend(fontsize=7, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT)
    flags = " ".join("OK" if peak_match.get(n, False) else "PK!" for n in names)
    ax.text(0.99, 0.02, "Peak: " + flags, transform=ax.transAxes,
            ha='right', va='bottom', fontsize=6.5, color=SUBTEXT, family='monospace')

    # Spectrum helper
    def draw_spec(ax, name, color, title, dr=100):
        if name not in spectra: return
        hw, ref = spectra[name]
        ref_aligned = fit_ref(hw, ref)
        half = N // 2
        bins = np.arange(half)
        hw_mag  = 20*np.log10(np.maximum(np.abs(hw[:half]),  1e-6))
        ref_mag = 20*np.log10(np.maximum(np.abs(ref_aligned[:half]), 1e-6))
        pk = np.max(hw_mag) if np.max(hw_mag) > -np.inf else 0
        # Auto-zoom for flat spectra (impulse): widen if dynamic range < 20 dB
        min_visible = np.min(hw_mag[hw_mag > pk - dr]) if (hw_mag > pk - dr).any() else pk - dr
        span = pk - min_visible
        floor = pk - 20 if span < 20 else pk - dr
        ax.fill_between(bins, hw_mag, floor, alpha=0.35, color=color)
        ax.plot(bins, ref_mag, color=RED,   linewidth=1.0, linestyle='--',
                alpha=0.85, label="Float64 reference")
        ax.plot(bins, hw_mag,  color=color, linewidth=1.4, label="Hardware (BFP)")
        ax.set_ylim(floor, pk + 5)
        ax.set_xlim(0, half - 1)
        ax.set_xlabel("Frequency Bin", color=TEXT, fontsize=7.5)
        ax.set_ylabel("Magnitude (dB)", color=TEXT, fontsize=7.5)
        ax.set_title(title, color=TITLE, fontsize=9, fontweight='bold')
        ax.legend(fontsize=7, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT,
                  loc="upper right")
        sq = sqnr.get(name, 0)
        ax.text(0.01, 0.96, f"SQNR = {sq:.1f} dB",
                transform=ax.transAxes, fontsize=8, color=YELLOW, va='top')

    draw_spec(panel(1, 0, span=2), "Impulse", BLUE,
              "Impulse Response — Hardware vs. Reference", dr=80)
    draw_spec(panel(1, 2, span=2), "DC", GREEN,
              "DC Input — Hardware vs. Reference", dr=100)
    draw_spec(panel(2, 0), "Sine", PURPLE,
              "Single-Tone Sine (bin 50)", dr=100)
    draw_spec(panel(2, 1), "MultiTone", ORANGE,
              "Multi-Tone (bins 50/200/450)", dr=100)
    draw_spec(panel(2, 2), "Chirp", TEAL,
              "Linear Chirp (0 → 511)", dr=80)

    # Synthesis + verification summary
    ax = panel(2, 3); ax.axis('off')
    summary = (
        f"SERIAL FFT · ARTIX-7\n"
        f"{'─'*32}\n"
        f"Tool   : Yosys 0.56 synth_xilinx\n"
        f"Family : xc7 (Artix-7)\n"
        f"Part   : xc7a100tcsg324-1\n\n"
        f"Yosys cells:\n"
        f"  LUTs (1–6)  : {area['luts']:>6,}\n"
        f"  FFs         : {area['ffs']:>6,}\n"
        f"  DSP48E1     : {area['dsp']:>6}\n"
        f"  RAMB18/36   : {area['bram18']}/{area['bram36_native']:<3}\n"
        f"  CARRY4      : {area['carry4']:>6,}\n"
        f"  SRL16E      : {area['srl16']:>6}\n"
        f"  Total cells : {area['total_cells']:>6,}\n\n"
        f"Verification:\n"
        f"  AXI-Stream TB (fft_axi_tb_xc7\n"
        f"  .v) streams all 1024 bins\n"
        f"  via M_AXIS. fft_axi_top\n"
        f"  patched to bit-reverse the\n"
        f"  preload (DIT input order)\n"
        f"  and read out naturally.\n\n"
        f"Tests passed: {sum(1 for v in peak_match.values() if v)}/{len(peak_match)}\n"
    )
    ax.text(0.02, 0.98, summary, transform=ax.transAxes,
            fontsize=7.5, color=TEXT, va='top', family='monospace',
            bbox=dict(boxstyle="round,pad=0.5", facecolor=DARK,
                      edgecolor=GRID, alpha=0.9))
    ax.set_title("Synthesis & Verification Summary",
                 color=TITLE, fontsize=9, fontweight='bold')

    fig.savefig(OUT_PNG, dpi=150, bbox_inches='tight', facecolor=DARK)
    print(f"[+] Saved -> {OUT_PNG}")


def main():
    print("=" * 64)
    print("  Serial FFT — Artix-7 (xc7a100t) Thesis Report")
    print("=" * 64)

    if not os.path.exists(YOSYS_LOG):
        raise SystemExit(f"[ERROR] {YOSYS_LOG} not found. Run: yosys synthesis/synth_xc7.ys")

    area = parse_xc7_log(YOSYS_LOG)
    print(f"  LUTs (1–6)      : {area['luts']:>7,}  ({100*area['luts']/DEV_LUT6:.2f}% of {DEV_LUT6:,})")
    print(f"  FFs             : {area['ffs']:>7,}  ({100*area['ffs']/DEV_FF:.2f}% of {DEV_FF:,})")
    print(f"  DSP48E1         : {area['dsp']:>7}  ({100*area['dsp']/DEV_DSP:.1f}% of {DEV_DSP})")
    print(f"  BRAM18 / BRAM36 : {area['bram18']:>3} / {area['bram36_native']:<3}  (BRAM36 eq. = {area['bram36']:.1f})")
    print(f"  Total cells     : {area['total_cells']:>7,}")

    spectra, sqnr, peak_match = run_all_sims()
    latency = compute_latency()
    make_report(area, spectra, sqnr, peak_match, latency)

    # Standalone utilization artifacts (results/serial/)
    print("[+] Writing standalone utilization artifacts ...")
    emit_utilization_artifacts(assemble_utilization(area, latency))
    print("[OK] Artix-7 thesis report complete.")


if __name__ == "__main__":
    main()
