set_property top tb_fft_top [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

set_property -name {xsim.simulate.runtime}      -value {50us}                 -objects [get_filesets sim_1]
set_property -name {xsim.simulate.saif_scope}   -value {tb_fft_top/u_dut}     -objects [get_filesets sim_1]
set_property -name {xsim.simulate.saif}         -value {fft_top.saif}         -objects [get_filesets sim_1]
set_property -name {xsim.simulate.saif_all_signals} -value {true}             -objects [get_filesets sim_1]

launch_simulation -mode behavioral

# At this point XSim is running interactively.  Step 4 (below) executes
# inside the simulator.  If you launched non-interactively the
# xsim.simulate.runtime above will run the full 50 us and write SAIF.

# 4. If you launched the simulation in -batch / non-interactive mode:
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