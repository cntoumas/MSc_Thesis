#!/usr/bin/env python3
"""
Serial FFT - All Signal Cases
==============================
Simulates the serial FFT hardware for 4 input signal types and produces
a 2x2 spectrum plot.

Cases:
  1. DC impulse      (x[0] = A, rest = 0)  -> flat spectrum
  2. Single sine     (bin 50)              -> single peak
  3. Multi-tone      (bins 50, 200, 450)   -> three peaks
  4. Linear chirp    (bin 0 -> 511)        -> spread energy

Usage:
  cd "Serial FFT processor"
  python3 scripts/fft_all_cases.py
"""

import os
import sys
import shutil
import subprocess
import time
from pathlib import Path

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
N          = 1024
LOG2_N     = 10
AMPLITUDE  = 10000      # Q1.15 safe amplitude (avoids BFP overflow)
DATA_BITS  = 17         # internal RAM width

SRC_DIR     = os.path.dirname(os.path.abspath(__file__))
PROJ_DIR    = os.path.dirname(SRC_DIR)
ROM_DIR     = os.path.join(PROJ_DIR, "rom")
MEM_RE      = os.path.join(PROJ_DIR, "stimulus_re.mem")
MEM_IM      = os.path.join(PROJ_DIR, "stimulus_im.mem")
HW_CSV      = os.path.join(PROJ_DIR, "hw_output.csv")
HW_EXP      = os.path.join(PROJ_DIR, "hw_exponent.txt")
OUT_PNG     = os.path.join(PROJ_DIR, "fft_all_cases.png")

# ---------------------------------------------------------------------------
# Signal generators
# ---------------------------------------------------------------------------
def signal_impulse():
    """Single DC impulse at n=0."""
    re = np.zeros(N, dtype=np.int32)
    im = np.zeros(N, dtype=np.int32)
    re[0] = AMPLITUDE
    return re, im, "DC Impulse (x[0]=A)"

def signal_sine(bin_k=50):
    """Pure real sine at frequency bin k."""
    n = np.arange(N)
    wave = AMPLITUDE * np.sin(2 * np.pi * bin_k * n / N)
    re = np.round(wave).astype(np.int32)
    im = np.zeros(N, dtype=np.int32)
    return re, im, f"Single Sine  (bin {bin_k})"

def signal_multitone(bins=(50, 200, 450)):
    """Sum of real sines at three frequency bins."""
    n   = np.arange(N)
    amp = AMPLITUDE // len(bins)          # divide so sum stays in range
    wave = sum(amp * np.sin(2 * np.pi * k * n / N) for k in bins)
    re = np.round(wave).astype(np.int32)
    im = np.zeros(N, dtype=np.int32)
    label = "Multi-tone  (bins " + ", ".join(str(b) for b in bins) + ")"
    return re, im, label

def signal_chirp(f_start=0, f_end=511):
    """Linear frequency sweep (chirp) from f_start to f_end bins."""
    n  = np.arange(N)
    # instantaneous frequency rises linearly from f_start to f_end over N samples
    phi = 2 * np.pi * (f_start + (f_end - f_start) * n / (2 * N)) * n / N
    wave = AMPLITUDE * np.sin(phi)
    re = np.round(wave).astype(np.int32)
    im = np.zeros(N, dtype=np.int32)
    return re, im, f"Linear Chirp  (bin {f_start}->{f_end})"

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
def clamp17(v):
    """Clamp to 17-bit signed range."""
    return int(np.clip(v, -(1 << 16), (1 << 16) - 1))

def bit_reverse_permutation(data, bits):
    """Reorder array so data[i] -> position bit_reverse(i, bits)."""
    n   = len(data)
    out = np.zeros_like(data)
    for i in range(n):
        out[bit_reverse(i, bits)] = data[i]
    return out

def write_mem(path, data):
    """Write signed integer array as hex .mem file (17-bit two's complement)."""
    mask = (1 << DATA_BITS) - 1
    with open(path, 'w') as f:
        for v in data:
            f.write(f"{int(v) & mask:05X}\n")

def bit_reverse(x, bits):
    r = 0
    for _ in range(bits):
        r = (r << 1) | (x & 1)
        x >>= 1
    return r

def setup_sim():
    """Copy ROM files and compile Verilog once (reused for all runs)."""
    for name in ("cos.mem", "sin.mem"):
        src = os.path.join(ROM_DIR, name)
        dst = os.path.join(PROJ_DIR, name)
        if os.path.exists(src):
            shutil.copy(src, dst)

    rtl_files = sorted(f for f in os.listdir(os.path.join(PROJ_DIR, "rtl")) if f.endswith('.v'))
    vfiles = [os.path.join("tb", "fft_tb.v")] + [os.path.join("rtl", f) for f in rtl_files]
    cmd = ["iverilog", "-o", "fft_sim"] + vfiles
    print(f"  Compiling: {' '.join(cmd)}")
    r = subprocess.run(cmd, cwd=PROJ_DIR, capture_output=True, text=True)
    if r.returncode != 0:
        print("[ERROR] Compilation failed:\n", r.stderr)
        sys.exit(1)
    print("  Compilation OK")

def run_sim(re_data, im_data, label):
    """Write stimulus, run simulation, return (hw_re, hw_im, exponent)."""
    print(f"\n{'='*60}")
    print(f"  Case: {label}")
    print(f"{'='*60}")

    # The hardware (Pease/rotate-left DIT AGU) requires bit-reversed input
    # to produce natural-order output — no output reordering needed.
    br_re = bit_reverse_permutation(re_data.astype(np.int32), LOG2_N)
    br_im = bit_reverse_permutation(im_data.astype(np.int32), LOG2_N)
    write_mem(MEM_RE, br_re)
    write_mem(MEM_IM, br_im)

    t0 = time.time()
    r  = subprocess.run(["vvp", "fft_sim"], cwd=PROJ_DIR,
                        capture_output=True, text=True, timeout=300)
    elapsed = time.time() - t0

    if r.returncode != 0:
        print("[ERROR] Simulation failed:\n", r.stderr)
        sys.exit(1)

    for ln in r.stdout.strip().split('\n'):
        s = ln.strip()
        if s and any(k in s for k in ("Written", "Exponent", ">>>", "===")):
            print("   ", s)
    print(f"  Simulation: {elapsed:.1f}s")

    # Read output
    hw_re, hw_im = [], []
    with open(HW_CSV) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            a, b = line.split(',')
            hw_re.append(int(a))
            hw_im.append(int(b))

    exponent = 0
    if os.path.exists(HW_EXP):
        try:
            exponent = int(Path(HW_EXP).read_text().strip())
        except Exception:
            pass

    hw_re = np.array(hw_re, dtype=np.float64)
    hw_im = np.array(hw_im, dtype=np.float64)
    print(f"  BFP exponent = {exponent}")
    return hw_re, hw_im, exponent

# ---------------------------------------------------------------------------
# Reference FFT (software) for overlay
# ---------------------------------------------------------------------------
def reference_fft(re_data, im_data):
    x   = re_data.astype(np.float64) + 1j * im_data.astype(np.float64)
    return np.fft.fft(x)

# ---------------------------------------------------------------------------
# Plotting
# ---------------------------------------------------------------------------
DARK_BG   = "#0d1117"
GRID_CLR  = "#21262d"
ACCENT    = "#58a6ff"
REF_CLR   = "#f78166"
TEXT_CLR  = "#e6edf3"
TITLE_CLR = "#79c0ff"

CASE_COLORS = [ACCENT, "#3fb950", "#d2a8ff", "#ffa657"]

def magnitude_db(re, im, exponent):
    """Convert raw hardware output to magnitude in dB (BFP-scaled)."""
    scale = 2.0 ** exponent
    mag   = np.sqrt((re * scale) ** 2 + (im * scale) ** 2)
    mag   = np.where(mag == 0, 1e-10, mag)
    return 20 * np.log10(mag)

def plot_all(cases):
    """cases: list of (label, re_in, im_in, hw_re, hw_im, exponent)"""
    fig = plt.figure(figsize=(16, 10), facecolor=DARK_BG)
    fig.suptitle("Serial FFT Processor — Hardware Simulation Results (N=1024)",
                 fontsize=15, color=TITLE_CLR, fontweight='bold', y=0.98)

    gs = GridSpec(2, 2, figure=fig, hspace=0.42, wspace=0.32,
                  left=0.06, right=0.97, top=0.93, bottom=0.07)

    bins = np.arange(N)

    for idx, (label, re_in, im_in, hw_re, hw_im, exp) in enumerate(cases):
        ax = fig.add_subplot(gs[idx // 2, idx % 2])
        ax.set_facecolor(DARK_BG)
        ax.tick_params(colors=TEXT_CLR, labelsize=8)
        for spine in ax.spines.values():
            spine.set_edgecolor(GRID_CLR)
        ax.grid(True, color=GRID_CLR, linewidth=0.6, linestyle='--', alpha=0.7)

        color = CASE_COLORS[idx]

        # Hardware produces natural-order output (input was pre-scrambled)
        hw_mag_db = magnitude_db(hw_re, hw_im, exp)

        # Reference (software FFT) — magnitude in dB
        ref = reference_fft(re_in, im_in)
        ref_mag = np.abs(ref)
        ref_mag = np.where(ref_mag == 0, 1e-10, ref_mag)
        # Normalise reference to match hardware peak
        hw_peak = np.max(np.exp(hw_mag_db * np.log(10) / 20))
        ref_peak = np.max(ref_mag)
        if ref_peak > 0:
            ref_mag_scaled = ref_mag * (hw_peak / ref_peak)
        else:
            ref_mag_scaled = ref_mag
        ref_db = 20 * np.log10(np.where(ref_mag_scaled == 0, 1e-10, ref_mag_scaled))

        # Plot only up to N/2 (one-sided spectrum for real inputs)
        half = N // 2
        ax.fill_between(bins[:half], hw_mag_db[:half],
                        alpha=0.25, color=color)
        ax.plot(bins[:half], hw_mag_db[:half],
                color=color, linewidth=1.2, label="Hardware")
        ax.plot(bins[:half], ref_db[:half],
                color=REF_CLR, linewidth=0.8, linestyle='--',
                alpha=0.75, label="Software ref")

        # Dynamic y-range: focus on the interesting region
        peak_db = np.max(hw_mag_db[:half])
        ax.set_ylim(peak_db - 80, peak_db + 12)
        ax.set_xlim(0, half - 1)

        ax.set_title(label, color=TITLE_CLR, fontsize=9.5, fontweight='bold', pad=6)
        ax.set_xlabel("Frequency Bin", color=TEXT_CLR, fontsize=8)
        ax.set_ylabel("Magnitude (dB)", color=TEXT_CLR, fontsize=8)

        legend = ax.legend(fontsize=7.5, facecolor="#161b22",
                           edgecolor=GRID_CLR, labelcolor=TEXT_CLR,
                           loc="upper right")

        # Annotate BFP exponent
        ax.text(0.02, 0.95, f"BFP exp = {exp}",
                transform=ax.transAxes, fontsize=7.5,
                color="#8b949e", va='top')

    fig.savefig(OUT_PNG, dpi=150, bbox_inches='tight', facecolor=DARK_BG)
    print(f"\n[+] Saved plot -> {OUT_PNG}")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main():
    print("Serial FFT — 4-Case Hardware Simulation")
    print("=" * 60)

    setup_sim()

    # Define the 4 test cases
    test_cases_input = [
        signal_impulse(),
        signal_sine(bin_k=50),
        signal_multitone(bins=(50, 200, 450)),
        signal_chirp(f_start=0, f_end=511),
    ]

    results = []
    for re_in, im_in, label in test_cases_input:
        hw_re, hw_im, exp = run_sim(re_in, im_in, label)
        results.append((label, re_in, im_in, hw_re, hw_im, exp))

    print("\n[*] All simulations complete. Generating plot...")
    plot_all(results)
    print("[OK] Done.")


if __name__ == "__main__":
    main()
