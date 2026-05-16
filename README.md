# MSc Thesis — FPGA FFT Processor Architectures

**Author:** Christos Ntoumas · MSc in Electronic & Computer Engineering  
**Target Device:** Lattice iCE40HX8K · **Algorithm:** 1024-point Radix-2 FFT · **Fixed-Point:** 16-bit Q1.15

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
| **Throughput** | ~19.1 kFFT/s | ~390.6 kFFT/s |
| **Latency** | ~52.3 μs | ~5.12 μs |
| **LUT4 (raw)** | 254,908 | 143,067 |
| **BRAM blocks** | 2 | 16 |
| **Scaling** | Adaptive BFP (per-stage CLZ) | Fixed block exponent (÷2¹⁰) |
| **SQNR — Sine** | ~76 dB | 73.48 dB |
| **SQNR — Chirp** | ~36 dB | 34.95 dB |

---

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
│   └── README.md     — Full architecture documentation & results
│
├── Parallel MDF FFT/
│   ├── rtl/          — fft_stage_fb, fft_stage_nf, bit_reverse, BFP modules, AXI wrapper
│   ├── tb/           — System-level and per-module testbenches (13 files)
│   ├── rom/          — 32 twiddle hex files (tw_sk_pp.hex, one per stage per path)
│   ├── constraints/  — Xilinx XDC constraint files
│   ├── scripts/      — Twiddle generator, verification, thesis report
│   └── README.md     — Full architecture documentation & results
│
└── README.md         — This file
```

Each architecture folder contains a detailed README with architecture block diagrams, design rationale, synthesis results, and hardware-verified SQNR measurements.

---

## Simulation & Verification

Both designs are verified against a 64-bit floating-point NumPy FFT reference using Icarus Verilog. Five standard test signals are used: impulse, DC, single-tone sine, multi-tone, and linear chirp.

```bash
# Parallel MDF FFT — generate ROMs, compile, simulate, report
cd "Parallel MDF FFT"
python scripts/gen_twiddle.py        # generate rom/tw_*.hex
python scripts/fft_verify.py         # simulate + SQNR report

# Serial FFT Processor — generate ROMs, compile, simulate, report
cd "Serial FFT processor"
python scripts/twiddle_generator.py  # generate rom/cos.mem + sin.mem
python scripts/fft_verify_serial.py  # simulate + SQNR report
```

**Requirements:** Icarus Verilog, Python 3.8+, numpy, matplotlib

---

## Key Results

### Synthesis (Yosys, iCE40HX8K target)

Both designs exceed the iCE40HX8K's 7,680 logic cells when memories are synthesised as LUT-FF arrays (iCE40 has no distributed RAM primitive). The numbers below reflect the raw Yosys output; with proper BRAM inference on a Xilinx Artix-7 or similar device, the projected LUT count drops to ~1,500–2,000 (Serial) and ~34,000 (Parallel).

| Metric | Serial FFT | Parallel MDF FFT |
|--------|-----------|-----------------|
| LUT4 (raw) | 254,908 | 143,067 |
| Flip-flops | 70,852 | 33,401 |
| Carry chains | 435 | 8,435 |
| BRAM blocks | 2 | 16 |
| Proj. BRAM (with inference) | ~13 blocks | ~56 blocks |

### Signal Quality (hardware simulation)

| Signal Type | Serial FFT SQNR | Parallel MDF SQNR |
|---|---|---|
| Impulse | ~66 dB | 120.00 dB |
| DC | ~50 dB | 120.00 dB |
| Single-Tone Sine | ~76 dB | 73.48 dB |
| Multi-Tone | ~42 dB | 68.22 dB |
| Chirp | ~36 dB | 34.95 dB |

The Parallel MDF's fixed block exponent delivers near-perfect SQNR for concentrated-energy signals (impulse, DC) while the Serial FFT's adaptive BFP provides more consistent quality across diverse input types.
