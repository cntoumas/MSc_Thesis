# csim_mdf.tcl - run C-simulation only for the MDF FFT
open_project mdf_fft_hls
set_top fft_mdf
add_files mdf_fft/fft_mdf.cpp -cflags "-I. -I./mdf_fft"
add_files -tb mdf_fft/fft_mdf_tb.cpp -cflags "-I. -I./mdf_fft"
open_solution "solution1"
set_part xc7a200tfbg676-2
create_clock -period 10 -name default
csim_design
close_project
puts "\n=== csim_mdf done ==="
