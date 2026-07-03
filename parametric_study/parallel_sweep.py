#!/usr/bin/env python3
"""
parallel_sweep.py — Parametric sweep harness for the P=4 MDF FFT.
=================================================================
Drives the thesis Parallel MDF verification flow (the same fft_stage_fb/nf,
delay_line, complex_mult, twiddle_rom, bit_reverse RTL, simulated with Icarus
Verilog, scored with common/dsp_metrics.py) across a matrix of FFT sizes,
data-path widths and twiddle widths.

Because the thesis fft_top.v is hand-wired for N=1024, each config:
  1. code-generates a size-specialised fft_top (parallel_codegen.gen_fft_top),
  2. generates the twiddle eighth-ROMs at (N, TWIDDLE_W),
  3. generates a matching parametric system testbench,
  4. compiles the generated top + TB with the *unmodified* sub-module RTL,
  5. simulates, reconstructs the stride-(N/P) spectrum, and recomputes the
     identical DSP figures of merit.

Outputs land under results/parametric_sweep/parallel/<config>/ and an
aggregate CSV at results/parametric_sweep/parallel_summary.csv.

At the default config (N=1024, DATA=16, TWIDDLE=16) this reproduces the
thesis baseline numbers.
"""

import argparse
import csv
import math
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path

import numpy as np

THIS_DIR = Path(__file__).resolve().parent
REPO_ROOT = THIS_DIR.parent
PAR_DIR = REPO_ROOT / "Parallel MDF FFT"
RTL_DIR = PAR_DIR / "rtl"
COMMON_DIR = REPO_ROOT / "common"
RESULTS_DIR = REPO_ROOT / "results" / "parametric_sweep" / "parallel"
BUILD_ROOT = THIS_DIR / "build" / "parallel"

sys.path.insert(0, str(COMMON_DIR))
import dsp_metrics as dsp  # noqa: E402

import parallel_codegen as cg  # noqa: E402  (same dir)

P = 4
NF_ALIGN = None        # bit-reverse alignment offset (None = geometry default)
CLK_PERIOD_NS = 10
TEST_NAMES = {0: "Impulse", 1: "DC", 2: "Sine", 3: "MultiTone", 4: "Chirp"}
SINE_TID = 2

# Sub-module RTL reused verbatim (fft_top is generated, so excluded).
SUBMODULES = ["bit_reverse.v", "block_scaler.v", "butterfly_r2.v",
              "complex_mult.v", "delay_line.v", "fft_stage_fb.v",
              "fft_stage_nf.v", "overflow_detect.v", "twiddle_rom.v"]


# --------------------------------------------------------------------------
# Reference signals (must match the generated TB stimulus)
# --------------------------------------------------------------------------
def make_references(N, data_w):
    amp = max(1, (1 << (data_w - 1)) // 16)
    mt_amp = max(1, int(round((1 << (data_w - 1)) * (600.0 / 32768.0))))
    tone, mt = cg.scaled_bins(N)
    chirp_f1 = N // 2 - 1
    nn = np.arange(N)
    refs = {}

    x0 = np.zeros(N, dtype=complex); x0[0] = amp
    refs[0] = np.fft.fft(x0)

    x1 = np.full(N, amp, dtype=complex)
    refs[1] = np.fft.fft(x1)

    x2 = np.array([int(round(amp * math.sin(2*math.pi*tone*n/N))) for n in range(N)], dtype=complex)
    refs[2] = np.fft.fft(x2)

    x3 = np.array([int(round(mt_amp * sum(math.sin(2*math.pi*b*n/N) for b in mt))) for n in range(N)], dtype=complex)
    refs[3] = np.fft.fft(x3)

    x4 = np.zeros(N, dtype=complex)
    for n in range(N):
        ph = 2*math.pi*(chirp_f1*n/(2.0*N))*n/N
        x4[n] = int(round(amp*math.sin(ph)))
    refs[4] = np.fft.fft(x4)
    return refs, dict(tone=tone, mt=mt, amp=amp)


# --------------------------------------------------------------------------
# Parse + reconstruct (mirrors Parallel fft_verify.py)
# --------------------------------------------------------------------------
def parse_outputs(csv_path, N):
    rows = {0: [], 1: [], 2: [], 3: [], 4: []}
    if not csv_path.exists():
        return rows

    def si(v):
        v = v.strip().lower()
        return 0 if ("x" in v or "z" in v or v == "") else int(v)

    with open(csv_path) as f:
        rdr = csv.DictReader(f)
        for r in rdr:
            tid = int(r["test_id"])
            rec = {"bfp_exp": si(r["bfp_exp"])}
            for p in range(P):
                rec[f"out{p}_r"] = si(r[f"out{p}_r"])
                rec[f"out{p}_i"] = si(r[f"out{p}_i"])
            rows[tid].append(rec)
    words = N // P
    for tid in rows:
        all_rows = rows[tid]
        rows[tid] = all_rows[words:] if len(all_rows) >= 2 * words else all_rows
    return rows


def reconstruct(hw_samples, N):
    bins = np.zeros(N, dtype=complex)
    stride = N // P
    for k, s in enumerate(hw_samples[:stride]):
        scale = 2.0 ** s["bfp_exp"]
        for p in range(P):
            bins[k + p*stride] = complex(s[f"out{p}_r"], s[f"out{p}_i"]) * scale
    return bins


def compute_sqnr(ref, hw):
    n = min(len(ref), len(hw))
    if n == 0:
        return -np.inf
    ref_t, hw_t = ref[:n], hw[:n]
    sig = np.mean(np.abs(ref_t) ** 2)
    noise = np.mean(np.abs(ref_t - hw_t) ** 2)
    if noise < 1e-20:
        return 120.0
    if sig < 1e-20:
        return 0.0
    return 10 * np.log10(sig / noise)


# --------------------------------------------------------------------------
# Per-config run
# --------------------------------------------------------------------------
def run_config(N, data_w, twiddle_w, keep_build=False, timeout=1800):
    cfg = f"N{N}_D{data_w}_T{twiddle_w}" if P == 4 else f"N{N}_P{P}_D{data_w}_T{twiddle_w}"
    geo = cg.fft_geometry(N, P)
    build_dir = BUILD_ROOT / cfg
    if build_dir.exists():
        shutil.rmtree(build_dir)
    build_dir.mkdir(parents=True, exist_ok=True)
    print(f"\n=== Parallel {cfg}  (L={geo['L']} stages, blk_exp={geo['blk_exp']}, pipe_w={geo['pipe_w']}) ===")

    # 1. generated top + TB
    (build_dir / "fft_top_gen.v").write_text(cg.gen_fft_top(N, P, nf_align=NF_ALIGN))
    (build_dir / "tb_gen.v").write_text(cg.gen_tb(N, P, data_w, twiddle_w))
    # 2. eighth ROMs
    cg.gen_eighth_roms(build_dir, N, twiddle_w)

    # 3. compile (twiddle width override via -D not needed — fft_stage_fb now
    #    threads TWIDDLE_W; the TB sets TWIDDLE_W=DW. To sweep twiddle width
    #    independently we override the DUT's TWIDDLE_W parameter through a
    #    define the generated TB honours.)
    srcs = [str(build_dir / "fft_top_gen.v"), str(build_dir / "tb_gen.v")]
    subs = list(SUBMODULES)
    if P != 4:
        # P!=4 uses the generated NF block instead of fft_stage_nf
        (build_dir / "nf_gen.v").write_text(cg.gen_nf(P, data_w))
        srcs.append(str(build_dir / "nf_gen.v"))
        subs = [m for m in subs if m != "fft_stage_nf.v"]
    srcs += [str(RTL_DIR / m) for m in subs]
    cmd = ["iverilog", "-gsystem-verilog", "-o", "fft_sim", "-s", "tb_fft_top", *srcs]
    r = subprocess.run(cmd, cwd=build_dir, capture_output=True, text=True)
    if r.returncode != 0:
        raise RuntimeError(f"compile failed:\n{r.stderr}")

    # 4. simulate
    t0 = time.time()
    r = subprocess.run(["vvp", "fft_sim"], cwd=build_dir,
                       capture_output=True, text=True, timeout=timeout)
    sim_time = time.time() - t0
    if r.returncode != 0:
        raise RuntimeError(f"sim failed:\n{r.stderr}\n{r.stdout[-1500:]}")

    # 5. parse + score
    refs, info = make_references(N, data_w)
    rows = parse_outputs(build_dir / "fft_output.csv", N)
    results = {}
    for tid in sorted(TEST_NAMES):
        hw = reconstruct(rows[tid], N)
        ref = refs[tid]
        n = min(len(hw), len(ref))
        ref_t, hw_t = ref[:n], hw[:n]
        is_tone = (tid == SINE_TID)
        tm = dsp.tone_metrics(ref_t, hw_t, info["tone"] if is_tone else None, single_tone=is_tone)
        sqnr = compute_sqnr(ref_t, hw_t)
        bfp = rows[tid][0]["bfp_exp"] if rows[tid] else 0
        results[tid] = dict(name=TEST_NAMES[tid], sqnr_db=sqnr, bfp=bfp,
                            num_outputs=n, hw_fft=hw_t, ref_fft=ref_t,
                            sfdr_dbc=tm["sfdr_dbc"], thd_db=tm["thd_db"],
                            sinad_db=tm["sinad_db"], enob_bits=tm["enob_bits"],
                            phase_rms_deg_detrended=tm["phase_rms_deg_detrended"])
        print(f"    {TEST_NAMES[tid]:9s} SQNR={sqnr:6.2f} dB  outs={n}  bfp={bfp}")

    cfg_dir = RESULTS_DIR / cfg
    cfg_dir.mkdir(parents=True, exist_ok=True)
    save_csv(cfg_dir, results)
    save_npz(cfg_dir, results)

    # throughput: one N-point block every N/P clocks (streaming)
    throughput = N / ((N / P) * CLK_PERIOD_NS * 1e-9) / 1e6

    if not keep_build:
        shutil.rmtree(build_dir, ignore_errors=True)

    return dict(config=cfg, N=N, data_width=data_w, twiddle_width=twiddle_w,
                L=geo["L"], blk_exp=geo["blk_exp"], throughput_msps=throughput,
                sim_time_s=sim_time, results=results)


def _fmt(v, nd=2):
    if v is None or (isinstance(v, float) and (math.isnan(v) or math.isinf(v))):
        return "N/A"
    return f"{v:.{nd}f}"


def save_csv(cfg_dir, results):
    with open(cfg_dir / "metrics.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["Test", "SQNR_dB", "SFDR_dBc", "THD_dB", "SINAD_dB",
                    "ENOB_bits", "Phase_RMS_detrended_deg", "BFP_Exp"])
        for tid in sorted(results):
            r = results[tid]
            w.writerow([r["name"], _fmt(r["sqnr_db"]), _fmt(r["sfdr_dbc"]),
                        _fmt(r["thd_db"]), _fmt(r["sinad_db"]), _fmt(r["enob_bits"]),
                        _fmt(r["phase_rms_deg_detrended"], 3), r["bfp"]])


def save_npz(cfg_dir, results):
    arrays, tids = {}, []
    for tid, r in results.items():
        if r["num_outputs"] == 0:
            continue
        arrays[f"hw_{tid}"] = np.asarray(r["hw_fft"], complex)
        arrays[f"ref_{tid}"] = np.asarray(r["ref_fft"], complex)
        tids.append(tid)
    arrays["test_ids"] = np.array(tids, int)
    np.savez(cfg_dir / "spectrum.npz", **arrays)


# Grid values:  N ∈ {512,1024,2048,4096}, D ∈ {8,16,32,64}, T ∈ {8,16,32,64}.
# OFAT N-axis at (D=16,T=16) + full data×twiddle plane at N=1024 (subsumes the
# D and T axes and the baseline) = 16 + 3 = 19 unique configs, matching the
# Serial harness exactly.
N_VALUES = (512, 1024, 2048, 4096)
D_VALUES = (8, 16, 32, 64)
T_VALUES = (8, 16, 32, 64)
N_BASE, D_BASE, T_BASE = 1024, 16, 16


def default_matrix():
    cfgs, seen = [], set()
    def add(N, d, t):
        if (N, d, t) not in seen:
            seen.add((N, d, t)); cfgs.append((N, d, t))
    add(N_BASE, D_BASE, T_BASE)       # baseline parity
    for N in N_VALUES:                # Axis A — FFT size (the refactor test)
        add(N, D_BASE, T_BASE)
    for d in D_VALUES:                # Full data×twiddle plane at N=1024
        for t in T_VALUES:
            add(N_BASE, d, t)
    return cfgs


def parse_tokens(s):
    import re
    out = []
    for tok in s.replace(",", " ").split():
        m = re.match(r"N(\d+)_D(\d+)_T(\d+)$", tok)
        if not m:
            raise SystemExit(f"bad config token: {tok}")
        out.append((int(m.group(1)), int(m.group(2)), int(m.group(3))))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--only")
    ap.add_argument("--configs", help="explicit configs, e.g. 'N1024_D16_T20 N1024_D32_T24'")
    ap.add_argument("--summary", default="parallel_summary.csv")
    ap.add_argument("--P", type=int, default=4, help="parallelism (power of 2)")
    ap.add_argument("--nf-align", type=int, default=None,
                    help="bit-reverse alignment offset (tuning; default=geometry)")
    ap.add_argument("--keep-build", action="store_true")
    args = ap.parse_args()
    global P, NF_ALIGN
    P = args.P
    NF_ALIGN = args.nf_align
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)

    matrix = parse_tokens(args.configs) if args.configs else default_matrix()
    summary = []
    for (N, d, t) in matrix:
        cfg = f"N{N}_D{d}_T{t}"
        if args.only and args.only != cfg:
            continue
        try:
            summary.append(run_config(N, d, t, keep_build=args.keep_build))
        except Exception as e:
            print(f"  [FAIL] {cfg}: {str(e).splitlines()[0][:200]}")
            summary.append(dict(config=cfg, N=N, data_width=d, twiddle_width=t,
                                error=str(e).splitlines()[0][:200]))
    write_summary(summary, args.summary)


def write_summary(summary, name="parallel_summary.csv"):
    path = RESULTS_DIR.parent / name
    with open(path, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["Config", "N", "DataW", "TwiddleW", "Stages", "BlkExp",
                    "Throughput_MSPS", "SimTime_s", "SQNR_Impulse", "SQNR_DC",
                    "SQNR_Sine", "SQNR_MultiTone", "SQNR_Chirp", "ENOB_Sine", "Status"])
        for s in summary:
            if "error" in s:
                w.writerow([s["config"], s["N"], s["data_width"], s["twiddle_width"],
                            "", "", "", "", "", "", "", "", "", "", f"FAIL: {s['error']}"])
                continue
            r = s["results"]
            def sq(t): return _fmt(r[t]["sqnr_db"]) if t in r else "N/A"
            w.writerow([s["config"], s["N"], s["data_width"], s["twiddle_width"],
                        s["L"], s["blk_exp"], _fmt(s["throughput_msps"], 1),
                        _fmt(s["sim_time_s"], 1), sq(0), sq(1), sq(2), sq(3), sq(4),
                        _fmt(r[2]["enob_bits"]) if 2 in r else "N/A", "OK"])
    print(f"\n[+] Wrote parallel sweep summary: {path}")


if __name__ == "__main__":
    main()
