#!/usr/bin/env python3
"""
synth_area.py — Yosys synth_xilinx area sweep for the Serial FFT core.

Synthesises fft_top (N=1024, xc7) at several (DATA_WIDTH, TWIDDLE_WIDTH) points
and reports DSP48E1 / LUT / FF / BRAM, so the *cost* of the precision sweep is
concrete. A thin wrapper instantiates fft_top with concrete parameters (normal
elaboration — avoids a yosys-0.56 chparam derive-mode assert).

Open-source estimate only (Yosys packs DSP/RAM differently from Vivado); the
*trend* across widths is the point. Writes serial_area_summary.csv.
"""
import csv
import re
import shutil
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RTL = ROOT / "Serial FFT processor" / "rtl"
ROM = ROOT / "Serial FFT processor" / "rom"
OUT = ROOT / "results" / "parametric_sweep" / "serial_area_summary.csv"
BUILD = Path(__file__).resolve().parent / "build" / "synth"

RTL_FILES = ["AGU.v", "BFP_scanner.v", "BFP_shifter.v", "RAM.v",
             "butterfly_unit.v", "complex_mult.v", "fft_top.v", "twiddle_rom.v"]

# On-grid data×twiddle plane (D, T) ∈ {8,16,32,64}², matching the SQNR sweep.
CONFIGS = [(d, t) for d in (8, 16, 32, 64) for t in (8, 16, 32, 64)]

WRAP = """module wrap #(parameter DATA_WIDTH={d}, parameter TWIDDLE_WIDTH={t}) (
  input wire clk, rst, start_fft,
  output wire signed [7:0] final_exponent, output wire fft_done,
  input wire preload_en, input wire [9:0] preload_addr,
  input wire signed [DATA_WIDTH:0] preload_re, preload_im,
  input wire readout_en, input wire [9:0] readout_addr, input wire readout_bank_sel,
  output wire signed [DATA_WIDTH:0] readout_re, readout_im
);
  fft_top #(.N(1024), .DATA_WIDTH(DATA_WIDTH), .TWIDDLE_WIDTH(TWIDDLE_WIDTH), .LOG2_N(10)) u (
    .clk(clk), .rst(rst), .start_fft(start_fft), .final_exponent(final_exponent),
    .fft_done(fft_done), .preload_en(preload_en), .preload_addr(preload_addr),
    .preload_re(preload_re), .preload_im(preload_im), .readout_en(readout_en),
    .readout_addr(readout_addr), .readout_bank_sel(readout_bank_sel),
    .readout_re(readout_re), .readout_im(readout_im));
endmodule
"""


def parse(text):
    dsp = lut = ff = bram = 0
    # use the first "Number of cells" block (flattened top)
    seen = False
    for line in text.splitlines():
        if "Number of cells" in line:
            if seen:
                break
            seen = True
            continue
        if not seen:
            continue
        m = re.match(r"\s+(\S+)\s+(\d+)\s*$", line)
        if not m:
            if line.strip() == "":
                continue
            continue
        cell, n = m.group(1).upper(), int(m.group(2))
        if cell.startswith("DSP48"):
            dsp += n
        elif re.match(r"LUT[1-6]$", cell):
            lut += n
        elif cell.startswith(("FDRE", "FDSE", "FDCE", "FDPE")):
            ff += n
        elif cell.startswith("RAMB"):
            bram += n
    return dsp, lut, ff, bram


def main():
    BUILD.mkdir(parents=True, exist_ok=True)
    for f in ("cos.mem", "sin.mem"):
        shutil.copy(ROM / f, BUILD / f)
    reads = " ".join(f'"{(RTL / f).as_posix()}"' for f in RTL_FILES)

    rows = []
    for d, t in CONFIGS:
        (BUILD / "wrap.v").write_text(WRAP.format(d=d, t=t))
        ys = (f'read_verilog {reads} "wrap.v"\n'
              f"synth_xilinx -family xc7 -top wrap -flatten\nstat\n")
        sf = BUILD / f"synth_D{d}_T{t}.ys"
        sf.write_text(ys)
        r = subprocess.run(["yosys", "-s", sf.name], cwd=str(BUILD),
                           capture_output=True, text=True)
        dsp, lut, ff, bram = parse(r.stdout + r.stderr)
        rows.append((d, t, dsp, lut, ff, bram))
        print(f"DATA={d:2d} TWIDDLE={t:2d}  DSP48={dsp:3d}  LUT={lut:5d}  FF={ff:5d}  BRAM={bram}")

    OUT.parent.mkdir(parents=True, exist_ok=True)
    with open(OUT, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["DataW", "TwiddleW", "DSP48", "LUT", "FF", "BRAM"])
        w.writerows(rows)
    print(f"\n[+] {OUT}")


if __name__ == "__main__":
    main()
