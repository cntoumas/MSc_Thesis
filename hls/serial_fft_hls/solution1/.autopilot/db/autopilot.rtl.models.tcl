set SynModuleInfo {
  {SRCNAME fft_serial_Pipeline_load_loop MODELNAME fft_serial_Pipeline_load_loop RTLNAME fft_serial_fft_serial_Pipeline_load_loop
    SUBMODULES {
      {MODELNAME fft_serial_flow_control_loop_pipe_sequential_init RTLNAME fft_serial_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fft_serial_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fft_serial_Pipeline_bfly_loop MODELNAME fft_serial_Pipeline_bfly_loop RTLNAME fft_serial_fft_serial_Pipeline_bfly_loop
    SUBMODULES {
      {MODELNAME fft_serial_mul_16s_16ns_32_4_1 RTLNAME fft_serial_mul_16s_16ns_32_4_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_serial_Pipeline_scan_loop MODELNAME fft_serial_Pipeline_scan_loop RTLNAME fft_serial_fft_serial_Pipeline_scan_loop}
  {SRCNAME fft_serial_Pipeline_bfly_loop1 MODELNAME fft_serial_Pipeline_bfly_loop1 RTLNAME fft_serial_fft_serial_Pipeline_bfly_loop1
    SUBMODULES {
      {MODELNAME fft_serial_mul_16s_16s_32_4_1 RTLNAME fft_serial_mul_16s_16s_32_4_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft_serial_mac_mulsub_16s_16s_31s_32_4_1 RTLNAME fft_serial_mac_mulsub_16s_16s_31s_32_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft_serial_mac_muladd_16s_16s_31s_32_4_1 RTLNAME fft_serial_mac_muladd_16s_16s_31s_32_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_serial_Pipeline_scan_loop2 MODELNAME fft_serial_Pipeline_scan_loop2 RTLNAME fft_serial_fft_serial_Pipeline_scan_loop2}
  {SRCNAME fft_serial_Pipeline_bfly_loop3 MODELNAME fft_serial_Pipeline_bfly_loop3 RTLNAME fft_serial_fft_serial_Pipeline_bfly_loop3
    SUBMODULES {
      {MODELNAME fft_serial_mac_mulsub_16s_16s_32s_32_1_1 RTLNAME fft_serial_mac_mulsub_16s_16s_32s_32_1_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft_serial_mac_muladd_16s_16s_32s_32_1_1 RTLNAME fft_serial_mac_muladd_16s_16s_32s_32_1_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft_serial_Pipeline_scan_loop4 MODELNAME fft_serial_Pipeline_scan_loop4 RTLNAME fft_serial_fft_serial_Pipeline_scan_loop4}
  {SRCNAME fft_serial_Pipeline_bfly_loop5 MODELNAME fft_serial_Pipeline_bfly_loop5 RTLNAME fft_serial_fft_serial_Pipeline_bfly_loop5}
  {SRCNAME fft_serial_Pipeline_scan_loop6 MODELNAME fft_serial_Pipeline_scan_loop6 RTLNAME fft_serial_fft_serial_Pipeline_scan_loop6}
  {SRCNAME fft_serial_Pipeline_bfly_loop7 MODELNAME fft_serial_Pipeline_bfly_loop7 RTLNAME fft_serial_fft_serial_Pipeline_bfly_loop7}
  {SRCNAME fft_serial_Pipeline_scan_loop8 MODELNAME fft_serial_Pipeline_scan_loop8 RTLNAME fft_serial_fft_serial_Pipeline_scan_loop8}
  {SRCNAME fft_serial_Pipeline_bfly_loop9 MODELNAME fft_serial_Pipeline_bfly_loop9 RTLNAME fft_serial_fft_serial_Pipeline_bfly_loop9}
  {SRCNAME fft_serial_Pipeline_scan_loop10 MODELNAME fft_serial_Pipeline_scan_loop10 RTLNAME fft_serial_fft_serial_Pipeline_scan_loop10}
  {SRCNAME fft_serial_Pipeline_bfly_loop11 MODELNAME fft_serial_Pipeline_bfly_loop11 RTLNAME fft_serial_fft_serial_Pipeline_bfly_loop11}
  {SRCNAME fft_serial_Pipeline_scan_loop12 MODELNAME fft_serial_Pipeline_scan_loop12 RTLNAME fft_serial_fft_serial_Pipeline_scan_loop12}
  {SRCNAME fft_serial_Pipeline_bfly_loop13 MODELNAME fft_serial_Pipeline_bfly_loop13 RTLNAME fft_serial_fft_serial_Pipeline_bfly_loop13}
  {SRCNAME fft_serial_Pipeline_scan_loop14 MODELNAME fft_serial_Pipeline_scan_loop14 RTLNAME fft_serial_fft_serial_Pipeline_scan_loop14}
  {SRCNAME fft_serial_Pipeline_bfly_loop15 MODELNAME fft_serial_Pipeline_bfly_loop15 RTLNAME fft_serial_fft_serial_Pipeline_bfly_loop15}
  {SRCNAME fft_serial_Pipeline_scan_loop16 MODELNAME fft_serial_Pipeline_scan_loop16 RTLNAME fft_serial_fft_serial_Pipeline_scan_loop16}
  {SRCNAME fft_serial_Pipeline_bfly_loop17 MODELNAME fft_serial_Pipeline_bfly_loop17 RTLNAME fft_serial_fft_serial_Pipeline_bfly_loop17}
  {SRCNAME fft_serial_Pipeline_scan_loop18 MODELNAME fft_serial_Pipeline_scan_loop18 RTLNAME fft_serial_fft_serial_Pipeline_scan_loop18}
  {SRCNAME fft_serial_Pipeline_store_loop MODELNAME fft_serial_Pipeline_store_loop RTLNAME fft_serial_fft_serial_Pipeline_store_loop}
  {SRCNAME fft_serial MODELNAME fft_serial RTLNAME fft_serial IS_TOP 1
    SUBMODULES {
      {MODELNAME fft_serial_sparsemux_17_32_4_1_1 RTLNAME fft_serial_sparsemux_17_32_4_1_1 BINDTYPE op TYPE sparsemux IMPL auto}
      {MODELNAME fft_serial_TW_COS_LUT_ROM_AUTO_1R RTLNAME fft_serial_TW_COS_LUT_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_serial_TW_SIN_LUT_ROM_AUTO_1R RTLNAME fft_serial_TW_SIN_LUT_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_serial_re_RAM_AUTO_1R1W RTLNAME fft_serial_re_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_serial_AXI_IN_m_axi RTLNAME fft_serial_AXI_IN_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME fft_serial_AXI_OUT_m_axi RTLNAME fft_serial_AXI_OUT_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME fft_serial_control_s_axi RTLNAME fft_serial_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
