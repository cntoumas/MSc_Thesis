#!/usr/bin/env python3
"""Compare HLS FFT output against the RTL hardware output and the golden
reference, using the shared common/dsp_metrics library so the numbers are
directly comparable to the thesis RTL results.

Inputs:
  results/serial/spectrum.npz   - RTL serial: ref_k (golden DFT), hw_k (RTL out)
  results/parallel/spectrum.npz - RTL MDF
  hls/xcheck_serial_out.txt     - HLS serial raw outputs (natural order)
  hls/xcheck_mdf_out.txt        - HLS MDF raw outputs (stream order)
"""
import numpy as np, os, sys
REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, REPO)
from common import dsp_metrics as M

N, P, WORDS = 1024, 4, 256


def parse_hls(path):
    """Return {tid: (name, blk_exp, complex[N])}."""
    out = {}
    with open(path) as f:
        lines = f.read().split("\n")
    i = 0
    while i < len(lines):
        if lines[i].startswith("TEST"):
            _, tid, name, be = lines[i].split()[:4]
            tid = int(tid); be = int(be)
            vals = []
            for j in range(1, N + 1):
                re, im = lines[i + j].split()
                vals.append(int(re) + 1j * int(im))
            out[tid] = (name, be, np.array(vals, dtype=complex))
            i += N + 1
        else:
            i += 1
    return out


def bitrev(idx, bits):
    r = 0
    for _ in range(bits):
        r = (r << 1) | (idx & 1); idx >>= 1
    return r


def deinterleave_mdf(stream, mapping):
    """stream[g*P+p] -> bin per chosen mapping."""
    binv = np.zeros(N, dtype=complex)
    for g in range(WORDS):
        for p in range(P):
            if mapping == "g+pW":   bi = g + p * WORDS
            elif mapping == "p+gP": bi = p + g * P
            elif mapping == "rev":  bi = bitrev(g + p * WORDS, 10)
            binv[bi] = stream[g * P + p]
    return binv


def best_alignment(ref, hls, candidates):
    """Pick the ordering candidate giving the highest scale-fitted SINAD."""
    best = (-np.inf, None, None)
    for label, cand in candidates:
        try:
            sinad = M.compute_sinad_ref(ref, cand)
        except Exception:
            sinad = -np.inf
        if sinad > best[0]:
            best = (sinad, label, cand)
    return best


def report(arch, npz_path, hls_path, mdf=False):
    d = np.load(npz_path, allow_pickle=True)
    names = [str(s) for s in d["names"]]
    tone_bin = int(d["tone_bin"]); sine_tid = int(d["sine_tid"])
    hls = parse_hls(hls_path)

    print(f"\n================= {arch} : HLS vs RTL =================")
    print(f"{'Test':10} {'RTL SQNR':>9} {'HLS SQNR':>9} {'RTL ENOB':>8} "
          f"{'HLS ENOB':>8} {'HLS=RTL':>9}  order")
    rows = []
    for tid in range(len(names)):
        ref = d[f"ref_{tid}"]; hw = d[f"hw_{tid}"]
        name, be, raw = hls[tid]

        if mdf:
            cands = [(m, deinterleave_mdf(raw, m)) for m in ("g+pW", "p+gP", "rev")]
        else:
            cands = [("identity", raw),
                     ("bitrev", raw[[bitrev(k, 10) for k in range(N)]])]
        sinad_best, order, hls_sp = best_alignment(ref, None, cands)

        rtl_sqnr = M.compute_sinad_ref(ref, hw)
        hls_sqnr = M.compute_sinad_ref(ref, hls_sp)
        rtl_enob = M.compute_enob_ref(ref, hw)
        hls_enob = M.compute_enob_ref(ref, hls_sp)
        # HLS-vs-RTL direct agreement (treat RTL as reference)
        agree = M.compute_sinad_ref(hw, hls_sp)
        rows.append((name, rtl_sqnr, hls_sqnr, rtl_enob, hls_enob, agree, order))
        print(f"{name:10} {rtl_sqnr:9.2f} {hls_sqnr:9.2f} {rtl_enob:8.2f} "
              f"{hls_enob:8.2f} {agree:9.2f}  {order}")
    return rows


if __name__ == "__main__":
    report("SERIAL", os.path.join(REPO, "results/serial/spectrum.npz"),
           os.path.join(REPO, "hls/xcheck_serial_out.txt"), mdf=False)
    report("MDF", os.path.join(REPO, "results/parallel/spectrum.npz"),
           os.path.join(REPO, "hls/xcheck_mdf_out.txt"), mdf=True)
    print("\nSINAD here = scale-fitted SINAD vs golden (compute_sinad_ref);")
    print("HLS=RTL column = scale-fitted SINAD of HLS treating RTL output as reference.")
    print("High HLS=RTL (e.g. >60 dB) => HLS reproduces the RTL hardware result.")
