# File list for xvlog — Serial FFT UVM compile.
# Paths with spaces need double quotes per xvlog's -f file syntax.

-sv

-i env
-i seq
-i tests

"../Serial FFT processor/rtl/AGU.v"
"../Serial FFT processor/rtl/BFP_scanner.v"
"../Serial FFT processor/rtl/BFP_shifter.v"
"../Serial FFT processor/rtl/RAM.v"
"../Serial FFT processor/rtl/butterfly_unit.v"
"../Serial FFT processor/rtl/complex_mult.v"
"../Serial FFT processor/rtl/fft_top.v"
"../Serial FFT processor/rtl/twiddle_rom.v"
"../Serial FFT processor/rtl/fft_axi_top.v"

env/axi_stream_if.sv
env/fft_pkg.sv
tb/axi_stream_sva.sv
tb/tb_top_serial.sv
