# csim_serial.tcl - run C-simulation only for the serial FFT (verify TB fix)
open_project serial_fft_hls
set_top fft_serial
add_files serial_fft/fft_serial.cpp -cflags "-I. -I./serial_fft"
add_files -tb serial_fft/fft_serial_tb.cpp -cflags "-I. -I./serial_fft"
open_solution "solution1"
set_part xc7a200tfbg676-2
create_clock -period 10 -name default
csim_design
close_project
puts "\n=== csim_serial done ==="
