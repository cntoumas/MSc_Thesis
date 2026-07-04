# File list for xvlog — Serial FFT UVM compile.
# Paths with spaces need double quotes per xvlog's -f file syntax.

-sv

-i env
-i seq
-i tests

"../serial_fft/rtl/AGU.v"
"../serial_fft/rtl/BFP_scanner.v"
"../serial_fft/rtl/BFP_shifter.v"
"../serial_fft/rtl/RAM.v"
"../serial_fft/rtl/butterfly_unit.v"
"../serial_fft/rtl/complex_mult.v"
"../serial_fft/rtl/fft_top.v"
"../serial_fft/rtl/twiddle_rom.v"
"../serial_fft/rtl/fft_axi_top.v"

env/axi_stream_if.sv
env/fft_pkg.sv
tb/axi_stream_sva.sv
tb/tb_top_serial.sv
