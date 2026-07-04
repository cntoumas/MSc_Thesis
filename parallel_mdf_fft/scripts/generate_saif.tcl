# =============================================================================
# generate_saif.tcl - Run Vivado XSim with SAIF capture for fft_top
#
# Usage (from Vivado TCL console, with the project already open):
#   source scripts/generate_saif.tcl
#
# Output: <project_dir>/fft_top.saif  (the activity file consumed by
#         report_power for accurate power estimation)
#
# Prerequisite: rtl/* and tb/tb_fft_top.v must be in the project, and
# tb_fft_top must be the simulation top.  The ROM .hex files in rom/ must
# be accessible from the simulation working directory (Vivado copies them
# automatically if they are added as design sources, OR you must set the
# simulation working directory to the project root).
# =============================================================================

# -----------------------------------------------------------------------------
# 1. Make sure tb_fft_top is the simulation top
# -----------------------------------------------------------------------------
set_property top tb_fft_top [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

# -----------------------------------------------------------------------------
# 2. Configure XSim to generate a SAIF file
# -----------------------------------------------------------------------------
# These properties tell XSim to dump SAIF for the DUT hierarchy.
set_property -name {xsim.simulate.runtime}      -value {50us}                 -objects [get_filesets sim_1]
set_property -name {xsim.simulate.saif_scope}   -value {tb_fft_top/u_dut}     -objects [get_filesets sim_1]
set_property -name {xsim.simulate.saif}         -value {fft_top.saif}         -objects [get_filesets sim_1]
set_property -name {xsim.simulate.saif_all_signals} -value {true}             -objects [get_filesets sim_1]

# -----------------------------------------------------------------------------
# 3. Launch the simulation (behavioral / RTL)
# -----------------------------------------------------------------------------
launch_simulation -mode behavioral

# At this point XSim is running interactively.  Step 4 (below) executes
# inside the simulator.  If you launched non-interactively the
# xsim.simulate.runtime above will run the full 50 us and write SAIF.

# -----------------------------------------------------------------------------
# 4. If you launched the simulation in -batch / non-interactive mode:
# -----------------------------------------------------------------------------
# Vivado will:
#   1. compile RTL + TB
#   2. elaborate
#   3. run 50 us
#   4. close_saif on completion
#   5. write fft_top.saif into the run directory
#
# Look for the file under:
#   <project_dir>/<project_name>.sim/sim_1/behav/xsim/fft_top.saif
#
# Or if you launched outside a project, it lands in the current dir.

puts ""
puts "============================================================"
puts "SAIF generation requested. Steps:"
puts "  1. Simulation runs for 50 us (tb_fft_top sweeps 5 stimuli)"
puts "  2. SAIF file is written when simulation completes"
puts "  3. After it finishes, locate fft_top.saif and load it"
puts "     into the open synthesis run with:"
puts ""
puts "       open_run synth_1"
puts "       read_saif -strip_path tb_fft_top/u_dut \\"
puts "           <project_dir>/<proj_name>.sim/sim_1/behav/xsim/fft_top.saif"
puts "       report_power -file power_with_saif.rpt"
puts "============================================================"
