
wire kernel_monitor_reset;
wire kernel_monitor_clock;
wire kernel_monitor_report;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
assign kernel_monitor_report = 1'b0;
wire [1:0] axis_block_sigs;
wire [16:0] inst_idle_sigs;
wire [13:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~axis_to_word_U0.s_in_TDATA_blk_n;
assign axis_block_sigs[1] = ~word_to_axis_U0.s_out_TDATA_blk_n;

assign inst_idle_sigs[0] = axis_to_word_U0.ap_idle;
assign inst_block_sigs[0] = (axis_to_word_U0.ap_done & ~axis_to_word_U0.ap_continue) | ~axis_to_word_U0.w_in_blk_n;
assign inst_idle_sigs[1] = Loop_VITIS_LOOP_95_1_proc10_U0.ap_idle;
assign inst_block_sigs[1] = (Loop_VITIS_LOOP_95_1_proc10_U0.ap_done & ~Loop_VITIS_LOOP_95_1_proc10_U0.ap_continue) | ~Loop_VITIS_LOOP_95_1_proc10_U0.s0_blk_n | ~Loop_VITIS_LOOP_95_1_proc10_U0.w_in_blk_n;
assign inst_idle_sigs[2] = Loop_VITIS_LOOP_95_1_proc111_U0.ap_idle;
assign inst_block_sigs[2] = (Loop_VITIS_LOOP_95_1_proc111_U0.ap_done & ~Loop_VITIS_LOOP_95_1_proc111_U0.ap_continue) | ~Loop_VITIS_LOOP_95_1_proc111_U0.s1_blk_n | ~Loop_VITIS_LOOP_95_1_proc111_U0.s0_blk_n;
assign inst_idle_sigs[3] = Loop_VITIS_LOOP_95_1_proc212_U0.ap_idle;
assign inst_block_sigs[3] = (Loop_VITIS_LOOP_95_1_proc212_U0.ap_done & ~Loop_VITIS_LOOP_95_1_proc212_U0.ap_continue) | ~Loop_VITIS_LOOP_95_1_proc212_U0.s2_blk_n | ~Loop_VITIS_LOOP_95_1_proc212_U0.s1_blk_n;
assign inst_idle_sigs[4] = Loop_VITIS_LOOP_95_1_proc313_U0.ap_idle;
assign inst_block_sigs[4] = (Loop_VITIS_LOOP_95_1_proc313_U0.ap_done & ~Loop_VITIS_LOOP_95_1_proc313_U0.ap_continue) | ~Loop_VITIS_LOOP_95_1_proc313_U0.s3_blk_n | ~Loop_VITIS_LOOP_95_1_proc313_U0.s2_blk_n;
assign inst_idle_sigs[5] = Loop_VITIS_LOOP_95_1_proc414_U0.ap_idle;
assign inst_block_sigs[5] = (Loop_VITIS_LOOP_95_1_proc414_U0.ap_done & ~Loop_VITIS_LOOP_95_1_proc414_U0.ap_continue) | ~Loop_VITIS_LOOP_95_1_proc414_U0.s4_blk_n | ~Loop_VITIS_LOOP_95_1_proc414_U0.s3_blk_n;
assign inst_idle_sigs[6] = Loop_VITIS_LOOP_95_1_proc515_U0.ap_idle;
assign inst_block_sigs[6] = (Loop_VITIS_LOOP_95_1_proc515_U0.ap_done & ~Loop_VITIS_LOOP_95_1_proc515_U0.ap_continue) | ~Loop_VITIS_LOOP_95_1_proc515_U0.s5_blk_n | ~Loop_VITIS_LOOP_95_1_proc515_U0.s4_blk_n;
assign inst_idle_sigs[7] = Loop_VITIS_LOOP_95_1_proc616_U0.ap_idle;
assign inst_block_sigs[7] = (Loop_VITIS_LOOP_95_1_proc616_U0.ap_done & ~Loop_VITIS_LOOP_95_1_proc616_U0.ap_continue) | ~Loop_VITIS_LOOP_95_1_proc616_U0.s6_blk_n | ~Loop_VITIS_LOOP_95_1_proc616_U0.s5_blk_n;
assign inst_idle_sigs[8] = Loop_VITIS_LOOP_95_1_proc717_U0.ap_idle;
assign inst_block_sigs[8] = (Loop_VITIS_LOOP_95_1_proc717_U0.ap_done & ~Loop_VITIS_LOOP_95_1_proc717_U0.ap_continue) | ~Loop_VITIS_LOOP_95_1_proc717_U0.s7_blk_n | ~Loop_VITIS_LOOP_95_1_proc717_U0.s6_blk_n;
assign inst_idle_sigs[9] = Loop_VITIS_LOOP_168_1_proc18_U0.ap_idle;
assign inst_block_sigs[9] = (Loop_VITIS_LOOP_168_1_proc18_U0.ap_done & ~Loop_VITIS_LOOP_168_1_proc18_U0.ap_continue) | ~Loop_VITIS_LOOP_168_1_proc18_U0.s7_blk_n | ~Loop_VITIS_LOOP_168_1_proc18_U0.s8_blk_n;
assign inst_idle_sigs[10] = Loop_VITIS_LOOP_168_1_proc819_U0.ap_idle;
assign inst_block_sigs[10] = (Loop_VITIS_LOOP_168_1_proc819_U0.ap_done & ~Loop_VITIS_LOOP_168_1_proc819_U0.ap_continue) | ~Loop_VITIS_LOOP_168_1_proc819_U0.s8_blk_n | ~Loop_VITIS_LOOP_168_1_proc819_U0.s9_blk_n;
assign inst_idle_sigs[11] = Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.ap_idle;
assign inst_block_sigs[11] = (Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.ap_done & ~Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.ap_continue) | ~Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26.s9_blk_n;
assign inst_idle_sigs[12] = Loop_read_loop_proc_U0.ap_idle;
assign inst_block_sigs[12] = (Loop_read_loop_proc_U0.ap_done & ~Loop_read_loop_proc_U0.ap_continue) | ~Loop_read_loop_proc_U0.w_out_blk_n;
assign inst_idle_sigs[13] = word_to_axis_U0.ap_idle;
assign inst_block_sigs[13] = (word_to_axis_U0.ap_done & ~word_to_axis_U0.ap_continue) | ~word_to_axis_U0.w_out_blk_n;

assign inst_idle_sigs[14] = 1'b0;
assign inst_idle_sigs[15] = axis_to_word_U0.ap_idle;
assign inst_idle_sigs[16] = word_to_axis_U0.ap_idle;

fft_mdf_hls_deadlock_idx0_monitor fft_mdf_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);


always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end
