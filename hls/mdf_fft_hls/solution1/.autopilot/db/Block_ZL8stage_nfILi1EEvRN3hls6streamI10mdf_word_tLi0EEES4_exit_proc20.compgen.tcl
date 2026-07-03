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
    id 177 \
    name bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank \
    op interface \
    ports { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 { O 8 vector } bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 { O 1 bit } bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_we0 { O 1 bit } bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 178 \
    name bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 \
    op interface \
    ports { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 { O 8 vector } bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 { O 1 bit } bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_we0 { O 1 bit } bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name s9 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_s9 \
    op interface \
    ports { s9_dout { I 129 vector } s9_num_data_valid { I 10 vector } s9_fifo_cap { I 10 vector } s9_empty_n { I 1 bit } s9_read { O 1 bit } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 1 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
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
    id -4 \
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


