#!/usr/bin/env python3
"""
common/dsp_plots.py — shared matplotlib rendering for DSP figures of merit
==========================================================================
Kept separate from ``dsp_metrics.py`` (pure math) so the metric logic has no
plotting dependency. Both verification scripts and the co-simulation import
``render_dsp_metrics_png`` so every per-architecture ``dsp_metrics.png`` looks
identical.

A "metric record" is a flat dict with keys (missing single-tone fields → NaN):
    name, sqnr_db, sfdr_dbc, thd_db, thd_pct, sinad_db, enob_bits,
    single_tone (bool), phase_rms_deg, phase_rms_deg_detrended,
    phase (dict from dsp_metrics.compute_phase_error, with per_bin / idx).
"""
import math
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec

# GitHub-dark palette, matching the existing report styling.
DARK = "#0d1117"
PANEL = "#161b22"
GRID = "#21262d"
BLUE = "#58a6ff"
GREEN = "#3fb950"
ORANGE = "#f0883e"
PURPLE = "#d2a8ff"
RED = "#f85149"
TEAL = "#56d364"
YELLOW = "#e3b341"
TEXT = "#c9d1d9"
TITLE = "#58a6ff"


def _fmt(v, suffix="", nd=1):
    if v is None or (isinstance(v, float) and (math.isnan(v) or math.isinf(v))):
        return "N/A"
    return f"{v:.{nd}f}{suffix}"


def render_dsp_metrics_png(records, title, out_path, sine_name="Sine"):
    """Render the per-architecture DSP figures-of-merit PNG.

    ``records`` is an ordered list of metric-record dicts (see module docstring).
    ``sine_name`` selects which record drives the single-tone bar chart and the
    per-bin phase-error stem plot.
    """
    fig = plt.figure(figsize=(20, 11), facecolor=DARK)
    fig.suptitle(title, fontsize=18, fontweight="bold", color=TITLE, y=0.98)
    gs = GridSpec(2, 3, figure=fig, hspace=0.38, wspace=0.30,
                  left=0.05, right=0.97, top=0.90, bottom=0.08)

    def _style(ax):
        ax.set_facecolor(PANEL)
        ax.tick_params(colors=TEXT, labelsize=8)
        for s in ax.spines.values():
            s.set_edgecolor(GRID)
        ax.grid(True, color=GRID, linewidth=0.5, linestyle="--", alpha=0.6)
        return ax

    names = [r["name"] for r in records]
    sine = next((r for r in records if r["name"] == sine_name), None)
    if sine is None:
        sine = next((r for r in records if r.get("single_tone")), None)

    # ── Summary table (row 0, cols 0-1) ──────────────────────────────────
    ax_tbl = fig.add_subplot(gs[0, 0:2])
    ax_tbl.set_facecolor(PANEL)
    ax_tbl.axis("off")
    col_labels = ["Test", "SQNR (dB)", "SFDR (dBc)", "ENOB (bits)",
                  "THD (dB)", "Phase RMS (°)"]
    table_data = []
    for r in records:
        table_data.append([
            r["name"],
            _fmt(r.get("sqnr_db")),
            _fmt(r.get("sfdr_dbc")),
            _fmt(r.get("enob_bits"), nd=2),
            _fmt(r.get("thd_db")),
            _fmt(r.get("phase_rms_deg_detrended"), nd=3),
        ])
    tbl = ax_tbl.table(cellText=table_data, colLabels=col_labels,
                       loc="center", cellLoc="center")
    tbl.auto_set_font_size(False)
    tbl.set_fontsize(9)
    tbl.scale(1, 1.8)
    for key, cell in tbl.get_celld().items():
        cell.set_edgecolor(GRID)
        cell.set_text_props(color=TEXT, fontfamily="monospace")
        if key[0] == 0:
            cell.set_facecolor(GRID)
            cell.set_text_props(color=TITLE, fontweight="bold", fontfamily="monospace")
        else:
            cell.set_facecolor(PANEL if key[0] % 2 else "#1c2128")
    ax_tbl.set_title("DSP Metrics Summary", color=TITLE, fontsize=11,
                     fontweight="bold", pad=12)

    # ── SQNR by test case (row 0, col 2) ─────────────────────────────────
    ax = _style(fig.add_subplot(gs[0, 2]))
    sqnr_vals = [r.get("sqnr_db", 0) for r in records]
    palette = [BLUE, GREEN, PURPLE, ORANGE, TEAL]
    bars = ax.bar(range(len(names)), sqnr_vals,
                  color=[palette[i % len(palette)] for i in range(len(names))],
                  width=0.6, alpha=0.9)
    for b, v in zip(bars, sqnr_vals):
        ax.text(b.get_x() + b.get_width() / 2, b.get_height() + 0.5,
                _fmt(v), ha="center", va="bottom", fontsize=7.5, color=TEXT)
    ax.set_xticks(range(len(names)))
    ax.set_xticklabels(names, fontsize=7.5, color=TEXT, rotation=20, ha="right")
    ax.set_ylabel("SQNR (dB)", color=TEXT, fontsize=8)
    ax.set_title("SQNR by Test Case", color=TITLE, fontsize=10, fontweight="bold")

    # ── Single-tone metrics bar chart (row 1, col 0) ─────────────────────
    ax = _style(fig.add_subplot(gs[1, 0]))
    if sine is not None:
        metric_labels = ["SFDR\n(dBc)", "SINAD\n(dB)", "|THD|\n(dB)", "ENOB×6\n(dB-eq)"]
        metric_vals = [
            sine.get("sfdr_dbc", float("nan")),
            sine.get("sinad_db", float("nan")),
            abs(sine.get("thd_db", float("nan"))),
            sine.get("enob_bits", float("nan")) * 6.02,
        ]
        mcolors = [BLUE, GREEN, ORANGE, PURPLE]
        bars = ax.bar(range(len(metric_labels)), metric_vals, color=mcolors,
                      width=0.6, alpha=0.9)
        for b, v in zip(bars, metric_vals):
            if not (isinstance(v, float) and math.isnan(v)):
                ax.text(b.get_x() + b.get_width() / 2, b.get_height() + 0.5,
                        f"{v:.1f}", ha="center", va="bottom", fontsize=7.5, color=TEXT)
        ax.set_xticks(range(len(metric_labels)))
        ax.set_xticklabels(metric_labels, fontsize=7.5, color=TEXT)
        ax.set_ylabel("dB", color=TEXT, fontsize=8)
        ax.set_title(f"Single-Tone Metrics ({sine['name']})",
                     color=TITLE, fontsize=10, fontweight="bold")
        enob = sine.get("enob_bits")
        ax.text(0.98, 0.96, f"ENOB = {_fmt(enob, ' bits', 2)}",
                transform=ax.transAxes, ha="right", va="top",
                fontsize=8, color=YELLOW)
    else:
        ax.axis("off")
        ax.text(0.5, 0.5, "No single-tone case", transform=ax.transAxes,
                ha="center", va="center", color=TEXT)

    # ── Per-bin phase error stem (row 1, cols 1-2) ───────────────────────
    ax = _style(fig.add_subplot(gs[1, 1:3]))
    phase = (sine or {}).get("phase") if sine else None
    if phase is not None and phase.get("idx") is not None and len(phase["idx"]) > 0:
        idx = phase["idx"]
        per_bin = phase["per_bin"]
        deg = np.degrees(per_bin[idx])
        markerline, stemlines, baseline = ax.stem(idx, deg, linefmt=BLUE,
                                                   markerfmt="o", basefmt=GRID)
        plt.setp(markerline, markersize=3, color=BLUE)
        plt.setp(stemlines, linewidth=0.8, color=BLUE)
        ax.set_xlabel("Frequency Bin", color=TEXT, fontsize=8)
        ax.set_ylabel("Phase Error (°)", color=TEXT, fontsize=8)
        ax.set_title("Per-Bin Phase Error (bins with significant |ref|)",
                     color=TITLE, fontsize=10, fontweight="bold")
        note = (f"RMS = {_fmt(sine.get('phase_rms_deg'), '°', 3)}   "
                f"detrended = {_fmt(sine.get('phase_rms_deg_detrended'), '°', 3)}   "
                f"max = {_fmt(sine.get('phase_max_deg'), '°', 3)}")
        ax.text(0.01, 0.97, note, transform=ax.transAxes, ha="left", va="top",
                fontsize=8, color=YELLOW, family="monospace")
    else:
        ax.axis("off")
        ax.text(0.5, 0.5, "No phase data available", transform=ax.transAxes,
                ha="center", va="center", color=TEXT)

    fig.savefig(out_path, dpi=150, facecolor=fig.get_facecolor(), bbox_inches="tight")
    plt.close(fig)
    print(f"  Saved: {out_path}")
