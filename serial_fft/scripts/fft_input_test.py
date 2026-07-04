#!/usr/bin/env python3
"""
Test 1: Check if input bit-reversal is causing the output ordering issue
"""

import os
import sys
import numpy as np
import csv
import subprocess
import shutil
from pathlib import Path

# Force UTF-8 stdout/stderr so Unicode arrows/checkmarks don't crash on Windows cp1253
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

N = 1024
LOG2_N = 10
TONE_BIN = 50

PROJ_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC_DIR = os.path.dirname(os.path.abspath(__file__))
ROM_DIR = os.path.join(PROJ_DIR, "rom")

MEM_FILE_RE = os.path.join(PROJ_DIR, "stimulus_re.mem")
MEM_FILE_IM = os.path.join(PROJ_DIR, "stimulus_im.mem")
HW_OUTPUT_FILE = os.path.join(PROJ_DIR, "hw_output.csv")
HW_EXPONENT_FILE = os.path.join(PROJ_DIR, "hw_exponent.txt")


def bit_reverse(x, num_bits):
    """Bit-reverse an integer."""
    result = 0
    for _ in range(num_bits):
        result = (result << 1) | (x & 1)
        x >>= 1
    return result


def write_mem_file_br(data_re, data_im, br=True):
    """Write memory files with optional bit-reversal permutation."""
    if br:
        # Apply bit-reversal
        perm_re = np.zeros_like(data_re)
        perm_im = np.zeros_like(data_im)
        for i in range(len(data_re)):
            br_i = bit_reverse(i, LOG2_N)
            perm_re[br_i] = data_re[i]
            perm_im[br_i] = data_im[i]
        data_re = perm_re
        data_im = perm_im
    
    # Write to files
    with open(MEM_FILE_RE, 'w') as f:
        for val in data_re:
            f.write(f"{int(val) & 0xFFFF:04x}\n")
    
    with open(MEM_FILE_IM, 'w') as f:
        for val in data_im:
            f.write(f"{int(val) & 0xFFFF:04x}\n")
    
    br_str = "(BR-permuted)" if br else "(natural order)"
    print(f"  [+] Wrote stimulus files {br_str}")


def copy_rom_files():
    """Copy twiddle ROM files to project root."""
    cos_src = os.path.join(ROM_DIR, "cos.mem")
    sin_src = os.path.join(ROM_DIR, "sin.mem")
    cos_dst = os.path.join(PROJ_DIR, "cos.mem")
    sin_dst = os.path.join(PROJ_DIR, "sin.mem")
    
    if os.path.isfile(cos_src):
        shutil.copy(cos_src, cos_dst)
    if os.path.isfile(sin_src):
        shutil.copy(sin_src, sin_dst)
    
    print(f"  [+] Copied ROM files to project root")


SIM_BIN = "fft_axi_sim"

def run_simulation():
    """Compile and run the AXI-driven testbench (streams all 1024 bins)."""
    cmd = ["iverilog", "-o", SIM_BIN,
           "tb/fft_axi_tb_xc7.v", "rtl/AGU.v", "rtl/BFP_scanner.v",
           "rtl/BFP_shifter.v", "rtl/RAM.v", "rtl/butterfly_unit.v",
           "rtl/complex_mult.v", "rtl/fft_top.v", "rtl/twiddle_rom.v",
           "rtl/fft_axi_top.v"]

    print(f"  [+] Compiling (AXI testbench)...")
    r = subprocess.run(cmd, cwd=PROJ_DIR, capture_output=True, text=True)
    if r.returncode != 0:
        print(f"  [ERROR] Compilation failed:\n{r.stderr}")
        return False

    print(f"  [+] Running simulation...")
    r = subprocess.run(["vvp", SIM_BIN], cwd=PROJ_DIR, capture_output=True, text=True, timeout=120)
    if r.returncode != 0:
        print(f"  [ERROR] Simulation failed:\n{r.stderr}")
        return False
    
    # Print key lines from output
    for line in r.stdout.split("\n"):
        if "Exponent" in line or "Written" in line or "ERROR" in line:
            print(f"    {line.strip()}")
    
    return True


def read_hw_output():
    """Read hw_output.csv and hw_exponent.txt."""
    hw_re = []
    hw_im = []
    
    if not os.path.isfile(HW_OUTPUT_FILE):
        print(f"[ERROR] {HW_OUTPUT_FILE} not found")
        return None, None, None
    
    def _safe(v):
        v = v.strip().lower()
        return 0 if ('x' in v or 'z' in v or not v) else int(v)
    with open(HW_OUTPUT_FILE, 'r') as f:
        reader = csv.reader(f)
        for row in reader:
            if len(row) >= 2:
                hw_re.append(_safe(row[0]))
                hw_im.append(_safe(row[1]))
    
    exponent = 0
    if os.path.isfile(HW_EXPONENT_FILE):
        with open(HW_EXPONENT_FILE, 'r') as f:
            exponent = int(f.read().strip())
    
    return np.array(hw_re), np.array(hw_im), exponent


def analyze_results(hw_re, hw_im, exponent, test_name, br_used):
    """Analyze the FFT results."""
    hw_complex = (hw_re + 1j * hw_im) * (2.0 ** exponent)
    hw_mag = np.abs(hw_complex)
    
    peak_idx = np.argmax(hw_mag)
    peak_mag = hw_mag[peak_idx]
    
    print(f"\n  Test: {test_name} (input BR: {br_used})")
    print(f"    Peak bin: {peak_idx}, magnitude: {peak_mag:.1f}")
    print(f"    Bin 0 (DC): real={hw_re[0]}, imag={hw_im[0]} → magnitude={hw_mag[0]:.1f}")
    print(f"    Bin 50: magnitude={hw_mag[50]:.1f}")
    print(f"    Bin 974 (1024-50): magnitude={hw_mag[974]:.1f}")
    
    return peak_idx, peak_mag


def main():
    print("\n" + "=" * 70)
    print("Serial FFT - Input Bit-Reversal Analysis")
    print("=" * 70)
    
    # Generate test signal (Sine at bin 50)
    sine_amp = 2048
    x = np.array([int(round(sine_amp * np.sin(2 * np.pi * TONE_BIN * n / N))) for n in range(N)], dtype=int)
    
    # Test 1: WITH bit-reversal (current approach)
    print("\n--- TEST 1: WITH Input Bit-Reversal (Current) ---")
    write_mem_file_br(x, np.zeros_like(x), br=True)
    copy_rom_files()
    if run_simulation():
        hw_re, hw_im, exp = read_hw_output()
        if hw_re is not None:
            peak1, mag1 = analyze_results(hw_re, hw_im, exp, "Sine (BR input)", True)
    
    # Test 2: WITHOUT bit-reversal
    print("\n--- TEST 2: WITHOUT Input Bit-Reversal (Natural Order) ---")
    write_mem_file_br(x, np.zeros_like(x), br=False)
    copy_rom_files()
    if run_simulation():
        hw_re, hw_im, exp = read_hw_output()
        if hw_re is not None:
            peak2, mag2 = analyze_results(hw_re, hw_im, exp, "Sine (Natural input)", False)
    
    # Summary
    print("\n" + "=" * 70)
    print("SUMMARY")
    print("=" * 70)
    print("\nExpected peak location: bin 50 (tone frequency)")
    print(f"  With BR input: peak at bin {peak1}")
    print(f"  With natural input: peak at bin {peak2}")
    
    if peak2 == TONE_BIN:
        print("\n✓ SOLUTION FOUND: Remove input bit-reversal!")
        print("  The hardware expects natural-order inputs and outputs natural-order FFT.")
    elif peak1 == TONE_BIN:
        print("\n✓ Current approach is correct (peak matches expected location)")
    else:
        print("\n✗ Issue persists - investigate further")


if __name__ == "__main__":
    main()
