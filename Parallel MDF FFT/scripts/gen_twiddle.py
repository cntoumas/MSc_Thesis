#!/usr/bin/env python3
"""
gen_twiddle.py — Generate twiddle-factor ROMs for the P=4 MDF FFT.

Architecture recap
------------------
  N   = 1024 (FFT size)
  P   = 4    (parallelism, paths per stage)
  L   = 10   (stages total = log2(N))
  L_FB = 8   (feedback stages: s = 0..7)
  L_NF = 2   (no-feedback stages: s = 8, 9 — only ±1 factors, no ROM needed)

  For feedback stage s (0..7) and path p (0..3):
    DEPTH  = N // (P * 2**(s+1))   = 128 >> s   (128, 64, 32, … 1)
    ROM[k] = W_N^{n(k)}   where n(k) = (k*P + p) * 2**s
           = exp(-j * 2*pi * n(k) / N)

  Stored in Q15 signed fixed-point:
    re = round(cos(-2*pi*n/N) * 32767)
    im = round(sin(-2*pi*n/N) * 32767)

  Each hex line: {im_signed_16bit}{re_signed_16bit}  (32-bit word, MSB=im)

Output
------
  rom/tw_s{s}_p{p}.hex   — 32 files (4 paths × 8 stages)

Usage
-----
  python scripts/gen_twiddle.py          # generate to rom/
  python scripts/gen_twiddle.py --verify # also print sanity table
"""

import math
import os
import argparse

# ---------------------------------------------------------------------------
# Parameters
# ---------------------------------------------------------------------------
N    = 1024
P    = 4
L_FB = 8          # feedback stages
Q15  = 32767      # 1.0 in Q15 (2^15 - 1)


def to_q15(x: float) -> int:
    """Round a real value in [-1, 1] to a signed 16-bit Q15 integer."""
    v = int(round(x * Q15))
    # Clamp to [-32768, 32767]
    return max(-32768, min(32767, v))


def to_u16(x: int) -> int:
    """Convert a signed 16-bit integer to unsigned (two's complement)."""
    return x & 0xFFFF


def generate_rom(s: int, p: int) -> list[int]:
    """
    Generate ROM contents for stage s, path p.

    Returns a list of 32-bit unsigned words (each = {im[15:0], re[15:0]}).
    """
    depth = N // (P * (2 ** (s + 1)))   # 128 >> s
    words = []
    for k in range(depth):
        n = (k * P + p) * (2 ** s)
        angle = -2.0 * math.pi * n / N
        re_f = math.cos(angle)
        im_f = math.sin(angle)
        re_q = to_q15(re_f)
        im_q = to_q15(im_f)
        # Pack: {im[15:0], re[15:0]}
        word = ((to_u16(im_q) << 16) | to_u16(re_q))
        words.append(word)
    return words


def write_hex(path: str, words: list[int]) -> None:
    """Write a Verilog $readmemh-compatible hex file (one 32-bit word per line)."""
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, 'w') as f:
        for w in words:
            f.write(f"{w:08X}\n")


def verify(s: int, p: int, words: list[int]) -> None:
    """Print the first few entries of a ROM for sanity checking."""
    depth = len(words)
    print(f"  Stage {s}, Path {p}: depth={depth}")
    for k in range(min(4, depth)):
        w    = words[k]
        re_u = w & 0xFFFF
        im_u = (w >> 16) & 0xFFFF
        re_s = re_u if re_u < 32768 else re_u - 65536
        im_s = im_u if im_u < 32768 else im_u - 65536
        n    = (k * P + p) * (2 ** s)
        angle = -2.0 * math.pi * n / N
        re_exact = math.cos(angle)
        im_exact = math.sin(angle)
        print(f"    k={k:3d}  n={n:5d}  "
              f"re={re_s:6d} ({re_exact:+.4f})  "
              f"im={im_s:6d} ({im_exact:+.4f})")


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate MDF FFT twiddle ROMs")
    parser.add_argument("--verify", action="store_true",
                        help="Print first entries of each ROM for sanity checking")
    parser.add_argument("--outdir", default="rom",
                        help="Output directory (default: rom/)")
    args = parser.parse_args()

    out_dir = args.outdir
    total = 0

    for s in range(L_FB):
        for p in range(P):
            words = generate_rom(s, p)
            depth = len(words)
            path  = os.path.join(out_dir, f"tw_s{s}_p{p}.hex")
            write_hex(path, words)
            total += 1
            if args.verify:
                verify(s, p, words)

    print(f"Generated {total} ROM files in '{out_dir}/'")
    print(f"Stage depths: " + ", ".join(
        f"s{s}={N//(P*(2**(s+1)))}" for s in range(L_FB)
    ))

    # Verify stage 0 path 0 entry 0 must be (1+0j) = W_1024^0
    w0 = generate_rom(0, 0)[0]
    re0 = w0 & 0xFFFF
    if re0 != 32767:
        print(f"WARNING: ROM[s=0,p=0,k=0].re = {re0}, expected 32767")
    else:
        print("Sanity check: ROM[s=0,p=0,k=0] = 1+0j  OK")


if __name__ == "__main__":
    main()
