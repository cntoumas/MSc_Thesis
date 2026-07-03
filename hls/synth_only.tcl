# synth_only.tcl - run C-synthesis only (skip the broken csim) for both designs
set PART "xc7a200tfbg676-2"
set CLK_NS 10

open_project serial_fft_hls
set_top fft_serial
add_files serial_fft/fft_serial.cpp -cflags "-I. -I./serial_fft"
add_files -tb serial_fft/fft_serial_tb.cpp -cflags "-I. -I./serial_fft"
open_solution "solution1"
set_part $PART
create_clock -period $CLK_NS -name default
csynth_design
close_project

open_project mdf_fft_hls
set_top fft_mdf
add_files mdf_fft/fft_mdf.cpp -cflags "-I. -I./mdf_fft"
add_files -tb mdf_fft/fft_mdf_tb.cpp -cflags "-I. -I./mdf_fft"
open_solution "solution1"
set_part $PART
create_clock -period $CLK_NS -name default
csynth_design
close_project

puts "\n=== synth_only done ==="
