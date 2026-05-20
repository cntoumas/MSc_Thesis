#!/usr/bin/env python3
"""
Serial FFT Hardware Verification Script
======================================
Runs a single-tone verification for the Serial FFT processor, using
the project root as the simulation working directory so ROM and
stimulus files are found. Produces a dark-themed verification PNG
similar to the Parallel verification script.
"""

import os
import sys
import shutil
from pathlib import Path
import subprocess

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
N = 1024
LOG2_N = 10
TONE_BIN = 50
AMPLITUDE = 10000
DATA_BITS = 17          # 17-bit signed registers in testbench (DATA_WIDTH + 1)
DATA_WIDTH = 16         # Nominal data width (matches fft_top parameter)
TWIDDLE_WIDTH = 16
FRAC_BITS = DATA_WIDTH - 1
NUM_STAGES = LOG2_N     # R2 DIF stages
CLK_PERIOD = 10         # ns

SRC_DIR = os.path.dirname(os.path.abspath(__file__))
PROJ_DIR = os.path.dirname(SRC_DIR)  # project root containing rtl/, tb/, rom/
ROM_DIR = os.path.join(PROJ_DIR, "rom")

MEM_FILE_RE = os.path.join(PROJ_DIR, "stimulus_re.mem")
MEM_FILE_IM = os.path.join(PROJ_DIR, "stimulus_im.mem")
HW_OUTPUT_FILE = os.path.join(PROJ_DIR, "hw_output.csv")
HW_EXPONENT_FILE = os.path.join(PROJ_DIR, "hw_exponent.txt")


def bit_reverse(x, num_bits):
    result = 0
    for _ in range(num_bits):
        result = (result << 1) | (x & 1)
        x >>= 1
    return result


def bit_reverse_permutation(data_re, data_im, num_bits):
    n = len(data_re)
    out_re = np.zeros(n, dtype=data_re.dtype)
    out_im = np.zeros(n, dtype=data_im.dtype)
    for i in range(n):
        j = bit_reverse(i, num_bits)
        out_re[i] = data_re[j]
        out_im[i] = data_im[j]
    return out_re, out_im


def unbit_reverse_fft(hw_fft):
    """
    Un-bit-reverse FFT output if hardware outputs in bit-reversed order.
    If hardware[BR(i)] contains bin i, then result[i] = hardware[BR(i)].
    """
    n = len(hw_fft)
    log2n = n.bit_length() - 1
    result = np.zeros_like(hw_fft)
    
    for i in range(n):
        br_i = bit_reverse(i, log2n)
        result[i] = hw_fft[br_i]
    
    return result


def generate_sinusoidal_signal():
    n = np.arange(N)
    x_re = np.round(AMPLITUDE * np.sin(2 * np.pi * TONE_BIN * n / N)).astype(int)
    x_im = np.zeros(N, dtype=int)
    return x_re, x_im


def write_mem_file(signal_re, signal_im):
    def write_single_file(filename, signal):
        with open(filename, "w") as f:
            for val in signal:
                if val < 0:
                    val_unsigned = (1 << DATA_BITS) + val
                else:
                    val_unsigned = val
                f.write(f"{val_unsigned:05X}\n")
        print(f"[+] Wrote {N} samples to {filename}")

    write_single_file(MEM_FILE_RE, signal_re)
    write_single_file(MEM_FILE_IM, signal_im)


def run_simulation(timeout=300):
    """Compile Verilog from project root and run the simulation there."""
    # Make sure the ROM files are visible in the working directory for $readmemh
    cos_src = os.path.join(ROM_DIR, "cos.mem")
    sin_src = os.path.join(ROM_DIR, "sin.mem")
    cos_dst = os.path.join(PROJ_DIR, "cos.mem")
    sin_dst = os.path.join(PROJ_DIR, "sin.mem")
    if os.path.exists(cos_src) and os.path.exists(sin_src):
        try:
            shutil.copy(cos_src, cos_dst)
            shutil.copy(sin_src, sin_dst)
            print(f"  [+] Copied ROM files to project root: {cos_dst}, {sin_dst}")
        except Exception as e:
            print(f"  [WARN] Failed to copy ROM files: {e}")
    else:
        print("  [WARN] ROM files missing in rom/ — twiddle ROM may fail to initialize")

    # Build verilog file list: tb/ then all rtl/*.v
    rtl_dir = os.path.join(PROJ_DIR, "rtl")
    tb_dir = os.path.join(PROJ_DIR, "tb")
    if not os.path.isdir(rtl_dir) or not os.path.isdir(tb_dir):
        print("[ERROR] rtl/ or tb/ missing in project root")
        sys.exit(1)

    rtl_files = sorted([f for f in os.listdir(rtl_dir) if f.endswith('.v')])
    # Use AXI testbench: streams natural-order input via S_AXIS and writes
    # all 1024 output bins via M_AXIS (no bank0 stripe limitation).
    verilog_files = [os.path.join("tb", "fft_axi_tb_xc7.v")] + \
                    [os.path.join("rtl", f) for f in rtl_files]

    cmd = ["iverilog", "-o", "fft_axi_sim"] + verilog_files
    print("  CMD:", " ".join(cmd))
    r = subprocess.run(cmd, cwd=PROJ_DIR, capture_output=True, text=True)
    if r.returncode != 0:
        print("[!] Compilation failed:\n", r.stderr)
        sys.exit(1)
    if r.stderr.strip():
        print("  [WARN] Compilation warnings:\n", r.stderr)
    print("  [OK] Compilation successful")

    # Run simulation and measure time
    import time
    print("[*] Running simulation (this may take a while)...")
    t0 = time.time()
    r = subprocess.run(["vvp", "fft_axi_sim"], cwd=PROJ_DIR, capture_output=True, text=True, timeout=timeout)
    elapsed = time.time() - t0
    if r.returncode != 0:
        print("[!] Simulation failed:\n", r.stderr)
        sys.exit(1)

    # Print informative sim lines
    for ln in r.stdout.strip().split('\n'):
        s = ln.strip()
        if not s:
            continue
        if any(k in s for k in ("Written", "Exponent", "FFT" , ">>>", "===")):
            print("    ", s)

    print(f"[+] Simulation finished in {elapsed:.2f}s")
    return elapsed


def read_hardware_output():
    if not os.path.exists(HW_OUTPUT_FILE):
        print(f"[!] Hardware output file not found: {HW_OUTPUT_FILE}")
        sys.exit(1)

    hw_re = []
    hw_im = []
    def _safe(v):
        v = v.strip().lower()
        return 0 if ('x' in v or 'z' in v or not v) else int(v)
    with open(HW_OUTPUT_FILE, 'r') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            parts = line.split(',')
            hw_re.append(_safe(parts[0]))
            hw_im.append(_safe(parts[1]))

    hw_re = np.array(hw_re, dtype=np.float64)
    hw_im = np.array(hw_im, dtype=np.float64)

    exponent = 0
    if os.path.exists(HW_EXPONENT_FILE):
        with open(HW_EXPONENT_FILE, 'r') as f:
            try:
                exponent = int(f.read().strip())
            except Exception:
                exponent = 0

    print(f"[+] Read {len(hw_re)} bins from hardware. Exponent={exponent}")
    return hw_re, hw_im, exponent


def generate_reference():
    """Create reference inputs and FFTs for Impulse, DC and Sine tests."""
    refs = {}
    # Test 0: Impulse (match parallel script amplitude)
    x0 = np.zeros(N, dtype=complex)
    x0[0] = 2048
    refs[0] = {"input_re": x0.real.astype(int), "input_im": x0.imag.astype(int), "fft": np.fft.fft(x0)}

    # Test 1: DC
    x1 = np.full(N, 2048, dtype=complex)
    refs[1] = {"input_re": x1.real.astype(int), "input_im": x1.imag.astype(int), "fft": np.fft.fft(x1)}

    # Test 2: Single-tone sine (bin TONE_BIN)
    sine_amp = 2048
    tone_bin = TONE_BIN
    x2 = np.array([int(round(sine_amp * np.sin(2 * np.pi * tone_bin * n / N))) for n in range(N)], dtype=complex)
    refs[2] = {"input_re": x2.real.astype(int), "input_im": x2.imag.astype(int), "fft": np.fft.fft(x2)}

    return refs


def compute_sqnr(ref, hw):
    n = min(len(ref), len(hw))
    if n == 0:
        return -np.inf
    ref_t = ref[:n]
    hw_t = hw[:n]
    signal_power = np.mean(np.abs(ref_t) ** 2)
    noise = ref_t - hw_t
    noise_power = np.mean(np.abs(noise) ** 2)
    if noise_power < 1e-20:
        return 120.0
    if signal_power < 1e-20:
        return 0.0
    return 10 * np.log10(signal_power / noise_power)


def compute_metrics_all(results):
    """Compute derived metrics for each test and return structured results."""
    out = {}
    for tid, r in results.items():
        ref = r["ref_fft"]
        hw = r["hw_fft"]
        n = min(len(ref), len(hw))

        # Truncate
        ref_t = ref[:n]
        hw_t = hw[:n]

        # Errors
        err = ref_t - hw_t
        max_err = np.max(np.abs(err)) if n > 0 else -1
        rms_err = np.sqrt(np.mean(np.abs(err) ** 2)) if n > 0 else -1

        # SQNR
        sqnr = compute_sqnr(ref_t, hw_t)

        # Peak
        hw_mag = np.abs(hw_t)
        ref_mag = np.abs(ref_t)
        peak_hw = int(np.argmax(hw_mag)) if n > 0 else -1
        peak_ref = int(np.argmax(ref_mag)) if n > 0 else -1
        peak_match = (peak_hw == peak_ref)

        # Basic pass criteria
        passed = (n >= N // 2) and (sqnr > 10)

        out[tid] = {
            "name": r["name"],
            "pass": passed,
            "sqnr_db": sqnr,
            "max_err": float(max_err),
            "rms_err": float(rms_err),
            "num_outputs": n,
            # Serial architecture: N/2 butterflies/stage × LOG2_N stages + drain
            "total_cycles": (N // 2 + 10) * LOG2_N,
            "throughput_msps": round(N / (((N // 2 + 10) * LOG2_N) * CLK_PERIOD * 1e-9) / 1e6, 1),
            "bfp_final": r.get("bfp_final", 0),
            "peak_hw": peak_hw,
            "peak_ref": peak_ref,
            "peak_match": peak_match,
            "hw_fft": hw_t,
            "ref_fft": ref_t,
            "hw_mag": hw_mag,
            "ref_mag": ref_mag,
        }
    return out


def save_metrics_csv(results, sim_time):
    csv_path = os.path.join(SRC_DIR, "fft_metrics.csv")
    import csv
    with open(csv_path, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["Test", "Pass", "SQNR_dB", "Max_Error", "RMS_Error", "Num_Outputs", "BFP_Final"])
        for tid, r in results.items():
            w.writerow([r["name"], r["pass"], f"{r['sqnr_db']:.2f}", f"{r['max_err']:.2f}", f"{r['rms_err']:.2f}", r["num_outputs"], r["bfp_final"]])
    print(f"[+] Saved metrics CSV to {csv_path}")


def generate_report_png_all(results):
    # Create a report similar to Parallel's, dark themed
    try:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
        from matplotlib.gridspec import GridSpec
    except Exception:
        print("[!] matplotlib not available for plotting")
        return

    test_ids = sorted(results.keys())
    n_tests = len(test_ids)
    rows = n_tests + 1
    fig = plt.figure(figsize=(20, max(8, 4 * rows)), facecolor="#0d1117")
    gs = GridSpec(rows, 3, figure=fig, hspace=0.45, wspace=0.35,
                  left=0.06, right=0.94, top=0.92, bottom=0.04)
    text_color = "#c9d1d9"
    accent_colors = ["#58a6ff", "#3fb950", "#f0883e"]
    grid_color = "#21262d"

    bg_color = "#161b22"

    fig.suptitle("1024-pt Serial SDF Radix-2 DIF FFT — Verification Report",
                 fontsize=20, fontweight="bold", color="#58a6ff", y=0.97)

    # Params box
    ax_params = fig.add_subplot(gs[0, 0])
    ax_params.set_facecolor(bg_color)
    ax_params.axis("off")
    param_text = (
        f"{'─' * 32}\n"
        f"  Architecture Parameters\n"
        f"{'─' * 32}\n"
        f"  FFT Points:      {N}\n"
        f"  Data Width:      {DATA_WIDTH} bits\n"
        f"  Twiddle Width:   {TWIDDLE_WIDTH} bits\n"
        f"  Frac Bits:       {FRAC_BITS}\n"
        f"  Parallelism:     1\n"
        f"  R2 DIF Stages:   {NUM_STAGES}\n"
        f"  BFP Enabled:     Yes\n"
        f"  Clock Period:    {CLK_PERIOD} ns\n"
        f"{'─' * 32}"
    )
    ax_params.text(0.05, 0.95, param_text, transform=ax_params.transAxes,
                   fontsize=10, fontfamily="monospace", color=text_color,
                   verticalalignment="top",
                   bbox=dict(boxstyle="round,pad=0.5", facecolor="#0d1117", edgecolor="#30363d", alpha=0.9))

    # Summary table
    ax_summary = fig.add_subplot(gs[0, 1:])
    ax_summary.set_facecolor(bg_color)
    ax_summary.axis("off")
    col_labels = ["Test", "Status", "SQNR (dB)", "Peak Match",
                  "Outputs", "Cycles", "MSPS", "BFP Exp"]
    table_data = []
    cell_colors = []
    for tid in test_ids:
        r = results[tid]
        status = "\u2713 PASS" if r["pass"] else "\u2717 FAIL"
        row = [
            r["name"], status,
            f"{r['sqnr_db']:.1f}", "\u2713" if r["peak_match"] else "\u2717",
            str(r["num_outputs"]), str(r["total_cycles"]),
            f"{r['throughput_msps']:.1f}", str(r["bfp_final"]),
        ]
        table_data.append(row)
        sc = "#1a3a1a" if r["pass"] else "#3a1a1a"
        cell_colors.append([sc] * len(col_labels))

    tbl = ax_summary.table(cellText=table_data, colLabels=col_labels,
                           cellColours=cell_colors, colColours=["#21262d"] * len(col_labels),
                           loc="center", cellLoc="center")
    tbl.auto_set_font_size(False)
    tbl.set_fontsize(9)
    tbl.scale(1, 1.6)
    for key, cell in tbl.get_celld().items():
        cell.set_edgecolor("#30363d")
        cell.set_text_props(color=text_color, fontfamily="monospace")
        if key[0] == 0:
            cell.set_text_props(color="#58a6ff", fontweight="bold", fontfamily="monospace")

    # Per-test rows
    for idx, tid in enumerate(test_ids):
        r = results[tid]
        color = accent_colors[idx % len(accent_colors)]
        if r["num_outputs"] == 0:
            ax = fig.add_subplot(gs[idx + 1, :])
            ax.set_facecolor(bg_color)
            ax.text(0.5, 0.5, f"Test {tid}: {r['name']} — NO DATA",
                    transform=ax.transAxes, ha="center", va="center",
                    fontsize=16, color="#f85149")
            continue

        n = r["num_outputs"]
        bins = np.arange(n)

        # Magnitude
        ax_mag = fig.add_subplot(gs[idx + 1, 0])
        ax_mag.set_facecolor(bg_color)
        ref_mag = np.abs(r["ref_fft"][:n])
        hw_mag = np.abs(r["hw_fft"][:n])
        ax_mag.plot(bins, ref_mag, color="#8b949e", linewidth=1.5,
                    label="NumPy Ref", alpha=0.7, linestyle="--")
        ax_mag.plot(bins, hw_mag, color=color, linewidth=1.2,
                    label="Hardware", alpha=0.9)
        ax_mag.set_title(f"{r['name']} — Magnitude", color=text_color, fontsize=10)
        ax_mag.set_xlabel("Bin", color=text_color, fontsize=8)
        ax_mag.set_ylabel("|X[k]|", color=text_color, fontsize=8)
        ax_mag.legend(fontsize=7, facecolor=bg_color, edgecolor="#30363d",
                      labelcolor=text_color)
        ax_mag.tick_params(colors=text_color, labelsize=7)
        for spine in ax_mag.spines.values():
            spine.set_color(grid_color)
        ax_mag.grid(True, color=grid_color, alpha=0.3)

        # Error
        ax_err = fig.add_subplot(gs[idx + 1, 1])
        ax_err.set_facecolor(bg_color)
        err = r["ref_fft"][:n] - r["hw_fft"][:n]
        ax_err.stem(bins, np.abs(err), linefmt=color, markerfmt="o",
                    basefmt=grid_color)
        ax_err.set_title(f"{r['name']} — |Error|", color=text_color, fontsize=10)
        ax_err.set_xlabel("Bin", color=text_color, fontsize=8)
        ax_err.set_ylabel("|Err|", color=text_color, fontsize=8)
        ax_err.tick_params(colors=text_color, labelsize=7)
        for spine in ax_err.spines.values():
            spine.set_color(grid_color)
        ax_err.grid(True, color=grid_color, alpha=0.3)

        # dB
        ax_db = fig.add_subplot(gs[idx + 1, 2])
        ax_db.set_facecolor(bg_color)
        eps = 1e-10
        ref_db = 20 * np.log10(ref_mag + eps)
        hw_db = 20 * np.log10(hw_mag + eps)
        ax_db.plot(bins, ref_db, color="#8b949e", linewidth=1.5,
                   label="Ref (dB)", alpha=0.7, linestyle="--")
        ax_db.plot(bins, hw_db, color=color, linewidth=1.2,
                   label="HW (dB)", alpha=0.9)
        ax_db.set_title(f"{r['name']} — Spectrum (dB)", color=text_color, fontsize=10)
        ax_db.set_xlabel("Bin", color=text_color, fontsize=8)
        ax_db.set_ylabel("dB", color=text_color, fontsize=8)
        ax_db.legend(fontsize=7, facecolor=bg_color, edgecolor="#30363d",
                     labelcolor=text_color)
        ax_db.tick_params(colors=text_color, labelsize=7)
        for spine in ax_db.spines.values():
            spine.set_color(grid_color)
        ax_db.grid(True, color=grid_color, alpha=0.3)

    out_path = os.path.join(SRC_DIR, "fft_verification.png")
    fig.savefig(out_path, dpi=150, facecolor=fig.get_facecolor())
    plt.close(fig)
    print(f"[+] Saved: {out_path}")


def generate_report_png(signal_re, hw_re, hw_im, exponent, ref_re, ref_im):
    # Rescale
    scale = 2.0 ** exponent
    hw_re_s = hw_re * scale
    hw_im_s = hw_im * scale
    hw_mag = np.sqrt(hw_re_s**2 + hw_im_s**2)
    ref_mag = np.abs(ref_re + 1j * ref_im)
    bins = np.arange(N)

    fig = plt.figure(figsize=(18, 10), facecolor="#0d1117")
    gs = GridSpec(2, 3, figure=fig, hspace=0.45, wspace=0.35,
                  left=0.06, right=0.94, top=0.92, bottom=0.05)
    text_color = "#c9d1d9"
    accent = "#FF5722"
    bg_color = "#0d1117"
    grid_color = "#21262d"

    fig.suptitle("1024-Point FFT Hardware Verification", fontsize=18,
                 fontweight='bold', color="#58a6ff", y=0.96)

    # Params
    ax_params = fig.add_subplot(gs[0, 0])
    ax_params.axis('off')
    param_text = (
        f"FFT Points: {N}\n"
        f"Data Width: 16 bits\n"
        f"Twiddle W:  16 bits\n"
        f"Tone bin:    {TONE_BIN}\n"
        f"BFP Exponent:{exponent}\n"
    )
    ax_params.text(0, 1, param_text, transform=ax_params.transAxes,
                   fontsize=11, fontfamily='monospace', color=text_color,
                   verticalalignment='top', bbox=dict(facecolor=bg_color, edgecolor="#30363d", pad=8))

    # Spectrum linear
    ax_mag = fig.add_subplot(gs[0, 1:])
    ax_mag.set_facecolor(bg_color)
    ax_mag.plot(bins[:N//2], ref_mag[:N//2], color="#8b949e", linestyle='--', label='NumPy Ref')
    ax_mag.plot(bins[:N//2], hw_mag[:N//2], color=accent, label='Hardware')
    ax_mag.set_title('Magnitude Spectrum — First Half', color=text_color)
    ax_mag.legend(facecolor=bg_color, edgecolor="#30363d", labelcolor=text_color)
    ax_mag.tick_params(colors=text_color)
    ax_mag.grid(True, color=grid_color, alpha=0.3)

    # Zoom
    ax_zoom = fig.add_subplot(gs[1, 0])
    zoom_start = max(0, TONE_BIN - 10)
    zoom_end = min(N, TONE_BIN + 11)
    zb = np.arange(zoom_start, zoom_end)
    ax_zoom.bar(zb - 0.15, ref_mag[zoom_start:zoom_end], width=0.3, color="#4CAF50", label='Ref')
    ax_zoom.bar(zb + 0.15, hw_mag[zoom_start:zoom_end], width=0.3, color=accent, label='HW')
    ax_zoom.set_title(f'Zoomed: Bins {zoom_start}-{zoom_end-1}', color=text_color)
    ax_zoom.tick_params(colors=text_color)
    ax_zoom.grid(True, color=grid_color, alpha=0.3)
    ax_zoom.legend(facecolor=bg_color, edgecolor="#30363d", labelcolor=text_color)

    # dB
    ax_db = fig.add_subplot(gs[1, 1])
    eps = 1e-10
    ref_db = 20 * np.log10(ref_mag + eps)
    hw_db = 20 * np.log10(hw_mag + eps)
    ax_db.plot(bins[:N//2], ref_db[:N//2], color="#8b949e", linestyle='--')
    ax_db.plot(bins[:N//2], hw_db[:N//2], color=accent)
    ax_db.set_title('Magnitude (dB, first half)', color=text_color)
    ax_db.tick_params(colors=text_color)
    ax_db.grid(True, color=grid_color, alpha=0.3)

    # Error
    ax_err = fig.add_subplot(gs[1, 2])
    error_mag = np.sqrt((hw_re_s - ref_re)**2 + (hw_im_s - ref_im)**2)
    ax_err.semilogy(bins[:N//2], np.maximum(error_mag[:N//2], 1e-3), color="#9C27B0")
    ax_err.set_title('Absolute Error |HW − Reference| (log)', color=text_color)
    ax_err.tick_params(colors=text_color)
    ax_err.grid(True, color=grid_color, alpha=0.3)

    peak_hw = np.argmax(hw_mag)
    peak_ref = np.argmax(ref_mag)
    stats = (
        f"Peak HW: {peak_hw}\nPeak Ref: {peak_ref}\n"
        f"Max Err: {np.max(error_mag):.1f}\nRMS Err: {np.sqrt(np.mean(error_mag**2)):.1f}"
    )
    ax_mag.text(0.02, 0.02, stats, transform=ax_mag.transAxes, fontsize=10,
                fontfamily='monospace', color=text_color,
                bbox=dict(facecolor=bg_color, edgecolor="#30363d", pad=6, alpha=0.9))

    out_png = os.path.join(SRC_DIR, "fft_verification.png")
    fig.savefig(out_png, dpi=150, facecolor=fig.get_facecolor(), bbox_inches='tight')
    plt.close(fig)
    print(f"[+] Saved plot to {out_png}")


def main():
    print("\n" + "=" * 60)
    print("  1024-Point Serial FFT VERIFICATION")
    print("=" * 60)

    # Prepare references for the three tests
    refs = generate_reference()

    raw_results = {}
    sim_times = {}

    # Run each test: write mem, simulate, read output
    for tid, data in refs.items():
        name = "Impulse" if tid == 0 else ("DC" if tid == 1 else "Sine")
        print(f"\n[TEST {tid}] {name}: preparing stimulus and running simulation...")

        # AXI top accepts natural-order time samples and emits natural-order
        # bins — no input bit-reversal needed (it's handled internally).
        sig_re = data["input_re"].astype(int)
        sig_im = data["input_im"].astype(int)
        write_mem_file(sig_re, sig_im)

        # Run simulation and capture elapsed time
        sim_time = run_simulation()
        sim_times[tid] = sim_time

        # Read hardware output and assemble complex bins
        hw_re, hw_im, exponent = read_hardware_output()
        hw_complex = (hw_re + 1j * hw_im) * (2.0 ** exponent)
        
        # With bit-reversed input, Pease AGU produces natural-order output
        # No un-bit-reversal needed

        raw_results[tid] = {
            "name": name,
            "ref_fft": data["fft"],
            "hw_fft": hw_complex,
            "bfp_final": exponent,
        }

    # Compute metrics and produce report
    results = compute_metrics_all(raw_results)
    total_sim_time = sum(sim_times.values())
    save_metrics_csv(results, total_sim_time)
    generate_report_png_all(results)

    print("\nVerification complete")


if __name__ == "__main__":
    main()
