#!/usr/bin/env python3
"""
aggregate.py — Combine the Serial + Parallel parametric sweeps into one
comparison table and a set of trend plots.

Reads:
    results/parametric_sweep/serial_summary.csv
    results/parametric_sweep/parallel_summary.csv
Writes:
    results/parametric_sweep/combined_summary.csv
    results/parametric_sweep/trends.png   (SQNR vs N / data-width / twiddle-width)
"""
import csv
import os
from pathlib import Path

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parent.parent
SW = ROOT / "results" / "parametric_sweep"


def load(path, arch):
    rows = []
    if not path.exists():
        return rows
    with open(path) as f:
        for r in csv.DictReader(f):
            r["Arch"] = arch
            rows.append(r)
    return rows


def fnum(v):
    try:
        return float(v)
    except (TypeError, ValueError):
        return np.nan


def combined():
    s = load(SW / "serial_summary.csv", "Serial")
    p = load(SW / "parallel_summary.csv", "Parallel")
    cols = ["Arch", "Config", "N", "DataW", "TwiddleW", "Throughput_MSPS",
            "SQNR_Impulse", "SQNR_DC", "SQNR_Sine", "SQNR_MultiTone",
            "SQNR_Chirp", "ENOB_Sine", "Status"]
    out = SW / "combined_summary.csv"
    with open(out, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(cols)
        for r in s + p:
            w.writerow([r.get(c, "") for c in cols])
    print(f"[+] {out}")
    return s, p


def trend_plot(s, p):
    def series(rows, fixed, xkey):
        pts = []
        for r in rows:
            if r.get("Status") != "OK":
                continue
            ok = all(int(r[k]) == v for k, v in fixed.items())
            if ok:
                pts.append((int(r[xkey]), fnum(r["SQNR_Sine"]), fnum(r["SQNR_Chirp"])))
        pts.sort()
        return pts

    fig, axes = plt.subplots(1, 3, figsize=(18, 5), facecolor="white")
    panels = [
        ("FFT size N (D=16, T=16)", {"DataW": 16, "TwiddleW": 16}, "N"),
        ("Data width (N=1024, T=16)", {"N": 1024, "TwiddleW": 16}, "DataW"),
        ("Twiddle width (N=1024, D=16)", {"N": 1024, "DataW": 16}, "TwiddleW"),
    ]
    for ax, (title, fixed, xkey) in zip(axes, panels):
        for rows, name, c in ((s, "Serial", "#1f77b4"), (p, "Parallel", "#d62728")):
            pts = series(rows, fixed, xkey)
            if not pts:
                continue
            x = [a for a, _, _ in pts]
            ax.plot(x, [b for _, b, _ in pts], "o-", color=c, label=f"{name} Sine")
            ax.plot(x, [d for _, _, d in pts], "s--", color=c, alpha=0.55, label=f"{name} Chirp")
        ax.set_title(title)
        ax.set_xlabel(xkey)
        ax.set_ylabel("SQNR (dB)")
        ax.grid(True, alpha=0.3)
        ax.legend(fontsize=8)
    fig.suptitle("Parametric sweep — SQNR trends (Sine & Chirp)", fontsize=15, fontweight="bold")
    fig.tight_layout(rect=[0, 0, 1, 0.96])
    out = SW / "trends.png"
    fig.savefig(out, dpi=150)
    plt.close(fig)
    print(f"[+] {out}")


if __name__ == "__main__":
    s, p = combined()
    trend_plot(s, p)
