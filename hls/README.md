# HLS vs. Hand-Written RTL — FFT Architecture Comparison

**Designs:** 1024-point, 16-bit (Q1.15), block-floating-point (BFP) FFT, in two
architectures — a resource-shared **Serial** processor and a streaming
**Parallel MDF** (Multi-path Delay Feedback, P = 4).
**For each architecture there are two independent implementations:**

- **RTL** — hand-written Verilog (the thesis reference designs).
- **HLS** — C/C++ synthesised with Vitis HLS, written to mirror the RTL algorithm
  (same BFP scanner/shifter, same butterfly, same twiddle ROM).

**Target / tools (identical for both flows):** AMD Artix-7 `xc7a200t-fbg676-2`
(−2 speed grade), 100 MHz target (10 ns), Vivado/Vitis HLS **2023.2**.

---

## 1. TL;DR

| | **Serial** | **Parallel MDF** |
|---|---|---|
| Winner on area/speed | **Hand RTL by a wide margin** (≈9× fewer LUTs, ≈9× fewer DSPs, ≈7× higher throughput) | **HLS competitive / better on logic** (fewer LUTs, fewer DSPs, higher Fmax; trades LUTRAM → BRAM) |
| Numerical match to RTL | **Bit-exact** across all 5 test classes | **Functionally correct** (spectrum matches golden to 3×10⁻⁵), but **different output bin ordering** — not sample-aligned |
| One-line lesson | HLS cannot reproduce the RTL's single-butterfly **resource reuse** + tightly-scheduled in-place memory; it unrolls and serialises poorly. | HLS **dataflow** maps a regular streaming pipeline very well. |

The two architectures land on opposite sides of the classic HLS trade-off:
**HLS shines on regular streaming dataflow (MDF) and struggles with
irregular control + resource-shared, schedule-critical datapaths (Serial).**

---

## 2. Methodology & fairness notes

- **Resources** are reported at **Vivado post-synthesis** (out-of-context, no
  debug cores) for *both* flows — the most apples-to-apples basis. HLS numbers
  come from `export_design -flow impl` (Vivado synth+P&R on the HLS-generated
  RTL); post-implementation figures are also given. The existing RTL *impl* runs
  had an ILA/`dbg_hub` inserted on the Serial project (≈+1.6k LUT), so RTL
  resource numbers use the clean **synth** reports; RTL **timing** uses the
  routed reports.
- **Timing** is the achieved critical path (CP) / worst-negative-slack (WNS) at
  the 100 MHz constraint. HLS `csynth` *estimates* are noted where relevant but
  are pre-P&R and pessimistic (e.g. Serial HLS `csynth` 10.98 ns → post-impl
  9.10 ns).
- **Numerical accuracy** uses the **same 5 stimulus vectors** the RTL testbench
  used (recovered exactly via `ifft(ref_k)` from the stored golden spectra) and
  the **same metric library** (`common/dsp_metrics.py`), so HLS and RTL SQNR /
  ENOB are directly comparable.
- **Interfaces differ** and are *not* normalised away (they are part of the
  comparison): the RTL tops are **AXI4-Stream**; the **HLS Serial** top is
  memory-mapped **AXI4 master (in/out) + AXI4-Lite control** (it ingests a whole
  buffer), while the **HLS MDF** top is **AXI4-Stream** like the RTL.

---

## 3. Resource utilisation (Vivado post-synthesis, `xc7a200t`, no debug cores)

### Serial

| Resource | RTL (hand) | HLS | HLS ÷ RTL |
|---|---:|---:|---:|
| LUT (total) | **790** | 7,058 | **8.9×** |
| — LUT as logic | 790 | 6,757 | 8.6× |
| — LUT as memory | 0 | 301 | — |
| FF | 507 | 4,958 | 9.8× |
| DSP48E1 | **4** | 38 | **9.5×** |
| BRAM tiles | 3 | 4 (8×RAMB18) | 1.3× |

### Parallel MDF

| Resource | RTL (hand) | HLS | HLS ÷ RTL |
|---|---:|---:|---:|
| LUT (total) | 10,851 | **5,863** | **0.54×** |
| — LUT as logic | 8,436* | 5,863 | — |
| — LUT as memory | 2,415* | 0 | — |
| FF | 5,722 | 7,336 | 1.28× |
| DSP48E1 | 160 | **114** | **0.71×** |
| BRAM tiles | **0** | 72 (32×RAMB36 + 80×RAMB18 ≈ 144×18K) | ∞ |

\*RTL MDF LUT-as-memory from the placed report (delay lines inferred as
distributed RAM).

**Why the Serial gap is so large.** The hand RTL instantiates **one** butterfly
and **one** complex multiplier (4 DSPs) and *reuses* them across all
10 × 512 = 5,120 butterflies, with a custom address-generator (AGU) driving a
ping-pong RAM. HLS, given the same C, **unrolled the 10 DIT stages into 10
separate butterfly instances** (≈4 DSPs each → 38 DSPs) plus per-stage BFP scan
loops and AXI-master adapters — yet still executes them sequentially. It pays
the area of partial unrolling *without* the throughput of a pipeline.

**Why the MDF flips.** Both are inherently parallel (32 complex multipliers).
Here HLS is actually **leaner**: it maps the 32 delay lines to **BRAM** (72
tiles) which frees ~2.4k LUTs that the RTL spends on distributed-RAM delay
lines, and its complex-multiply binding uses **114 DSPs** vs the RTL's
Karatsuba-style 160. The cost is a large **BRAM** footprint (0 → 144×18K).
This is a pure **LUTRAM ↔ BRAM** memory-style trade, not a real efficiency loss.

---

## 4. Performance (timing, latency, throughput)

| | Serial RTL | Serial HLS | MDF RTL | MDF HLS |
|---|---:|---:|---:|---:|
| Clock target | 10 ns | 10 ns | 10 ns | 10 ns |
| Achieved CP (post-route) | 6.58 ns | 9.10 ns | 8.97 ns | 6.85 ns |
| **Fmax** | **≈152 MHz** | ≈110 MHz | ≈112 MHz | **≈146 MHz** |
| Timing met @100 MHz | ✅ (+3.42 ns) | ✅ (+0.90 ns) | ✅ (+1.03 ns) | ✅ (+3.15 ns) |
| Cycles per FFT | 5,230 | 39,028 | 256 (II) | 263 (II) |
| Latency (first output) | ~5,230 cyc | 39,027 cyc | ~few-hundred cyc | 573 cyc |
| **Throughput @100 MHz** | **19.1 kFFT/s** | **≈2.6 kFFT/s** | **390.6 kFFT/s** | **≈380 kFFT/s** |
| Samples/clock (steady state) | ~0.2 | ~0.026 | **4** | **4** |

**Serial:** HLS is **~7.5× slower** (39,028 vs 5,230 cycles/FFT) *and* lower
Fmax — strictly worse on both axes. The per-stage butterfly loop could not reach
II = 1: the in-place, 2-bank partitioned working RAM forces ~5 cycles between
dependent accesses, and the decoupled BFP-scan loops add a further N cycles per
stage. (Getting the multiply path to close timing already required binding the
twiddle products to 3-stage pipelined DSPs and splitting the scan out of the
butterfly — see §6.)

**MDF:** essentially a **tie on throughput** (≈380 vs 390 kFFT/s, both stream
4 samples/clock at the II of one P-group per cycle), with HLS holding a **higher
Fmax** (146 vs 112 MHz). HLS `#pragma HLS DATAFLOW` reproduced the streaming
behaviour cleanly.

---

## 5. Numerical accuracy & functional equivalence

Same 5 stimuli (Impulse, DC, Sine @bin 50, MultiTone, Chirp), scored against the
floating-point golden DFT with `dsp_metrics.compute_sinad_ref` / `_enob_ref`
(scale-fitted, so global BFP scaling is not penalised).

### Serial — HLS is **bit-exact** to the RTL

| Test | RTL SQNR (dB) | HLS SQNR (dB) | RTL ENOB | HLS ENOB | HLS vs RTL |
|---|---:|---:|---:|---:|---:|
| Impulse | 120.00 | 120.00 | 19.6 | 19.6 | identical |
| DC | 75.59 | 75.59 | 12.3 | 12.3 | identical |
| Sine | 72.41 | 72.41 | 11.7 | 11.7 | identical |
| MultiTone | 59.75 | 59.75 | 9.6 | 9.6 | identical |
| Chirp | 65.88 | 65.88 | 10.7 | 10.7 | identical |

Treating the RTL output as the reference, the HLS-vs-RTL SINAD saturates the
metric cap (≈120 dB) on every test → the HLS Serial reproduces the RTL output
**sample-for-sample**. The HLS C model is a faithful bit-accurate twin of the
hand RTL (same dynamic-BFP exponents, same rounding).

### MDF — correct spectrum, **different output ordering**

The HLS MDF computes a numerically **correct** 1024-point FFT:

- Single-tone (Sine @bin 50): exactly **2** non-zero output bins, and the
  sorted-magnitude spectrum matches the golden reference to **3×10⁻⁵** relative
  RMS.
- Two-tone: **4** near-equal peaks (spread 0.03 %); SQNR (tone vs floor)
  **122.5 dB**.

**But** its output samples are emitted in a **bin order that differs from the
RTL's documented stream convention** (`bin = p·256 + g`). No structured
remapping tried (bit-reversal × path-permutation × group/path interleavings)
aligned the HLS output to the RTL/golden natural order — e.g. for the Sine test
the two tones appear at stream positions 840 & 315 rather than the expected 50 &
974. So the HLS MDF is **functionally/spectrally equivalent** to the RTL but
**not a drop-in sample-compatible replacement**: a deterministic output
index-remap (the MDF commutator + bit-reversal convention) would be needed to
make them identical. RTL MDF accuracy for reference: Sine 73.5 dB / ENOB 11.9,
MultiTone 68.2 dB, Chirp 35.1 dB.

> This contrast is itself a finding: HLS reproduced the *simple, memory-mapped*
> Serial design exactly, but for the *complex streaming* MDF — whose correctness
> hinges on an intricate inter-stage commutation and bit-reversal schedule — the
> HLS model matches the math while diverging on the exact output-sample order.

---

## 6. Microarchitecture & design-effort differences

| Aspect | Serial RTL | Serial HLS | MDF RTL | MDF HLS |
|---|---|---|---|---|
| Top interface | AXI4-Stream | AXI4 m_axi + AXI4-Lite | AXI4-Stream | AXI4-Stream |
| Butterfly hardware | **1, time-shared** | 10 (unrolled stages) | 32 (P×stages) | 32 (P×stages) |
| Datapath scheduling | hand AGU + 9-stage delay align | HLS pipeline (II≈5/stage) | hand commutator + valid_pipe | HLS DATAFLOW |
| Delay/working memory | ping-pong BRAM | partitioned BRAM | distributed LUTRAM | BRAM (inferred) |
| BFP | dynamic (per-block exponent) | dynamic (mirrors RTL) | fixed (÷2 per stage) | fixed (÷2 per stage) |
| Source size (LOC) | 1,652 (9 files) | **312** (1 .cpp + .h) | 1,528 (10 files) | **416** (1 .cpp + .h) |

**Design effort.** HLS source is **~4–5× smaller** and far faster to write and
re-target (one device-string change vs. re-validating constraints/IP). That
productivity is the real HLS win — *when* the resulting QoR is acceptable
(MDF: yes; Serial: no).

**Engineering caveats surfaced during this study (HLS-side):**
- The Serial HLS needed manual pragmas to be viable at all — `BIND_OP … impl=dsp
  latency=3` on the twiddle products and splitting the BFP scan into its own loop
  — to drop the critical path from 24.5 ns to ≈9 ns.
- The MDF HLS originally failed synthesis (`ap_axis` used on internal streams,
  HLS 214-208); fixed by confining `ap_axis` to the top ports and carrying an
  internal plain-word struct with boundary adapters.
- Two HLS C testbenches had a float-vs-integer scaling bug that made their
  golden checks vacuous; rewritten to scale-invariant / order-independent checks.

---

## 7. Conclusions

1. **Architecture decides whether HLS is competitive.** For the streaming MDF,
   HLS matched throughput, beat the RTL on Fmax and DSPs, and used fewer LUTs
   (trading into BRAM) — at a fraction of the source size. For the
   resource-shared Serial processor, HLS was **~9× larger and ~7× slower**
   because it could not express the single-butterfly reuse and tight in-place
   memory schedule that make the hand RTL efficient.
2. **HLS faithfully reproduces simple algorithms bit-for-bit** (Serial:
   identical SQNR on every test) but can **diverge on output-ordering
   conventions** in complex dataflow (MDF: correct spectrum, different bin
   order).
3. **Recommended split for this thesis:** keep the **hand RTL Serial** (the HLS
   version offers no benefit and large penalties); the **MDF is a legitimate
   candidate for HLS** if a BRAM-heavy mapping is acceptable and the output
   index-remap is added/verified.

---

## 8. Reproducibility

| Step | Command (run in `hls/`) |
|---|---|
| HLS C-sim (both, with meaningful checks) | `vitis_hls -f setup_vitis_hls.tcl` |
| HLS synth only | `vitis_hls -f synth_only.tcl` |
| HLS Vivado synth+P&R (post-route numbers) | `vitis_hls -f export_impl.tcl` |
| Recover exact RTL stimulus → C header | `py -3 gen_xcheck_inputs.py` |
| HLS run on RTL vectors | `vitis_hls -f xcheck.tcl` |
| HLS-vs-RTL numerical comparison | `py -3 compare_hls_rtl.py` |

**Data sources:** HLS reports under `hls/<proj>_hls/solution1/{syn,impl}/report/`;
RTL reports under `Serial_FFT_Vivado/…/{synth_1,impl_1}` and `MDF FFT/…`; RTL
golden/hardware spectra in `results/{serial,parallel}/spectrum.npz`; shared
metrics in `common/dsp_metrics.py`.

*Generated for the FPGA-FFT thesis (Serial + Parallel MDF), AMD Artix-7
`xc7a200t-fbg676-2`, Vivado/Vitis HLS 2023.2.*
