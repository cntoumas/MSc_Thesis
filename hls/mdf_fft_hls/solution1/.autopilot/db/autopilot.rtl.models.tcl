set SynModuleInfo {
  {SRCNAME axis_to_word MODELNAME axis_to_word RTLNAME fft_mdf_axis_to_word
    SUBMODULES {
      {MODELNAME fft_mdf_regslice_both RTLNAME fft_mdf_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME fft_mdf_regslice_both_U}
      {MODELNAME fft_mdf_flow_control_loop_pipe RTLNAME fft_mdf_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fft_mdf_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_95_1_proc10 MODELNAME Loop_VITIS_LOOP_95_1_proc10 RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc10
    SUBMODULES {
      {MODELNAME fft_mdf_mul_16s_16s_31_1_1 RTLNAME fft_mdf_mul_16s_16s_31_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_mac_muladd_16s_16s_31s_31_4_1 RTLNAME fft_mdf_mac_muladd_16s_16s_31s_31_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_mac_mulsub_16s_16s_31s_31_4_1 RTLNAME fft_mdf_mac_mulsub_16s_16s_31s_31_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc10_void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdbkb RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc10_void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdbkb BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc10_TW_COS_LUT25_ROM_AUTO_1R RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc10_TW_COS_LUT25_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc10_TW_SIN_LUT30_ROM_AUTO_1R RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc10_TW_SIN_LUT30_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_95_1_proc111 MODELNAME Loop_VITIS_LOOP_95_1_proc111 RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc111
    SUBMODULES {
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc111_void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdjbC RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc111_void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdjbC BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_95_1_proc212 MODELNAME Loop_VITIS_LOOP_95_1_proc212 RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc212
    SUBMODULES {
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc212_void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdrcU RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc212_void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdrcU BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_95_1_proc313 MODELNAME Loop_VITIS_LOOP_95_1_proc313 RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc313
    SUBMODULES {
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc313_void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdzec RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc313_void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdzec BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_95_1_proc414 MODELNAME Loop_VITIS_LOOP_95_1_proc414 RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc414
    SUBMODULES {
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc414_void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdfHfu RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc414_void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdfHfu BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_95_1_proc515 MODELNAME Loop_VITIS_LOOP_95_1_proc515 RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc515
    SUBMODULES {
      {MODELNAME fft_mdf_sparsemux_7_32_16_1_1 RTLNAME fft_mdf_sparsemux_7_32_16_1_1 BINDTYPE op TYPE sparsemux IMPL auto}
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc515_void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdfPgM RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc515_void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdfPgM BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc515_TW_COS_LUT_ROM_AUTO_1R RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc515_TW_COS_LUT_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc515_TW_SIN_LUT_ROM_AUTO_1R RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc515_TW_SIN_LUT_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_95_1_proc616 MODELNAME Loop_VITIS_LOOP_95_1_proc616 RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc616
    SUBMODULES {
      {MODELNAME fft_mdf_mul_16s_16ns_31_1_1 RTLNAME fft_mdf_mul_16s_16ns_31_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc616_void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdfXh4 RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc616_void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdfXh4 BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_95_1_proc717 MODELNAME Loop_VITIS_LOOP_95_1_proc717 RTLNAME fft_mdf_Loop_VITIS_LOOP_95_1_proc717
    SUBMODULES {
      {MODELNAME fft_mdf_mac_muladd_16s_15ns_31s_31_4_1 RTLNAME fft_mdf_mac_muladd_16s_15ns_31s_31_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_am_addmul_16s_16s_16s_31_4_1 RTLNAME fft_mdf_am_addmul_16s_16s_16s_31_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_am_submul_16s_16s_16s_31_4_1 RTLNAME fft_mdf_am_submul_16s_16s_16s_31_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_168_1_proc18 MODELNAME Loop_VITIS_LOOP_168_1_proc18 RTLNAME fft_mdf_Loop_VITIS_LOOP_168_1_proc18}
  {SRCNAME Loop_VITIS_LOOP_168_1_proc819 MODELNAME Loop_VITIS_LOOP_168_1_proc819 RTLNAME fft_mdf_Loop_VITIS_LOOP_168_1_proc819}
  {SRCNAME Block__ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_.exit_proc20_Pipelin MODELNAME Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin RTLNAME fft_mdf_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin
    SUBMODULES {
      {MODELNAME fft_mdf_flow_control_loop_pipe_sequential_init RTLNAME fft_mdf_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fft_mdf_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME Block__ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_.exit_proc20 MODELNAME Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20 RTLNAME fft_mdf_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20}
  {SRCNAME Loop_read_loop_proc MODELNAME Loop_read_loop_proc RTLNAME fft_mdf_Loop_read_loop_proc}
  {SRCNAME word_to_axis MODELNAME word_to_axis RTLNAME fft_mdf_word_to_axis}
  {SRCNAME fft_mdf MODELNAME fft_mdf RTLNAME fft_mdf IS_TOP 1
    SUBMODULES {
      {MODELNAME fft_mdf_bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_RAM_AUTO_1R1W_memcore RTLNAME fft_mdf_bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_RAM_AUTO_1R1W_memcore BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_RAM_AUTO_1R1W RTLNAME fft_mdf_bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME w_in_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME s0_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME s1_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME s2_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME s3_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME s4_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME s5_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME s6_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME s7_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME s8_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME s9_U}
      {MODELNAME fft_mdf_fifo_w1_d2_S RTLNAME fft_mdf_fifo_w1_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME rd_bank_cast_loc_channel_U}
      {MODELNAME fft_mdf_fifo_w129_d260_A RTLNAME fft_mdf_fifo_w129_d260_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME w_out_U}
      {MODELNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc10_U0 RTLNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc10_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U}
      {MODELNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc111_U0 RTLNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc111_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U}
      {MODELNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc212_U0 RTLNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc212_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U}
      {MODELNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc313_U0 RTLNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc313_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U}
      {MODELNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc414_U0 RTLNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc414_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U}
      {MODELNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc515_U0 RTLNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc515_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U}
      {MODELNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc616_U0 RTLNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc616_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U}
      {MODELNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc717_U0 RTLNAME fft_mdf_start_for_Loop_VITIS_LOOP_95_1_proc717_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U}
      {MODELNAME fft_mdf_start_for_Loop_VITIS_LOOP_168_1_proc18_U0 RTLNAME fft_mdf_start_for_Loop_VITIS_LOOP_168_1_proc18_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U}
      {MODELNAME fft_mdf_start_for_Loop_VITIS_LOOP_168_1_proc819_U0 RTLNAME fft_mdf_start_for_Loop_VITIS_LOOP_168_1_proc819_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U}
      {MODELNAME fft_mdf_start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm RTLNAME fft_mdf_start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U}
      {MODELNAME fft_mdf_start_for_word_to_axis_U0 RTLNAME fft_mdf_start_for_word_to_axis_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_word_to_axis_U0_U}
    }
  }
}
