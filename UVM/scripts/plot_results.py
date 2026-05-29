#!/usr/bin/env python3
"""
plot_results.py — produce regression_summary.png and coverage_summary.png
from the per-test xsim log files in cov_db/.

Usage:
    python scripts/plot_results.py   # writes both PNGs to UVM/ root

The script re-runs each test once (via the Makefile) to capture both the
SQNR scoreboard lines AND the functional-coverage sample lines emitted by
fft_coverage.sv. Re-using the existing run_regression.py outputs would
require restructuring; this is simpler and just as fast (~30 s).
"""
import sys
import re
import subprocess
from pathlib import Path

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

# Force UTF-8 stdout
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

UVM_DIR = Path(__file__).resolve().parent.parent
OUT_REGRESSION = UVM_DIR / "regression_summary.png"
OUT_COVERAGE   = UVM_DIR / "coverage_summary.png"

TESTS = [
    ("fft_impulse_test",   "Impulse"),
    ("fft_dc_test",        "DC"),
    ("fft_sine_test",      "Sine"),
    ("fft_multitone_test", "MultiTone"),
    ("fft_chirp_test",     "Chirp"),
]
DUTS  = ("serial", "parallel")

# Regexes for the scoreboard + coverage lines
SCORE_RE = re.compile(
    r"\[(?P<label>\w+)\]\s+(?P<verdict>PASS|FAIL)\s*:\s*SQNR\s*=\s*"
    r"(?P<sqnr>-?[\d.]+|-inf|nan)\s*dB\s*"
    r"\(threshold\s+(?P<thresh>[\d.]+),\s*BFP\s+exp=(?P<bfp>-?\d+)\)"
)
COV_RE = re.compile(
    r"sampled:\s+signal=(?P<signal>\w+)\s+amp=(?P<amp>\d+)\s+"
    r"bfp_exp=(?P<bfp>-?\d+)\s+peak_bin=(?P<peak>\d+)"
)

# Dark theme palette matching the existing thesis_report PNGs
DARK    = "#0d1117"
PANEL   = "#161b22"
GRID    = "#21262d"
TEXT    = "#e6edf3"
TITLE   = "#79c0ff"
BLUE    = "#58a6ff"
GREEN   = "#3fb950"
ORANGE  = "#ffa657"
PURPLE  = "#d2a8ff"
RED     = "#f78166"
YELLOW  = "#e3b341"
TEAL    = "#56d364"


def run_one(dut: str, uvm_test: str) -> dict:
    """Run a single sim, parse log."""
    cmd = ["make", dut, f"UVM_TESTNAME={uvm_test}"]
    print(f"  → {' '.join(cmd)}")
    proc = subprocess.run(cmd, cwd=UVM_DIR, capture_output=True,
                          encoding="utf-8", errors="replace", timeout=600)
    out = (proc.stdout or "") + (proc.stderr or "")
    res = {"verdict": "ERROR", "sqnr": None, "bfp": None,
           "signal": None, "amp": None, "peak": None}
    m = SCORE_RE.search(out)
    if m:
        res["verdict"] = m.group("verdict")
        res["sqnr"]    = float(m.group("sqnr")) if m.group("sqnr") not in ("-inf", "nan") else None
        res["bfp"]     = int(m.group("bfp"))
    m = COV_RE.search(out)
    if m:
        res["signal"] = m.group("signal")
        res["amp"]    = int(m.group("amp"))
        res["peak"]   = int(m.group("peak"))
    return res


def collect_all() -> dict:
    """Returns {(dut, label): result_dict}."""
    all_results = {}
    for dut in DUTS:
        print(f"\n===== {dut.upper()} regression =====")
        for uvm_test, label in TESTS:
            r = run_one(dut, uvm_test)
            all_results[(dut, label)] = r
    return all_results


def panel(fig, *args):
    """Wrap fig.add_subplot with our dark-theme styling."""
    ax = fig.add_subplot(*args)
    ax.set_facecolor(PANEL)
    ax.tick_params(colors=TEXT, labelsize=9)
    for s in ax.spines.values(): s.set_edgecolor(GRID)
    ax.grid(True, color=GRID, linewidth=0.6, linestyle='--', alpha=0.7)
    return ax


def plot_regression_summary(results: dict):
    fig = plt.figure(figsize=(14, 7), facecolor=DARK)
    fig.suptitle("UVM Verification Regression — SQNR per Test × DUT",
                 fontsize=15, color=TITLE, fontweight='bold', y=0.97)
    ax = panel(fig, 1, 1, 1)

    labels   = [l for _, l in TESTS]
    serial   = [results[("serial",   l)]["sqnr"]   or 0 for l in labels]
    parallel = [results[("parallel", l)]["sqnr"]   or 0 for l in labels]
    x = np.arange(len(labels))
    width = 0.36

    bs = ax.bar(x - width/2, serial,   width, color=BLUE,  label="Serial",   alpha=0.9)
    bp = ax.bar(x + width/2, parallel, width, color=GREEN, label="Parallel", alpha=0.9)

    # Verdict annotations on top of each bar
    for bars, dut in ((bs, "serial"), (bp, "parallel")):
        for bar, lbl in zip(bars, labels):
            r = results[(dut, lbl)]
            colour = TEAL if r["verdict"] == "PASS" else RED
            ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 2,
                    f"{r['sqnr']:.1f}\n{r['verdict']}", ha='center', va='bottom',
                    fontsize=8, color=colour, fontweight='bold')

    # Ideal 16-bit SQNR reference line
    ideal = 6.02*16 + 1.76
    ax.axhline(ideal, color=YELLOW, linewidth=1.2, linestyle='--',
               label=f"Ideal 16-bit ({ideal:.0f} dB)")
    ax.set_xticks(x); ax.set_xticklabels(labels, color=TEXT, fontsize=10)
    ax.set_ylabel("SQNR (dB)", color=TEXT, fontsize=11)
    ax.set_ylim(0, max(max(serial), max(parallel), ideal) + 20)
    ax.legend(fontsize=10, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT,
              loc='upper right')

    # Compact result table inset (bottom left)
    n_pass = sum(1 for r in results.values() if r["verdict"] == "PASS")
    n_total = len(results)
    tbl_text = f"Overall: {n_pass}/{n_total} PASS"
    ax.text(0.01, 0.98, tbl_text, transform=ax.transAxes,
            fontsize=12, color=TEAL if n_pass == n_total else RED,
            va='top', fontweight='bold',
            bbox=dict(boxstyle="round,pad=0.4", facecolor=DARK,
                      edgecolor=GRID, alpha=0.9))

    fig.savefig(OUT_REGRESSION, dpi=150, bbox_inches='tight', facecolor=DARK)
    print(f"[+] Saved -> {OUT_REGRESSION}")


def plot_coverage_summary(results: dict):
    """Aggregate sampled (signal, peak, bfp) across all 10 runs and show
    the functional-coverage hit map as a 5×4 heatmap (signal × peak bucket)."""
    fig = plt.figure(figsize=(14, 7), facecolor=DARK)
    fig.suptitle("Functional Coverage — Signal × Peak-Bin Quadrant",
                 fontsize=15, color=TITLE, fontweight='bold', y=0.97)

    # Two panels side by side
    ax1 = fig.add_subplot(1, 2, 1)
    ax2 = fig.add_subplot(1, 2, 2)
    for ax in (ax1, ax2):
        ax.set_facecolor(PANEL)
        ax.tick_params(colors=TEXT, labelsize=9)
        for s in ax.spines.values(): s.set_edgecolor(GRID)

    # Panel 1 — signal × peak-quadrant heatmap (5 signals × 4 quadrants = 20 bins)
    SIGNAL_NAMES = ["Impulse", "DC", "Sine", "MultiTone", "Chirp"]
    QUADRANTS    = ["bin 0-255", "bin 256-511", "bin 512-767", "bin 768-1023"]
    # Cells marked here are flagged ignore_bins in fft_coverage.sv — physically
    # unreachable for the canonical stimulus, so they're excluded from the
    # coverage % calc. Display them hatched/grey instead of contributing to
    # the colour scale.
    IGNORED = {
        ("Impulse",   1), ("Impulse",   2), ("Impulse",   3),
        ("DC",        1), ("DC",        2), ("DC",        3),
        ("Sine",      1), ("Sine",      2), ("Sine",      3),
        ("MultiTone", 2), ("MultiTone", 3),
    }
    grid = np.zeros((5, 4), dtype=int)
    for (dut, lbl), r in results.items():
        if r["peak"] is None: continue
        sig_idx = SIGNAL_NAMES.index(lbl)
        quad    = min(r["peak"] // 256, 3)
        grid[sig_idx][quad] += 1

    # Mask ignored cells for the colormap so they don't skew the scale
    masked = np.ma.masked_where(
        np.array([[(SIGNAL_NAMES[i], j) in IGNORED for j in range(4)]
                  for i in range(5)]),
        grid)
    cmap = plt.cm.viridis.copy()
    cmap.set_bad(color=GRID)
    im = ax1.imshow(masked, aspect='auto', cmap=cmap)
    ax1.set_xticks(range(4)); ax1.set_xticklabels(QUADRANTS, color=TEXT, rotation=20, ha='right')
    ax1.set_yticks(range(5)); ax1.set_yticklabels(SIGNAL_NAMES, color=TEXT)
    ax1.set_title("Cross-coverage hit count (ignore_bins shaded)",
                  color=TITLE, fontsize=11, fontweight='bold')
    for i in range(5):
        for j in range(4):
            if (SIGNAL_NAMES[i], j) in IGNORED:
                ax1.text(j, i, "—", ha='center', va='center',
                         color=TEXT, fontsize=10, alpha=0.5)
            else:
                ax1.text(j, i, grid[i][j], ha='center', va='center',
                         color=TEXT, fontsize=10, fontweight='bold')

    # Panel 2 — BFP exponent distribution per DUT
    bfp_serial   = [r["bfp"] for k, r in results.items()
                    if k[0] == "serial"   and r["bfp"] is not None]
    bfp_parallel = [r["bfp"] for k, r in results.items()
                    if k[0] == "parallel" and r["bfp"] is not None]

    bins = np.arange(-3, 12) - 0.5
    ax2.hist(bfp_serial,   bins=bins, color=BLUE,  alpha=0.8, label="Serial",   edgecolor=DARK)
    ax2.hist(bfp_parallel, bins=bins, color=GREEN, alpha=0.8, label="Parallel", edgecolor=DARK,
             bottom=np.histogram(bfp_serial, bins=bins)[0])
    ax2.set_xlabel("BFP exponent (m_axis_tuser)", color=TEXT, fontsize=11)
    ax2.set_ylabel("Tests at this exponent",       color=TEXT, fontsize=11)
    ax2.set_title("BFP exponent distribution",     color=TITLE, fontsize=11, fontweight='bold')
    ax2.grid(True, color=GRID, linewidth=0.5, linestyle='--', alpha=0.6)
    ax2.legend(fontsize=10, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT)

    # Overall coverage summary text — counts only reachable cells
    reachable_total = 5 * 4 - len(IGNORED)
    reachable_hits  = sum(1 for i in range(5) for j in range(4)
                          if (SIGNAL_NAMES[i], j) not in IGNORED and grid[i][j] > 0)
    fc_pct = 100.0 * reachable_hits / reachable_total
    raw_total = 5 * 4
    raw_hits  = (grid > 0).sum()
    fig.text(0.5, 0.03,
             f"Reachable coverage: {reachable_hits}/{reachable_total} = {fc_pct:.1f} %  "
             f"(raw {raw_hits}/{raw_total}; {len(IGNORED)} cells ignored as unreachable)",
             ha='center', color=TEAL if fc_pct == 100 else YELLOW, fontsize=11,
             fontweight='bold')

    fig.savefig(OUT_COVERAGE, dpi=150, bbox_inches='tight', facecolor=DARK)
    print(f"[+] Saved -> {OUT_COVERAGE}")


def main():
    results = collect_all()
    plot_regression_summary(results)
    plot_coverage_summary(results)
    print("\n[OK] Plots written.")


if __name__ == "__main__":
    main()
