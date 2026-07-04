# File list for xvlog — parallel_mdf_fft UVM compile.

-sv
-i env
-i seq
-i tests

"../parallel_mdf_fft/rtl/bit_reverse.v"
"../parallel_mdf_fft/rtl/block_scaler.v"
"../parallel_mdf_fft/rtl/butterfly_r2.v"
"../parallel_mdf_fft/rtl/complex_mult.v"
"../parallel_mdf_fft/rtl/delay_line.v"
"../parallel_mdf_fft/rtl/fft_stage_fb.v"
"../parallel_mdf_fft/rtl/fft_stage_nf.v"
"../parallel_mdf_fft/rtl/fft_top.v"
"../parallel_mdf_fft/rtl/overflow_detect.v"
"../parallel_mdf_fft/rtl/twiddle_rom.v"
"../parallel_mdf_fft/rtl/fft_axi_top.v"

env/axi_stream_if.sv
env/fft_pkg.sv
tb/axi_stream_sva.sv
tb/tb_top_parallel.sv
