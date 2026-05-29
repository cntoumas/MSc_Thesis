# UVM Verification — Serial FFT & Parallel MDF FFT

UVM 1.2 verification environment that drives **both** thesis FFT DUTs through
the same agent / scoreboard / coverage stack. One env, two `tb_top`s, five
deterministic stimulus sequences, one PASS/FAIL scoreboard, four functional
covergroups, and AXI4-Stream protocol assertions.

**Final result:** ✅ **10/10 PASS** (5 tests × 2 DUTs).

---

## 1. Layout

```
UVM/
├── env/                     UVM components (agent, scoreboard, ref model, coverage, env)
├── seq/                     5 deterministic sequences + virtual sequence
├── tests/                   Per-test classes + regression test
├── tb/                      tb_top_serial, tb_top_parallel, axi_stream_sva
├── refs/{serial,parallel}/  NumPy-precomputed expected FFT outputs (.mem)
├── scripts/
│   ├── gen_refs.py          Generates refs/*.mem from numpy.fft
│   ├── serial.f             xvlog file list for the Serial DUT compile
│   ├── parallel.f           xvlog file list for the Parallel DUT compile
│   ├── run_regression.py    Loops 5 tests × DUT, parses scoreboard log lines
│   └── plot_results.py      Produces regression_summary.png + coverage_summary.png
├── docs/                    Day-by-day walkthrough markdown
└── Makefile                 xvlog / xelab / xsim driver, plus xcrg coverage merge
```

---

## 2. Prerequisites

| Tool | Where to find it | Notes |
|---|---|---|
| Vivado 2023.2 (xsim) | `C:/Xilinx/Vivado/2023.2/bin/{xvlog,xelab,xsim,xcrg}.bat` | xsim ships UVM 1.2 — no separate install needed |
| Python ≥ 3.10 | system PATH | needs `numpy`, `matplotlib` |
| GNU make | MinGW / git-bash on Windows | the Makefile uses `cp`, `mkdir -p`, etc. |

The Makefile pins `VIVADO_BIN := C:/Xilinx/Vivado/2023.2/bin`. Edit that one
line if Vivado lives somewhere else.

---

## 3. Quick start

```bash
cd UVM

# 1. Generate the NumPy reference vectors (impulse / dc / sine / multitone / chirp).
make refs

# 2. Smoke-test the Serial DUT with a single impulse test (~10 s).
make serial UVM_TESTNAME=fft_impulse_test

# 3. Full regression — 5 tests × 2 DUTs = 10 runs (~3 min).
make regression

# 4. Merge per-test coverage DBs into a single HTML report (writes cov_html/).
make coverage

# 5. Build the two summary PNGs used in the thesis appendix.
python scripts/plot_results.py
```

Expected console after step 3:

```
===== SERIAL regression =====
  Impulse    PASS    120.00 dB    threshold 100.00    BFP -1
  DC         PASS     75.59 dB    threshold  60.00    BFP  6
  Sine       PASS     72.66 dB    threshold  60.00    BFP  6
  MultiTone  PASS     59.14 dB    threshold  50.00    BFP  5
  Chirp      PASS     65.84 dB    threshold  50.00    BFP  4
  Overall: 5/5 PASS

===== PARALLEL regression =====
  Impulse    PASS    120.00 dB    threshold 100.00    BFP 10
  DC         PASS    120.00 dB    threshold 100.00    BFP 10
  Sine       PASS     88.86 dB    threshold  60.00    BFP 10
  MultiTone  PASS     81.96 dB    threshold  55.00    BFP 10
  Chirp      PASS     48.88 dB    threshold  25.00    BFP 10
  Overall: 5/5 PASS

===== GRAND TOTAL: 10/10 PASS =====
```

---

## 4. Make targets

| Target | What it does |
|---|---|
| `make refs` | Runs `scripts/gen_refs.py` → 20 `.mem` files under `refs/{serial,parallel}/` |
| `make serial` | Compiles Serial DUT + UVM env, runs one test (default `fft_smoke_test`) |
| `make parallel` | Compiles Parallel DUT + UVM env, runs one test |
| `make serial-regression` | Loops 5 tests on Serial via `run_regression.py serial` |
| `make parallel-regression` | Same for Parallel |
| `make regression` | Both DUTs, prints the GRAND TOTAL line |
| `make coverage` | Merges `cov_db/xsim.covdb/{serial,parallel}_<test>/` into `cov_html/index.html` via `xcrg` |
| `make bp-serial` | Backpressure-stress run on Serial — pulses tready low (see §11) |
| `make bp-parallel` | Same for Parallel |
| `make equiv` | Direct Serial↔Parallel equivalence check → `equivalence_summary.png` |
| `make clean` | Wipes `xsim.dir`, `work`, logs, `*.wdb`, `cov_html`, `actuals` |
| `make clean-refs` | Removes the generated `.mem` files |
| `make clean-all` | Both of the above |

Per-test override (used by `run_regression.py` and `plot_results.py`):

```bash
make serial   UVM_TESTNAME=fft_sine_test
make parallel UVM_TESTNAME=fft_chirp_test
```

---

## 5. Deliverable artefacts

> **Not version-controlled — all regenerable.** The reference vectors (`refs/*.mem`),
> the summary PNGs, the coverage DBs/HTML, and the captured `actuals/` are produced
> by the make targets below and are excluded from git. Run `make refs` first, then the
> targets here, to recreate them locally. Only the UVM **source**, scripts, docs, the
> Makefile and this README are tracked.

After a clean `make regression && make coverage && python scripts/plot_results.py && make equiv`:

| Artefact | Purpose |
|---|---|
| `regression_summary.png` | SQNR-per-test bar chart with PASS/FAIL annotations, ideal-16-bit reference line, and the `Overall: 10/10 PASS` callout. |
| `coverage_summary.png` | Functional-coverage heatmap (signal × peak-bin quadrant, ignore_bins shaded) + BFP-exponent histogram. **Reachable coverage: 6/9 = 66.7 %.** |
| `equivalence_summary.png` | Direct Serial↔Parallel SQNR per test. **5/5 EQUIV** at 40 dB threshold. |
| `cov_html/index.html` | xsim functional+code coverage merged HTML report. |
| `actuals/<dut>_<test>.txt` | Per-bin scaled FFT output captured by the scoreboard — fed to `equivalence_check.py`. |
| `docs/day{1..5}_walkthrough.md` | Day-by-day build-up of the env, including the debug saga for the Parallel DUT and the Saturday additions. |

---

## 6. Per-test SQNR thresholds

Set in [env/fft_pkg.sv](env/fft_pkg.sv) `sqnr_threshold()`. Numbers come from
the existing `thesis_report_xc7.png` baseline minus ~2 dB headroom.

| Test | Serial threshold | Parallel threshold |
|---|---:|---:|
| Impulse | 100 dB | 100 dB |
| DC | 60 | 100 |
| Sine bin 50 | 60 | 60 |
| MultiTone | 50 | 55 |
| Chirp | 50 | 25 |

A measured SQNR ≥ threshold → PASS. The scoreboard line is printed at
`UVM_NONE` so it's grep-able from any log:

```
UVM_INFO [Impulse] PASS : SQNR = 120.00 dB (threshold 100.00, BFP exp=-1)
```

---

## 7. Functional coverage

Four covergroups in [env/fft_coverage.sv](env/fft_coverage.sv), sampled
**once per FFT block** on the M_AXIS `tlast` beat:

| Covergroup | Coverpoint | Bins |
|---|---|---|
| `cg_signal_type` | which test was driven | 5 (impulse, dc, sine, multitone, chirp) |
| `cg_amplitude` | input amplitude bucket | 5 (very_low, low, mid, high, peak) |
| `cg_bfp_exp` | reported BFP exponent | 5 (neg_large, neg_small, zero, pos_small, pos_large) |
| `cg_peak_bin × signal` | output peak quadrant × signal | 4×5 = 20 (cross) |

Per-block stats are reset on every `tlast`, so each FFT result counts as one
independent sample. The `[COV] sampled: ...` line in the xsim log feeds
`plot_results.py` for the aggregate heatmap.

---

## 8. AXI4-Stream assertions

[tb/axi_stream_sva.sv](tb/axi_stream_sva.sv) is `bind`-ed into both `tb_top`s
on the S_AXIS and M_AXIS interfaces. Four properties:

1. **tvalid_hold** — `$rose(tvalid) |-> tvalid` until handshake (no premature deassertion).
2. **tdata_stable** — `(tvalid && !tready) |=> $stable(tdata)` (stable on backpressure).
3. **tlast_stable** — `(tvalid && !tready) |=> $stable(tlast)`.
4. **tuser_stable** — output BFP exponent is constant across the burst.
5. **no_x_tvalid** — `tvalid` is never X / Z.

Failures show up as `$error` lines from xsim. Clean run → zero failures.

---

## 9. Re-running just the plots

`plot_results.py` re-executes each `make <dut> UVM_TESTNAME=...` to get a
fresh log, then parses both the scoreboard line and the `[COV] sampled:`
line. So you can regenerate the PNGs in isolation:

```bash
python scripts/plot_results.py
```

Output: `regression_summary.png` + `coverage_summary.png` in the `UVM/` root.

---

## 10. References

- Build-up history and debug notes: [docs/day1_walkthrough.md](docs/day1_walkthrough.md) → [docs/day5_walkthrough.md](docs/day5_walkthrough.md)
- DUT RTL — [Serial FFT processor/rtl/fft_axi_top.v](../Serial%20FFT%20processor/rtl/fft_axi_top.v), [Parallel MDF FFT/rtl/fft_axi_top.v](../Parallel%20MDF%20FFT/rtl/fft_axi_top.v)
- Original `thesis_report_xc7` numbers used to set the SQNR thresholds

---

## 11. Backpressure stress test (finding)

`make bp-serial` and `make bp-parallel` pulse the M_AXIS `tready` line low to
test AXI4-Stream backpressure compliance. Tunable via `BP_LOW` / `BP_HIGH`:

```bash
make bp-serial  UVM_TESTNAME=fft_impulse_test BP_LOW=2 BP_HIGH=10
make bp-parallel UVM_TESTNAME=fft_impulse_test BP_LOW=2 BP_HIGH=20
```

**Finding — neither DUT honours M_AXIS backpressure.** With any non-zero
`BP_LOW`, the M_AXIS pipeline stalls and never resumes — the scoreboard
times out with `0/1 block(s)` captured. No SVA fires because the DUT
simply stops asserting `tvalid` (rather than deasserting it mid-burst).

The wrapper RTL exposes `m_axis_tready` as an input but doesn't propagate
it back into the inner FFT core's pipeline-stall logic. This is a
documented limitation, not a regression — the default `make regression`
target leaves backpressure disabled (`BP_LOW=0 BP_HIGH=0`) and all
10/10 tests pass.

For production use the DUTs would need either:
- A downstream FIFO that absorbs ≥1 full FFT block (1024 beats), or
- A wrapper-level back-propagation of `tready` into the FFT core stall.

This is exactly the kind of issue an AXI-Stream protocol stress test is
designed to surface, and a strong argument for the thesis methodology
section.

---

## 12. Architectural equivalence check

`make equiv` runs both DUTs across all 5 tests, dumps each scoreboard's
scaled actuals to `actuals/<dut>_<test>.txt`, and cross-compares them in
Python (`scripts/equivalence_check.py`).

For each test it computes the optimal complex scalar α that best fits the
Parallel output to the Serial output, then reports

  SQNR_equiv = 10·log10( |α·serial|² / |parallel − α·serial|² )

A result ≥ 40 dB → the two DUTs are *functionally equivalent up to a
complex scaling factor*. Current numbers:

| Test | Serial vs Parallel SQNR | Verdict |
|---|---:|:---:|
| Impulse | 120.00 dB | EQUIV |
| DC | 75.59 dB | EQUIV |
| Sine | 72.70 dB | EQUIV |
| MultiTone | 59.13 dB | EQUIV |
| Chirp | 48.92 dB | EQUIV |

**5/5 EQUIV.** This is a stronger statement than "both pass against the
NumPy reference": it shows the two DUTs (with very different micro-
architectures) compute the same FFT to within the worst-case rounding
budget of either implementation.
