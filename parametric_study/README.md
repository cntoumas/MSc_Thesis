# Parametric Study Harness

Additive tooling to sweep both thesis FFT cores over FFT size, data-path width,
twiddle width, and (Parallel only) parallelism P. **Does not modify the thesis
baseline** — at the default `1024 / 16 / 16`, P=4 config each design reproduces
its published numbers exactly.

**Sweep grid (both architectures, identical):**
`N ∈ {512, 1024, 2048, 4096}`, `D ∈ {8, 16, 32, 64}`, `T ∈ {8, 16, 32, 64}`.
The default matrix is one-factor-at-a-time on the **N axis** (at D=16, T=16) plus
the full **data×twiddle plane at N=1024** (which subsumes the D and T axes and the
baseline) = 19 unique configs per core. The D×T plane feeds `precision_plot.py`
directly, so no separate wide-precision runs are needed.

Parallelism sweep (Parallel MDF only):
```bash
python parametric_study/parallel_sweep.py --P 8 --only N1024_D16_T16 --keep-build
```
P must be a power of two dividing N (P=6/10 are infeasible for radix-2 MDF). For
P≠4 the harness also generates the cross-path P-point NF block (`gen_nf`) and
uses the generalized `bit_reverse`/`fft_stage_fb`. Verified: P=8 matches P=4 SQNR
exactly at 2× throughput. See `FINDINGS.md` §5d.

## Files
| File | Role |
|------|------|
| `serial_sweep.py` | Serial FFT sweep: regenerates ROMs + stimulus per config, compiles the thesis RTL/TB with `iverilog -D` overrides, scores via `common/dsp_metrics.py`. |
| `parallel_codegen.py` | Elaboration-time generator for the Parallel core: emits an N-specialised `fft_top` (stage count, delay taps, pipe width, `blk_exp`) + matching TB + eighth-ROMs. `selftest()` checks N=1024 reproduces the original taps. |
| `parallel_sweep.py` | Parallel FFT sweep: drives the codegen, compiles with the unmodified sub-module RTL, reconstructs the stride-(N/P) spectrum, scores. |
| `aggregate.py` | Merges both summaries → `combined_summary.csv` + `trends.png`. |
| `synth_area.py` | Yosys `synth_xilinx` area sweep of the Serial core over the D×T plane → `serial_area_summary.csv`. |
| `precision_plot.py` | Renders `precision_minlaw.png` (SQNR vs data/twiddle width) directly from the D×T plane carried in the main summary CSVs. |

### Explicit-config mode
The default run already covers the full grid, but single slices can be re-run:
```bash
# re-run the twiddle row at D=16 (slice of the plane)
python parametric_study/serial_sweep.py \
    --configs "N1024_D16_T8 N1024_D16_T16 N1024_D16_T32 N1024_D16_T64"
```
(`parallel_sweep.py` takes the same `--configs` / `--summary` flags.)

## Run
```bash
python parametric_study/serial_sweep.py            # → results/parametric_sweep/serial/
python parametric_study/parallel_sweep.py          # → results/parametric_sweep/parallel/
python parametric_study/aggregate.py               # → combined_summary.csv + trends.png

# single config / keep build dir for inspection:
python parametric_study/serial_sweep.py   --only N4096_D32_T16 --keep-build
python parametric_study/parallel_sweep.py --only N2048_D16_T16 --keep-build
```

Build scratch lands in `parametric_study/build/` (git-ignored, auto-cleaned
unless `--keep-build`). Results land in `results/parametric_sweep/`.

## RTL changes made to enable the sweep (baseline-preserving)
- **Serial** `fft_top.v` / `fft_axi_top.v`: added `TWIDDLE_WIDTH` parameter
  (default 16) to decouple twiddle width from data width.
- **Serial** `fft_axi_tb_xc7.v`: `` `ifndef``-guarded `N`/`LOG2_N`/`DATA_WIDTH`/
  `TWIDDLE_WIDTH` macros (Icarus has no `-P`); width-scaled stimulus arrays.
- **Serial** `twiddle_generator.py`: now takes `--n` / `--width`.
- **Parallel** `fft_stage_fb.v`: threads `.WIDTH(TWIDDLE_W)` into its
  `twiddle_rom` instances (was stuck at default 16). The N-specialised
  `fft_top` is generated, not hand-edited.

## Generator fix (wide-word twiddle precision)
`twiddle_generator.py` and `parallel_codegen.py` scaled `cos·(2^(W-1)-1)` in
float64, which overflowed for `W ≥ 54` — e.g. `cos(0)·(2^63-1)` rounds to `2^63`
and wraps to the most-negative 64-bit word, corrupting the **entire** T=64 ROM
(every T=64 config scored 0 dB). Both now scale via `decimal.Decimal` for
`W > 53` and clamp to the signed range; the `W ≤ 53` path is unchanged, so the
baseline ROMs stay byte-identical (verified against `Serial FFT processor/rom/`).

## Datapath dynamic-range limits (sweep findings)
Both cores cover the full grid, but the **Parallel MDF** core fails its tone
tests at the data-width extremes, while the **Serial** core does not:

| Data width D | Serial (adaptive BFP) | Parallel MDF (fixed ÷2/stage BFP) |
|---|---|---|
| 8  | works (~23 dB, gnd-limited) | **underflow** — tones collapse to ~12 / 0 dB |
| 16, 32 | works | works |
| 64 | works (Sine 79.6→275 dB) | **overflow** — a 64-bit datapath node wraps; tones → 0 dB (Impulse/DC still pass) |

So the **usable parallel data path is D ∈ {16, 32}**; the serial core spans the
full D ∈ {8, 16, 32, 64}. Once `T ≥ D` the SQNR saturates at the data-width
ceiling (the `min(D, T)` law), so T=64 buys nothing over T=32 at any D ≤ 32 —
it is included only to complete the requested grid. These are architectural
range limits, not bugs; the thesis RTL is intentionally left unchanged.

See `results/parametric_sweep/FINDINGS.md` for the full analysis (rewritten
against the current on-grid summaries, including the `min(D,T)` plane, the
generator precision fix, and the Serial vs Parallel usable-data-width comparison).
