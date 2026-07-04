#!/usr/bin/env python3
"""
cosim/cosim_compare.py — serial vs parallel MDF cross-architecture co-sim
=========================================================================
Runs at the repo root and **invokes both simulators itself**, then produces a
single head-to-head comparison driven by the *identical* DSP math
(``common.dsp_metrics``) on both architectures' reconstructed spectra.

Flow
----
1. Subprocess-run ``fft_verify_serial.py`` then ``fft_verify.py``. Each
   compiles with iverilog, runs vvp, and writes
   ``results/<arch>/spectrum.npz`` + ``metrics.csv``.
2. Subprocess-run ``thesis_report_xc7.py`` (serial) and ``thesis_report.py``
   (parallel) to produce both ``results/<arch>/utilization.csv``.
3. Load both ``spectrum.npz`` and run the **identical** metric functions on
   each — guaranteeing the comparison uses one math path.
4. Emit ``results/comparison/comparison.csv`` and ``comparison.png``:
     * DSP block — grouped bars for SQNR/SFDR/ENOB/THD plus overlaid per-bin
       phase-error stems (serial vs parallel) on the Sine case.
     * Utilization block — grouped bars LUT/FF/DSP/BRAM (absolute counts, with
       %-of-device labelled per device) and Fmax / throughput.

CLI
---
  --skip-run        reuse existing npz/csv instead of re-simulating
  --results-dir DIR results root (default: <repo>/results)

DSP review caveats surfaced in the output
------------------------------------------
  * Device mismatch: the serial report targets xc7a100t while the parallel
    report parses iCE40HX8K, yet the README claims Artix-7 for both. The
    utilization comparison therefore uses **absolute counts** as the primary
    axis and labels each design's device for the %-of-device figures.
  * A constant/linear phase offset between the NumPy reference ordering and the
    DIF hardware ordering is expected; detrended phase RMS isolates the
    intrinsic precision loss.
"""
import argparse
import csv
import os
import subprocess
import sys

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
sys.path.insert(0, os.path.join(REPO_ROOT, "common"))
import dsp_metrics as dsp  # noqa: E402

SERIAL_DIR = os.path.join(REPO_ROOT, "Serial FFT processor")
PARALLEL_DIR = os.path.join(REPO_ROOT, "Parallel MDF FFT")

SERIAL_VERIFY = os.path.join(SERIAL_DIR, "scripts", "fft_verify_serial.py")
PARALLEL_VERIFY = os.path.join(PARALLEL_DIR, "scripts", "fft_verify.py")
SERIAL_UTIL = os.path.join(SERIAL_DIR, "scripts", "thesis_report_xc7.py")
PARALLEL_UTIL = os.path.join(PARALLEL_DIR, "scripts", "thesis_report.py")

# GitHub-dark palette
DARK = "#0d1117"
PANEL = "#161b22"
GRID = "#21262d"
BLUE = "#58a6ff"
GREEN = "#3fb950"
ORANGE = "#f0883e"
PURPLE = "#d2a8ff"
RED = "#f85149"
YELLOW = "#e3b341"
TEXT = "#c9d1d9"
TITLE = "#58a6ff"

SERIAL_COLOR = BLUE
PARALLEL_COLOR = ORANGE


# ---------------------------------------------------------------------------
# Step 1+2: run sub-simulations / reports
# ---------------------------------------------------------------------------
def _run(script, cwd, label):
    print(f"\n>>> {label}: {os.path.relpath(script, REPO_ROOT)}")
    r = subprocess.run([sys.executable, script], cwd=cwd)
    if r.returncode != 0:
        print(f"  [WARN] {label} exited with code {r.returncode}; "
              f"continuing with any artifacts already written.")
        return False
    return True


def run_all():
    print("=" * 64)
    print("  Co-simulation: invoking both simulators + utilization reports")
    print("=" * 64)
    _run(SERIAL_VERIFY, SERIAL_DIR, "Serial verification")
    _run(PARALLEL_VERIFY, PARALLEL_DIR, "Parallel verification")
    _run(SERIAL_UTIL, SERIAL_DIR, "Serial utilization report")
    _run(PARALLEL_UTIL, PARALLEL_DIR, "Parallel utilization report")


# ---------------------------------------------------------------------------
# Step 3: load spectra + recompute identical metrics
# ---------------------------------------------------------------------------
def load_spectra(npz_path):
    if not os.path.exists(npz_path):
        print(f"  [WARN] missing {npz_path}")
        return None
    data = np.load(npz_path, allow_pickle=True)
    tids = [int(t) for t in data["test_ids"]]
    names = [str(n) for n in data["names"]]
    sine_tid = int(data["sine_tid"])
    tone_bin = int(data["tone_bin"])
    spectra = {}
    for tid, name in zip(tids, names):
        spectra[tid] = {
            "name": name,
            "hw": data[f"hw_{tid}"],
            "ref": data[f"ref_{tid}"],
        }
    return {"spectra": spectra, "sine_tid": sine_tid, "tone_bin": tone_bin}


def metrics_from_spectra(loaded):
    """Recompute metrics for every test via the shared module (one math path)."""
    if loaded is None:
        return {}
    out = {}
    sine_tid = loaded["sine_tid"]
    tone_bin = loaded["tone_bin"]
    for tid, s in loaded["spectra"].items():
        single = (tid == sine_tid)
        tm = dsp.tone_metrics(s["ref"], s["hw"],
                              tone_bin if single else None, single_tone=single)
        tm["name"] = s["name"]
        out[s["name"]] = tm
    return out


# ---------------------------------------------------------------------------
# Utilization CSV reader (flat schema written by common/util_plots.py)
# ---------------------------------------------------------------------------
def load_utilization(csv_path):
    if not os.path.exists(csv_path):
        print(f"  [WARN] missing {csv_path}")
        return None
    util = {}
    with open(csv_path, newline="") as f:
        rd = csv.DictReader(f)
        for row in rd:
            metric = row["metric"]
            if metric in ("LUT", "FF", "DSP", "BRAM"):
                util[metric] = _num(row["used"])
                util[f"{metric}_total"] = _num(row["device_total"])
                util[f"{metric}_pct"] = _num(row["percent"])
            else:
                util[metric] = row["used"]
    return util


def _num(v):
    try:
        f = float(v)
        return int(f) if f.is_integer() else f
    except (ValueError, AttributeError):
        return v


# ---------------------------------------------------------------------------
# Step 4: comparison CSV + PNG
# ---------------------------------------------------------------------------
def write_comparison_csv(serial_m, parallel_m, serial_u, parallel_u, path):
    with open(path, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["category", "metric", "serial", "parallel"])

        # DSP metrics, per test case present in either arch
        names = list(dict.fromkeys(list(serial_m.keys()) + list(parallel_m.keys())))
        keys = [("SQNR_dB", "sqnr_db"), ("SFDR_dBc", "sfdr_dbc"),
                ("THD_dB", "thd_db"), ("SINAD_dB", "sinad_db"),
                ("ENOB_bits", "enob_bits"),
                ("Phase_RMS_deg", "phase_rms_deg"),
                ("Phase_RMS_deg_detrended", "phase_rms_deg_detrended")]
        for name in names:
            for label, k in keys:
                sv = _fmt(serial_m.get(name, {}).get(k))
                pv = _fmt(parallel_m.get(name, {}).get(k))
                w.writerow([f"DSP/{name}", label, sv, pv])

        # Utilization
        for res in ("LUT", "FF", "DSP", "BRAM"):
            sv = serial_u.get(res, "N/A") if serial_u else "N/A"
            pv = parallel_u.get(res, "N/A") if parallel_u else "N/A"
            w.writerow(["Utilization", res, sv, pv])
        for meta in ("device", "Fmax_MHz", "power_mW", "throughput_msps"):
            sv = serial_u.get(meta, "N/A") if serial_u else "N/A"
            pv = parallel_u.get(meta, "N/A") if parallel_u else "N/A"
            w.writerow(["Utilization", meta, sv, pv])
    print(f"  Saved: {path}")


def _fmt(v, nd=2):
    import math
    if v is None or (isinstance(v, float) and (math.isnan(v) or math.isinf(v))):
        return "N/A"
    if isinstance(v, float):
        return f"{v:.{nd}f}"
    return v


def _style(ax):
    ax.set_facecolor(PANEL)
    ax.tick_params(colors=TEXT, labelsize=8)
    for s in ax.spines.values():
        s.set_edgecolor(GRID)
    ax.grid(True, color=GRID, linewidth=0.5, linestyle="--", alpha=0.6)
    return ax


def _valid(v):
    import math
    return v is not None and not (isinstance(v, float) and (math.isnan(v) or math.isinf(v)))


def make_comparison_png(serial_m, parallel_m, serial_u, parallel_u,
                        serial_load, parallel_load, path):
    fig = plt.figure(figsize=(22, 13), facecolor=DARK)
    fig.suptitle("Serial vs Parallel MDF — Cross-Architecture Comparison\n"
                 "Identical DSP math (common/dsp_metrics.py) on both reconstructed spectra",
                 fontsize=16, fontweight="bold", color=TITLE, y=0.98)
    gs = GridSpec(2, 3, figure=fig, hspace=0.42, wspace=0.30,
                  left=0.05, right=0.97, top=0.90, bottom=0.08)

    # ── Single-tone DSP grouped bars (Sine case) ─────────────────────────
    ax = _style(fig.add_subplot(gs[0, 0]))
    sine_s = serial_m.get("Sine", {})
    sine_p = parallel_m.get("Sine", {})
    labels = ["SQNR\n(dB)", "SFDR\n(dBc)", "SINAD\n(dB)", "|THD|\n(dB)", "ENOB×6\n(dB-eq)"]
    s_vals = [sine_s.get("sqnr_db"), sine_s.get("sfdr_dbc"), sine_s.get("sinad_db"),
              abs(sine_s.get("thd_db")) if _valid(sine_s.get("thd_db")) else np.nan,
              sine_s.get("enob_bits") * 6.02 if _valid(sine_s.get("enob_bits")) else np.nan]
    p_vals = [sine_p.get("sqnr_db"), sine_p.get("sfdr_dbc"), sine_p.get("sinad_db"),
              abs(sine_p.get("thd_db")) if _valid(sine_p.get("thd_db")) else np.nan,
              sine_p.get("enob_bits") * 6.02 if _valid(sine_p.get("enob_bits")) else np.nan]
    s_vals = [v if _valid(v) else np.nan for v in s_vals]
    p_vals = [v if _valid(v) else np.nan for v in p_vals]
    x = np.arange(len(labels))
    ax.bar(x - 0.2, s_vals, width=0.4, color=SERIAL_COLOR, label="Serial", alpha=0.9)
    ax.bar(x + 0.2, p_vals, width=0.4, color=PARALLEL_COLOR, label="Parallel", alpha=0.9)
    ax.set_xticks(x)
    ax.set_xticklabels(labels, fontsize=8, color=TEXT)
    ax.set_ylabel("dB", color=TEXT, fontsize=8)
    ax.set_title("Single-Tone DSP Metrics (Sine, bin 50)", color=TITLE,
                 fontsize=11, fontweight="bold")
    ax.legend(fontsize=8, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT)

    # ── SQNR across all common test cases ────────────────────────────────
    ax = _style(fig.add_subplot(gs[0, 1]))
    names = list(dict.fromkeys(list(serial_m.keys()) + list(parallel_m.keys())))
    x = np.arange(len(names))
    s_sqnr = [serial_m.get(n, {}).get("sqnr_db", np.nan) for n in names]
    p_sqnr = [parallel_m.get(n, {}).get("sqnr_db", np.nan) for n in names]
    s_sqnr = [v if _valid(v) else np.nan for v in s_sqnr]
    p_sqnr = [v if _valid(v) else np.nan for v in p_sqnr]
    ax.bar(x - 0.2, s_sqnr, width=0.4, color=SERIAL_COLOR, label="Serial", alpha=0.9)
    ax.bar(x + 0.2, p_sqnr, width=0.4, color=PARALLEL_COLOR, label="Parallel", alpha=0.9)
    ax.set_xticks(x)
    ax.set_xticklabels(names, fontsize=7.5, color=TEXT, rotation=20, ha="right")
    ax.set_ylabel("SQNR (dB)", color=TEXT, fontsize=8)
    ax.set_title("SQNR by Test Case", color=TITLE, fontsize=11, fontweight="bold")
    ax.legend(fontsize=8, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT)

    # ── Overlaid per-bin phase-error stems (Sine) ────────────────────────
    ax = _style(fig.add_subplot(gs[0, 2]))
    drew = False
    for m, color, lab in ((sine_s, SERIAL_COLOR, "Serial"),
                          (sine_p, PARALLEL_COLOR, "Parallel")):
        ph = m.get("phase")
        if ph and ph.get("idx") is not None and len(ph["idx"]) > 0:
            idx = ph["idx"]
            deg = np.degrees(ph["per_bin"][idx])
            ml, sl, bl = ax.stem(idx, deg, linefmt=color, markerfmt="o", basefmt=GRID)
            plt.setp(ml, markersize=3, color=color, label=lab)
            plt.setp(sl, linewidth=0.7, color=color, alpha=0.7)
            drew = True
    if drew:
        ax.legend(fontsize=8, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT)
    ax.set_xlabel("Frequency Bin", color=TEXT, fontsize=8)
    ax.set_ylabel("Phase Error (°)", color=TEXT, fontsize=8)
    ax.set_title("Per-Bin Phase Error (Sine)", color=TITLE, fontsize=11, fontweight="bold")

    # ── Utilization grouped bars (absolute counts, log) ──────────────────
    ax = _style(fig.add_subplot(gs[1, 0:2]))
    res_keys = ["LUT", "FF", "DSP", "BRAM"]
    x = np.arange(len(res_keys))
    s_use = [serial_u.get(k, 0) if serial_u else 0 for k in res_keys]
    p_use = [parallel_u.get(k, 0) if parallel_u else 0 for k in res_keys]
    s_bars = ax.bar(x - 0.2, [max(v, 0.1) for v in s_use], width=0.4,
                    color=SERIAL_COLOR, label="Serial (xc7a100t)", alpha=0.9)
    p_bars = ax.bar(x + 0.2, [max(v, 0.1) for v in p_use], width=0.4,
                    color=PARALLEL_COLOR, label="Parallel (iCE40HX8K)", alpha=0.9)
    for bars, use, util in ((s_bars, s_use, serial_u), (p_bars, p_use, parallel_u)):
        for b, u, key in zip(bars, use, res_keys):
            pct = util.get(f"{key}_pct") if util else None
            txt = f"{int(u):,}"
            if _valid(pct):
                txt += f"\n({pct:.1f}%)"
            ax.text(b.get_x() + b.get_width() / 2, b.get_height(), txt,
                    ha="center", va="bottom", fontsize=7, color=TEXT)
    ax.set_yscale("log")
    ax.set_xticks(x)
    ax.set_xticklabels(res_keys, fontsize=9, color=TEXT)
    ax.set_ylabel("Count (log scale)", color=TEXT, fontsize=8)
    ax.set_title("FPGA Utilization — absolute counts (different target devices!)",
                 color=TITLE, fontsize=11, fontweight="bold")
    ax.legend(fontsize=8, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT)

    # ── Summary / Fmax / throughput table ────────────────────────────────
    ax = fig.add_subplot(gs[1, 2])
    ax.set_facecolor(PANEL)
    ax.axis("off")
    su = serial_u or {}
    pu = parallel_u or {}
    rows = [
        ["Metric", "Serial", "Parallel"],
        ["Device", su.get("device", "?"), pu.get("device", "?")],
        ["Fmax (MHz)", str(su.get("Fmax_MHz", "N/A")), str(pu.get("Fmax_MHz", "N/A"))],
        ["Throughput", str(su.get("throughput_msps", "N/A")),
         str(pu.get("throughput_msps", "N/A"))],
        ["Power (mW)", str(su.get("power_mW", "N/A")), str(pu.get("power_mW", "N/A"))],
        ["ENOB (Sine)", _fmt(sine_s.get("enob_bits")), _fmt(sine_p.get("enob_bits"))],
        ["SFDR (Sine)", _fmt(sine_s.get("sfdr_dbc")), _fmt(sine_p.get("sfdr_dbc"))],
        ["Phase RMS°", _fmt(sine_s.get("phase_rms_deg_detrended"), 3),
         _fmt(sine_p.get("phase_rms_deg_detrended"), 3)],
    ]
    tbl = ax.table(cellText=rows[1:], colLabels=rows[0],
                   cellLoc="left", loc="center", bbox=[0, 0, 1, 1])
    tbl.auto_set_font_size(False)
    tbl.set_fontsize(8)
    for (r, c), cell in tbl.get_celld().items():
        cell.set_facecolor(PANEL if r % 2 == 0 else "#1c2128")
        cell.set_text_props(color=TITLE if r == 0 else TEXT, family="monospace")
        cell.set_edgecolor(GRID)
    ax.set_title("Head-to-Head Summary", color=TITLE, fontsize=11, fontweight="bold")
    ax.text(0.5, -0.05,
            "Devices differ (iCE40HX8K vs xc7a100t) — compare absolute counts, "
            "not %-of-device.", transform=ax.transAxes, fontsize=7,
            color="#8b949e", ha="center", style="italic")

    fig.savefig(path, dpi=150, facecolor=DARK, bbox_inches="tight")
    plt.close(fig)
    print(f"  Saved: {path}")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main():
    ap = argparse.ArgumentParser(description="Serial vs Parallel MDF FFT co-simulation")
    ap.add_argument("--skip-run", action="store_true",
                    help="reuse existing npz/csv instead of re-simulating")
    ap.add_argument("--results-dir", default=os.path.join(REPO_ROOT, "results"),
                    help="results root (default: <repo>/results)")
    args = ap.parse_args()

    results_dir = os.path.abspath(args.results_dir)
    serial_res = os.path.join(results_dir, "serial")
    parallel_res = os.path.join(results_dir, "parallel")
    comp_res = os.path.join(results_dir, "comparison")
    os.makedirs(comp_res, exist_ok=True)

    if not args.skip_run:
        run_all()
    else:
        print("[--skip-run] reusing cached results/<arch>/ artifacts")

    print("\n" + "=" * 64)
    print("  Loading spectra + recomputing identical DSP metrics")
    print("=" * 64)
    serial_load = load_spectra(os.path.join(serial_res, "spectrum.npz"))
    parallel_load = load_spectra(os.path.join(parallel_res, "spectrum.npz"))
    serial_m = metrics_from_spectra(serial_load)
    parallel_m = metrics_from_spectra(parallel_load)

    serial_u = load_utilization(os.path.join(serial_res, "utilization.csv"))
    parallel_u = load_utilization(os.path.join(parallel_res, "utilization.csv"))

    if not serial_m and not parallel_m:
        print("\n[ABORT] No spectra available. Run without --skip-run first.")
        return 1

    print("\n[+] Writing comparison artifacts ...")
    write_comparison_csv(serial_m, parallel_m, serial_u, parallel_u,
                         os.path.join(comp_res, "comparison.csv"))
    make_comparison_png(serial_m, parallel_m, serial_u, parallel_u,
                        serial_load, parallel_load,
                        os.path.join(comp_res, "comparison.png"))

    # Console sanity readout
    print("\n  Sine-case head-to-head:")
    for name, m in (("Serial", serial_m.get("Sine", {})),
                    ("Parallel", parallel_m.get("Sine", {}))):
        print(f"    {name:8s}: SQNR={_fmt(m.get('sqnr_db'))} dB  "
              f"SFDR={_fmt(m.get('sfdr_dbc'))} dBc  "
              f"ENOB={_fmt(m.get('enob_bits'))} bits  "
              f"THD={_fmt(m.get('thd_db'))} dB")
    print("\n[OK] Comparison complete -> results/comparison/")
    return 0


if __name__ == "__main__":
    sys.exit(main())
