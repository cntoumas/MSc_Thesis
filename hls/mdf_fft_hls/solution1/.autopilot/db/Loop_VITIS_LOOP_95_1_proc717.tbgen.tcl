set moduleName Loop_VITIS_LOOP_95_1_proc717
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
set C_modelName {Loop_VITIS_LOOP_95_1_proc717}
set C_modelType { void 0 }
set C_modelArgList {
	{ s7 int 129 regular {fifo 1 volatile }  }
	{ s6 int 129 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s7", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s6", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} ]}
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
	{ s6_dout sc_in sc_lv 129 signal 1 } 
	{ s6_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ s6_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ s6_empty_n sc_in sc_logic 1 signal 1 } 
	{ s6_read sc_out sc_logic 1 signal 1 } 
	{ s7_din sc_out sc_lv 129 signal 0 } 
	{ s7_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ s7_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ s7_full_n sc_in sc_logic 1 signal 0 } 
	{ s7_write sc_out sc_logic 1 signal 0 } 
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
 	{ "name": "s6_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s6", "role": "dout" }} , 
 	{ "name": "s6_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s6", "role": "num_data_valid" }} , 
 	{ "name": "s6_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s6", "role": "fifo_cap" }} , 
 	{ "name": "s6_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s6", "role": "empty_n" }} , 
 	{ "name": "s6_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s6", "role": "read" }} , 
 	{ "name": "s7_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s7", "role": "din" }} , 
 	{ "name": "s7_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s7", "role": "num_data_valid" }} , 
 	{ "name": "s7_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s7", "role": "fifo_cap" }} , 
 	{ "name": "s7_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s7", "role": "full_n" }} , 
 	{ "name": "s7_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s7", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc717",
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
			{"Name" : "s7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_31_1_1_U157", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_31_1_1_U158", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_15ns_31s_31_4_1_U159", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U160", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.am_addmul_16s_16s_16s_31_4_1_U161", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.am_submul_16s_16s_16s_31_4_1_U162", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_95_1_proc717 {
		s7 {Type O LastRead -1 FirstWrite 5}
		s6 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0 {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "262", "Max" : "262"}
	, {"Name" : "Interval", "Min" : "262", "Max" : "262"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s7 { ap_fifo {  { s7_din fifo_data_in 1 129 }  { s7_num_data_valid fifo_status_num_data_valid 0 10 }  { s7_fifo_cap fifo_update 0 10 }  { s7_full_n fifo_status 0 1 }  { s7_write fifo_port_we 1 1 } } }
	s6 { ap_fifo {  { s6_dout fifo_data_in 0 129 }  { s6_num_data_valid fifo_status_num_data_valid 0 10 }  { s6_fifo_cap fifo_update 0 10 }  { s6_empty_n fifo_status 0 1 }  { s6_read fifo_port_we 1 1 } } }
}
set moduleName Loop_VITIS_LOOP_95_1_proc717
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
set C_modelName {Loop_VITIS_LOOP_95_1_proc717}
set C_modelType { void 0 }
set C_modelArgList {
	{ s7 int 129 regular {fifo 1 volatile }  }
	{ s6 int 129 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s7", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s6", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} ]}
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
	{ s6_dout sc_in sc_lv 129 signal 1 } 
	{ s6_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ s6_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ s6_empty_n sc_in sc_logic 1 signal 1 } 
	{ s6_read sc_out sc_logic 1 signal 1 } 
	{ s7_din sc_out sc_lv 129 signal 0 } 
	{ s7_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ s7_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ s7_full_n sc_in sc_logic 1 signal 0 } 
	{ s7_write sc_out sc_logic 1 signal 0 } 
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
 	{ "name": "s6_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s6", "role": "dout" }} , 
 	{ "name": "s6_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s6", "role": "num_data_valid" }} , 
 	{ "name": "s6_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s6", "role": "fifo_cap" }} , 
 	{ "name": "s6_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s6", "role": "empty_n" }} , 
 	{ "name": "s6_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s6", "role": "read" }} , 
 	{ "name": "s7_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s7", "role": "din" }} , 
 	{ "name": "s7_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s7", "role": "num_data_valid" }} , 
 	{ "name": "s7_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s7", "role": "fifo_cap" }} , 
 	{ "name": "s7_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s7", "role": "full_n" }} , 
 	{ "name": "s7_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s7", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc717",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "261", "EstimateLatencyMax" : "261",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_31_1_1_U157", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_31_1_1_U158", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_15ns_31s_31_4_1_U159", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U160", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.am_addmul_16s_16s_16s_31_4_1_U161", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.am_submul_16s_16s_16s_31_4_1_U162", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_95_1_proc717 {
		s7 {Type O LastRead -1 FirstWrite 4}
		s6 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0 {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "261", "Max" : "261"}
	, {"Name" : "Interval", "Min" : "261", "Max" : "261"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s7 { ap_fifo {  { s7_din fifo_data_in 1 129 }  { s7_num_data_valid fifo_status_num_data_valid 0 10 }  { s7_fifo_cap fifo_update 0 10 }  { s7_full_n fifo_status 0 1 }  { s7_write fifo_port_we 1 1 } } }
	s6 { ap_fifo {  { s6_dout fifo_data_in 0 129 }  { s6_num_data_valid fifo_status_num_data_valid 0 10 }  { s6_fifo_cap fifo_update 0 10 }  { s6_empty_n fifo_status 0 1 }  { s6_read fifo_port_we 1 1 } } }
}
set moduleName Loop_VITIS_LOOP_95_1_proc717
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
set C_modelName {Loop_VITIS_LOOP_95_1_proc717}
set C_modelType { void 0 }
set C_modelArgList {
	{ s7 int 129 regular {fifo 1 volatile }  }
	{ s6 int 129 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s7", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s6", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} ]}
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
	{ s6_dout sc_in sc_lv 129 signal 1 } 
	{ s6_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ s6_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ s6_empty_n sc_in sc_logic 1 signal 1 } 
	{ s6_read sc_out sc_logic 1 signal 1 } 
	{ s7_din sc_out sc_lv 129 signal 0 } 
	{ s7_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ s7_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ s7_full_n sc_in sc_logic 1 signal 0 } 
	{ s7_write sc_out sc_logic 1 signal 0 } 
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
 	{ "name": "s6_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s6", "role": "dout" }} , 
 	{ "name": "s6_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s6", "role": "num_data_valid" }} , 
 	{ "name": "s6_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s6", "role": "fifo_cap" }} , 
 	{ "name": "s6_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s6", "role": "empty_n" }} , 
 	{ "name": "s6_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s6", "role": "read" }} , 
 	{ "name": "s7_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "s7", "role": "din" }} , 
 	{ "name": "s7_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s7", "role": "num_data_valid" }} , 
 	{ "name": "s7_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s7", "role": "fifo_cap" }} , 
 	{ "name": "s7_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s7", "role": "full_n" }} , 
 	{ "name": "s7_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s7", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc717",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "261", "EstimateLatencyMax" : "261",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_31_1_1_U157", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_31_1_1_U158", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_15ns_31s_31_4_1_U159", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_31s_31_4_1_U160", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.am_addmul_16s_16s_16s_31_4_1_U161", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.am_submul_16s_16s_16s_31_4_1_U162", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_95_1_proc717 {
		s7 {Type O LastRead -1 FirstWrite 4}
		s6 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0 {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "261", "Max" : "261"}
	, {"Name" : "Interval", "Min" : "261", "Max" : "261"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s7 { ap_fifo {  { s7_din fifo_data_in 1 129 }  { s7_num_data_valid fifo_status_num_data_valid 0 10 }  { s7_fifo_cap fifo_update 0 10 }  { s7_full_n fifo_status 0 1 }  { s7_write fifo_port_we 1 1 } } }
	s6 { ap_fifo {  { s6_dout fifo_data_in 0 129 }  { s6_num_data_valid fifo_status_num_data_valid 0 10 }  { s6_fifo_cap fifo_update 0 10 }  { s6_empty_n fifo_status 0 1 }  { s6_read fifo_port_we 1 1 } } }
}
