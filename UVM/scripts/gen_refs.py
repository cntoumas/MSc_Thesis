#!/usr/bin/env python3
"""
gen_refs.py — produce per-test stimulus + NumPy reference .mem files.

For each of the five canonical test signals (Impulse, DC, Sine, MultiTone,
Chirp) we emit four files:

  <test>_re.mem      stimulus, real part      (Q1.15 sample as 17-bit signed hex)
  <test>_im.mem      stimulus, imag part
  <test>_ref_re.mem  expected FFT output, real part (32-bit signed hex)
  <test>_ref_im.mem  expected FFT output, imag part

The reference is the float64 NumPy FFT, rounded to integer. The hardware FFT
uses the +j twiddle convention while NumPy uses -j; the scoreboard handles
this by trying both ref and conj(ref) and reporting the best fit, so this
script just writes the canonical NumPy result.

Output: UVM/refs/serial/*.mem  (same files work for the Parallel DUT too —
the scoreboard handles P=4 unpacking on its side).
"""
import sys
from pathlib import Path
import numpy as np

# Force UTF-8 stdout so Unicode arrows don't crash on Windows cp1253
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

# ───────────────────────────────────────────────────────────────────────────
N           = 1024
AMP_DEFAULT = 10000
TONE_BIN    = 50
MULTI_BINS  = (50, 200, 450)
MULTI_AMP   = 3000      # per-tone
CHIRP_F0    = 0.0
CHIRP_F1    = 511.0

OUT_DIR = Path(__file__).resolve().parent.parent / "refs" / "serial"
OUT_DIR.mkdir(parents=True, exist_ok=True)


def write_mem(path: Path, data: np.ndarray, width_bits: int):
    """Write data as one signed hex value per line, masked to width_bits."""
    mask    = (1 << width_bits) - 1
    hex_w   = (width_bits + 3) // 4    # hex digits needed
    with path.open("w", encoding="ascii") as f:
        for v in data:
            f.write(f"{int(v) & mask:0{hex_w}X}\n")


def make_signal(name: str):
    n = np.arange(N)
    if name == "impulse":
        re = np.zeros(N, dtype=np.int64); re[0] = AMP_DEFAULT
        im = np.zeros(N, dtype=np.int64)
    elif name == "dc":
        re = np.full(N, AMP_DEFAULT, dtype=np.int64)
        im = np.zeros(N, dtype=np.int64)
    elif name == "sine":
        re = np.round(AMP_DEFAULT * np.sin(2*np.pi*TONE_BIN*n/N)).astype(np.int64)
        im = np.zeros(N, dtype=np.int64)
    elif name == "multitone":
        re = np.round(sum(MULTI_AMP * np.sin(2*np.pi*b*n/N) for b in MULTI_BINS)).astype(np.int64)
        im = np.zeros(N, dtype=np.int64)
    elif name == "chirp":
        phi = 2*np.pi*(CHIRP_F0 + (CHIRP_F1-CHIRP_F0)*n/(2*N))*n/N
        re  = np.round(AMP_DEFAULT * np.sin(phi)).astype(np.int64)
        im  = np.zeros(N, dtype=np.int64)
    else:
        raise ValueError(f"unknown signal: {name}")
    return re, im


def main():
    print(f"Generating UVM reference vectors → {OUT_DIR}")
    for name in ("impulse", "dc", "sine", "multitone", "chirp"):
        re, im = make_signal(name)
        ref    = np.fft.fft(re.astype(np.float64) + 1j*im.astype(np.float64))

        # 17-bit signed stimulus (matches existing 17-bit .mem format)
        write_mem(OUT_DIR / f"{name}_re.mem",     re, width_bits=17)
        write_mem(OUT_DIR / f"{name}_im.mem",     im, width_bits=17)

        # 32-bit signed reference (FFT output magnitudes can reach N×A ≈ 10M)
        ref_re_i = np.round(ref.real).astype(np.int64)
        ref_im_i = np.round(ref.imag).astype(np.int64)
        write_mem(OUT_DIR / f"{name}_ref_re.mem", ref_re_i, width_bits=32)
        write_mem(OUT_DIR / f"{name}_ref_im.mem", ref_im_i, width_bits=32)

        peak_bin  = int(np.argmax(np.abs(ref)))
        peak_mag  = float(np.abs(ref).max())
        print(f"  {name:10s}  ref peak |X[{peak_bin:4d}]| = {peak_mag:>12.1f}")

    print(f"[ok] wrote {5*4} .mem files in {OUT_DIR}")


if __name__ == "__main__":
    main()
