#!/usr/bin/env python3
"""
run_regression.py — drive the per-test xsim invocations and aggregate
the PASS/FAIL + SQNR numbers into a single summary table.

Usage:
    python scripts/run_regression.py serial      # → 5 tests on Serial DUT
    python scripts/run_regression.py parallel    # → 5 tests on Parallel DUT
    python scripts/run_regression.py both        # → both
"""
import sys
import re
import subprocess
from pathlib import Path

# Force UTF-8 stdout so Unicode arrows don't crash on Windows cp1253
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

TESTS = [
    ("fft_impulse_test",   "Impulse"),
    ("fft_dc_test",        "DC"),
    ("fft_sine_test",      "Sine"),
    ("fft_multitone_test", "MultiTone"),
    ("fft_chirp_test",     "Chirp"),
]

UVM_DIR = Path(__file__).resolve().parent.parent

# Regex for the scoreboard PASS/FAIL line:
# "[Impulse] PASS : SQNR = 120.00 dB (threshold 100.00, BFP exp=-1)"
SCORE_RE = re.compile(
    r"\[(?P<name>\w+)\]\s+(?P<verdict>PASS|FAIL)\s*:\s*SQNR\s*=\s*"
    r"(?P<sqnr>-?[\d.]+|-inf|nan)\s*dB\s*"
    r"\(threshold\s+(?P<thresh>[\d.]+),\s*BFP\s+exp=(?P<bfp>-?\d+)\)"
)


def run_one(make_target: str, uvm_testname: str) -> dict:
    """Run `make <target> UVM_TESTNAME=<uvm>` and parse the scoreboard line."""
    cmd = ["make", make_target, f"UVM_TESTNAME={uvm_testname}"]
    print(f"  → {' '.join(cmd)}")
    # text=True can crash on Windows when xsim emits bytes that aren't valid
    # in the system codepage (cp1253). Force UTF-8 + replace on decode errors.
    proc = subprocess.run(cmd, cwd=UVM_DIR, capture_output=True,
                          encoding="utf-8", errors="replace", timeout=600)
    output = (proc.stdout or "") + (proc.stderr or "")

    m = SCORE_RE.search(output)
    if not m:
        return {"verdict": "ERROR", "sqnr": None, "thresh": None, "bfp": None,
                "name": uvm_testname, "tail": output.splitlines()[-15:]}

    return {
        "verdict": m.group("verdict"),
        "sqnr":    m.group("sqnr"),
        "thresh":  m.group("thresh"),
        "bfp":     m.group("bfp"),
        "name":    m.group("name"),
        "exit":    proc.returncode,
    }


def run_dut(dut: str) -> int:
    """Run all 5 tests on one DUT. Returns the number of PASS results."""
    target = dut   # "serial" or "parallel"
    print(f"\n===== {dut.upper()} regression =====")
    results = []
    for uvm_test, label in TESTS:
        r = run_one(target, uvm_test)
        r["label"] = label
        results.append(r)

    # Pretty summary
    print(f"\n----- {dut.upper()} summary -----")
    print(f"  {'Test':<12}  {'Verdict':<8}  {'SQNR (dB)':>10}  {'Threshold':>10}  {'BFP exp':>7}")
    print(f"  {'-'*12}  {'-'*8}  {'-'*10}  {'-'*10}  {'-'*7}")
    n_pass = 0
    for r in results:
        sqnr_str   = r['sqnr'] if r['sqnr'] is not None else 'N/A'
        thresh_str = r['thresh'] if r['thresh'] is not None else 'N/A'
        bfp_str    = r['bfp'] if r['bfp'] is not None else 'N/A'
        print(f"  {r['label']:<12}  {r['verdict']:<8}  {sqnr_str:>10}  {thresh_str:>10}  {bfp_str:>7}")
        if r['verdict'] == 'PASS':
            n_pass += 1
        if r['verdict'] == 'ERROR':
            print(f"    (couldn't parse scoreboard output; last lines:)")
            for line in r['tail']:
                print(f"    | {line}")

    print(f"\n  Overall: {n_pass}/{len(results)} PASS")
    return n_pass


def main():
    arg = sys.argv[1] if len(sys.argv) > 1 else "serial"
    if arg == "both":
        n_serial   = run_dut("serial")
        n_parallel = run_dut("parallel")
        total      = n_serial + n_parallel
        print(f"\n===== GRAND TOTAL: {total}/10 PASS =====")
        sys.exit(0 if total == 10 else 1)
    else:
        n = run_dut(arg)
        sys.exit(0 if n == 5 else 1)


if __name__ == "__main__":
    main()
