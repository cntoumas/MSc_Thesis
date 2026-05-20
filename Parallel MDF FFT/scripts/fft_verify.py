#!/usr/bin/env python3
"""
FFT Verification Script for 1024-pt P=4 MDF Radix-2 DIF Architecture
Compiles Verilog, runs simulation, compares against NumPy reference,
computes metrics (SQNR, throughput, errors), generates CSV + PNG report.
"""
import subprocess, sys, os, csv, math, time
import numpy as np

# Force UTF-8 stdout/stderr so Unicode chars don't crash on Windows cp1253
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

# ============================================================
# CONFIGURATION
# ============================================================
SRC_DIR = os.path.dirname(os.path.abspath(__file__))
VERILOG_FILES = [
    "../rtl/bit_reverse.v",
    "../rtl/block_scaler.v", 
    "../rtl/butterfly_r2.v",
    "../rtl/complex_mult.v",
    "../rtl/delay_line.v",
    "../rtl/fft_stage_fb.v",
    "../rtl/fft_stage_nf.v",
    "../rtl/fft_top.v",
    "../rtl/overflow_detect.v",
    "../rtl/twiddle_rom.v",
    "../tb/tb_fft_top.v",
]
TB_MODULE = "tb_fft_top"
SIM_OUT = "fft_sim"
VCD_FILE = "fft_verify.vcd"

# Match testbench parameters
DATA_WIDTH = 16
TWIDDLE_WIDTH = 16
FFT_POINTS = 1024
PARALLELISM = 4
BFP_ENABLED = 1
CLK_PERIOD = 10  # ns
FRAC_BITS = DATA_WIDTH - 1
SCALE = 1 << FRAC_BITS

TEST_NAMES = {0: "Impulse", 1: "DC", 2: "Sine", 3: "MultiTone", 4: "Chirp"}

# ============================================================
# STEP 1: Compile Verilog
# ============================================================
def compile_verilog():
    print("=" * 60)
    print("STEP 1: Compiling Verilog with Icarus Verilog")
    print("=" * 60)
    srcs = [os.path.join(SRC_DIR, f) for f in VERILOG_FILES]
    for s in srcs:
        if not os.path.isfile(s):
            print(f"  [ERROR] Missing file: {s}")
            return False
        print(f"  [OK] {os.path.basename(s)}")

    cmd = ["iverilog", "-gsystem-verilog", "-o", SIM_OUT, "-s", TB_MODULE] + srcs
    print(f"\n  CMD: {' '.join(cmd)}")
    r = subprocess.run(cmd, cwd=SRC_DIR, capture_output=True, text=True)
    if r.returncode != 0:
        print(f"  [COMPILE ERROR]\n{r.stderr}")
        return False
    if r.stderr.strip():
        print(f"  [WARNINGS]\n{r.stderr}")
    print("  [OK] Compilation successful")
    return True

# ============================================================
# STEP 2: Run Simulation
# ============================================================
def run_simulation():
    print("\n" + "=" * 60)
    print("STEP 2: Running Simulation")
    print("=" * 60)
    exe = os.path.join(SRC_DIR, SIM_OUT)
    if sys.platform == "win32":
        exe += ".exe" if not exe.endswith(".exe") else ""
        # iverilog on windows may produce .vvp or direct exe
        if not os.path.isfile(exe):
            exe = os.path.join(SRC_DIR, SIM_OUT)
    
    # Try vvp first (standard iverilog flow)
    cmd = ["vvp", os.path.join(SRC_DIR, SIM_OUT)]
    print(f"  CMD: {' '.join(cmd)}")
    # Run from project root directory so ROM files can be found
    project_dir = os.path.dirname(SRC_DIR)
    t0 = time.time()
    # Increase timeout to allow longer simulations on slower hosts
    r = subprocess.run(cmd, cwd=project_dir, capture_output=True, text=True, timeout=600)
    elapsed = time.time() - t0
    
    if r.returncode != 0:
        print(f"  [SIM ERROR]\n{r.stderr}")
        return False, "", 0
    
    print(f"  [OK] Simulation finished in {elapsed:.2f}s")
    # Print sim output for debugging
    for line in r.stdout.strip().split("\n"):
        if line.strip():
            print(f"  SIM: {line}")
    return True, r.stdout, elapsed

# ============================================================
# STEP 3: Generate Reference (NumPy)
# ============================================================
def generate_reference():
    print("\n" + "=" * 60)
    print("STEP 3: Generating NumPy Reference")
    print("=" * 60)
    refs = {}

    # Test 0: Impulse - match testbench input of 1000
    x0 = np.zeros(FFT_POINTS, dtype=complex)
    x0[0] = 2048  # Match testbench impulse_word[0*2*DW +: DW] = 16'sd2048
    refs[0] = {"input": x0, "fft": np.fft.fft(x0)}

    # Test 1: DC input - match testbench input of 100
    x1 = np.full(FFT_POINTS, 2048, dtype=complex)  # Match cur_word[jj*2*DW +: DW] = 16'sd2048
    refs[1] = {"input": x1, "fft": np.fft.fft(x1)}

    # Test 2: Single-tone sine wave (exact bin), choose amplitude
    # so it survives the unconditional block-scaling (multiple of 2^10).
    sine_amp = 2048
    tone_bin = 50  # Bin index for the sine wave (0..1023)
    x2 = np.array([int(round(sine_amp * np.sin(2 * np.pi * tone_bin * n / FFT_POINTS)))
                   for n in range(FFT_POINTS)], dtype=complex)
    refs[2] = {"input": x2, "fft": np.fft.fft(x2)}

    # Test 3: Multi-tone — 3 sines at bins 50, 200, 450, amplitude 600 each
    multi_amp = 600
    bins_multi = [50, 200, 450]
    x3 = np.zeros(FFT_POINTS, dtype=complex)
    for n in range(FFT_POINTS):
        s = sum(multi_amp * np.sin(2 * np.pi * b * n / FFT_POINTS) for b in bins_multi)
        x3[n] = int(round(s))
    refs[3] = {"input": x3, "fft": np.fft.fft(x3)}

    # Test 4: Linear chirp — frequency sweep from bin 0 to bin 511, amp 2048
    chirp_amp = 2048
    f0, f1 = 0.0, 511.0
    x4 = np.zeros(FFT_POINTS, dtype=complex)
    for n in range(FFT_POINTS):
        phase = 2 * np.pi * (f0 + (f1 - f0) * n / (2.0 * FFT_POINTS)) * n / FFT_POINTS
        x4[n] = int(round(chirp_amp * np.sin(phase)))
    refs[4] = {"input": x4, "fft": np.fft.fft(x4)}

    for tid, data in refs.items():
        mag = np.abs(data["fft"])
        peak_bin = np.argmax(mag)
        print(f"  Test {tid} ({TEST_NAMES[tid]}): peak at bin {peak_bin}, "
              f"mag={mag[peak_bin]:.1f}, DC={mag[0]:.1f}")
    return refs

# ============================================================
# STEP 4: Parse Simulation Output
# ============================================================
def parse_outputs():
    print("\n" + "=" * 60)
    print("STEP 4: Parsing Simulation CSV Outputs")
    print("=" * 60)
    
    hw_data = {0: [], 1: [], 2: [], 3: [], 4: []}
    params = {}
    
    # Parse params
    pfile = os.path.join(SRC_DIR, "../fft_params.csv")  # CSV files are in project root
    if os.path.isfile(pfile):
        with open(pfile) as f:
            reader = csv.DictReader(f)
            for row in reader:
                params[row["param"]] = int(row["value"])
        print(f"  Params: {params}")
    else:
        print("  [WARN] fft_params.csv not found, using defaults")
    
    # Parse outputs — handle 'x' (undefined) values from iverilog
    def safe_int(val):
        """Parse integer from simulation output, treating 'x'/'z' as 0."""
        v = val.strip().lower()
        if 'x' in v or 'z' in v or v == '':
            return 0, True  # value, is_undefined
        return int(v), False

    ofile = os.path.join(SRC_DIR, "../fft_output.csv")  # CSV files are in project root
    if not os.path.isfile(ofile):
        print("  [ERROR] fft_output.csv not found!")
        return hw_data, params
    
    x_counts = {0: 0, 1: 0, 2: 0, 3: 0, 4: 0}
    with open(ofile) as f:
        reader = csv.DictReader(f)
        for row in reader:
            tid = int(row["test_id"])
            o0r, x0r = safe_int(row["out0_r"])
            o0i, x0i = safe_int(row["out0_i"])
            o1r, x1r = safe_int(row["out1_r"])
            o1i, x1i = safe_int(row["out1_i"])
            o2r, x2r = safe_int(row["out2_r"])
            o2i, x2i = safe_int(row["out2_i"])
            o3r, x3r = safe_int(row["out3_r"])
            o3i, x3i = safe_int(row["out3_i"])
            bfp, _ = safe_int(row["bfp_exp"])
            tns, _ = safe_int(row["time_ns"])
            
            has_x = x0r or x0i or x1r or x1i or x2r or x2i or x3r or x3i
            if has_x:
                x_counts[tid] = x_counts.get(tid, 0) + 1
            
            hw_data[tid].append({
                "idx": int(row["sample_idx"]),
                "out0_r": o0r, "out0_i": o0i,
                "out1_r": o1r, "out1_i": o1i,
                "out2_r": o2r, "out2_i": o2i,
                "out3_r": o3r, "out3_i": o3i,
                "bfp_exp": bfp, "time_ns": tns,
                "has_x": has_x,
            })
    
    # Each test feeds 2 blocks; the first WORDS output-clock rows are the
    # warmup block. Keep only the second block (rows WORDS..2*WORDS-1).
    WORDS = FFT_POINTS // PARALLELISM   # 256
    for tid in hw_data:
        all_rows = hw_data[tid]
        hw_data[tid] = all_rows[WORDS:] if len(all_rows) >= 2 * WORDS else all_rows
        n = len(hw_data[tid])
        xn = x_counts.get(tid, 0)
        valid_n = n - xn
        print(f"  Test {tid}: {n} second-block samples ({valid_n} valid, {xn} undefined/x)")
        if n > 0:
            exps = set(s["bfp_exp"] for s in hw_data[tid])
            print(f"    BFP exponents seen: {sorted(exps)}")
        if xn > 0:
            print(f"    [WARN] {xn} samples contain undefined (x) values!")
    
    return hw_data, params

# ============================================================
# STEP 5: Reconstruct HW FFT & Compute Metrics
# ============================================================
def reconstruct_hw_fft(hw_samples):
    """Reconstruct complex FFT bins from parallel output samples.

    The MDF P=4 bit_reverse module emits bins on a stride-(N/P) layout:
        path p at output clock k → FFT bin (k + p * N/P)
    so the four parallel streams cover bins 0..255, 256..511, 512..767,
    768..1023 in natural order.
    """
    bins = np.zeros(FFT_POINTS, dtype=complex)
    stride = FFT_POINTS // PARALLELISM   # 256 for N=1024, P=4
    for k, s in enumerate(hw_samples[:stride]):
        scale = 2.0 ** s["bfp_exp"]
        bins[k + 0 * stride] = complex(s["out0_r"], s["out0_i"]) * scale
        bins[k + 1 * stride] = complex(s["out1_r"], s["out1_i"]) * scale
        bins[k + 2 * stride] = complex(s["out2_r"], s["out2_i"]) * scale
        bins[k + 3 * stride] = complex(s["out3_r"], s["out3_i"]) * scale
    return bins

def compute_sqnr(ref, hw):
    """Signal-to-Quantization-Noise Ratio in dB."""
    n = min(len(ref), len(hw))
    if n == 0:
        return -np.inf
    ref_t = ref[:n]
    hw_t = hw[:n]
    signal_power = np.mean(np.abs(ref_t) ** 2)
    noise = ref_t - hw_t
    noise_power = np.mean(np.abs(noise) ** 2)
    if noise_power < 1e-20:
        return 120.0  # Effectively perfect
    if signal_power < 1e-20:
        return 0.0
    return 10 * np.log10(signal_power / noise_power)

def compute_metrics(hw_data, refs):
    print("\n" + "=" * 60)
    print("STEP 5: Computing Verification Metrics")
    print("=" * 60)
    
    results = {}
    for tid in sorted(TEST_NAMES.keys()):
        hw_samples = hw_data.get(tid, [])
        ref_fft = refs[tid]["fft"]
        name = TEST_NAMES[tid]
        
        print(f"\n  --- Test {tid}: {name} ---")
        
        if len(hw_samples) == 0:
            print(f"    [FAIL] No HW output captured!")
            results[tid] = {
                "name": name, "pass": False, "sqnr_db": -999,
                "max_err_r": -1, "max_err_i": -1, "num_outputs": 0,
                "total_cycles": 0, "throughput_msps": 0, "bfp_final": 0,
                "peak_bin_hw": -1, "peak_bin_ref": -1, "peak_match": False,
            }
            continue
        
        # BFP exponent from last sample (for reporting only)
        bfp_final = hw_samples[-1]["bfp_exp"]
        
        # Reconstruct HW FFT output (already BFP scaled)
        hw_fft = reconstruct_hw_fft(hw_samples)
        
        # Timing
        if len(hw_samples) >= 2:
            t_first = hw_samples[0]["time_ns"]
            t_last = hw_samples[-1]["time_ns"]
            total_cycles = (t_last - t_first) // CLK_PERIOD + 1
        else:
            total_cycles = 0
        
        throughput = (FFT_POINTS / (total_cycles * CLK_PERIOD * 1e-9)) / 1e6 if total_cycles > 0 else 0
        
        # Truncate to common length
        n = min(len(hw_fft), len(ref_fft))
        hw_t = hw_fft[:n]
        ref_t = ref_fft[:n]
        
        # Errors
        err = ref_t - hw_t
        max_err_r = np.max(np.abs(err.real)) if n > 0 else -1
        max_err_i = np.max(np.abs(err.imag)) if n > 0 else -1
        rms_err = np.sqrt(np.mean(np.abs(err) ** 2)) if n > 0 else -1
        
        # SQNR
        sqnr = compute_sqnr(ref_t, hw_t)
        
        # Peak detection
        hw_mag = np.abs(hw_t)
        ref_mag = np.abs(ref_t)
        peak_hw = np.argmax(hw_mag)
        peak_ref = np.argmax(ref_mag)
        peak_match = (peak_hw == peak_ref)
        
        # Pass/fail criteria
        passed = (n >= FFT_POINTS // 2) and (sqnr > 10 or n < 4)
        
        print(f"    Outputs:     {n} / {FFT_POINTS}")
        print(f"    BFP exp:     {bfp_final}")
        print(f"    SQNR:        {sqnr:.2f} dB")
        print(f"    Max Err (R): {max_err_r:.2f}")
        print(f"    Max Err (I): {max_err_i:.2f}")
        print(f"    RMS Error:   {rms_err:.2f}")
        print(f"    Peak bin HW: {peak_hw}  Ref: {peak_ref}  Match: {peak_match}")
        print(f"    Cycles:      {total_cycles}")
        print(f"    Throughput:  {throughput:.2f} MSPS")
        print(f"    Result:      {'PASS' if passed else 'FAIL'}")
        
        results[tid] = {
            "name": name, "pass": passed, "sqnr_db": sqnr,
            "max_err_r": max_err_r, "max_err_i": max_err_i,
            "rms_err": rms_err, "num_outputs": n,
            "total_cycles": total_cycles, "throughput_msps": throughput,
            "bfp_final": bfp_final, "peak_bin_hw": peak_hw,
            "peak_bin_ref": peak_ref, "peak_match": peak_match,
            "hw_fft": hw_t, "ref_fft": ref_t, "hw_mag": hw_mag, "ref_mag": ref_mag,
        }
    
    return results

# ============================================================
# STEP 6: Save Metrics to CSV
# ============================================================
def save_metrics_csv(results, params, sim_time):
    print("\n" + "=" * 60)
    print("STEP 6: Saving Metrics CSV")
    print("=" * 60)
    
    csv_path = os.path.join(SRC_DIR, "fft_metrics.csv")
    with open(csv_path, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["Section", "Parameter", "Value"])
        
        # Architecture params
        w.writerow(["Architecture", "DATA_WIDTH", DATA_WIDTH])
        w.writerow(["Architecture", "TWIDDLE_WIDTH", TWIDDLE_WIDTH])
        w.writerow(["Architecture", "FFT_POINTS", FFT_POINTS])
        w.writerow(["Architecture", "PARALLELISM", PARALLELISM])
        w.writerow(["Architecture", "BFP_ENABLED", BFP_ENABLED])
        w.writerow(["Architecture", "FRAC_BITS", FRAC_BITS])
        w.writerow(["Architecture", "NUM_R2_STAGES", int(math.log2(FFT_POINTS))])
        w.writerow(["Architecture", "CLK_PERIOD_ns", CLK_PERIOD])
        w.writerow(["Simulation", "Sim_Wall_Time_s", f"{sim_time:.2f}"])
        
        # Per-test metrics
        for tid, r in results.items():
            pfx = f"Test{tid}_{r['name'].replace(' ', '_')}"
            w.writerow([pfx, "Pass", r["pass"]])
            w.writerow([pfx, "SQNR_dB", f"{r['sqnr_db']:.2f}"])
            w.writerow([pfx, "Max_Error_Real", f"{r['max_err_r']:.2f}"])
            w.writerow([pfx, "Max_Error_Imag", f"{r['max_err_i']:.2f}"])
            w.writerow([pfx, "RMS_Error", f"{r.get('rms_err', -1):.2f}"])
            w.writerow([pfx, "Num_Outputs", r["num_outputs"]])
            w.writerow([pfx, "Total_Cycles", r["total_cycles"]])
            w.writerow([pfx, "Throughput_MSPS", f"{r['throughput_msps']:.2f}"])
            w.writerow([pfx, "BFP_Final_Exponent", r["bfp_final"]])
            w.writerow([pfx, "Peak_Bin_HW", r["peak_bin_hw"]])
            w.writerow([pfx, "Peak_Bin_Ref", r["peak_bin_ref"]])
            w.writerow([pfx, "Peak_Match", r["peak_match"]])
    
    print(f"  Saved: {csv_path}")

# ============================================================
# STEP 7: Generate Verification PNG
# ============================================================
def generate_report_png(results, params):
    print("\n" + "=" * 60)
    print("STEP 7: Generating Verification Report PNG")
    print("=" * 60)
    
    try:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
        from matplotlib.gridspec import GridSpec
    except ImportError:
        print("  [ERROR] matplotlib not installed. Run: pip install matplotlib")
        return
    
    # Dynamic layout: one top row for params+summary, then one row per test
    n_tests = len(results)
    rows = n_tests + 1
    fig = plt.figure(figsize=(20, max(8, 4 * rows)), facecolor="#0d1117")
    fig.patch.set_facecolor("#0d1117")

    gs = GridSpec(rows, 3, figure=fig, hspace=0.45, wspace=0.35,
                  left=0.06, right=0.94, top=0.92, bottom=0.04)
    
    text_color = "#c9d1d9"
    accent_colors = ["#58a6ff", "#3fb950", "#f0883e"]
    grid_color = "#21262d"
    bg_color = "#161b22"
    
    # Title
    fig.suptitle("1024-pt P=4 MDF Radix-2 DIF FFT — Verification Report",
                 fontsize=20, fontweight="bold", color="#58a6ff", y=0.97)
    
    # --- Row 0: Parameter table + Summary ---
    ax_params = fig.add_subplot(gs[0, 0])
    ax_params.set_facecolor(bg_color)
    ax_params.axis("off")
    
    num_stages = int(math.log2(FFT_POINTS))
    param_text = (
        f"{'─' * 32}\n"
        f"  Architecture Parameters\n"
        f"{'─' * 32}\n"
        f"  FFT Points:      {FFT_POINTS}\n"
        f"  Data Width:      {DATA_WIDTH} bits\n"
        f"  Twiddle Width:   {TWIDDLE_WIDTH} bits\n"
        f"  Frac Bits:       {FRAC_BITS}\n"
        f"  Parallelism:     {PARALLELISM}\n"
        f"  R2 DIF Stages:   {num_stages}\n"
        f"  BFP Enabled:     {'Yes' if BFP_ENABLED else 'No'}\n"
        f"  Clock Period:    {CLK_PERIOD} ns\n"
        f"{'─' * 32}"
    )
    ax_params.text(0.05, 0.95, param_text, transform=ax_params.transAxes,
                   fontsize=10, fontfamily="monospace", color=text_color,
                   verticalalignment="top",
                   bbox=dict(boxstyle="round,pad=0.5", facecolor="#0d1117",
                             edgecolor="#30363d", alpha=0.9))
    
    # Summary table
    ax_summary = fig.add_subplot(gs[0, 1:])
    ax_summary.set_facecolor(bg_color)
    ax_summary.axis("off")
    
    col_labels = ["Test", "Status", "SQNR (dB)", "Peak Match",
                  "Outputs", "Cycles", "MSPS", "BFP Exp"]
    table_data = []
    cell_colors = []
    # Summary table: iterate over available tests
    test_ids = list(sorted(results.keys()))
    for tid in test_ids:
        r = results[tid]
        status = "✓ PASS" if r["pass"] else "✗ FAIL"
        row = [
            r["name"], status,
            f"{r['sqnr_db']:.1f}", "✓" if r["peak_match"] else "✗",
            str(r["num_outputs"]), str(r["total_cycles"]),
            f"{r['throughput_msps']:.1f}", str(r["bfp_final"]),
        ]
        table_data.append(row)
        sc = "#1a3a1a" if r["pass"] else "#3a1a1a"
        cell_colors.append([sc] * len(col_labels))
    
    tbl = ax_summary.table(cellText=table_data, colLabels=col_labels,
                           cellColours=cell_colors,
                           colColours=["#21262d"] * len(col_labels),
                           loc="center", cellLoc="center")
    tbl.auto_set_font_size(False)
    tbl.set_fontsize(9)
    tbl.scale(1, 1.6)
    for key, cell in tbl.get_celld().items():
        cell.set_edgecolor("#30363d")
        cell.set_text_props(color=text_color, fontfamily="monospace")
        if key[0] == 0:
            cell.set_text_props(color="#58a6ff", fontweight="bold", fontfamily="monospace")
    
    # --- Per-test plots (Magnitude, Error, dB) ---
    for tidx, tid in enumerate(test_ids):
        r = results[tid]
        color = accent_colors[tidx % len(accent_colors)]
        
        if r["num_outputs"] == 0:
            ax = fig.add_subplot(gs[tidx + 1, :])
            ax.set_facecolor(bg_color)
            ax.text(0.5, 0.5, f"Test {tid}: {r['name']} — NO DATA",
                    transform=ax.transAxes, ha="center", va="center",
                    fontsize=16, color="#f85149")
            continue
        
        n = r["num_outputs"]
        bins = np.arange(n)
        
        # Col 0: Magnitude comparison
        ax_mag = fig.add_subplot(gs[tidx + 1, 0])
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
        ax_mag.set_facecolor(bg_color)
        for spine in ax_mag.spines.values():
            spine.set_color(grid_color)
        ax_mag.grid(True, color=grid_color, alpha=0.3)
        
        # Col 1: Error
        ax_err = fig.add_subplot(gs[tidx + 1, 1])
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
        
        # Col 2: Magnitude in dB
        ax_db = fig.add_subplot(gs[tidx + 1, 2])
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
    print(f"  Saved: {out_path}")

# ============================================================
# MAIN
# ============================================================
def main():
    print("\n" + "=" * 60)
    print("  1024-pt P=4 MDF RADIX-2 DIF FFT - FULL VERIFICATION")
    print("=" * 60)
    print(f"  FFT_POINTS={FFT_POINTS}  DATA_WIDTH={DATA_WIDTH}  "
          f"PARALLELISM={PARALLELISM}  BFP={BFP_ENABLED}\n")
    
    # Step 1
    if not compile_verilog():
        print("\n[ABORT] Compilation failed.")
        sys.exit(1)
    
    # Step 2
    ok, sim_stdout, sim_time = run_simulation()
    if not ok:
        print("\n[ABORT] Simulation failed.")
        sys.exit(1)
    
    # Step 3
    refs = generate_reference()
    
    # Step 4
    hw_data, params = parse_outputs()
    
    # Step 5
    results = compute_metrics(hw_data, refs)
    
    # Step 6
    save_metrics_csv(results, params, sim_time)
    
    # Step 7
    generate_report_png(results, params)
    
    # Final Summary
    print("\n" + "=" * 60)
    print("  FINAL VERIFICATION SUMMARY")
    print("=" * 60)
    all_pass = True
    for tid in sorted(results.keys()):
        r = results[tid]
        status = "PASS" if r["pass"] else "FAIL"
        if not r["pass"]:
            all_pass = False
        print(f"  Test {tid} ({r['name']:20s}): {status}  "
              f"SQNR={r['sqnr_db']:7.2f} dB  "
              f"BFP_exp={r['bfp_final']}")
    
    print(f"\n  Overall: {'ALL TESTS PASSED' if all_pass else 'SOME TESTS FAILED'}")
    print(f"  Reports: fft_metrics.csv, fft_verification.png")
    print("=" * 60)
    
    return 0 if all_pass else 1

if __name__ == "__main__":
    sys.exit(main())
