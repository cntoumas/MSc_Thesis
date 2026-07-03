set moduleName Loop_VITIS_LOOP_95_1_proc10
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {Loop_VITIS_LOOP_95_1_proc10}
set C_modelType { void 0 }
set C_modelArgList {
	{ s0 int 129 regular {fifo 1 volatile }  }
	{ w_in int 129 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s0", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} , 
 	{ "Name" : "w_in", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ w_in_dout sc_in sc_lv 129 signal 1 } 
	{ w_in_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ w_in_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ w_in_empty_n sc_in sc_logic 1 signal 1 } 
	{ w_in_read sc_out sc_logic 1 signal 1 } 
	{ s0_din sc_out sc_lv 129 signal 0 } 
	{ s0_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ s0_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ s0_full_n sc_in sc_logic 1 signal 0 } 
	{ s0_write sc_out sc_logic 1 signal 0 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "w_in_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_in", "role": "dout" }} , 
 	{ "name": "w_in_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "num_data_valid" }} , 
 	{ "name": "w_in_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "fifo_cap" }} , 
 	{ "name": "w_in_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "empty_n" }} , 
 	{ "name": "w_in_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "read" }} , 
 	{ "name": "s0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s0", "role": "din" }} , 
 	{ "name": "s0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s0", "role": "num_data_valid" }} , 
 	{ "name": "s0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s0", "role": "fifo_cap" }} , 
 	{ "name": "s0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s0", "role": "full_n" }} , 
 	{ "name": "s0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s0", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "263", "EstimateLatencyMax" : "263",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT30", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_COS_LUT25_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_SIN_LUT30_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U16", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U17", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U18", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U19", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U20", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U21", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U22", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U23", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U24", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U25", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U26", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U27", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U28", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U29", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U30", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U31", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_95_1_proc10 {
		s0 {Type O LastRead -1 FirstWrite 6}
		w_in {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT25 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT30 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "263", "Max" : "263"}
	, {"Name" : "Interval", "Min" : "263", "Max" : "263"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s0 { ap_fifo {  { s0_din fifo_data_in 1 129 }  { s0_num_data_valid fifo_status_num_data_valid 0 10 }  { s0_fifo_cap fifo_update 0 10 }  { s0_full_n fifo_status 0 1 }  { s0_write fifo_port_we 1 1 } } }
	w_in { ap_fifo {  { w_in_dout fifo_data_in 0 129 }  { w_in_num_data_valid fifo_status_num_data_valid 0 10 }  { w_in_fifo_cap fifo_update 0 10 }  { w_in_empty_n fifo_status 0 1 }  { w_in_read fifo_port_we 1 1 } } }
}
set moduleName Loop_VITIS_LOOP_95_1_proc10
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {Loop_VITIS_LOOP_95_1_proc10}
set C_modelType { void 0 }
set C_modelArgList {
	{ s0 int 129 regular {fifo 1 volatile }  }
	{ w_in int 129 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s0", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} , 
 	{ "Name" : "w_in", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ w_in_dout sc_in sc_lv 129 signal 1 } 
	{ w_in_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ w_in_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ w_in_empty_n sc_in sc_logic 1 signal 1 } 
	{ w_in_read sc_out sc_logic 1 signal 1 } 
	{ s0_din sc_out sc_lv 129 signal 0 } 
	{ s0_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ s0_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ s0_full_n sc_in sc_logic 1 signal 0 } 
	{ s0_write sc_out sc_logic 1 signal 0 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "w_in_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_in", "role": "dout" }} , 
 	{ "name": "w_in_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "num_data_valid" }} , 
 	{ "name": "w_in_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "fifo_cap" }} , 
 	{ "name": "w_in_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "empty_n" }} , 
 	{ "name": "w_in_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "read" }} , 
 	{ "name": "s0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s0", "role": "din" }} , 
 	{ "name": "s0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s0", "role": "num_data_valid" }} , 
 	{ "name": "s0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s0", "role": "fifo_cap" }} , 
 	{ "name": "s0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s0", "role": "full_n" }} , 
 	{ "name": "s0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s0", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "262", "EstimateLatencyMax" : "262",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT30", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_COS_LUT25_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_SIN_LUT30_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U16", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U17", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U18", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U19", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U20", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U21", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U22", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U23", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U24", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U25", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U26", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U27", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U28", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U29", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U30", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U31", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_95_1_proc10 {
		s0 {Type O LastRead -1 FirstWrite 5}
		w_in {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT25 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT30 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "262", "Max" : "262"}
	, {"Name" : "Interval", "Min" : "262", "Max" : "262"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s0 { ap_fifo {  { s0_din fifo_data_in 1 129 }  { s0_num_data_valid fifo_status_num_data_valid 0 10 }  { s0_fifo_cap fifo_update 0 10 }  { s0_full_n fifo_status 0 1 }  { s0_write fifo_port_we 1 1 } } }
	w_in { ap_fifo {  { w_in_dout fifo_data_in 0 129 }  { w_in_num_data_valid fifo_status_num_data_valid 0 10 }  { w_in_fifo_cap fifo_update 0 10 }  { w_in_empty_n fifo_status 0 1 }  { w_in_read fifo_port_we 1 1 } } }
}
set moduleName Loop_VITIS_LOOP_95_1_proc10
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {Loop_VITIS_LOOP_95_1_proc10}
set C_modelType { void 0 }
set C_modelArgList {
	{ s0 int 129 regular {fifo 1 volatile }  }
	{ w_in int 129 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s0", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} , 
 	{ "Name" : "w_in", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ w_in_dout sc_in sc_lv 129 signal 1 } 
	{ w_in_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ w_in_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ w_in_empty_n sc_in sc_logic 1 signal 1 } 
	{ w_in_read sc_out sc_logic 1 signal 1 } 
	{ s0_din sc_out sc_lv 129 signal 0 } 
	{ s0_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ s0_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ s0_full_n sc_in sc_logic 1 signal 0 } 
	{ s0_write sc_out sc_logic 1 signal 0 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "w_in_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_in", "role": "dout" }} , 
 	{ "name": "w_in_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "num_data_valid" }} , 
 	{ "name": "w_in_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "fifo_cap" }} , 
 	{ "name": "w_in_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "empty_n" }} , 
 	{ "name": "w_in_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "read" }} , 
 	{ "name": "s0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s0", "role": "din" }} , 
 	{ "name": "s0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s0", "role": "num_data_valid" }} , 
 	{ "name": "s0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s0", "role": "fifo_cap" }} , 
 	{ "name": "s0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s0", "role": "full_n" }} , 
 	{ "name": "s0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s0", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "262", "EstimateLatencyMax" : "262",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT30", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_COS_LUT25_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_SIN_LUT30_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U16", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U17", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U18", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U19", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U20", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U21", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U22", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_31_1_1_U23", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U24", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U25", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U26", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U27", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U28", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U29", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U30", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_mulsub_16s_16s_31s_31_4_1_U31", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_95_1_proc10 {
		s0 {Type O LastRead -1 FirstWrite 5}
		w_in {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT25 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT30 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "262", "Max" : "262"}
	, {"Name" : "Interval", "Min" : "262", "Max" : "262"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s0 { ap_fifo {  { s0_din fifo_data_in 1 129 }  { s0_num_data_valid fifo_status_num_data_valid 0 10 }  { s0_fifo_cap fifo_update 0 10 }  { s0_full_n fifo_status 0 1 }  { s0_write fifo_port_we 1 1 } } }
	w_in { ap_fifo {  { w_in_dout fifo_data_in 0 129 }  { w_in_num_data_valid fifo_status_num_data_valid 0 10 }  { w_in_fifo_cap fifo_update 0 10 }  { w_in_empty_n fifo_status 0 1 }  { w_in_read fifo_port_we 1 1 } } }
}
