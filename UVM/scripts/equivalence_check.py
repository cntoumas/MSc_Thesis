#!/usr/bin/env python3
"""
equivalence_check.py — directly compare the Serial and Parallel DUT outputs
against each other (not just against the NumPy reference).

For each of the 5 canonical tests, this script:
  1. Re-runs `make serial` and `make parallel` to refresh the actuals dumps
     in actuals/<dut>_<test>.txt.
  2. Loads both arrays of (re, im) per bin.
  3. Aligns the two outputs across (a) sign convention (+j vs -j twiddle)
     and (b) the optimal complex scalar α that best fits one to the other.
  4. Reports SQNR_serial_vs_parallel per test — a direct architectural
     equivalence metric.
  5. Renders equivalence_summary.png — bar chart + per-test error overlay.

A PASS verdict here means *both DUTs produce the same FFT up to a complex
scalar*. That's a stronger statement than "both match NumPy within X dB",
because it cross-checks the two implementations against each other.

Usage:
    python scripts/equivalence_check.py            # full re-run + plot
    python scripts/equivalence_check.py --no-run   # just re-plot from existing
"""
import sys
import re
import subprocess
import argparse
from pathlib import Path

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

UVM_DIR     = Path(__file__).resolve().parent.parent
ACTUALS_DIR = UVM_DIR / "actuals"
OUT_PNG     = UVM_DIR / "equivalence_summary.png"

TESTS = [
    ("fft_impulse_test",   "Impulse"),
    ("fft_dc_test",        "DC"),
    ("fft_sine_test",      "Sine"),
    ("fft_multitone_test", "MultiTone"),
    ("fft_chirp_test",     "Chirp"),
]

# Equivalence threshold (dB): below this we flag the two DUTs as divergent.
EQUIV_THRESHOLD_DB = 40.0

# Dark theme palette
DARK, PANEL, GRID, TEXT, TITLE = "#0d1117", "#161b22", "#21262d", "#e6edf3", "#79c0ff"
BLUE, GREEN, ORANGE, RED, TEAL = "#58a6ff", "#3fb950", "#ffa657", "#f78166", "#56d364"
YELLOW, PURPLE = "#e3b341", "#d2a8ff"

HEADER_RE = re.compile(
    r"#\s*dut=(?P<dut>\w+)\s+test=(?P<test>\w+)\s+bfp_exp=(?P<bfp>-?\d+)\s+"
    r"sqnr=(?P<sqnr>-?[\d.]+)\s+verdict=(?P<verdict>\w+)"
)


def load_actuals(path: Path):
    """Return (re, im, header_dict) — both arrays length 1024."""
    re_arr = np.zeros(1024, dtype=np.float64)
    im_arr = np.zeros(1024, dtype=np.float64)
    header = {}
    with path.open("r") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            if line.startswith("#"):
                m = HEADER_RE.match(line)
                if m:
                    header = m.groupdict()
                continue
            parts = line.split()
            if len(parts) != 3:
                continue
            bin_idx = int(parts[0])
            re_arr[bin_idx] = float(parts[1])
            im_arr[bin_idx] = float(parts[2])
    return re_arr, im_arr, header


def optimal_alpha_sqnr(act_re, act_im, ref_re, ref_im):
    """Find α ∈ ℂ minimising ||act - α·ref||² and return SQNR (dB).
    α = <act, ref*> / <ref, ref>"""
    a = act_re + 1j * act_im
    r = ref_re + 1j * ref_im
    den = np.sum(np.abs(r) ** 2)
    if den <= 0:
        return -np.inf, 0+0j
    alpha = np.sum(a * np.conj(r)) / den
    fit   = alpha * r
    sig   = np.sum(np.abs(fit) ** 2)
    noise = np.sum(np.abs(a - fit) ** 2)
    if noise <= 0:
        return 120.0, alpha
    return 10.0 * np.log10(sig / noise), alpha


def best_sqnr_two_conventions(serial_re, serial_im, par_re, par_im):
    """Try parallel vs serial, and parallel vs conj(serial). Return the
    better SQNR plus a flag of which convention won."""
    s1, a1 = optimal_alpha_sqnr(par_re, par_im, serial_re,  serial_im)
    s2, a2 = optimal_alpha_sqnr(par_re, par_im, serial_re, -serial_im)
    if s1 >= s2:
        return s1, a1, "direct"
    return s2, a2, "conj"


def run_dut_test(dut: str, uvm_test: str):
    cmd = ["make", dut, f"UVM_TESTNAME={uvm_test}"]
    print(f"  → {' '.join(cmd)}")
    proc = subprocess.run(cmd, cwd=UVM_DIR, capture_output=True,
                          encoding="utf-8", errors="replace", timeout=600)
    if proc.returncode != 0:
        sys.stderr.write(f"[warn] {dut}/{uvm_test} exit {proc.returncode}\n")
    return proc


def collect_all(skip_run: bool):
    if not skip_run:
        ACTUALS_DIR.mkdir(parents=True, exist_ok=True)
        for dut in ("serial", "parallel"):
            print(f"\n===== {dut.upper()} =====")
            for uvm_test, _ in TESTS:
                run_dut_test(dut, uvm_test)

    results = []
    for uvm_test, label in TESTS:
        ser_path = ACTUALS_DIR / f"serial_{label}.txt"
        par_path = ACTUALS_DIR / f"parallel_{label}.txt"
        if not ser_path.exists() or not par_path.exists():
            print(f"[skip] {label}: missing dump files "
                  f"(serial={ser_path.exists()}, parallel={par_path.exists()})")
            results.append({"label": label, "sqnr": None})
            continue
        sr_re, sr_im, sr_hdr = load_actuals(ser_path)
        pr_re, pr_im, pr_hdr = load_actuals(par_path)
        sqnr, alpha, conv = best_sqnr_two_conventions(sr_re, sr_im, pr_re, pr_im)
        verdict = "EQUIV" if sqnr >= EQUIV_THRESHOLD_DB else "DIVERG"
        print(f"  {label:<10}  Serial vs Parallel: {sqnr:6.2f} dB  "
              f"(α={alpha:.3g}, conv={conv})  {verdict}")
        results.append({
            "label": label, "sqnr": sqnr, "alpha": alpha, "conv": conv,
            "verdict": verdict,
            "serial_re": sr_re, "serial_im": sr_im,
            "parallel_re": pr_re, "parallel_im": pr_im,
        })
    return results


def plot_summary(results):
    fig = plt.figure(figsize=(14, 7), facecolor=DARK)
    fig.suptitle("Serial vs Parallel — Architectural Equivalence Check",
                 fontsize=15, color=TITLE, fontweight='bold', y=0.97)

    # Left panel — SQNR bar chart
    ax1 = fig.add_subplot(1, 2, 1)
    ax1.set_facecolor(PANEL); ax1.tick_params(colors=TEXT, labelsize=9)
    for s in ax1.spines.values(): s.set_edgecolor(GRID)
    ax1.grid(True, color=GRID, linewidth=0.6, linestyle='--', alpha=0.7)

    labels = [r["label"] for r in results]
    sqnrs  = [r["sqnr"] if r["sqnr"] is not None else 0 for r in results]
    colors = [TEAL if r.get("verdict") == "EQUIV" else RED for r in results]
    bars = ax1.bar(labels, sqnrs, color=colors, alpha=0.9, edgecolor=DARK)
    ax1.axhline(EQUIV_THRESHOLD_DB, color=YELLOW, linestyle='--', linewidth=1.2,
                label=f"Equivalence threshold ({EQUIV_THRESHOLD_DB:.0f} dB)")
    for bar, r in zip(bars, results):
        if r["sqnr"] is None: continue
        ax1.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 1,
                 f"{r['sqnr']:.1f}\n{r['verdict']}",
                 ha='center', va='bottom', fontsize=9,
                 color=TEAL if r["verdict"] == "EQUIV" else RED,
                 fontweight='bold')
    ax1.set_ylabel("SQNR (Parallel vs Serial), dB", color=TEXT, fontsize=11)
    ax1.set_title("Per-test equivalence SQNR",
                  color=TITLE, fontsize=12, fontweight='bold')
    ax1.set_ylim(0, max(sqnrs + [EQUIV_THRESHOLD_DB]) + 25)
    ax1.legend(fontsize=9, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT,
               loc='upper right')

    # Right panel — per-bin magnitude overlay for the worst-equiv test
    ax2 = fig.add_subplot(1, 2, 2)
    ax2.set_facecolor(PANEL); ax2.tick_params(colors=TEXT, labelsize=9)
    for s in ax2.spines.values(): s.set_edgecolor(GRID)
    ax2.grid(True, color=GRID, linewidth=0.6, linestyle='--', alpha=0.7)

    valid = [r for r in results if r["sqnr"] is not None]
    if valid:
        worst = min(valid, key=lambda r: r["sqnr"])
        sr = np.sqrt(worst["serial_re"]**2   + worst["serial_im"]**2)
        pr = np.sqrt(worst["parallel_re"]**2 + worst["parallel_im"]**2)
        # Normalize each so the shape comparison is visible
        sr_n = sr / (sr.max() + 1e-9)
        pr_n = pr / (pr.max() + 1e-9)
        ax2.plot(sr_n, color=BLUE,  linewidth=1.0, alpha=0.85, label="Serial |X[k]|")
        ax2.plot(pr_n, color=GREEN, linewidth=1.0, alpha=0.85, label="Parallel |X[k]|")
        ax2.set_xlabel("Bin index", color=TEXT, fontsize=11)
        ax2.set_ylabel("Normalised |X[k]|", color=TEXT, fontsize=11)
        ax2.set_title(f"Worst-equiv test: {worst['label']} "
                      f"({worst['sqnr']:.1f} dB)",
                      color=TITLE, fontsize=12, fontweight='bold')
        ax2.set_xlim(0, 1023)
        ax2.legend(fontsize=10, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT)

    # Footer summary
    n_equiv = sum(1 for r in valid if r["verdict"] == "EQUIV")
    summary = f"{n_equiv}/{len(valid)} tests pass Serial≡Parallel equivalence"
    fig.text(0.5, 0.03, summary, ha='center',
             color=TEAL if n_equiv == len(valid) else YELLOW,
             fontsize=12, fontweight='bold')

    fig.savefig(OUT_PNG, dpi=150, bbox_inches='tight', facecolor=DARK)
    print(f"\n[+] Saved → {OUT_PNG}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--no-run", action="store_true",
                    help="Don't re-run xsim; just plot from existing actuals/")
    args = ap.parse_args()

    results = collect_all(skip_run=args.no_run)
    plot_summary(results)

    # Console summary table
    print("\n" + "="*60)
    print(f"{'Test':<12}  {'SQNR (dB)':>10}  {'Verdict':<8}  {'Conv':<6}")
    print("-"*60)
    for r in results:
        s = f"{r['sqnr']:.2f}" if r["sqnr"] is not None else "  N/A"
        v = r.get("verdict", "MISS")
        c = r.get("conv", "-")
        print(f"  {r['label']:<10}  {s:>10}  {v:<8}  {c:<6}")
    print("="*60)


if __name__ == "__main__":
    main()
