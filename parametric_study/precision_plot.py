#!/usr/bin/env python3
"""
precision_plot.py — Visualise the SQNR = f(min(data_width, twiddle_width)) law
from the wide-precision sweeps.

Left  : SQNR vs data width, at fixed twiddle = 16 (saturates) and 32 (linear).
Right : SQNR vs twiddle width, at fixed data = 16 (saturates) and 32 (linear).
Both architectures, Sine SQNR.

Reads the summary CSVs under results/parametric_sweep/ and writes
precision_minlaw.png there.
"""
import csv
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

SW = Path(__file__).resolve().parent.parent / "results" / "parametric_sweep"


def load(name):
    p = SW / name
    rows = []
    if p.exists():
        with open(p) as f:
            rows = list(csv.DictReader(f))
    return rows


def pts(rows, fixed, xkey, ykey="SQNR_Sine"):
    out = []
    for r in rows:
        if r.get("Status") not in (None, "", "OK"):
            continue
        try:
            if all(int(r[k]) == v for k, v in fixed.items()):
                out.append((int(r[xkey]), float(r[ykey])))
        except (ValueError, KeyError):
            pass
    return sorted(set(out))


# Source: the single main summary per arch now carries the full data×twiddle
# plane at N=1024 (D,T ∈ {8,16,32,64}²), so every series below is a slice of it.
serial_main = load("serial_summary.csv")
par_main = load("parallel_summary.csv")

fig, (axL, axR) = plt.subplots(1, 2, figsize=(14, 5.5), facecolor="white")

# ---- Left: SQNR vs data width ----
series_L = [
    ("Serial,  Tw=16", pts(serial_main, {"TwiddleW": 16, "N": 1024}, "DataW"), "#1f77b4", "o-"),
    ("Serial,  Tw=32", pts(serial_main, {"TwiddleW": 32, "N": 1024}, "DataW"), "#1f77b4", "o--"),
    ("Parallel, Tw=16", pts(par_main, {"TwiddleW": 16, "N": 1024}, "DataW"), "#d62728", "s-"),
    ("Parallel, Tw=32", pts(par_main, {"TwiddleW": 32, "N": 1024}, "DataW"), "#d62728", "s--"),
]
for lbl, p, c, ls in series_L:
    if p:
        axL.plot([a for a, _ in p], [b for _, b in p], ls, color=c, label=lbl, alpha=0.9)
axL.axhline(79.5, color="#1f77b4", lw=0.8, ls=":", alpha=0.5)
axL.axhline(82, color="#d62728", lw=0.8, ls=":", alpha=0.5)
axL.set_title("SQNR vs DATA width\n(Tw=16 saturates at the twiddle ceiling; Tw=32 climbs ~6 dB/bit)")
axL.set_xlabel("data-path width (bits)")
axL.set_ylabel("Sine SQNR (dB)")
axL.grid(True, alpha=0.3)
axL.legend(fontsize=8)

# ---- Right: SQNR vs twiddle width ----
series_R = [
    ("Serial,  D=16", pts(serial_main, {"DataW": 16, "N": 1024}, "TwiddleW"), "#1f77b4", "o-"),
    ("Serial,  D=32", pts(serial_main, {"DataW": 32, "N": 1024}, "TwiddleW"), "#1f77b4", "o--"),
    ("Parallel, D=16", pts(par_main, {"DataW": 16, "N": 1024}, "TwiddleW"), "#d62728", "s-"),
    ("Parallel, D=32", pts(par_main, {"DataW": 32, "N": 1024}, "TwiddleW"), "#d62728", "s--"),
]
for lbl, p, c, ls in series_R:
    if p:
        axR.plot([a for a, _ in p], [b for _, b in p], ls, color=c, label=lbl, alpha=0.9)
axR.set_title("SQNR vs TWIDDLE width\n(D=16 saturates at the data ceiling; D=32 climbs ~6 dB/bit)")
axR.set_xlabel("twiddle width (bits)")
axR.set_ylabel("Sine SQNR (dB)")
axR.grid(True, alpha=0.3)
axR.legend(fontsize=8)

fig.suptitle("SQNR is governed by min(data_width, twiddle_width) — ~6 dB per limiting bit",
             fontsize=14, fontweight="bold")
fig.tight_layout(rect=[0, 0, 1, 0.93])
out = SW / "precision_minlaw.png"
fig.savefig(out, dpi=150)
plt.close(fig)
print(f"[+] {out}")
