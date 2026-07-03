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
    id 168 \
    name re \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename re \
    op interface \
    ports { re_address0 { O 9 vector } re_ce0 { O 1 bit } re_q0 { I 17 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 're'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 169 \
    name re_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename re_1 \
    op interface \
    ports { re_1_address0 { O 9 vector } re_1_ce0 { O 1 bit } re_1_q0 { I 17 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 're_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 171 \
    name im \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename im \
    op interface \
    ports { im_address0 { O 9 vector } im_ce0 { O 1 bit } im_q0 { I 17 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'im'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 172 \
    name im_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename im_1 \
    op interface \
    ports { im_1_address0 { O 9 vector } im_1_ce0 { O 1 bit } im_1_q0 { I 17 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'im_1'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 167 \
    name AXI_OUT \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_AXI_OUT \
    op interface \
    ports { m_axi_AXI_OUT_AWVALID { O 1 bit } m_axi_AXI_OUT_AWREADY { I 1 bit } m_axi_AXI_OUT_AWADDR { O 64 vector } m_axi_AXI_OUT_AWID { O 1 vector } m_axi_AXI_OUT_AWLEN { O 32 vector } m_axi_AXI_OUT_AWSIZE { O 3 vector } m_axi_AXI_OUT_AWBURST { O 2 vector } m_axi_AXI_OUT_AWLOCK { O 2 vector } m_axi_AXI_OUT_AWCACHE { O 4 vector } m_axi_AXI_OUT_AWPROT { O 3 vector } m_axi_AXI_OUT_AWQOS { O 4 vector } m_axi_AXI_OUT_AWREGION { O 4 vector } m_axi_AXI_OUT_AWUSER { O 1 vector } m_axi_AXI_OUT_WVALID { O 1 bit } m_axi_AXI_OUT_WREADY { I 1 bit } m_axi_AXI_OUT_WDATA { O 16 vector } m_axi_AXI_OUT_WSTRB { O 2 vector } m_axi_AXI_OUT_WLAST { O 1 bit } m_axi_AXI_OUT_WID { O 1 vector } m_axi_AXI_OUT_WUSER { O 1 vector } m_axi_AXI_OUT_ARVALID { O 1 bit } m_axi_AXI_OUT_ARREADY { I 1 bit } m_axi_AXI_OUT_ARADDR { O 64 vector } m_axi_AXI_OUT_ARID { O 1 vector } m_axi_AXI_OUT_ARLEN { O 32 vector } m_axi_AXI_OUT_ARSIZE { O 3 vector } m_axi_AXI_OUT_ARBURST { O 2 vector } m_axi_AXI_OUT_ARLOCK { O 2 vector } m_axi_AXI_OUT_ARCACHE { O 4 vector } m_axi_AXI_OUT_ARPROT { O 3 vector } m_axi_AXI_OUT_ARQOS { O 4 vector } m_axi_AXI_OUT_ARREGION { O 4 vector } m_axi_AXI_OUT_ARUSER { O 1 vector } m_axi_AXI_OUT_RVALID { I 1 bit } m_axi_AXI_OUT_RREADY { O 1 bit } m_axi_AXI_OUT_RDATA { I 16 vector } m_axi_AXI_OUT_RLAST { I 1 bit } m_axi_AXI_OUT_RID { I 1 vector } m_axi_AXI_OUT_RFIFONUM { I 10 vector } m_axi_AXI_OUT_RUSER { I 1 vector } m_axi_AXI_OUT_RRESP { I 2 vector } m_axi_AXI_OUT_BVALID { I 1 bit } m_axi_AXI_OUT_BREADY { O 1 bit } m_axi_AXI_OUT_BRESP { I 2 vector } m_axi_AXI_OUT_BID { I 1 vector } m_axi_AXI_OUT_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
    name sext_ln273 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln273 \
    op interface \
    ports { sext_ln273 { I 63 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name sext_ln273_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln273_1 \
    op interface \
    ports { sext_ln273_1 { I 63 vector } } \
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


