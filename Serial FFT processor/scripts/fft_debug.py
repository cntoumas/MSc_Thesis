#!/usr/bin/env python3
"""
Debug script to investigate FFT output issues:
1. Verify output bit-reversal (or lack thereof)
2. Check BFP exponent sign convention
3. Analyze peak detection failures
4. Inspect boundary bin errors (DC test)
"""

import os
import sys
import numpy as np
import csv

# Force UTF-8 stdout/stderr so Unicode arrows/checkmarks don't crash on Windows cp1253
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

N = 1024
LOG2_N = 10
TONE_BIN = 50

PROJ_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC_DIR = os.path.dirname(os.path.abspath(__file__))
HW_OUTPUT_FILE = os.path.join(PROJ_DIR, "hw_output.csv")
HW_EXPONENT_FILE = os.path.join(PROJ_DIR, "hw_exponent.txt")


def bit_reverse(x, num_bits):
    """Bit-reverse an integer."""
    result = 0
    for _ in range(num_bits):
        result = (result << 1) | (x & 1)
        x >>= 1
    return result


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


def generate_reference():
    """Create reference FFTs for the three tests."""
    refs = {}
    
    # Test 0: Impulse
    x0 = np.zeros(N, dtype=complex)
    x0[0] = 2048
    refs[0] = {
        "name": "Impulse",
        "input": x0.real.astype(int),
        "fft": np.fft.fft(x0),
    }
    
    # Test 1: DC
    x1 = np.full(N, 2048, dtype=complex)
    refs[1] = {
        "name": "DC",
        "input": x1.real.astype(int),
        "fft": np.fft.fft(x1),
    }
    
    # Test 2: Sine at bin 50
    sine_amp = 2048
    x2 = np.array([int(round(sine_amp * np.sin(2 * np.pi * TONE_BIN * n / N))) for n in range(N)], dtype=complex)
    refs[2] = {
        "name": "Sine",
        "input": x2.real.astype(int),
        "fft": np.fft.fft(x2),
    }
    
    return refs


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


def check_bit_reversal_order():
    """Check if the output appears to be in natural or bit-reversed order."""
    print("\n" + "=" * 70)
    print("CHECK 1: Output Ordering (Natural vs Bit-Reversed)")
    print("=" * 70)
    
    # Generate a test signal where we can easily detect the ordering
    # Impulse at bin 0 should have magnitude N at bin 0 in natural order
    # or at bit_reverse(0) = 0 in bit-reversed order (same thing)
    
    # Better test: DC signal
    # DC (bin 0) should have magnitude N*amplitude
    # In natural order, this is at index 0
    # In bit-reversed order, it's at index bit_reverse(0) = 0 (same)
    
    # Best test: Use a sine at bin 50
    # The peak should be near bin 50 in natural order
    # or near bit_reverse(50) = bit_reverse(0b0110010) = 0b0100110 = 38 in BR order
    
    br_50 = bit_reverse(50, LOG2_N)
    print(f"\n  Bin 50 in natural order")
    print(f"  Bit-reverse of 50 = {br_50} (binary 50={bin(50)}, BR={bin(br_50)})")
    
    refs = generate_reference()
    hw_re, hw_im, exponent = read_hw_output()
    
    if hw_re is None:
        return
    
    hw_complex = (hw_re + 1j * hw_im) * (2.0 ** exponent)
    # Un-bit-reverse the output
    hw_complex = unbit_reverse_fft(hw_complex)
    hw_mag = np.abs(hw_complex)
    ref_mag = np.abs(refs[2]["fft"])
    
    peak_hw_nat = np.argmax(hw_mag)
    peak_ref_nat = np.argmax(ref_mag)
    
    print(f"\n  Hardware FFT peak: bin {peak_hw_nat} (magnitude {hw_mag[peak_hw_nat]:.1f})")
    print(f"  Reference FFT peak: bin {peak_ref_nat} (magnitude {ref_mag[peak_ref_nat]:.1f})")
    
    if peak_hw_nat == peak_ref_nat:
        print(f"  ✓ Peaks match - output is in NATURAL order")
    elif peak_hw_nat == br_50:
        print(f"  ✓ HW peak at bit-reverse(50)={br_50} - output is BIT-REVERSED")
    else:
        print(f"  ✗ Peaks don't match natural or BR order - UNEXPECTED")
    
    # Print magnitudes around expected peaks
    print(f"\n  --- Bins around expected peak (natural order 50) ---")
    for b in range(45, 55):
        hw_m = hw_mag[b] if b < len(hw_mag) else 0
        ref_m = ref_mag[b] if b < len(ref_mag) else 0
        marker = " <-- PEAK" if b == peak_hw_nat else ""
        print(f"    Bin {b:3d}: HW={hw_m:8.1f}  Ref={ref_m:8.1f}{marker}")
    
    print(f"\n  --- Bins around bit-reverse(50)={br_50} (if BR order) ---")
    for b in range(max(0, br_50-2), min(N, br_50+3)):
        hw_m = hw_mag[b] if b < len(hw_mag) else 0
        ref_m = ref_mag[b] if b < len(ref_mag) else 0
        marker = " <-- PEAK" if b == peak_hw_nat else ""
        print(f"    Bin {b:3d}: HW={hw_m:8.1f}  Ref={ref_m:8.1f}{marker}")


def check_bfp_exponent_encoding():
    """Verify BFP exponent sign convention."""
    print("\n" + "=" * 70)
    print("CHECK 2: BFP Exponent Encoding (Sign Convention)")
    print("=" * 70)
    
    refs = generate_reference()
    hw_re, hw_im, exponent = read_hw_output()
    
    if hw_re is None:
        return
    
    print(f"\n  Raw exponent from hw_exponent.txt: {exponent}")
    print(f"  As signed 8-bit: {np.int8(exponent)}")
    
    # Test different interpretations
    hw_complex_pos = (hw_re + 1j * hw_im) * (2.0 ** exponent)
    hw_complex_neg = (hw_re + 1j * hw_im) / (2.0 ** exponent)
    
    # For Impulse test, the reference magnitude should be 2048 at bin 0
    ref_impulse_mag = np.abs(refs[0]["fft"])[0]
    
    hw_mag_pos = np.abs(hw_complex_pos)[0]
    hw_mag_neg = np.abs(hw_complex_neg)[0]
    
    print(f"\n  Impulse test, bin 0 (DC):")
    print(f"    Reference magnitude: {ref_impulse_mag:.1f}")
    print(f"    HW magnitude (exp^+): {hw_mag_pos:.1f}")
    print(f"    HW magnitude (exp^-): {hw_mag_neg:.1f}")
    
    ratio_pos = hw_mag_pos / ref_impulse_mag if ref_impulse_mag > 0 else 0
    ratio_neg = hw_mag_neg / ref_impulse_mag if ref_impulse_mag > 0 else 0
    
    print(f"\n    Ratio (exp^+): {ratio_pos:.4f} (expect ~1.0)")
    print(f"    Ratio (exp^-): {ratio_neg:.4f}")
    
    if abs(ratio_pos - 1.0) < 0.1:
        print(f"    ✓ Exponent encoding is CORRECT: multiply by 2^exp")
    elif abs(ratio_neg - 1.0) < 0.1:
        print(f"    ✓ Exponent encoding is INVERTED: should divide by 2^exp")
    else:
        print(f"    ✗ Neither interpretation matches - CHECK HARDWARE")


def check_boundary_errors():
    """Investigate edge-bin errors in DC test."""
    print("\n" + "=" * 70)
    print("CHECK 3: Boundary Bin Errors (DC Test)")
    print("=" * 70)
    
    refs = generate_reference()
    hw_re, hw_im, exponent = read_hw_output()
    
    if hw_re is None:
        return
    
    hw_complex = (hw_re + 1j * hw_im) * (2.0 ** exponent)
    # Un-bit-reverse the output
    hw_complex = unbit_reverse_fft(hw_complex)
    ref_fft = refs[1]["fft"]  # DC reference
    
    hw_mag = np.abs(hw_complex)
    ref_mag = np.abs(ref_fft)
    
    error = hw_complex - ref_fft
    err_mag = np.abs(error)
    
    print(f"\n  First and last 5 bins:")
    print(f"\n  Bin | HW Real | HW Imag | Ref Real | Ref Imag | Error Mag")
    print(f"  " + "-" * 60)
    
    for b in list(range(0, 5)) + list(range(N-5, N)):
        err_m = err_mag[b] if b < len(err_mag) else -1
        print(f"  {b:4d} | {hw_re[b]:7d} | {hw_im[b]:7d} | {int(ref_fft[b].real):8d} | {int(ref_fft[b].imag):8d} | {err_m:8.1f}")
    
    # Find the largest errors
    max_err_idx = np.argsort(err_mag)[::-1][:5]
    print(f"\n  Top 5 largest errors:")
    for idx in max_err_idx:
        print(f"    Bin {idx}: error magnitude {err_mag[idx]:.1f}")


def check_output_dynamic_range():
    """Check if output values seem reasonable for the exponent used."""
    print("\n" + "=" * 70)
    print("CHECK 4: Output Dynamic Range vs Exponent")
    print("=" * 70)
    
    hw_re, hw_im, exponent = read_hw_output()
    
    if hw_re is None:
        return
    
    hw_mag = np.abs(hw_re + 1j * hw_im)
    max_hw_raw = np.max(hw_mag)
    
    print(f"\n  Raw hardware output (before scaling):")
    print(f"    Max magnitude: {max_hw_raw:.0f}")
    print(f"    This suggests {np.log2(max_hw_raw):.1f} bits of magnitude")
    
    print(f"\n  BFP exponent: {exponent}")
    print(f"    2^{exponent} = {2.0**exponent:.4f}")
    
    if exponent < 0:
        print(f"    Negative exponent means RIGHT-shift: divide by 2^{-exponent}")
    else:
        print(f"    Positive exponent means LEFT-shift: multiply by 2^{exponent}")
    
    hw_complex = (hw_re + 1j * hw_im) * (2.0 ** exponent)
    hw_mag_scaled = np.abs(hw_complex)
    max_hw_scaled = np.max(hw_mag_scaled)
    
    print(f"\n  After scaling by 2^{exponent}:")
    print(f"    Max magnitude: {max_hw_scaled:.1f}")


def main():
    print("\n" + "=" * 70)
    print("Serial FFT - Comprehensive Debug Report")
    print("=" * 70)
    
    check_bit_reversal_order()
    check_bfp_exponent_encoding()
    check_boundary_errors()
    check_output_dynamic_range()
    
    print("\n" + "=" * 70)
    print("Debug Complete")
    print("=" * 70)


if __name__ == "__main__":
    main()
