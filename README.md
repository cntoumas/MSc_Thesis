# MSc Thesis — FPGA FFT Processor Architectures

**Author:** Christos Ntoumas · MSc in Electronic & Computer Engineering  
**Target Device:** Xilinx Artix-7 `xc7a100tcsg324-1` (Vivado P&R, 100 MHz timing met) · **Algorithm:** 1024-point Radix-2 FFT · **Fixed-Point:** 16-bit Q1.15

> The project was originally synthesised against the **Lattice iCE40HX8K** through the open-source Yosys + nextpnr-ice40 flow. Both designs proved infeasible on that part — the iCE40HX8K's 7,680 LCs, lack of DSP blocks, and absence of distributed RAM cannot host a 1024-pt FFT with reasonable precision. Both designs now target the **Xilinx Artix-7 `xc7a100tcsg324-1`** (Arty A7-100T-class), where ping-pong RAMs map to BRAM, complex multipliers map to DSP48E1 slices, and Vivado closes 100 MHz timing with positive slack on both designs. Yosys `synth_xilinx` is still used for open-source area sanity checks (see [synthesis/](Serial%20FFT%20processor/synthesis/) in each design folder).

---

## Overview

This repository contains the RTL implementations, testbenches, twiddle factor ROMs, and Python verification scripts for two distinct FFT processor architectures developed as part of an MSc thesis in hardware digital signal processing.

The central research question is a classic FPGA design trade-off:

> *How does the choice of hardware parallelism affect area, throughput, latency, and numerical precision in a fixed-point FFT processor targeting a resource-constrained FPGA?*

Two architectures are compared head-to-head:

| | [Serial FFT Processor](Serial%20FFT%20processor/) | [Parallel MDF FFT](Parallel%20MDF%20FFT/) |
|---|---|---|
| **Architecture** | Time-multiplexed, single BFU | Multi-path Delay Feedback (MDF), P=4 |
| **Parallelism** | 1 butterfly/cycle | 4 complex samples/cycle |
| **Throughput** | 19.1 kFFT/s | 390.6 kFFT/s |
| **Latency** | 52.3 μs | 5.12 μs |
| **LUTs (Vivado, post-route)** | 2,374 (1.77 %) | 10,101 (7.55 %) |
| **DSP48E1** | 4 (0.54 %) | 160 (21.62 %) |
| **Block RAM tiles** | 11 (3.01 %) | 0 (distributed RAM) |
| **Timing slack @ 100 MHz** | +3.18 ns (Fmax ~146 MHz) | +1.03 ns (Fmax ~112 MHz) |
| **Total power (post-route)** | 0.179 W | 0.818 W |
| **Scaling** | Adaptive BFP (per-stage CLZ) | Fixed block exponent (÷2¹⁰) |
| **SQNR — Sine** | 72.4 dB | 73.5 dB |
| **SQNR — Chirp** | 65.9 dB | 35.0 dB |
| **AXI4-Stream** | `fft_axi_top.v` + `fft_axi_tb_xc7.v` | `fft_axi_top.v` + `tb_fft_axi.v` |

---

## Additional Chapter Materials

The repository now includes two dedicated chapter folders for the thesis work:

- [hls](hls/) — HLS-versus-RTL comparison sources, documentation, and supporting scripts for the comparison chapter.
- [parametric_study](parametric_study/) — parametric sweep and synthesis-area study scripts, plus the associated README.

These folders collect the chapter-specific artifacts in one place and keep the main project layout focused on the RTL implementations and their verification flow.

## Thesis Context

The FFT is a cornerstone algorithm in digital signal processing — used in communications, radar, audio, and scientific computing. Implementing it efficiently in hardware requires careful architectural decisions that fundamentally shape the silicon cost and real-time performance of the final system.

This thesis explores two points on the area-throughput trade-off curve:

### Architecture 1 — Serial FFT Processor

A **resource-minimal** design that reuses a single Butterfly Unit (BFU) across all 10 stages of the FFT. Data lives in a dual-port Ping-Pong RAM and is processed one butterfly pair per clock cycle. The hardware cost is dominated by memory, not arithmetic.

Key design choices:
- **Single BFU reuse** — minimises arithmetic logic at the cost of throughput
- **Ping-Pong RAM** — allows concurrent read of stage N and write of stage N+1 results
- **Count-and-rotate AGU** — generates all butterfly address patterns with a barrel shifter and a single counter, avoiding a lookup table
- **Adaptive Block Floating Point (BFP)** — a per-stage OR-reduction scanner identifies the maximum amplitude and left-shifts all data to fill the 16-bit word, maximising SQNR dynamically

### Architecture 2 — Parallel MDF FFT

A **high-throughput streaming** design that processes P=4 complex samples every clock cycle. Data flows through a cascade of 10 pipeline stages — never stalls, never needs addressing logic. The hardware cost is dominated by the multiplier array and delay-line memories.

Key design choices:
- **P=4 MDF structure** — four parallel data paths reduce delay-line depths by 4× compared to single-path SDF, enabling the last two stages to be purely combinational (no delay line needed)
- **Commuted architecture** — the complex multiplier is moved *outside* the feedback loop, reducing the critical path from ~15 ns to ~6 ns and enabling 100 MHz operation
- **Streaming bit-reversal buffer** — a ping-pong reorder buffer corrects the DIF output permutation without stalling the pipeline
- **Fixed block exponent** — simplifies control at the cost of adaptive SQNR; outputs are always scaled by 2¹⁰ relative to input

---

## Repository Structure

```
MSc_Thesis/
├── Serial FFT processor/
│   ├── rtl/          — AGU, RAM, BFU, BFP scanner/shifter, twiddle ROM, AXI wrapper
│   ├── tb/           — Functional and AXI testbenches
│   ├── rom/          — cos.mem / sin.mem (1/8-symmetry twiddle factors)
│   ├── constrs/      — Xilinx XDC constraint file
│   ├── scripts/      — Twiddle generator, verification, thesis report
│   ├── stimulus_*.mem — Default testbench input data
│   └── README.md     — Full architecture documentation & results (incl. DSP figures of merit)
│
├── Parallel MDF FFT/
│   ├── rtl/          — fft_stage_fb, fft_stage_nf, bit_reverse, BFP modules, AXI wrapper
│   ├── tb/           — System-level and per-module testbenches (13 files)
│   ├── rom/          — 32 twiddle hex files (tw_sk_pp.hex, one per stage per path)
│   ├── constraints/  — Xilinx XDC constraint files
│   ├── scripts/      — Twiddle generator, verification, thesis report
│   └── README.md     — Full architecture documentation & results (incl. DSP figures of merit)
│
├── UVM/              — UVM 1.2 verification env driving BOTH DUTs (one agent/scoreboard/
│   │                   coverage stack; 5 stimuli × 2 DUTs = 10/10 PASS; Vivado xsim)
│   ├── env/ seq/ tests/ tb/ scripts/ docs/
│   └── README.md     — Thorough standalone UVM verification guide
│
├── hls/              — HLS-versus-RTL comparison chapter sources and documentation
│   ├── HLS_vs_RTL_comparison.md
│   ├── compare_hls_rtl.py
│   └── mdf_fft/ serial_fft/ — HLS source files and testbenches
│
├── parametric_study/ — Parametric sweep, synthesis-area, and script automation assets
│   ├── README.md
│   ├── parallel_sweep.py / serial_sweep.py
│   └── synth_area.py / precision_plot.py
│
└── README.md         — This file
```

Each architecture folder contains a detailed README with architecture block diagrams, design rationale, synthesis results, hardware-verified SQNR, and a dedicated **DSP Figures of Merit** section (SFDR / THD / SINAD / ENOB / phase error). The `UVM/` folder carries its own thorough README for the regression / coverage / equivalence environment.

> **Generated artifacts are not version-controlled.** Simulation outputs (`*.csv`, `*.vcd`, `*.wdb`, coverage DBs, the `results/` figures, UVM reference vectors) are reproducible from the scripts and are excluded via `.gitignore`. The repository tracks only source, ROMs, constraints, synthesis logs, and documentation.

---

## Simulation & Verification

Both designs are verified against a 64-bit floating-point NumPy FFT reference using Icarus Verilog. Five standard test signals are used: impulse, DC, single-tone sine, multi-tone, and linear chirp. Both architectures run their verification through their AXI4-Stream wrappers so the same flow that's used for the Vivado bitstream is exercised end-to-end.

```bash
# Parallel MDF FFT — generate ROMs, simulate, generate report
cd "Parallel MDF FFT"
python scripts/gen_twiddle.py        # generate rom/tw_*.hex
python scripts/fft_verify.py         # simulate + SQNR + PNG report
python scripts/thesis_report.py      # comprehensive Artix-7 thesis figure

# Serial FFT Processor — generate ROMs, simulate, generate report
cd "Serial FFT processor"
python scripts/twiddle_generator.py  # generate rom/cos.mem + sin.mem
python scripts/fft_verify_serial.py  # AXI sim + SQNR + PNG report
python scripts/thesis_report_xc7.py  # comprehensive Artix-7 thesis figure
```

**Requirements:** Icarus Verilog, Python 3.8+, numpy, matplotlib. For full synthesis: Xilinx Vivado (post-route utilization, Fmax, power); Yosys 0.56+ (`synth_xilinx`) for open-source area sanity checks.

---

## UVM Verification

In addition to the script-based golden-reference checks, a full **UVM 1.2** environment ([`UVM/`](UVM/)) drives **both** DUTs through a single shared agent / scoreboard / coverage stack — one env, two `tb_top`s, five deterministic stimulus sequences, an SQNR-threshold scoreboard, four functional covergroups, and AXI4-Stream protocol assertions.

- **Result:** ✅ **10/10 PASS** (5 tests × 2 DUTs), run under Vivado `xsim` 2023.2 (ships UVM 1.2).
- **Equivalence:** a direct Serial↔Parallel cross-check (`make equiv`) reports **5/5 EQUIV** — the two very different micro-architectures compute the same FFT to within the worst-case rounding budget of either implementation.
- **Protocol:** `bind`-ed AXI4-Stream SVA (tvalid-hold, tdata/tlast stability under backpressure, no-X) — and a backpressure stress test that surfaced a documented `m_axis_tready` limitation in both wrappers.

```bash
cd UVM
make refs                 # generate NumPy reference vectors (refs/*.mem)
make regression           # 5 tests × 2 DUTs → "GRAND TOTAL: 10/10 PASS"
make coverage             # merge coverage DBs → cov_html/
make equiv                # Serial↔Parallel equivalence check
```

See the **[UVM/README.md](UVM/README.md)** for the full standalone guide (layout, make targets, coverage model, assertions, and findings).

---

## DSP Figures of Merit

To substantiate the **numerical-precision** comparison beyond SQNR, both architectures are characterised with the standard DSP figures of merit — **SFDR, THD, SINAD, ENOB, and per-bin phase error** — using the shared analysis workflow documented in the thesis source materials and chapter-specific scripts. Single-tone metrics use the coherent, no-window convention (the Sine test sits exactly on bin 50).

| Metric | Meaning | Scope |
|---|---|---|
| **SQNR** | reconstruction error vs. float64 reference | all 5 tests |
| **SFDR** (dBc) | fundamental vs. largest spur | single tone (Sine) |
| **THD** (dB/%) | harmonic distortion (h = 2…5, folded) | single tone (Sine) |
| **SINAD / ENOB** | fundamental vs. noise+distortion → effective bits | single tone (Sine) |
| **Phase error** (°) | per-bin `∠hw − ∠ref`, raw + detrended; **scale-invariant** | all 5 tests |

**Sine-tone head-to-head:** Serial ENOB ≈ **11.95 bits** / SFDR **76.1 dBc**; the Parallel single-tone metrics saturate the 120 dB log-floor (its coherent, fixed-BFP read-back has no representable spurs — read as noise-floor-limited, *not* a bug). The robust comparison numbers are SQNR (73.5 vs 72.4 dB) and detrended phase (≈0°). On the broadband **Chirp** the ranking flips: Serial holds **65.9 dB / 0.03°** vs Parallel **35.0 dB / 0.71°** — the clearest evidence that adaptive BFP beats a fixed block exponent on spread-spectrum inputs. Full per-metric tables and the saturation caveat are documented in each architecture's README.

## Additional Chapter Artifacts

The repository now carries the chapter-specific materials for the new study sections in dedicated folders:

- [hls](hls/) hosts the HLS-versus-RTL comparison chapter, including the comparison notes and the related source files.
- [parametric_study](parametric_study/) contains the scripts and documentation for the parametric sweep and synthesis-area analysis.

These assets are kept alongside the main RTL project so the thesis chapters remain easy to navigate and reuse.

---

## Key Results

### Vivado Post-Route Utilization (xc7a100tcsg324-1)

| Resource | Serial FFT | Parallel MDF FFT |
|---|---:|---:|
| Slice LUTs           | 2,374 (1.77 %) | 10,101 (7.55 %) |
| Slice Registers      | 3,087 (1.15 %) |  5,722 (2.13 %) |
| DSP48E1              |   4 (0.54 %)   |    160 (21.62 %) |
| Block RAM tiles      |  11 (3.01 %)   |      0 (distributed RAM) |
| Bonded IOBs          |  80 (20.00 %)  |    267 (66.75 %) |
| **Total on-chip power** | **0.179 W** | **0.818 W** |
| **Worst slack @ 100 MHz** | **+3.18 ns** | **+1.03 ns** |

Both designs comfortably fit a single Arty A7-100T board with room to spare — the Serial FFT uses under 2 % of the device, and even the more demanding Parallel MDF uses under a quarter of the DSP budget.

### Yosys `synth_xilinx` Area (open-source flow)

For a quick area estimate without Vivado, `yosys synthesis/synth_xc7.ys` produces:

| Metric | Serial FFT | Parallel MDF FFT |
|---|---:|---:|
| LUT1–6 (sum) | 857 | 7,886 |
| FDRE / FDSE | 665 | 5,781 |
| DSP48E1 | 3 | 96 |
| RAMB18E1 / RAMB36E1 | 4 / 0 | 0 / 4 |
| Total cells | 1,952 | 18,352 |

(Yosys's DSP and RAM packing differs from Vivado's, so the numbers are not directly comparable to the post-route utilization — but they give a fast first-pass estimate when Vivado isn't available.)

### Signal Quality (hardware simulation, AXI flow)

| Signal Type | Serial FFT SQNR | Parallel MDF SQNR |
|---|---:|---:|
| Impulse | 120.00 dB | 120.00 dB |
| DC | 75.59 dB | 120.00 dB |
| Single-Tone Sine | 72.41 dB | 73.48 dB |
| Multi-Tone | 59.75 dB | 68.22 dB |
| Chirp | 65.88 dB | 34.95 dB |

The Parallel MDF's fixed block exponent (÷2¹⁰) delivers near-perfect SQNR for concentrated-energy signals (impulse, DC) but degrades on the broadband chirp. The Serial FFT's adaptive BFP scaling gives more consistent SQNR across signal types — note in particular the Chirp result, where adaptive scaling holds the noise floor 30 dB lower than the fixed-exponent design.

### Throughput / Energy

| Metric | Serial FFT | Parallel MDF FFT |
|---|---:|---:|
| Throughput | 19.1 kFFT/s | 390.6 kFFT/s |
| Energy per FFT | ~9.4 µJ | ~2.1 µJ |
| Area-throughput product | high | low (5× area / 20× throughput → favours Parallel) |

The Parallel MDF is more energy-efficient *per FFT*, despite using ~4.6× more total power, because it computes 20× as many FFTs in the same time.

### AXI4-Stream Wrappers

Both designs ship with an AXI4-Stream wrapper ([Serial](Serial%20FFT%20processor/rtl/fft_axi_top.v), [Parallel](Parallel%20MDF%20FFT/rtl/fft_axi_top.v)) that exposes the FFT core as a drop-in SoC IP block. The Serial wrapper additionally handles DIT input bit-reversal in hardware so the user never sees the order transform. See each architecture's README for the full port map and FSM.
