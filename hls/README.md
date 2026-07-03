# HLS Comparison

This directory contains the source artifacts used for the HLS-versus-RTL comparison chapter.

## Contents
- [HLS_vs_RTL_comparison.md](HLS_vs_RTL_comparison.md): narrative summary of the comparison workflow and results.
- [compare_hls_rtl.py](compare_hls_rtl.py): Python driver for running the comparison flow.
- [mdf_fft](mdf_fft): HLS sources and testbench for the MDF FFT design.
- [serial_fft](serial_fft): HLS sources and testbench for the serial FFT design.
- [cosim_inputs.h](cosim_inputs.h), [twiddle_lut.h](twiddle_lut.h), and [twiddle_rom.h](twiddle_rom.h): shared input and twiddle-factor headers.

## Notes
- The repository keeps the chapter sources and documentation here without the older TCL helper scripts.
- The comparison workflow is documented in [HLS_vs_RTL_comparison.md](HLS_vs_RTL_comparison.md).
