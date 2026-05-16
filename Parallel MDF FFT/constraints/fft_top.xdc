# =============================================================================
# fft_top.xdc - Synthesis & implementation constraints for the 1024-pt P=4
#               MDF Radix-2 DIF FFT top module on Xilinx Artix-7
#
# Target part : xc7a100tcsg324-1 (adjust below for your device)
# Top module  : fft_top
# Frequency   : 100 MHz (10 ns period)  -- edit CLK_PERIOD below to retarget
#
# NOTE: fft_top exposes 264 chip-level pins (din=128, dout=128, blk_exp=4,
# clk+rst+en+in_valid+out_valid=5 + slack). If you are NOT physically
# routing those buses to package balls (e.g. the FFT is buried inside an
# SoC), Vivado's power analyzer can be told to ignore I/O switching with
# `set_load 0` (see bottom of file) or by setting the I/O standard to an
# internal-only configuration.
# =============================================================================

# -----------------------------------------------------------------------------
# Primary clock
# -----------------------------------------------------------------------------
# 100 MHz = 10 ns period. Change -period if you target a different rate.
create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]

# Allow Vivado to use this as the system clock for unconstrained paths
set_input_jitter [get_clocks clk] 0.100

# -----------------------------------------------------------------------------
# Reset and control inputs (asynchronous deassert)
# -----------------------------------------------------------------------------
# rst is assumed asynchronous w.r.t. clk; deassert is synchronised inside
# the design (or external user logic). Mark as false path to avoid Vivado
# flagging a fictitious recovery violation.
set_false_path -from [get_ports rst]

# -----------------------------------------------------------------------------
# I/O standards (LVCMOS18 -- low-voltage to keep I/O dynamic power low)
# -----------------------------------------------------------------------------
# Change to LVCMOS33 / LVDS_25 / etc. to match your board's bank voltage.
# This is critical: LVCMOS33 draws ~3x more dynamic I/O power than LVCMOS18.
set_property IOSTANDARD LVCMOS18 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports en]
set_property IOSTANDARD LVCMOS18 [get_ports in_valid]
set_property IOSTANDARD LVCMOS18 [get_ports out_valid]
set_property IOSTANDARD LVCMOS18 [get_ports {din[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {dout[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {blk_exp[*]}]

# Optional: reduce drive strength and slew rate to save more I/O power.
# (Only set on outputs.)
set_property SLEW SLOW   [get_ports {dout[*]}]
set_property SLEW SLOW   [get_ports {blk_exp[*]}]
set_property SLEW SLOW   [get_ports out_valid]
set_property DRIVE 4     [get_ports {dout[*]}]
set_property DRIVE 4     [get_ports {blk_exp[*]}]
set_property DRIVE 4     [get_ports out_valid]

# -----------------------------------------------------------------------------
# I/O timing constraints
# -----------------------------------------------------------------------------
# Conservative 2 ns of external delay (assumes an AXI peer ~2 ns away on PCB)
# Tighten/loosen these to match the upstream/downstream block's timing.

# Inputs (data presented by upstream)
set_input_delay  -clock clk -max 2.0 [get_ports {en in_valid}]
set_input_delay  -clock clk -min 0.5 [get_ports {en in_valid}]
set_input_delay  -clock clk -max 2.0 [get_ports {din[*]}]
set_input_delay  -clock clk -min 0.5 [get_ports {din[*]}]

# Outputs (data consumed by downstream)
set_output_delay -clock clk -max 2.0 [get_ports {out_valid}]
set_output_delay -clock clk -min 0.5 [get_ports {out_valid}]
set_output_delay -clock clk -max 2.0 [get_ports {dout[*]}]
set_output_delay -clock clk -min 0.5 [get_ports {dout[*]}]
set_output_delay -clock clk -max 2.0 [get_ports {blk_exp[*]}]
set_output_delay -clock clk -min 0.5 [get_ports {blk_exp[*]}]

# -----------------------------------------------------------------------------
# Synthesis / implementation directives (optional but recommended)
# -----------------------------------------------------------------------------
# Vivado tends to pack memory arrays into block RAM when sizes permit.
# Force distributed RAM for the small twiddle ROMs to match the source-code
# attribute. The fft_top module already has (* ram_style = "distributed" *)
# on twiddle_rom.mem -- this is just a project-level fallback.
# (Leave commented out unless Vivado complains about ram_style.)
# set_property RAM_STYLE distributed [get_cells -hier -filter {NAME =~ *u_tw*mem*}]

# -----------------------------------------------------------------------------
# Power-analysis hints (used by report_power)
# -----------------------------------------------------------------------------
# These help Vivado's vectorless estimator if you cannot provide an SAIF
# file from simulation. Adjust toggle rates downward if you know your
# signals are mostly idle.
#
# Typical FFT activity: data nets toggle ~20-30%, control ~5%.
# If you have a SAIF, ignore everything below and use `read_saif` instead.
#
# set_switching_activity -toggle_rate 25 -static_probability 0.5 \
#     [get_nets -hier -filter {NAME =~ *din* || NAME =~ *dout*}]
# set_switching_activity -toggle_rate 5  -static_probability 0.5 \
#     [get_nets -hier -filter {NAME =~ *valid* || NAME =~ *en*}]

# If fft_top is an internal block (not driving external pads), zero the
# output load to remove the inflated I/O power estimate:
# set_load 0 [all_outputs]

# -----------------------------------------------------------------------------
# End of fft_top.xdc
# -----------------------------------------------------------------------------
