set moduleName Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {Block__ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_.exit_proc20}
set C_modelType { int 1 }
set C_modelArgList {
	{ s9 int 129 regular {fifo 0 volatile }  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank int 128 regular {array 256 { 0 3 } 0 1 }  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 int 128 regular {array 256 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s9", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s9_dout sc_in sc_lv 129 signal 0 } 
	{ s9_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ s9_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ s9_empty_n sc_in sc_logic 1 signal 0 } 
	{ s9_read sc_out sc_logic 1 signal 0 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 sc_out sc_lv 8 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 sc_out sc_logic 1 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_we0 sc_out sc_logic 1 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_d0 sc_out sc_lv 128 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 sc_out sc_lv 8 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_we0 sc_out sc_logic 1 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_d0 sc_out sc_lv 128 signal 2 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s9_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s9", "role": "dout" }} , 
 	{ "name": "s9_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s9", "role": "num_data_valid" }} , 
 	{ "name": "s9_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s9", "role": "fifo_cap" }} , 
 	{ "name": "s9_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s9", "role": "empty_n" }} , 
 	{ "name": "s9_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s9", "role": "read" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "we0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "d0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "we0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "d0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "259", "EstimateLatencyMax" : "259",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "s9", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "wr_bank", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "wr_cnt", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s9_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "write_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20 {
		s9 {Type I LastRead 1 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type O LastRead -1 FirstWrite 1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type O LastRead -1 FirstWrite 1}
		wr_bank {Type IO LastRead -1 FirstWrite -1}
		wr_cnt {Type IO LastRead -1 FirstWrite -1}}
	Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin {
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type O LastRead -1 FirstWrite 1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type O LastRead -1 FirstWrite 1}
		s9 {Type I LastRead 1 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		wr_cnt {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s9 { ap_fifo {  { s9_dout fifo_data_in 0 129 }  { s9_num_data_valid fifo_status_num_data_valid 0 10 }  { s9_fifo_cap fifo_update 0 10 }  { s9_empty_n fifo_status 0 1 }  { s9_read fifo_port_we 1 1 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_we0 mem_we 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_d0 mem_din 1 128 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_we0 mem_we 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_d0 mem_din 1 128 } } }
}
set moduleName Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {Block__ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_.exit_proc20}
set C_modelType { int 1 }
set C_modelArgList {
	{ s9 int 129 regular {fifo 0 volatile }  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank int 128 regular {array 256 { 0 3 } 0 1 }  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 int 128 regular {array 256 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s9", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s9_dout sc_in sc_lv 129 signal 0 } 
	{ s9_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ s9_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ s9_empty_n sc_in sc_logic 1 signal 0 } 
	{ s9_read sc_out sc_logic 1 signal 0 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 sc_out sc_lv 8 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 sc_out sc_logic 1 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_we0 sc_out sc_logic 1 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_d0 sc_out sc_lv 128 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 sc_out sc_lv 8 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_we0 sc_out sc_logic 1 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_d0 sc_out sc_lv 128 signal 2 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s9_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s9", "role": "dout" }} , 
 	{ "name": "s9_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s9", "role": "num_data_valid" }} , 
 	{ "name": "s9_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s9", "role": "fifo_cap" }} , 
 	{ "name": "s9_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s9", "role": "empty_n" }} , 
 	{ "name": "s9_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s9", "role": "read" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "we0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "d0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "we0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "d0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "259", "EstimateLatencyMax" : "259",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "s9", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "wr_bank", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "wr_cnt", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s9_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "write_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20 {
		s9 {Type I LastRead 1 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type O LastRead -1 FirstWrite 1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type O LastRead -1 FirstWrite 1}
		wr_bank {Type IO LastRead -1 FirstWrite -1}
		wr_cnt {Type IO LastRead -1 FirstWrite -1}}
	Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin {
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type O LastRead -1 FirstWrite 1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type O LastRead -1 FirstWrite 1}
		s9 {Type I LastRead 1 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		wr_cnt {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s9 { ap_fifo {  { s9_dout fifo_data_in 0 129 }  { s9_num_data_valid fifo_status_num_data_valid 0 10 }  { s9_fifo_cap fifo_update 0 10 }  { s9_empty_n fifo_status 0 1 }  { s9_read fifo_port_we 1 1 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_we0 mem_we 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_d0 mem_din 1 128 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_we0 mem_we 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_d0 mem_din 1 128 } } }
}
set moduleName Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {Block__ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_.exit_proc20}
set C_modelType { int 1 }
set C_modelArgList {
	{ s9 int 129 regular {fifo 0 volatile }  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank int 128 regular {array 256 { 0 3 } 0 1 }  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 int 128 regular {array 256 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s9", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s9_dout sc_in sc_lv 129 signal 0 } 
	{ s9_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ s9_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ s9_empty_n sc_in sc_logic 1 signal 0 } 
	{ s9_read sc_out sc_logic 1 signal 0 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 sc_out sc_lv 8 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 sc_out sc_logic 1 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_we0 sc_out sc_logic 1 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_d0 sc_out sc_lv 128 signal 1 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 sc_out sc_lv 8 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_we0 sc_out sc_logic 1 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_d0 sc_out sc_lv 128 signal 2 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s9_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s9", "role": "dout" }} , 
 	{ "name": "s9_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s9", "role": "num_data_valid" }} , 
 	{ "name": "s9_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s9", "role": "fifo_cap" }} , 
 	{ "name": "s9_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s9", "role": "empty_n" }} , 
 	{ "name": "s9_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s9", "role": "read" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "we0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "d0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "we0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "d0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "259", "EstimateLatencyMax" : "259",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "s9", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "wr_bank", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "wr_cnt", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s9_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "write_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20 {
		s9 {Type I LastRead 1 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type O LastRead -1 FirstWrite 1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type O LastRead -1 FirstWrite 1}
		wr_bank {Type IO LastRead -1 FirstWrite -1}
		wr_cnt {Type IO LastRead -1 FirstWrite -1}}
	Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin {
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type O LastRead -1 FirstWrite 1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type O LastRead -1 FirstWrite 1}
		s9 {Type I LastRead 1 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		wr_cnt {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s9 { ap_fifo {  { s9_dout fifo_data_in 0 129 }  { s9_num_data_valid fifo_status_num_data_valid 0 10 }  { s9_fifo_cap fifo_update 0 10 }  { s9_empty_n fifo_status 0 1 }  { s9_read fifo_port_we 1 1 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_we0 mem_we 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_d0 mem_din 1 128 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_we0 mem_we 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_d0 mem_din 1 128 } } }
}
