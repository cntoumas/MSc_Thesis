#!/usr/bin/env python3
"""
FFT Hardware Verification Script
=================================
Generates a sinusoidal test signal, runs the Verilog simulation,
reads back the hardware results (in bit-reversed order from the
Pease/Singleton algorithm), applies bit-reversal permutation,
compares with a NumPy reference FFT, and plots both.
"""

import numpy as np
import matplotlib
matplotlib.use('Agg')  # Use non-interactive backend for file output
import matplotlib.pyplot as plt
import subprocess
import os
import sys

# ============================================================
# Configuration
# ============================================================
N = 2048                # FFT size
LOG2_N = 11             # log2(N)
TONE_BIN = 50           # Which FFT bin the sinusoid maps to
AMPLITUDE = 10000       # Peak amplitude (fits comfortably in 16-bit signed)
DATA_BITS = 17          # RAM storage width

SRC_DIR = os.path.dirname(os.path.abspath(__file__))
MEM_FILE_RE = os.path.join(SRC_DIR, "stimulus_re.mem")
MEM_FILE_IM = os.path.join(SRC_DIR, "stimulus_im.mem")
HW_OUTPUT_FILE = os.path.join(SRC_DIR, "hw_output.csv")
HW_EXPONENT_FILE = os.path.join(SRC_DIR, "hw_exponent.txt")


def bit_reverse(x, num_bits):
    """Reverse the lower 'num_bits' bits of integer x."""
    result = 0
    for _ in range(num_bits):
        result = (result << 1) | (x & 1)
        x >>= 1
    return result


def bit_reverse_permutation(data_re, data_im, num_bits):
    """Apply bit-reversal permutation to complex data arrays."""
    n = len(data_re)
    out_re = np.zeros(n, dtype=data_re.dtype)
    out_im = np.zeros(n, dtype=data_im.dtype)
    for i in range(n):
        j = bit_reverse(i, num_bits)
        out_re[i] = data_re[j]
        out_im[i] = data_im[j]
    return out_re, out_im


def generate_sinusoidal_signal():
    """Generate a pure sinusoidal test signal at a known FFT bin."""
    n = np.arange(N)
    # Pure sine at bin TONE_BIN: x[n] = A * sin(2*pi*k*n/N)
    x_re = np.round(AMPLITUDE * np.sin(2 * np.pi * TONE_BIN * n / N)).astype(int)
    x_im = np.zeros(N, dtype=int)
    return x_re, x_im


def write_mem_file(signal_re, signal_im):
    """Write the signals as Verilog $readmemh compatible hex files."""
    def write_single_file(filename, signal):
        with open(filename, 'w') as f:
            for val in signal:
                # Convert signed integer to unsigned 17-bit two's complement
                if val < 0:
                    val_unsigned = (1 << DATA_BITS) + val
                else:
                    val_unsigned = val
                f.write(f"{val_unsigned:05X}\n")
        print(f"[+] Wrote {N} samples to {filename}")

    write_single_file(MEM_FILE_RE, signal_re)
    write_single_file(MEM_FILE_IM, signal_im)


def run_simulation():
    """Compile and run the Verilog simulation."""
    print("[*] Compiling Verilog...")
    verilog_files = [
        "fft_tb.v", "AGU.v", "RAM.v", "twiddle_rom.v",
        "butterfly_unit.v", "complex_mult.v", "BFP_scanner.v",
        "BFP_shifter.v", "fft_top.v"
    ]
    
    compile_cmd = ["iverilog", "-o", "fft_sim"] + verilog_files
    result = subprocess.run(compile_cmd, cwd=SRC_DIR, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"[!] Compilation failed:\n{result.stderr}")
        sys.exit(1)
    print("[+] Compilation successful.")
    
    print("[*] Running simulation (this may take ~10 seconds)...")
    result = subprocess.run(["vvp", "fft_sim"], cwd=SRC_DIR, capture_output=True, text=True, timeout=120)
    if result.returncode != 0:
        print(f"[!] Simulation failed:\n{result.stderr}")
        sys.exit(1)
    
    # Print key simulation messages
    for line in result.stdout.strip().split('\n'):
        line_s = line.strip()
        if line_s and 'VCD' not in line_s and 'Bin Index' not in line_s and '---' not in line_s:
            if '>>>' in line_s or '===' in line_s or 'Exponent' in line_s or 'Written' in line_s:
                print(f"    {line_s}")
    
    print("[+] Simulation complete.")


def read_hardware_output():
    """Read the hardware FFT output from the CSV file and apply bit-reversal."""
    if not os.path.exists(HW_OUTPUT_FILE):
        print(f"[!] Hardware output file not found: {HW_OUTPUT_FILE}")
        sys.exit(1)
    
    hw_re = []
    hw_im = []
    with open(HW_OUTPUT_FILE, 'r') as f:
        for line in f:
            line = line.strip()
            if line:
                parts = line.split(',')
                hw_re.append(int(parts[0]))
                hw_im.append(int(parts[1]))
    
    hw_re = np.array(hw_re, dtype=np.float64)
    hw_im = np.array(hw_im, dtype=np.float64)
    
    # Read the final exponent
    exponent = 0
    if os.path.exists(HW_EXPONENT_FILE):
        with open(HW_EXPONENT_FILE, 'r') as f:
            exponent = int(f.read().strip())
    
    # The hardware output is naturally ordered because we bit-reversed the input.
    print(f"[+] Read {len(hw_re)} bins (natural order). Exponent = {exponent}")
    
    # Quick sanity check: peak should be at TONE_BIN (checking positive frequencies)
    hw_mag = np.sqrt(hw_re**2 + hw_im**2)
    peak_bin = np.argmax(hw_mag[:N//2])
    print(f"    Peak: bin {peak_bin} (expected: {TONE_BIN})")
    
    return hw_re, hw_im, exponent


def compute_reference_fft(signal):
    """Compute the reference FFT using NumPy."""
    X = np.fft.fft(signal)
    return X.real, X.imag


def plot_comparison(signal, hw_re, hw_im, exponent, ref_re, ref_im):
    """Create a comprehensive comparison plot."""
    
    # Rescale hardware output to actual values using BFP exponent
    scale = 2.0 ** exponent
    hw_actual_re = hw_re * scale
    hw_actual_im = hw_im * scale
    
    # Compute magnitudes
    hw_mag = np.sqrt(hw_actual_re**2 + hw_actual_im**2)
    ref_mag = np.abs(ref_re + 1j * ref_im)
    
    # Convert to dB (normalized by N, floor at -120 dB)
    hw_mag_db = 20 * np.log10(np.maximum(hw_mag, 1e-6) / N)
    ref_mag_db = 20 * np.log10(np.maximum(ref_mag, 1e-6) / N)
    
    bins = np.arange(N)
    
    # ---- Create figure ----
    fig, axes = plt.subplots(3, 2, figsize=(16, 14))
    fig.suptitle(
        f'{N}-Point FFT Hardware Verification\n'
        f'Input: Sinusoid at Bin {TONE_BIN} (A={AMPLITUDE}, BFP Exponent={exponent})',
        fontsize=15, fontweight='bold', y=0.99
    )
    
    # ---- Row 1, Left: Time domain signal ----
    ax = axes[0, 0]
    ax.plot(signal[:128], color='#2196F3', linewidth=0.8)
    ax.set_title('Input Signal (first 128 samples)', fontweight='bold')
    ax.set_xlabel('Sample Index')
    ax.set_ylabel('Amplitude')
    ax.grid(True, alpha=0.3)
    ax.axhline(y=0, color='gray', linewidth=0.5)
    
    # ---- Row 1, Right: Full spectrum magnitude comparison (linear) ----
    ax = axes[0, 1]
    ax.plot(bins[:N//2], ref_mag[:N//2], color='#4CAF50', linewidth=1.2,
            label='NumPy Reference', alpha=0.8)
    ax.plot(bins[:N//2], hw_mag[:N//2], color='#FF5722', linewidth=1.0,
            label='Hardware FFT', linestyle='--', alpha=0.8)
    ax.set_title('Magnitude Spectrum — First Half (Linear)', fontweight='bold')
    ax.set_xlabel('Bin Index')
    ax.set_ylabel('Magnitude')
    ax.legend(loc='upper right')
    ax.grid(True, alpha=0.3)
    
    # ---- Row 2, Left: Zoomed magnitude around the tone ----
    zoom_start = max(0, TONE_BIN - 10)
    zoom_end = min(N, TONE_BIN + 11)
    zoom_bins = bins[zoom_start:zoom_end]
    
    ax = axes[1, 0]
    width = 0.35
    ax.bar(zoom_bins - width/2, ref_mag[zoom_start:zoom_end], width,
           color='#4CAF50', alpha=0.7, label='NumPy Reference')
    ax.bar(zoom_bins + width/2, hw_mag[zoom_start:zoom_end], width,
           color='#FF5722', alpha=0.7, label='Hardware FFT')
    ax.set_title(f'Zoomed: Bins {zoom_start}–{zoom_end-1}', fontweight='bold')
    ax.set_xlabel('Bin Index')
    ax.set_ylabel('Magnitude')
    ax.legend()
    ax.grid(True, alpha=0.3, axis='y')
    
    # ---- Row 2, Right: Magnitude in dB (first half) ----
    ax = axes[1, 1]
    ax.plot(bins[:N//2], ref_mag_db[:N//2], color='#4CAF50', linewidth=1.0,
            label='NumPy Reference', alpha=0.8)
    ax.plot(bins[:N//2], hw_mag_db[:N//2], color='#FF5722', linewidth=1.0,
            label='Hardware FFT', linestyle='--', alpha=0.8)
    ax.set_title('Magnitude Spectrum (dB, first half)', fontweight='bold')
    ax.set_xlabel('Bin Index')
    ax.set_ylabel('Magnitude (dB, normalized)')
    ax.set_ylim([-120, 10])
    ax.legend(loc='upper right')
    ax.grid(True, alpha=0.3)
    
    # ---- Row 3, Left: Error analysis ----
    error_re = hw_actual_re - ref_re
    error_im = hw_actual_im - ref_im
    error_mag = np.sqrt(error_re**2 + error_im**2)
    
    ax = axes[2, 0]
    ax.semilogy(bins[:N//2], np.maximum(error_mag[:N//2], 1e-1), color='#9C27B0', linewidth=0.8)
    ax.set_title('Absolute Error |HW − Reference| (log scale)', fontweight='bold')
    ax.set_xlabel('Bin Index')
    ax.set_ylabel('Error Magnitude')
    ax.grid(True, alpha=0.3)
    
    # ---- Row 3, Right: Statistics ----
    ax = axes[2, 1]
    ax.axis('off')
    
    # Compute statistics (search first half due to real signal conjugate symmetry)
    peak_hw = np.max(hw_mag[:N//2])
    peak_ref = np.max(ref_mag[:N//2])
    peak_bin_hw = np.argmax(hw_mag[:N//2])
    peak_bin_ref = np.argmax(ref_mag[:N//2])
    conj_bin = N - TONE_BIN
    
    # SNR: power at tone bins vs everything else
    signal_power_hw = hw_mag[TONE_BIN]**2 + hw_mag[conj_bin]**2
    noise_indices = np.ones(N, dtype=bool)
    noise_indices[TONE_BIN] = False
    noise_indices[conj_bin] = False
    noise_power_hw = np.sum(hw_mag[noise_indices]**2)
    if noise_power_hw > 0:
        snr_hw = 10 * np.log10(signal_power_hw / noise_power_hw)
    else:
        snr_hw = float('inf')
    
    # Same for reference
    signal_power_ref = ref_mag[TONE_BIN]**2 + ref_mag[conj_bin]**2
    noise_power_ref = np.sum(ref_mag[noise_indices]**2)
    if noise_power_ref > 0:
        snr_ref = 10 * np.log10(signal_power_ref / noise_power_ref)
    else:
        snr_ref = float('inf')
    
    max_error = np.max(error_mag)
    rms_error = np.sqrt(np.mean(error_mag**2))
    peak_error_pct = (abs(peak_hw - peak_ref) / peak_ref) * 100 if peak_ref > 0 else 0
    
    stats_text = (
        f"{'Hardware Results Summary':^40}\n"
        f"{'='*40}\n\n"
        f"Peak bin (HW):         {peak_bin_hw}\n"
        f"Peak bin (Reference):  {peak_bin_ref}\n"
        f"Peak mag (HW):         {peak_hw:,.1f}\n"
        f"Peak mag (Reference):  {peak_ref:,.1f}\n"
        f"Peak error:            {peak_error_pct:.2f}%\n\n"
        f"BFP Final Exponent:    {exponent}\n"
        f"BFP Scale Factor:      2^{exponent} = {scale}\n\n"
        f"Max absolute error:    {max_error:,.1f}\n"
        f"RMS error:             {rms_error:,.1f}\n"
        f"SNR (hardware):        {snr_hw:.1f} dB\n"
        f"SNR (reference):       {snr_ref:.1f} dB\n"
    )
    
    ax.text(0.05, 0.95, stats_text, transform=ax.transAxes,
            fontsize=11, verticalalignment='top', fontfamily='monospace',
            bbox=dict(boxstyle='round', facecolor='#E3F2FD', alpha=0.8))
    
    plt.tight_layout(rect=[0, 0, 1, 0.94])
    
    output_png = os.path.join(SRC_DIR, "fft_verification.png")
    plt.savefig(output_png, dpi=150, bbox_inches='tight')
    print(f"[+] Saved plot to {output_png}")


def main():
    print("=" * 60)
    print(f"  {N}-Point FFT Hardware Verification")
    print("=" * 60)
    
    # Step 1: Generate test signal
    print("\n[Step 1] Generating sinusoidal test signal...")
    signal_re, signal_im = generate_sinusoidal_signal()
    
    # DIT FFT algorithm expects bit-reversed inputs to produce natural order outputs
    sig_re_br, sig_im_br = bit_reverse_permutation(signal_re, signal_im, LOG2_N)
    write_mem_file(sig_re_br, sig_im_br)
    print(f"    Tone at bin {TONE_BIN}, amplitude ±{AMPLITUDE}")
    print(f"    Signal range: [{signal_re.min()}, {signal_re.max()}]")
    
    # Step 2: Run simulation
    print("\n[Step 2] Running Verilog simulation...")
    run_simulation()
    
    # Step 3: Read hardware output (with bit-reversal)
    print("\n[Step 3] Reading hardware output...")
    hw_re, hw_im, exponent = read_hardware_output()
    
    # Step 4: Compute reference FFT
    print("\n[Step 4] Computing NumPy reference FFT...")
    signal_complex = signal_re.astype(float) + 1j * signal_im.astype(float)
    ref_re, ref_im = compute_reference_fft(signal_complex)
    
    # Step 5: Plot comparison
    print("\n[Step 5] Plotting comparison...")
    plot_comparison(signal_re, hw_re, hw_im, exponent, ref_re, ref_im)
    
    print("\n" + "=" * 60)
    print("  Verification complete!")
    print("=" * 60)


if __name__ == "__main__":
    main()
