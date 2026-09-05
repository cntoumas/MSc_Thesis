set proj_dir [get_property DIRECTORY [current_project]]
set proj_name [get_property NAME [current_project]]
set saif_path "${proj_dir}/${proj_name}.sim/sim_1/behav/xsim/fft_top.saif"

if {![file exists $saif_path]} {
    puts "ERROR: SAIF not found at $saif_path"
    puts "       Run generate_saif.tcl first, or update the path above."
    return
}

# Make sure synth_1 is open
if {[current_design -quiet] eq ""} {
    open_run synth_1
}

# Load activity data
# -strip_path tells Vivado that the DUT in simulation was at hierarchy
# tb_fft_top/u_dut, and we want to map it to the top of the synthesised
# design (fft_top).
puts "Loading SAIF: $saif_path"
read_saif -strip_path tb_fft_top/u_dut $saif_path

# Generate the power report
set rpt_path "${proj_dir}/power_with_saif.rpt"
report_power -file $rpt_path
puts ""
puts "============================================================"
puts "Power report written: $rpt_path"
puts "Confidence level should now be Medium or High."
puts "============================================================"