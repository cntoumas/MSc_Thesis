set moduleName word_to_axis
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
set C_modelName {word_to_axis}
set C_modelType { void 0 }
set C_modelArgList {
	{ w_out int 129 regular {fifo 0 volatile }  }
	{ s_out_V_data_V int 128 regular {axi_s 1 volatile  { s_out Data } }  }
	{ s_out_V_keep_V int 16 regular {axi_s 1 volatile  { s_out Keep } }  }
	{ s_out_V_strb_V int 16 regular {axi_s 1 volatile  { s_out Strb } }  }
	{ s_out_V_user_V int 1 regular {axi_s 1 volatile  { s_out User } }  }
	{ s_out_V_last_V int 1 regular {axi_s 1 volatile  { s_out Last } }  }
	{ s_out_V_id_V int 1 regular {axi_s 1 volatile  { s_out ID } }  }
	{ s_out_V_dest_V int 1 regular {axi_s 1 volatile  { s_out Dest } }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "w_out", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} , 
 	{ "Name" : "s_out_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
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
	{ w_out_dout sc_in sc_lv 129 signal 0 } 
	{ w_out_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ w_out_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ w_out_empty_n sc_in sc_logic 1 signal 0 } 
	{ w_out_read sc_out sc_logic 1 signal 0 } 
	{ s_out_TREADY sc_in sc_logic 1 outacc 7 } 
	{ s_out_TDATA sc_out sc_lv 128 signal 1 } 
	{ s_out_TVALID sc_out sc_logic 1 outvld 7 } 
	{ s_out_TKEEP sc_out sc_lv 16 signal 2 } 
	{ s_out_TSTRB sc_out sc_lv 16 signal 3 } 
	{ s_out_TUSER sc_out sc_lv 1 signal 4 } 
	{ s_out_TLAST sc_out sc_lv 1 signal 5 } 
	{ s_out_TID sc_out sc_lv 1 signal 6 } 
	{ s_out_TDEST sc_out sc_lv 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "w_out_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_out", "role": "dout" }} , 
 	{ "name": "w_out_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "num_data_valid" }} , 
 	{ "name": "w_out_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "fifo_cap" }} , 
 	{ "name": "w_out_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "empty_n" }} , 
 	{ "name": "w_out_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "read" }} , 
 	{ "name": "s_out_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_out_V_data_V", "role": "default" }} , 
 	{ "name": "s_out_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_keep_V", "role": "default" }} , 
 	{ "name": "s_out_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_strb_V", "role": "default" }} , 
 	{ "name": "s_out_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_user_V", "role": "default" }} , 
 	{ "name": "s_out_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_last_V", "role": "default" }} , 
 	{ "name": "s_out_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_id_V", "role": "default" }} , 
 	{ "name": "s_out_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "word_to_axis",
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
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_out_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"BlockSignal" : [
					{"Name" : "s_out_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_out_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_313_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_user_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_last_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_id_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	word_to_axis {
		w_out {Type I LastRead 1 FirstWrite -1}
		s_out_V_data_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_keep_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_strb_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_user_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_last_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_id_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_dest_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	w_out { ap_fifo {  { w_out_dout fifo_data_in 0 129 }  { w_out_num_data_valid fifo_status_num_data_valid 0 10 }  { w_out_fifo_cap fifo_update 0 10 }  { w_out_empty_n fifo_status 0 1 }  { w_out_read fifo_port_we 1 1 } } }
	s_out_V_data_V { axis {  { s_out_TDATA out_data 1 128 } } }
	s_out_V_keep_V { axis {  { s_out_TKEEP out_data 1 16 } } }
	s_out_V_strb_V { axis {  { s_out_TSTRB out_data 1 16 } } }
	s_out_V_user_V { axis {  { s_out_TUSER out_data 1 1 } } }
	s_out_V_last_V { axis {  { s_out_TLAST out_data 1 1 } } }
	s_out_V_id_V { axis {  { s_out_TID out_data 1 1 } } }
	s_out_V_dest_V { axis {  { s_out_TREADY out_acc 0 1 }  { s_out_TVALID out_vld 1 1 }  { s_out_TDEST out_data 1 1 } } }
}
set moduleName word_to_axis
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
set C_modelName {word_to_axis}
set C_modelType { void 0 }
set C_modelArgList {
	{ w_out int 129 regular {fifo 0 volatile }  }
	{ s_out_V_data_V int 128 regular {axi_s 1 volatile  { s_out Data } }  }
	{ s_out_V_keep_V int 16 regular {axi_s 1 volatile  { s_out Keep } }  }
	{ s_out_V_strb_V int 16 regular {axi_s 1 volatile  { s_out Strb } }  }
	{ s_out_V_user_V int 1 regular {axi_s 1 volatile  { s_out User } }  }
	{ s_out_V_last_V int 1 regular {axi_s 1 volatile  { s_out Last } }  }
	{ s_out_V_id_V int 1 regular {axi_s 1 volatile  { s_out ID } }  }
	{ s_out_V_dest_V int 1 regular {axi_s 1 volatile  { s_out Dest } }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "w_out", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} , 
 	{ "Name" : "s_out_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
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
	{ w_out_dout sc_in sc_lv 129 signal 0 } 
	{ w_out_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ w_out_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ w_out_empty_n sc_in sc_logic 1 signal 0 } 
	{ w_out_read sc_out sc_logic 1 signal 0 } 
	{ s_out_TREADY sc_in sc_logic 1 outacc 7 } 
	{ s_out_TDATA sc_out sc_lv 128 signal 1 } 
	{ s_out_TVALID sc_out sc_logic 1 outvld 7 } 
	{ s_out_TKEEP sc_out sc_lv 16 signal 2 } 
	{ s_out_TSTRB sc_out sc_lv 16 signal 3 } 
	{ s_out_TUSER sc_out sc_lv 1 signal 4 } 
	{ s_out_TLAST sc_out sc_lv 1 signal 5 } 
	{ s_out_TID sc_out sc_lv 1 signal 6 } 
	{ s_out_TDEST sc_out sc_lv 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "w_out_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_out", "role": "dout" }} , 
 	{ "name": "w_out_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "num_data_valid" }} , 
 	{ "name": "w_out_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "fifo_cap" }} , 
 	{ "name": "w_out_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "empty_n" }} , 
 	{ "name": "w_out_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "read" }} , 
 	{ "name": "s_out_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_out_V_data_V", "role": "default" }} , 
 	{ "name": "s_out_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_keep_V", "role": "default" }} , 
 	{ "name": "s_out_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_strb_V", "role": "default" }} , 
 	{ "name": "s_out_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_user_V", "role": "default" }} , 
 	{ "name": "s_out_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_last_V", "role": "default" }} , 
 	{ "name": "s_out_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_id_V", "role": "default" }} , 
 	{ "name": "s_out_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "word_to_axis",
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
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_out_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"BlockSignal" : [
					{"Name" : "s_out_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_out_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_313_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_user_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_last_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_id_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	word_to_axis {
		w_out {Type I LastRead 1 FirstWrite -1}
		s_out_V_data_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_keep_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_strb_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_user_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_last_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_id_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_dest_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	w_out { ap_fifo {  { w_out_dout fifo_data_in 0 129 }  { w_out_num_data_valid fifo_status_num_data_valid 0 10 }  { w_out_fifo_cap fifo_update 0 10 }  { w_out_empty_n fifo_status 0 1 }  { w_out_read fifo_port_we 1 1 } } }
	s_out_V_data_V { axis {  { s_out_TDATA out_data 1 128 } } }
	s_out_V_keep_V { axis {  { s_out_TKEEP out_data 1 16 } } }
	s_out_V_strb_V { axis {  { s_out_TSTRB out_data 1 16 } } }
	s_out_V_user_V { axis {  { s_out_TUSER out_data 1 1 } } }
	s_out_V_last_V { axis {  { s_out_TLAST out_data 1 1 } } }
	s_out_V_id_V { axis {  { s_out_TID out_data 1 1 } } }
	s_out_V_dest_V { axis {  { s_out_TREADY out_acc 0 1 }  { s_out_TVALID out_vld 1 1 }  { s_out_TDEST out_data 1 1 } } }
}
set moduleName word_to_axis
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
set C_modelName {word_to_axis}
set C_modelType { void 0 }
set C_modelArgList {
	{ w_out int 129 regular {fifo 0 volatile }  }
	{ s_out_V_data_V int 128 regular {axi_s 1 volatile  { s_out Data } }  }
	{ s_out_V_keep_V int 16 regular {axi_s 1 volatile  { s_out Keep } }  }
	{ s_out_V_strb_V int 16 regular {axi_s 1 volatile  { s_out Strb } }  }
	{ s_out_V_user_V int 1 regular {axi_s 1 volatile  { s_out User } }  }
	{ s_out_V_last_V int 1 regular {axi_s 1 volatile  { s_out Last } }  }
	{ s_out_V_id_V int 1 regular {axi_s 1 volatile  { s_out ID } }  }
	{ s_out_V_dest_V int 1 regular {axi_s 1 volatile  { s_out Dest } }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "w_out", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY"} , 
 	{ "Name" : "s_out_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
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
	{ w_out_dout sc_in sc_lv 129 signal 0 } 
	{ w_out_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ w_out_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ w_out_empty_n sc_in sc_logic 1 signal 0 } 
	{ w_out_read sc_out sc_logic 1 signal 0 } 
	{ s_out_TREADY sc_in sc_logic 1 outacc 7 } 
	{ s_out_TDATA sc_out sc_lv 128 signal 1 } 
	{ s_out_TVALID sc_out sc_logic 1 outvld 7 } 
	{ s_out_TKEEP sc_out sc_lv 16 signal 2 } 
	{ s_out_TSTRB sc_out sc_lv 16 signal 3 } 
	{ s_out_TUSER sc_out sc_lv 1 signal 4 } 
	{ s_out_TLAST sc_out sc_lv 1 signal 5 } 
	{ s_out_TID sc_out sc_lv 1 signal 6 } 
	{ s_out_TDEST sc_out sc_lv 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "w_out_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_out", "role": "dout" }} , 
 	{ "name": "w_out_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "num_data_valid" }} , 
 	{ "name": "w_out_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "fifo_cap" }} , 
 	{ "name": "w_out_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "empty_n" }} , 
 	{ "name": "w_out_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "read" }} , 
 	{ "name": "s_out_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_out_V_data_V", "role": "default" }} , 
 	{ "name": "s_out_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_keep_V", "role": "default" }} , 
 	{ "name": "s_out_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_strb_V", "role": "default" }} , 
 	{ "name": "s_out_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_user_V", "role": "default" }} , 
 	{ "name": "s_out_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_last_V", "role": "default" }} , 
 	{ "name": "s_out_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_id_V", "role": "default" }} , 
 	{ "name": "s_out_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "word_to_axis",
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
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_out_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"BlockSignal" : [
					{"Name" : "s_out_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_out_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"},
			{"Name" : "s_out_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_313_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_user_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_last_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_id_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_out_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	word_to_axis {
		w_out {Type I LastRead 1 FirstWrite -1}
		s_out_V_data_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_keep_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_strb_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_user_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_last_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_id_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_dest_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	w_out { ap_fifo {  { w_out_dout fifo_data_in 0 129 }  { w_out_num_data_valid fifo_status_num_data_valid 0 10 }  { w_out_fifo_cap fifo_update 0 10 }  { w_out_empty_n fifo_status 0 1 }  { w_out_read fifo_port_we 1 1 } } }
	s_out_V_data_V { axis {  { s_out_TDATA out_data 1 128 } } }
	s_out_V_keep_V { axis {  { s_out_TKEEP out_data 1 16 } } }
	s_out_V_strb_V { axis {  { s_out_TSTRB out_data 1 16 } } }
	s_out_V_user_V { axis {  { s_out_TUSER out_data 1 1 } } }
	s_out_V_last_V { axis {  { s_out_TLAST out_data 1 1 } } }
	s_out_V_id_V { axis {  { s_out_TID out_data 1 1 } } }
	s_out_V_dest_V { axis {  { s_out_TREADY out_acc 0 1 }  { s_out_TVALID out_vld 1 1 }  { s_out_TDEST out_data 1 1 } } }
}
