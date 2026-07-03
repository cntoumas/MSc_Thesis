# export_impl.tcl - run Vivado synth+P&R on both HLS designs for post-route
# resource + timing numbers (apples-to-apples with the hand-written RTL).
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
export_design -flow impl -format ip_catalog -rtl verilog
close_project

open_project mdf_fft_hls
set_top fft_mdf
add_files mdf_fft/fft_mdf.cpp -cflags "-I. -I./mdf_fft"
add_files -tb mdf_fft/fft_mdf_tb.cpp -cflags "-I. -I./mdf_fft"
open_solution "solution1"
set_part $PART
create_clock -period $CLK_NS -name default
csynth_design
export_design -flow impl -format ip_catalog -rtl verilog
close_project

puts "\n=== export_impl done ==="
