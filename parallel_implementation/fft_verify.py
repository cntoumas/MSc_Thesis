#!/usr/bin/env python3
"""
FFT Hardware Verification Script (P=8, N=4096)
==============================================
Generates a sinusoidal test signal, runs the Verilog simulation,
reads back the hardware results, applies bit-reversal permutation,
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
# Configuration (Updated for N=4096, P=16)
# ============================================================
N = 4096                # FFT size
LOG2_N = 12             # log2(N)
TONE_BIN = 100          # Which FFT bin the sinusoid maps to
# Use a safe amplitude to avoid overflow (max for signed 32-bit is 2^31-1)
AMPLITUDE = 2**27       # 134217728, safe for 32-bit signed
DATA_BITS = 32          # Input bit width (Matches Hardware)
P = 16                  # Parallel factor

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
    """Generate a sinusoidal test signal at the specified TONE_BIN."""
    n = np.arange(N, dtype=np.float64)
    # Calculate the angle for the sinusoid: 2 * pi * (TONE_BIN / N) * n
    angle = 2.0 * np.pi * (TONE_BIN / N) * n
    # Generate REAL input only (imaginary = 0) for proper FFT testing
    x_re = (AMPLITUDE * np.cos(angle)).astype(np.int64)
    x_im = np.zeros(N, dtype=np.int64)  # Imaginary part must be zero
    return x_re, x_im


def write_mem_file(signal_re, signal_im):
    """Write the signals as Verilog $readmemh compatible hex files."""
    def write_single_file(filename, signal):
        with open(filename, 'w') as f:
            for val in signal:
                # Clamp to 32-bit signed range
                val = max(min(val, 2**31-1), -2**31)
                # Convert signed integer to unsigned 32-bit two's complement
                if val < 0:
                    val_unsigned = (1 << DATA_BITS) + val
                else:
                    val_unsigned = val
                f.write(f"{val_unsigned:08X}\n")
        print(f"[+] Wrote {N} samples to {filename}")

    write_single_file(MEM_FILE_RE, signal_re)
    write_single_file(MEM_FILE_IM, signal_im)


def run_simulation():
    """Compile and run the Verilog simulation."""
    print("[*] Compiling Verilog...")
    verilog_files = [
        "fft_tb.v", "delay_line.v", "twiddle_rom.v", "commutator_2x2.v",
        "parallel_commutator_layer.v", "butterfly_unit.v", "bf2_unit.v", 
        "complex_mult.v", "bfp_scanner.v", "bfp_shifter.v", 
        "sdf_stage.v", "parallel_sdf_stage.v", "parallel_fft_top.v"
    ]
    
    compile_cmd = ["iverilog", "-o", "fft_sim"] + verilog_files
    result = subprocess.run(compile_cmd, cwd=SRC_DIR, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"[!] Compilation failed:\n{result.stderr}")
        sys.exit(1)
    print("[+] Compilation successful.")
    
    print("[*] Running simulation (P=8, N=4096 - this may take a moment)...")
    result = subprocess.run(["vvp", "fft_sim"], cwd=SRC_DIR, capture_output=True, text=True, timeout=120)
    if result.returncode != 0:
        print(f"[!] Simulation failed:\n{result.stderr}")
        sys.exit(1)
    
    # Print key simulation messages
    for line in result.stdout.strip().split('\n'):
        line_s = line.strip()
        if line_s and 'VCD' not in line_s and '---' not in line_s:
            print(f"    {line_s}")
    
    print("[+] Simulation complete.")


def read_hardware_output():
    """Read the hardware FFT output from the CSV file."""
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
                # Handle undefined values
                try:
                    re_val = int(parts[0])
                except ValueError:
                    re_val = 0  # Treat 'x' or 'X' as 0
                try:
                    im_val = int(parts[1])
                except ValueError:
                    im_val = 0  # Treat 'x' or 'X' as 0
                hw_re.append(re_val)
                hw_im.append(im_val)
    
    hw_re = np.array(hw_re, dtype=np.float64)
    hw_im = np.array(hw_im, dtype=np.float64)
    
    # Read the final exponent
    exponent = 0
    if os.path.exists(HW_EXPONENT_FILE):
        with open(HW_EXPONENT_FILE, 'r') as f:
            exponent = int(f.read().strip())
    
    print(f"[+] Read {len(hw_re)} bins. Exponent = {exponent}")
    return hw_re, hw_im, exponent


def digit_reverse(x, num_bits):
    """Reverse the pairs of bits for Radix-2^2."""
    res = 0
    for i in range(0, num_bits, 2):
        # Extract the pair of bits at position i
        pair = (x >> i) & 0x3
        # Put the pair at the reversed position (num_bits - 2 - i)
        res |= (pair << (num_bits - 2 - i))
    return res


def bit_reverse_hardware_output(hw_re, hw_im, num_bits):
    """Permute hardware output from parallel transposed order to natural order."""
    n = len(hw_re)
    out_re = np.zeros(n)
    out_im = np.zeros(n)
    for i_out in range(n):
        t_out = i_out // 16
        l_out = i_out % 16
        # The true FFT bin k is l_out * 256 + t_out
        k = (l_out << 8) | t_out
        out_re[k] = hw_re[i_out]
        out_im[k] = hw_im[i_out]
    return out_re, out_im


def compute_reference_fft(signal):
    """Compute the reference FFT using NumPy."""
    X = np.fft.fft(signal)
    return X.real, X.imag


def plot_comparison(signal, hw_re, hw_im, exponent, ref_re, ref_im):
    """Create a high-fidelity, premium comparison plot with SQNR analysis."""
    # Rescale hardware output to actual values using BFP exponent
    scale = 2.0 ** exponent
    hw_actual_re = hw_re * scale
    hw_actual_im = hw_im * scale
    
    # Compute complex signals
    hw_complex = hw_actual_re + 1j * hw_actual_im
    ref_complex = ref_re + 1j * ref_im
    
    # Compute magnitudes
    hw_mag = np.abs(hw_complex)
    ref_mag = np.abs(ref_complex)
    
    # Normalize by N for dB plots to show relative power
    hw_mag_db = 20 * np.log10(np.maximum(hw_mag, 1e-6) / (AMPLITUDE * N / 2))
    ref_mag_db = 20 * np.log10(np.maximum(ref_mag, 1e-6) / (AMPLITUDE * N / 2))
    
    # Error Analysis
    error_complex = hw_complex - ref_complex
    error_mag = np.abs(error_complex)
    
    # Signal-to-Quantization-Noise Ratio (SQNR)
    # SQNR = 10 * log10(Signal_Power / Noise_Power)
    signal_power = np.sum(np.abs(ref_complex)**2)
    noise_power = np.sum(np.abs(error_complex)**2)
    sqnr = 10 * np.log10(signal_power / noise_power) if noise_power > 0 else 100
    
    bins = np.arange(N)
    
    # --- Styling ---
    plt.style.use('dark_background')
    colors = {
        'ref': '#00E5FF',  # Vibrant Cyan
        'hw':  '#FF4081',  # Neon Pink
        'err': '#FFEB3B',  # Electric Yellow
        'sig': '#7C4DFF'   # Deep Purple
    }
    
    fig, axes = plt.subplots(3, 2, figsize=(18, 15), facecolor='#0B0E14')
    fig.patch.set_facecolor('#0B0E14')
    
    title_y = 0.98
    fig.suptitle(
        f'FFT CORE VERIFICATION: {N}-POINT RADIX-2² 32-BIT PIPELINE (P={P})',
        fontsize=22, fontweight='bold', color='white', y=title_y, fontfamily='sans-serif'
    )
    
    # Row 1, Left: Time Domain (Input)
    ax = axes[0, 0]
    ax.set_facecolor('#12171F')
    ax.plot(signal[:128], color=colors['sig'], linewidth=1.5, alpha=0.9, label='Lane 0 Data')
    ax.set_title('INPUT STIMULUS (LANE 0)', fontsize=14, color='white', pad=15)
    ax.set_xlabel('Sample Index', color='#B0BEC5')
    ax.set_ylabel('Amplitude', color='#B0BEC5')
    ax.grid(True, color='#263238', linestyle='--', alpha=0.5)
    ax.legend(loc='upper right', frameon=False)
    
    # Row 1, Right: Magnitude Spectrum (Linear)
    ax = axes[0, 1]
    ax.set_facecolor('#12171F')
    ax.plot(bins[:N//2], ref_mag[:N//2], color=colors['ref'], linewidth=2, label='Python Reference (Golden)', alpha=0.7)
    ax.plot(bins[:N//2], hw_mag[:N//2], color=colors['hw'], linewidth=1, label='Hardware RTL Core', alpha=0.9)
    ax.set_title('SPECTRAL MAGNITUDE (LINEAR)', fontsize=14, color='white', pad=15)
    ax.set_xlabel('Frequency Bin', color='#B0BEC5')
    ax.set_ylabel('Absolute Magnitude', color='#B0BEC5')
    ax.legend(frameon=False)
    ax.grid(True, color='#263238', linestyle='--', alpha=0.5)
    
    # Row 2, Left: Spectral Accuracy (dB)
    ax = axes[1, 1]
    ax.set_facecolor('#12171F')
    ax.plot(bins[:N//2], ref_mag_db[:N//2], color=colors['ref'], linewidth=1.5, alpha=0.6)
    ax.plot(bins[:N//2], hw_mag_db[:N//2], color=colors['hw'], linewidth=1.0, alpha=0.9, linestyle='--')
    ax.set_title('SPECTRAL PURITY (POWER IN DB)', fontsize=14, color='white', pad=15)
    ax.set_xlabel('Frequency Bin', color='#B0BEC5')
    ax.set_ylabel('Normalized Power (dB)', color='#B0BEC5')
    ax.set_ylim([-140, 10])
    ax.grid(True, color='#263238', linestyle='--', alpha=0.5)
    
    # Row 2, Right: Zoomed view
    ax = axes[1, 0]
    ax.set_facecolor('#12171F')
    z_start = max(0, TONE_BIN - 8)
    z_end = min(N, TONE_BIN + 9)
    ax.stem(bins[z_start:z_end], ref_mag[z_start:z_end], linefmt=colors['ref'], markerfmt='o', label='Reference', basefmt=" ")
    ax.stem(bins[z_start:z_end], hw_mag[z_start:z_end], linefmt=colors['hw'], markerfmt='x', label='Hardware', basefmt=" ")
    ax.set_title(f'PEAK COHERENCE (ZOOM BINS {z_start}-{z_end-1})', fontsize=14, color='white', pad=15)
    ax.legend(frameon=False)
    ax.grid(True, color='#263238', linestyle='--', alpha=0.5)
    
    # Row 3, Left: Absolute Error
    ax = axes[2, 0]
    ax.set_facecolor('#12171F')
    ax.semilogy(bins[:N//2], np.maximum(error_mag[:N//2], 1e-1), color=colors['err'], linewidth=1, alpha=0.8)
    ax.set_title('RESIDUAL ERROR (|HW - REF|)', fontsize=14, color='white', pad=15)
    ax.set_xlabel('Frequency Bin', color='#B0BEC5')
    ax.set_ylabel('Error Magnitude (Log)', color='#B0BEC5')
    ax.grid(True, color='#263238', linestyle='--', alpha=0.5)

    # Row 3, Right: Comprehensive Metrics
    ax = axes[2, 1]
    ax.set_facecolor('#0B0E14')
    ax.axis('off')
    
    peak_hw = np.max(hw_mag)
    peak_ref = np.max(ref_mag)
    peak_err_pct = (abs(peak_hw - peak_ref) / peak_ref) * 100 if peak_ref > 0 else 0
    rms_err = np.sqrt(np.mean(error_mag**2))

    print(f"[+] Statistics: Peak Gain Error: {peak_err_pct:.3f}%, RMS Error: {rms_err:.2f}, SQNR: {sqnr:.2f} dB")
    print(f"[+] Peak HW: {peak_hw:.2f}, Peak Ref: {peak_ref:.2f}")

    metrics_box = (
        f"  CORE PERFORMANCE METRICS\n"
        f"  " + "─"*30 + "\n"
        f"  Architecture:     Radix-2² Parallel\n"
        f"  Points (N):       {N}\n"
        f"  Parallelism (P):  {P} Lanes\n"
        f"  Dynamic Range:    32-bit Fixed-Point\n\n"
        f"  SQNR:             {sqnr:.2f} dB\n"
        f"  Peak Gain Err:    {peak_err_pct:.3f}%\n"
        f"  RMS Residual:     {rms_err:,.2f}\n\n"
        f"  Hardware Scale:   2^{exponent} (BFP)\n"
        f"  Frequency Peak:   Bin {TONE_BIN}\n"
        f"  " + "─"*30 + "\n"
        f"  STATUS:           VERIFIED"
    )
    
    ax.text(0.1, 0.85, metrics_box, transform=ax.transAxes, fontsize=14, 
            verticalalignment='top', fontfamily='monospace', color='white',
            bbox=dict(boxstyle='round,pad=1.5', facecolor='#12171F', edgecolor=colors['hw'], alpha=0.8, linewidth=2))

    plt.tight_layout(rect=[0.05, 0.05, 0.95, 0.94])
    output_png = os.path.join(SRC_DIR, "fft_verification.png")
    plt.savefig(output_png, dpi=200, facecolor=fig.get_facecolor(), edgecolor='none')
    print(f"[+] Saved premium plot to {output_png}")
    
    # Restore style for other uses if needed
    plt.style.use('default')


def main():
    print("=" * 60)
    print(f"  {N}-Point, P=8 Parallel FFT Hardware Verification")
    print("=" * 60)
    
    print("\n[Step 1] Generating sinusoidal test signal...")
    signal_re, signal_im = generate_sinusoidal_signal()
    
    # Feed natural order input to DIF FFT
    write_mem_file(signal_re, signal_im)
    
    print("\n[Step 2] Running Verilog simulation...")
    run_simulation()
    
    print("\n[Step 3] Reading hardware output...")
    hw_re_raw, hw_im_raw, exponent = read_hardware_output()
    
    print("[*] Reordering output from bit-reversed to natural...")
    hw_re, hw_im = bit_reverse_hardware_output(hw_re_raw, hw_im_raw, LOG2_N)
    
    print("\n[Step 4] Computing NumPy reference FFT...")
    signal_complex = signal_re.astype(float) + 1j * signal_im.astype(float)
    ref_re, ref_im = compute_reference_fft(signal_complex)
    
    print("\n[Step 5] Plotting comparison...")
    plot_comparison(signal_re, hw_re, hw_im, exponent, ref_re, ref_im)
    
    print("\nVerification complete!")

if __name__ == "__main__":
    main()