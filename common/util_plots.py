#!/usr/bin/env python3
"""
common/util_plots.py — shared FPGA utilization CSV + PNG rendering
==================================================================
Consumes a *normalized* utilization dict so the serial and parallel reports
(and the cross-architecture comparison) render consistently. Absolute resource
counts are the primary axis; %-of-device is annotated and always labels which
device the percentage refers to (the two designs target different parts —
iCE40HX8K vs xc7a100t — so absolute counts are the only fair common axis).

Normalized util dict schema (None / 0 where a resource does not apply):
    {
      "arch":   "parallel" | "serial",
      "device": "<part/device string>",
      "LUT": int,  "LUT_total": int,
      "FF":  int,  "FF_total":  int,
      "DSP": int,  "DSP_total": int,
      "BRAM": float, "BRAM_total": int,     # device-native blocks
      "Fmax_MHz": float | None,
      "power_mW": float | None,
      "throughput_msps": float | None,
      "notes": str (optional),
    }
"""
import csv
import math
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec

DARK = "#0d1117"
PANEL = "#161b22"
GRID = "#21262d"
BLUE = "#58a6ff"
GREEN = "#3fb950"
ORANGE = "#f0883e"
PURPLE = "#d2a8ff"
RED = "#f85149"
TEXT = "#c9d1d9"
TITLE = "#58a6ff"

_RES_KEYS = [("LUT", BLUE), ("FF", GREEN), ("DSP", ORANGE), ("BRAM", PURPLE)]


def write_utilization_csv(util, path):
    """Write a normalized util dict to a flat key/value CSV."""
    with open(path, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["metric", "used", "device_total", "percent"])
        for key, _ in _RES_KEYS:
            used = util.get(key, 0)
            total = util.get(f"{key}_total", 0) or 0
            pct = (100.0 * used / total) if total else 0.0
            w.writerow([key, used, total, f"{pct:.3f}"])
        w.writerow(["device", util.get("device", "?"), "", ""])
        w.writerow(["Fmax_MHz", _csvnum(util.get("Fmax_MHz")), "", ""])
        w.writerow(["power_mW", _csvnum(util.get("power_mW")), "", ""])
        w.writerow(["throughput_msps", _csvnum(util.get("throughput_msps")), "", ""])
    print(f"  Saved: {path}")


def _csvnum(v):
    if v is None or (isinstance(v, float) and (math.isnan(v) or math.isinf(v))):
        return "N/A"
    return v


def _style(ax):
    ax.set_facecolor(PANEL)
    ax.tick_params(colors=TEXT, labelsize=8)
    for s in ax.spines.values():
        s.set_edgecolor(GRID)
    ax.grid(True, color=GRID, linewidth=0.5, linestyle="--", alpha=0.6)
    return ax


def render_utilization_png(util, title, out_path):
    """Standalone per-architecture utilization figure: resource bars (count +
    % of device), a timing/power table, and a power note (parallel only)."""
    fig = plt.figure(figsize=(18, 8), facecolor=DARK)
    fig.suptitle(title, fontsize=17, fontweight="bold", color=TITLE, y=0.97)
    gs = GridSpec(1, 2, figure=fig, wspace=0.28,
                  left=0.06, right=0.96, top=0.86, bottom=0.12)

    # ── Resource bars (absolute count, log scale) ────────────────────────
    ax = _style(fig.add_subplot(gs[0, 0]))
    labels, used, total, colors = [], [], [], []
    for key, color in _RES_KEYS:
        labels.append(key)
        used.append(max(util.get(key, 0), 0))
        total.append(util.get(f"{key}_total", 0) or 0)
        colors.append(color)
    x = np.arange(len(labels))
    ax.bar(x, total, color=GRID, width=0.6, label="Device total")
    bars = ax.bar(x, [max(u, 0.1) for u in used], color=colors, width=0.6,
                  alpha=0.9, label="Used")
    for b, u, t in zip(bars, used, total):
        pct = (100.0 * u / t) if t else 0.0
        ax.text(b.get_x() + b.get_width() / 2, b.get_height(),
                f"{int(u):,}\n({pct:.2f}%)", ha="center", va="bottom",
                fontsize=7.5, color=TEXT)
    if max(total) > 0:
        ax.set_yscale("log")
    ax.set_xticks(x)
    ax.set_xticklabels(labels, fontsize=9, color=TEXT)
    ax.set_ylabel("Count (log scale)", color=TEXT, fontsize=8)
    ax.set_title(f"Resource Utilization — {util.get('device', '?')}",
                 color=TITLE, fontsize=11, fontweight="bold")
    ax.legend(fontsize=8, facecolor=DARK, edgecolor=GRID, labelcolor=TEXT,
              loc="upper right")

    # ── Timing / power table ─────────────────────────────────────────────
    ax = fig.add_subplot(gs[0, 1])
    ax.set_facecolor(PANEL)
    ax.axis("off")
    fmax = util.get("Fmax_MHz")
    power = util.get("power_mW")
    thr = util.get("throughput_msps")
    rows = [
        ["Metric", "Value"],
        ["Target device", util.get("device", "?")],
        ["LUT", f"{util.get('LUT', 0):,} ({_pct(util,'LUT')})"],
        ["FF", f"{util.get('FF', 0):,} ({_pct(util,'FF')})"],
        ["DSP", f"{util.get('DSP', 0):,} ({_pct(util,'DSP')})"],
        ["BRAM", f"{util.get('BRAM', 0):g} ({_pct(util,'BRAM')})"],
        ["Fmax", f"{fmax:.1f} MHz" if fmax else "N/A (P&R/Vivado)"],
        ["Throughput", f"{thr:.0f} MSPS" if thr else "N/A"],
        ["Power", f"{power:.1f} mW" if power else "N/A"],
    ]
    tbl = ax.table(cellText=rows[1:], colLabels=rows[0],
                   cellLoc="left", loc="center", bbox=[0, 0, 1, 1])
    tbl.auto_set_font_size(False)
    tbl.set_fontsize(9.5)
    for (r, c), cell in tbl.get_celld().items():
        cell.set_facecolor(PANEL if r % 2 == 0 else "#1c2128")
        cell.set_text_props(color=TITLE if r == 0 else TEXT, family="monospace")
        cell.set_edgecolor(GRID)
    ax.set_title("Timing / Power", color=TITLE, fontsize=11, fontweight="bold")
    if util.get("notes"):
        ax.text(0.5, -0.04, util["notes"], transform=ax.transAxes, fontsize=7,
                color="#8b949e", ha="center", style="italic")

    fig.savefig(out_path, dpi=150, facecolor=DARK, bbox_inches="tight")
    plt.close(fig)
    print(f"  Saved: {out_path}")


def _pct(util, key):
    total = util.get(f"{key}_total", 0) or 0
    if not total:
        return "—"
    return f"{100.0 * util.get(key, 0) / total:.2f}%"
