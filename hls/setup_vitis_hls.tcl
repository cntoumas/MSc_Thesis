# =============================================================================
# setup_vitis_hls.tcl
# Run from the hls/ directory:
#   cd C:\Users\ntoum\Desktop\thesis_repo\hls
#   vitis_hls -f setup_vitis_hls.tcl
# =============================================================================

set PART "xc7a200tfbg676-2"   ;# Artix-7 (xc7a200tfbg676-2), -2 speed grade
set CLK_NS 10                 ;# 100 MHz (10 ns period)

# ---------------------------------------------------------------------------
# Project 1: Serial FFT
# ---------------------------------------------------------------------------
open_project serial_fft_hls
set_top fft_serial
add_files serial_fft/fft_serial.cpp -cflags "-I. -I./serial_fft"
add_files -tb serial_fft/fft_serial_tb.cpp -cflags "-I. -I./serial_fft"

open_solution "solution1"
set_part $PART
create_clock -period $CLK_NS -name default

# Run C simulation
csim_design

# Run HLS synthesis
csynth_design

close_project

# ---------------------------------------------------------------------------
# Project 2: MDF FFT
# ---------------------------------------------------------------------------
open_project mdf_fft_hls
set_top fft_mdf
add_files mdf_fft/fft_mdf.cpp -cflags "-I. -I./mdf_fft"
add_files -tb mdf_fft/fft_mdf_tb.cpp -cflags "-I. -I./mdf_fft"

open_solution "solution1"
set_part $PART
create_clock -period $CLK_NS -name default

csim_design
csynth_design

close_project

puts "\n=== Both designs synthesized. Check *_hls/solution1/syn/report/ for resource reports. ==="
