# File list for xvlog — Parallel MDF FFT UVM compile.

-sv
-i env
-i seq
-i tests

"../Parallel MDF FFT/rtl/bit_reverse.v"
"../Parallel MDF FFT/rtl/block_scaler.v"
"../Parallel MDF FFT/rtl/butterfly_r2.v"
"../Parallel MDF FFT/rtl/complex_mult.v"
"../Parallel MDF FFT/rtl/delay_line.v"
"../Parallel MDF FFT/rtl/fft_stage_fb.v"
"../Parallel MDF FFT/rtl/fft_stage_nf.v"
"../Parallel MDF FFT/rtl/fft_top.v"
"../Parallel MDF FFT/rtl/overflow_detect.v"
"../Parallel MDF FFT/rtl/twiddle_rom.v"
"../Parallel MDF FFT/rtl/fft_axi_top.v"

env/axi_stream_if.sv
env/fft_pkg.sv
tb/axi_stream_sva.sv
tb/tb_top_parallel.sv
