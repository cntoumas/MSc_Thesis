# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
# Tool Version Limit: 2023.10
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
source ./settings.tcl
source -notrace ./extraction.tcl

set vivado_proj_name project
set vivado_proj_dir .
set target_device "${device}${package}${speed}"
set target_clk_period_ns "10.000"
set target_clk_freq_hz [expr {floor(1000 / $target_clk_period_ns) * 1000000}]
set ip_vlnv xilinx.com:hls:fft_mdf:1.0
set ip_repo_path ../ip
set bd_design_name bd_0
set bd_inst_name hls_inst
set bd_props {}

set has_synth true
set synth_design_args {-directive sdx_optimization_effort_high}
set synth_dcp ""
set synth_props {}

set has_impl 1
set impl_props {}

set report_options [dict create]
dict set report_options report_level 2
dict set report_options report_max_paths 10
dict set report_options stdout_hls_reports 1
dict set report_options stdout_vivado_reports 0
dict set report_options hls_project mdf_fft_hls
dict set report_options hls_solution solution1
dict set report_options has_synth $has_synth
dict set report_options has_impl $has_impl
dict set report_options vivado_reportbasename $top_module
dict set report_options vivado_reportdir ./report
dict set report_options hls_impl_dir ..
dict set report_options hls_reportdir ../report/$language
dict set report_options target_clk_period $target_clk_period_ns
dict set report_options target_device $target_device
dict set report_options language $language
dict set report_options clock_name $clock
dict set report_options error_if_impl_timing_fails false
dict set report_options bindmodules {fft_mdf_regslice_both fft_mdf_flow_control_loop_pipe fft_mdf_mul_16s_16s_31_1_1 fft_mdf_mac_muladd_16s_16s_31s_31_4_1 fft_mdf_mac_mulsub_16s_16s_31s_31_4_1 fft_mdf_Loop_VITIS_LOOP_95_1_proc10_void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdbkb fft_mdf_Loop_VITIS_LOOP_95_1_proc10_TW_COS_LUT25_ROM_AUTO_1R fft_mdf_Loop_VITIS_LOOP_95_1_proc10_TW_SIN_LUT30_ROM_AUTO_1R fft_mdf_Loop_VITIS_LOOP_95_1_proc111_void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdjbC fft_mdf_Loop_VITIS_LOOP_95_1_proc212_void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdrcU fft_mdf_Loop_VITIS_LOOP_95_1_proc313_void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdzec fft_mdf_Loop_VITIS_LOOP_95_1_proc414_void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdfHfu fft_mdf_sparsemux_7_32_16_1_1 fft_mdf_Loop_VITIS_LOOP_95_1_proc515_void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdfPgM fft_mdf_Loop_VITIS_LOOP_95_1_proc515_TW_COS_LUT_ROM_AUTO_1R fft_mdf_Loop_VITIS_LOOP_95_1_proc515_TW_SIN_LUT_ROM_AUTO_1R fft_mdf_mul_16s_16ns_31_1_1 fft_mdf_Loop_VITIS_LOOP_95_1_proc616_void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdfXh4 fft_mdf_mac_muladd_16s_15ns_31s_31_4_1 fft_mdf_am_addmul_16s_16s_16s_31_4_1 fft_mdf_am_submul_16s_16s_16s_31_4_1 fft_mdf_flow_control_loop_pipe_sequential_init fft_mdf_bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_RAM_AUTO_1R1W_memcore fft_mdf_bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_RAM_AUTO_1R1W fft_mdf_fifo_w129_d260_A fft_mdf_fifo_w1_d2_S fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc10_U0 fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc111_U0 fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc212_U0 fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc313_U0 fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc414_U0 fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc515_U0 fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc616_U0 fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc717_U0 fft_mdf_start_for_Loop_VITIS_LOOP_168_1_proc18_U0 fft_mdf_start_for_Loop_VITIS_LOOP_168_1_proc819_U0 fft_mdf_start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm fft_mdf_start_for_word_to_axis_U0}
dict set report_options max_module_depth 7


create_project $vivado_proj_name $vivado_proj_dir -part $target_device -force
set_property target_language $language [current_project]


# setup design sources and constraints

if { ![file exists $ip_repo_path] } {
  error "Cannot find packaged HLS IP"
}
set_property ip_repo_paths [file normalize $ip_repo_path] [current_project]
update_ip_catalog
create_bd_design $bd_design_name

# Instantiate HLS IP
set cell_inst [create_bd_cell -type ip -vlnv $ip_vlnv $bd_inst_name]
if { [llength $bd_props] } { 
  set_property -dict $bd_props $cell_inst 
}

# Update BD pins
make_bd_pins_external $cell_inst
make_bd_intf_pins_external $cell_inst

# Set BD clock port freq property
set bd_clk_ports [get_bd_ports -filter {TYPE==clk}]
if { [llength $bd_clk_ports] && $target_clk_freq_hz ne "" } { 
  set_property CONFIG.FREQ_HZ $target_clk_freq_hz $bd_clk_ports 
}

# Remove "_0" suffix from BD ports & interfaces so they match IP ports (XDC names will match)
foreach bd_port [get_bd_intf_ports] {
  set_property name [regsub {_0$} [get_property name $bd_port] {}] $bd_port
}
foreach bd_port [get_bd_ports -filter {INTF!=TRUE}] {
  set_property name [regsub {_0$} [get_property name $bd_port] {}] $bd_port
}

# Vitis kernels have minimum width for s_axi target address space 
# This changes external port address space, not IP
set s_axi_addr_width_min 32
foreach bd_port [get_bd_intf_ports -filter {MODE == "Slave" && VLNV =~ "xilinx.com:interface:aximm_rtl:*"}] {
  set bd_port_addr_width [get_property CONFIG.ADDR_WIDTH $bd_port]
  if { $bd_port_addr_width < $s_axi_addr_width_min } {
    puts "INFO: Updating $bd_port CONFIG.ADDR_WIDTH to $s_axi_addr_width_min"
    set_property CONFIG.ADDR_WIDTH $s_axi_addr_width_min $bd_port
  }
}

# Downgrade slave segment critical warnings since this is an OOC design
set_msg_config -id {[BD 41-1265]} -severity {CRITICAL WARNING} -new_severity {INFO}

# Use default address assignment
assign_bd_address

# Set top of design to use BD wrapper
set toprtl [make_wrapper -files [get_files ${bd_design_name}.bd] -top]
add_files -norecurse $toprtl
set top_inst_name [file root [file tail $toprtl]]
puts "Using BD top: $top_inst_name"

# Add XDC files
set xdc_files [glob -nocomplain ./*.xdc]
if { [llength $xdc_files] } {
    add_files -fileset constrs_1 -norecurse $xdc_files
}

# Create the ooc run objects without running them
launch_runs synth_1 -scripts_only

# Rest all the synthesis runs
foreach run [get_runs -filter {IS_SYNTHESIS == 1}] {
  reset_run [get_runs $run]
}


set_property XPM_LIBRARIES {XPM_MEMORY XPM_FIFO} [current_project]

hls_vivado_reports_setup $report_options
if { $has_synth || $has_impl } {
  # synth properties setting
  set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value {-mode out_of_context} -objects [get_runs synth_1]
  set ip_inst [get_ips -quiet ${bd_design_name}*${bd_inst_name}*]
  if { ![llength $ip_inst] } {
      error "Cannot find HLS IP instance: ${bd_design_name}*${bd_inst_name}*"
  }
  set synth_run [get_runs -filter {IS_SYNTHESIS == 1} ${ip_inst}*]
  if { ![llength $synth_run] } {
      error "Cannot find synth run for HLS IP: ${ip_inst}*"
  }

  if { [llength $synth_design_args] } {
      set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value $synth_design_args -objects $synth_run
  }

  if { [llength $synth_props] } {
    set_property -dict $synth_props $synth_run
  }

  # launch run synth
  launch_runs synth_1
  wait_on_run synth_1
  # synth reports
  hls_vivado_reports_synth synth_1 $report_options
  if { $synth_dcp ne "" } {
    file mkdir [file dirname $synth_dcp]
    set run_dcp [glob -nocomplain [get_property DIRECTORY $synth_run]/*.dcp]
    if { [llength $run_dcp] != 1 } { error "Cannot find single dcp file for run $synth_run" }
    file copy -force $run_dcp $synth_dcp
  }
}


if { $has_impl } {
  # launch run impl
  if { [llength $impl_props] } {
    set_property -dict $impl_props [get_runs impl_1]
  }
  launch_runs impl_1
  wait_on_run impl_1
  # impl reports
  hls_vivado_reports_impl impl_1 $report_options
}
hls_vivado_reports_finalize $report_options
