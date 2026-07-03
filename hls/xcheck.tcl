# xcheck.tcl - C-sim both HLS designs on the 5 RTL test vectors, dumping
# outputs for a Python HLS-vs-RTL numerical comparison.  Uses separate project
# names so it does not disturb the synth/impl projects.
open_project -reset serial_xcheck
set_top fft_serial
add_files serial_fft/fft_serial.cpp -cflags "-I. -I./serial_fft"
add_files -tb serial_fft/fft_serial_xcheck.cpp -cflags "-I. -I./serial_fft"
open_solution "solution1"
set_part xc7a200tfbg676-2
create_clock -period 10 -name default
csim_design
close_project

open_project -reset mdf_xcheck
set_top fft_mdf
add_files mdf_fft/fft_mdf.cpp -cflags "-I. -I./mdf_fft"
add_files -tb mdf_fft/fft_mdf_xcheck.cpp -cflags "-I. -I./mdf_fft"
open_solution "solution1"
set_part xc7a200tfbg676-2
create_clock -period 10 -name default
csim_design
close_project
puts "\n=== xcheck done ==="
