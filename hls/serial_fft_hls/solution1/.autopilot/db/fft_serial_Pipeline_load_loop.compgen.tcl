# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2 \
    name im_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename im_1 \
    op interface \
    ports { im_1_address0 { O 9 vector } im_1_ce0 { O 1 bit } im_1_we0 { O 1 bit } im_1_d0 { O 17 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'im_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3 \
    name im \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename im \
    op interface \
    ports { im_address0 { O 9 vector } im_ce0 { O 1 bit } im_we0 { O 1 bit } im_d0 { O 17 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'im'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4 \
    name re_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename re_1 \
    op interface \
    ports { re_1_address0 { O 9 vector } re_1_ce0 { O 1 bit } re_1_we0 { O 1 bit } re_1_d0 { O 17 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 're_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5 \
    name re \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename re \
    op interface \
    ports { re_address0 { O 9 vector } re_ce0 { O 1 bit } re_we0 { O 1 bit } re_d0 { O 17 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 're'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name AXI_IN \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AXI_IN \
    op interface \
    ports { m_axi_AXI_IN_AWVALID { O 1 bit } m_axi_AXI_IN_AWREADY { I 1 bit } m_axi_AXI_IN_AWADDR { O 64 vector } m_axi_AXI_IN_AWID { O 1 vector } m_axi_AXI_IN_AWLEN { O 32 vector } m_axi_AXI_IN_AWSIZE { O 3 vector } m_axi_AXI_IN_AWBURST { O 2 vector } m_axi_AXI_IN_AWLOCK { O 2 vector } m_axi_AXI_IN_AWCACHE { O 4 vector } m_axi_AXI_IN_AWPROT { O 3 vector } m_axi_AXI_IN_AWQOS { O 4 vector } m_axi_AXI_IN_AWREGION { O 4 vector } m_axi_AXI_IN_AWUSER { O 1 vector } m_axi_AXI_IN_WVALID { O 1 bit } m_axi_AXI_IN_WREADY { I 1 bit } m_axi_AXI_IN_WDATA { O 16 vector } m_axi_AXI_IN_WSTRB { O 2 vector } m_axi_AXI_IN_WLAST { O 1 bit } m_axi_AXI_IN_WID { O 1 vector } m_axi_AXI_IN_WUSER { O 1 vector } m_axi_AXI_IN_ARVALID { O 1 bit } m_axi_AXI_IN_ARREADY { I 1 bit } m_axi_AXI_IN_ARADDR { O 64 vector } m_axi_AXI_IN_ARID { O 1 vector } m_axi_AXI_IN_ARLEN { O 32 vector } m_axi_AXI_IN_ARSIZE { O 3 vector } m_axi_AXI_IN_ARBURST { O 2 vector } m_axi_AXI_IN_ARLOCK { O 2 vector } m_axi_AXI_IN_ARCACHE { O 4 vector } m_axi_AXI_IN_ARPROT { O 3 vector } m_axi_AXI_IN_ARQOS { O 4 vector } m_axi_AXI_IN_ARREGION { O 4 vector } m_axi_AXI_IN_ARUSER { O 1 vector } m_axi_AXI_IN_RVALID { I 1 bit } m_axi_AXI_IN_RREADY { O 1 bit } m_axi_AXI_IN_RDATA { I 16 vector } m_axi_AXI_IN_RLAST { I 1 bit } m_axi_AXI_IN_RID { I 1 vector } m_axi_AXI_IN_RFIFONUM { I 10 vector } m_axi_AXI_IN_RUSER { I 1 vector } m_axi_AXI_IN_RRESP { I 2 vector } m_axi_AXI_IN_BVALID { I 1 bit } m_axi_AXI_IN_BREADY { O 1 bit } m_axi_AXI_IN_BRESP { I 2 vector } m_axi_AXI_IN_BID { I 1 vector } m_axi_AXI_IN_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name sext_ln219 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln219 \
    op interface \
    ports { sext_ln219 { I 63 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name sext_ln219_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln219_1 \
    op interface \
    ports { sext_ln219_1 { I 63 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName fft_serial_flow_control_loop_pipe_sequential_init_U
set CompName fft_serial_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix fft_serial_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


