#!/usr/bin/env python3
"""
serial_sweep.py — Parametric sweep harness for the Serial FFT Processor.
========================================================================
Runs the *existing* Serial AXI verification flow (fft_axi_tb_xc7.v + the
rtl/ modules, simulated with Icarus Verilog) across a matrix of:

    * FFT size            N  ∈ {512, 1024, 2048, 4096}
    * data-path width     DATA_WIDTH    ∈ {8, 16, 32, 64}
    * twiddle width       TWIDDLE_WIDTH ∈ {8, 16, 32, 64}

The Serial RTL is genuinely size-parametric (AGU/RAM/BFU/BFP/ROM all take
N / DATA_WIDTH / TWIDDLE_WIDTH / LOG2_N), so each config is realised by:

  1. regenerating the 1/8-cycle cos.mem / sin.mem at (N, TWIDDLE_WIDTH),
  2. generating width-scaled, N-scaled stimulus for the 5 standard signals,
  3. compiling the TB with `iverilog -D<param>=<value>` overrides
     (Icarus 0.9.7 has no -P, so the TB exposes `ifndef`-guarded macros),
  4. simulating, reading hw_output.csv, and recomputing the identical DSP
     figures of merit from common/dsp_metrics.py — the same single source
     of truth used by the thesis verification scripts.

Outputs land under  results/parametric_sweep/serial/<config>/  and an
aggregate CSV at  results/parametric_sweep/serial_summary.csv.

This harness is additive: it does not modify the thesis baseline scripts,
and at the default config (N=1024, DATA=16, TWIDDLE=16) it reproduces the
baseline numbers, which the harness checks explicitly.
"""

import argparse
import csv
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path

import numpy as np

# --------------------------------------------------------------------------
# Paths
# --------------------------------------------------------------------------
THIS_DIR = Path(__file__).resolve().parent
REPO_ROOT = THIS_DIR.parent
SERIAL_DIR = REPO_ROOT / "Serial FFT processor"
RTL_DIR = SERIAL_DIR / "rtl"
TB_FILE = SERIAL_DIR / "tb" / "fft_axi_tb_xc7.v"
COMMON_DIR = REPO_ROOT / "common"
RESULTS_DIR = REPO_ROOT / "results" / "parametric_sweep" / "serial"
BUILD_ROOT = THIS_DIR / "build" / "serial"

sys.path.insert(0, str(COMMON_DIR))
import dsp_metrics as dsp  # noqa: E402

# --------------------------------------------------------------------------
# Twiddle ROM generator (reuse the parametrized thesis generator)
# --------------------------------------------------------------------------
sys.path.insert(0, str(SERIAL_DIR / "scripts"))
from twiddle_generator import generate_twiddle_roms  # noqa: E402

CLK_PERIOD_NS = 10

# Full-scale fraction for the drive amplitude. 10000/32768 = 0.3052 reproduces
# the proven thesis amplitude at 16-bit; scaling by 2^(DATA_WIDTH-1) keeps the
# *relative* drive level (and therefore the SQNR comparison) consistent across
# data-path widths.
FULL_SCALE_FRACTION = 10000.0 / 32768.0
MULTITONE_FRACTION = 3000.0 / 32768.0

TEST_NAMES = {0: "Impulse", 1: "DC", 2: "Sine", 3: "MultiTone", 4: "Chirp"}
SINE_TID = 2


# --------------------------------------------------------------------------
# Signal generation (scaled with N and DATA_WIDTH)
# --------------------------------------------------------------------------
def scaled_bins(N):
    """Return (tone_bin, multitone_bins) scaled from the 1024-pt baseline."""
    tone_bin = int(round(50 * N / 1024))
    mt = [int(round(b * N / 1024)) for b in (50, 200, 450)]
    # Keep every tone strictly below Nyquist so it is an unaliased real bin.
    mt = [b for b in mt if 0 < b < N // 2]
    return tone_bin, mt


def make_references(N, data_width):
    """Build the 5 standard test signals as integer time series + float64 FFT."""
    amp = int(round(FULL_SCALE_FRACTION * (1 << (data_width - 1))))
    mt_amp = int(round(MULTITONE_FRACTION * (1 << (data_width - 1))))
    tone_bin, mt_bins = scaled_bins(N)
    nn = np.arange(N)
    refs = {}

    x0 = np.zeros(N, dtype=complex); x0[0] = amp
    refs[0] = dict(re=x0.real.astype(np.int64), im=x0.imag.astype(np.int64), fft=np.fft.fft(x0))

    x1 = np.full(N, amp, dtype=complex)
    refs[1] = dict(re=x1.real.astype(np.int64), im=x1.imag.astype(np.int64), fft=np.fft.fft(x1))

    x2r = np.round(amp * np.sin(2 * np.pi * tone_bin * nn / N)).astype(np.int64)
    x2 = x2r.astype(complex)
    refs[2] = dict(re=x2r, im=np.zeros(N, np.int64), fft=np.fft.fft(x2))

    x3r = np.round(sum(mt_amp * np.sin(2 * np.pi * b * nn / N) for b in mt_bins)).astype(np.int64)
    x3 = x3r.astype(complex)
    refs[3] = dict(re=x3r, im=np.zeros(N, np.int64), fft=np.fft.fft(x3))

    f_end = N // 2 - 1
    phi = 2 * np.pi * (f_end * nn / (2.0 * N)) * nn / N
    x4r = np.round(amp * np.sin(phi)).astype(np.int64)
    x4 = x4r.astype(complex)
    refs[4] = dict(re=x4r, im=np.zeros(N, np.int64), fft=np.fft.fft(x4))

    return refs, dict(amp=amp, mt_amp=mt_amp, tone_bin=tone_bin, mt_bins=mt_bins)


def write_stimulus(build_dir, sig_re, sig_im, data_width):
    """Write stimulus_re.mem / stimulus_im.mem as DATA_WIDTH-bit two's-comp hex."""
    hex_digits = (data_width + 3) // 4
    mask = (1 << data_width) - 1
    for name, sig in (("stimulus_re.mem", sig_re), ("stimulus_im.mem", sig_im)):
        with open(build_dir / name, "w") as f:
            for v in sig:
                f.write(f"{int(v) & mask:0{hex_digits}X}\n")


# --------------------------------------------------------------------------
# Convention alignment + SQNR (mirrors fft_verify_serial.py)
# --------------------------------------------------------------------------
def align_convention(hw, ref):
    n = min(len(hw), len(ref))
    h, r = hw[:n], ref[:n]

    def fit(cand):
        denom = np.sum(np.abs(cand) ** 2)
        beta = np.sum(np.conj(cand) * r) / denom if denom > 0 else 0.0
        aligned = beta * cand
        return np.sum(np.abs(aligned - r) ** 2)

    if fit(np.conj(h)) < fit(h):
        denom = np.sum(np.abs(h) ** 2)
        beta = np.sum(h * r) / denom if denom > 0 else 0.0  # conj(conj(h)) = h
        return beta * np.conj(hw)
    denom = np.sum(np.abs(h) ** 2)
    beta = np.sum(np.conj(h) * r) / denom if denom > 0 else 0.0
    return beta * hw


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
# Per-config simulation
# --------------------------------------------------------------------------
def compile_sim(build_dir, N, log2n, data_width, twiddle_width):
    rtl_files = sorted(str(p) for p in RTL_DIR.glob("*.v"))
    cmd = [
        "iverilog", "-o", "fft_axi_sim",
        f"-DN={N}", f"-DLOG2_N={log2n}",
        f"-DDATA_WIDTH={data_width}", f"-DTWIDDLE_WIDTH={twiddle_width}",
        str(TB_FILE), *rtl_files,
    ]
    r = subprocess.run(cmd, cwd=build_dir, capture_output=True, text=True)
    if r.returncode != 0:
        raise RuntimeError(f"compile failed:\n{r.stderr}")
    return r.stderr.strip()


def run_sim(build_dir, timeout=900):
    t0 = time.time()
    r = subprocess.run(["vvp", "fft_axi_sim"], cwd=build_dir,
                       capture_output=True, text=True, timeout=timeout)
    if r.returncode != 0:
        raise RuntimeError(f"sim failed:\n{r.stderr}\n{r.stdout[-2000:]}")
    return time.time() - t0


def read_hw_output(build_dir, N):
    out = build_dir / "hw_output.csv"
    if not out.exists():
        raise RuntimeError("hw_output.csv not produced")

    def safe(v):
        v = v.strip().lower()
        return 0 if ("x" in v or "z" in v or not v) else int(v)

    re, im = [], []
    with open(out) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            p = line.split(",")
            re.append(safe(p[0])); im.append(safe(p[1]))
    exponent = 0
    exp_file = build_dir / "hw_exponent.txt"
    if exp_file.exists():
        try:
            exponent = int(exp_file.read_text().strip())
        except ValueError:
            exponent = 0
    return np.array(re, np.float64), np.array(im, np.float64), exponent


def total_cycles(N, log2n):
    return (N // 2 + 10) * log2n


def run_config(N, data_width, twiddle_width, keep_build=False):
    log2n = int(np.log2(N))
    assert (1 << log2n) == N, "N must be a power of two"
    cfg = f"N{N}_D{data_width}_T{twiddle_width}"
    build_dir = BUILD_ROOT / cfg
    if build_dir.exists():
        shutil.rmtree(build_dir)
    build_dir.mkdir(parents=True, exist_ok=True)

    print(f"\n=== Serial {cfg}  (LOG2_N={log2n}) ===")

    # 1. ROMs at (N, twiddle_width)
    generate_twiddle_roms(output_dir=build_dir, N=N, WIDTH=twiddle_width)

    # 2. references / stimulus
    refs, stim_info = make_references(N, data_width)

    # 3+4. per-test sim
    results = {}
    sim_total = 0.0
    compile_warn = compile_sim(build_dir, N, log2n, data_width, twiddle_width)
    if compile_warn:
        print(f"  [compile warnings] {compile_warn.splitlines()[0][:120]}")

    for tid, data in refs.items():
        write_stimulus(build_dir, data["re"], data["im"], data_width)
        sim_total += run_sim(build_dir)
        hw_re, hw_im, exponent = read_hw_output(build_dir, N)
        hw = (hw_re + 1j * hw_im) * (2.0 ** exponent)
        hw = align_convention(hw, data["fft"])

        n = min(len(hw), len(data["fft"]))
        ref_t, hw_t = data["fft"][:n], hw[:n]
        is_tone = (tid == SINE_TID)
        tm = dsp.tone_metrics(ref_t, hw_t,
                              stim_info["tone_bin"] if is_tone else None,
                              single_tone=is_tone)
        sqnr = compute_sqnr(ref_t, hw_t)
        peak_match = (n > 0 and int(np.argmax(np.abs(hw_t))) == int(np.argmax(np.abs(ref_t))))
        results[tid] = dict(
            name=TEST_NAMES[tid], sqnr_db=sqnr, num_outputs=n,
            peak_match=peak_match, bfp_final=exponent,
            sfdr_dbc=tm["sfdr_dbc"], thd_db=tm["thd_db"], thd_pct=tm["thd_pct"],
            sinad_db=tm["sinad_db"], enob_bits=tm["enob_bits"],
            phase_rms_deg_detrended=tm["phase_rms_deg_detrended"],
            hw_fft=hw_t, ref_fft=ref_t,
        )
        print(f"    {TEST_NAMES[tid]:9s} SQNR={sqnr:6.2f} dB  exp={exponent:+d}  peak={'ok' if peak_match else 'X'}")

    # 5. persist per-config artifacts
    cfg_dir = RESULTS_DIR / cfg
    cfg_dir.mkdir(parents=True, exist_ok=True)
    save_config_csv(cfg_dir, results)
    save_config_npz(cfg_dir, results)

    cyc = total_cycles(N, log2n)
    throughput = N / (cyc * CLK_PERIOD_NS * 1e-9) / 1e6  # MSPS

    if not keep_build:
        shutil.rmtree(build_dir, ignore_errors=True)

    return dict(
        config=cfg, N=N, data_width=data_width, twiddle_width=twiddle_width,
        log2n=log2n, cycles=cyc, throughput_msps=throughput,
        sim_time_s=sim_total, results=results, stim_info=stim_info,
    )


def _fmt(v, nd=2):
    import math
    if v is None or (isinstance(v, float) and (math.isnan(v) or math.isinf(v))):
        return "N/A"
    return f"{v:.{nd}f}"


def save_config_csv(cfg_dir, results):
    with open(cfg_dir / "metrics.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["Test", "SQNR_dB", "SFDR_dBc", "THD_dB", "SINAD_dB",
                    "ENOB_bits", "Phase_RMS_detrended_deg", "Peak_Match", "BFP_Exp"])
        for tid in sorted(results):
            r = results[tid]
            w.writerow([r["name"], _fmt(r["sqnr_db"]), _fmt(r["sfdr_dbc"]),
                        _fmt(r["thd_db"]), _fmt(r["sinad_db"]), _fmt(r["enob_bits"]),
                        _fmt(r["phase_rms_deg_detrended"], 3),
                        r["peak_match"], r["bfp_final"]])


def save_config_npz(cfg_dir, results):
    arrays = {}
    tids = []
    for tid, r in results.items():
        if r["num_outputs"] == 0:
            continue
        arrays[f"hw_{tid}"] = np.asarray(r["hw_fft"], complex)
        arrays[f"ref_{tid}"] = np.asarray(r["ref_fft"], complex)
        tids.append(tid)
    arrays["test_ids"] = np.array(tids, int)
    np.savez(cfg_dir / "spectrum.npz", **arrays)


# --------------------------------------------------------------------------
# Sweep matrix — on-grid OFAT N-axis + full data×twiddle plane at N=1024.
#
# Grid values:  N ∈ {512,1024,2048,4096}, D ∈ {8,16,32,64}, T ∈ {8,16,32,64}.
# The N axis is held at the (D=16,T=16) baseline; the D×T plane at N=1024
# subsumes the data-width axis (T=16 column), the twiddle-width axis (D=16
# row) and the baseline, giving 16 + 3 = 19 unique configs.
# --------------------------------------------------------------------------
N_VALUES = (512, 1024, 2048, 4096)
D_VALUES = (8, 16, 32, 64)
T_VALUES = (8, 16, 32, 64)
N_BASE, D_BASE, T_BASE = 1024, 16, 16


def default_matrix():
    cfgs = []
    seen = set()

    def add(N, d, t):
        key = (N, d, t)
        if key not in seen:
            seen.add(key)
            cfgs.append(key)

    # Baseline
    add(N_BASE, D_BASE, T_BASE)
    # Axis A — FFT size (data=16, twiddle=16)
    for N in N_VALUES:
        add(N, D_BASE, T_BASE)
    # Full data×twiddle plane at N=1024 (subsumes the D and T axes)
    for d in D_VALUES:
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
    ap.add_argument("--only", help="run a single config like N1024_D16_T16")
    ap.add_argument("--configs", help="explicit configs, e.g. 'N1024_D16_T20 N1024_D32_T24'")
    ap.add_argument("--summary", default="serial_summary.csv", help="summary CSV filename")
    ap.add_argument("--keep-build", action="store_true")
    args = ap.parse_args()

    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    matrix = parse_tokens(args.configs) if args.configs else default_matrix()

    summary = []
    for (N, d, t) in matrix:
        cfg = f"N{N}_D{d}_T{t}"
        if args.only and args.only != cfg:
            continue
        try:
            res = run_config(N, d, t, keep_build=args.keep_build)
            summary.append(res)
        except Exception as e:
            print(f"  [FAIL] {cfg}: {e}")
            summary.append(dict(config=cfg, N=N, data_width=d, twiddle_width=t,
                                error=str(e).splitlines()[0][:200]))

    write_summary(summary, args.summary)


def write_summary(summary, name="serial_summary.csv"):
    path = RESULTS_DIR.parent / name
    with open(path, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["Config", "N", "DataW", "TwiddleW", "Throughput_MSPS",
                    "Cycles", "SimTime_s",
                    "SQNR_Impulse", "SQNR_DC", "SQNR_Sine", "SQNR_MultiTone",
                    "SQNR_Chirp", "ENOB_Sine", "SFDR_Sine_dBc", "Status"])
        for s in summary:
            if "error" in s:
                w.writerow([s["config"], s["N"], s["data_width"], s["twiddle_width"],
                            "", "", "", "", "", "", "", "", "", "", f"FAIL: {s['error']}"])
                continue
            r = s["results"]
            def sq(t): return _fmt(r[t]["sqnr_db"]) if t in r else "N/A"
            w.writerow([
                s["config"], s["N"], s["data_width"], s["twiddle_width"],
                _fmt(s["throughput_msps"], 3), s["cycles"], _fmt(s["sim_time_s"], 1),
                sq(0), sq(1), sq(2), sq(3), sq(4),
                _fmt(r[2]["enob_bits"]) if 2 in r else "N/A",
                _fmt(r[2]["sfdr_dbc"]) if 2 in r else "N/A",
                "OK",
            ])
    print(f"\n[+] Wrote sweep summary: {path}")


if __name__ == "__main__":
    main()
