set moduleName axis_to_word
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
set C_modelName {axis_to_word}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_in_V_data_V int 128 regular {axi_s 0 volatile  { s_in Data } }  }
	{ s_in_V_keep_V int 16 regular {axi_s 0 volatile  { s_in Keep } }  }
	{ s_in_V_strb_V int 16 regular {axi_s 0 volatile  { s_in Strb } }  }
	{ s_in_V_user_V int 1 regular {axi_s 0 volatile  { s_in User } }  }
	{ s_in_V_last_V int 1 regular {axi_s 0 volatile  { s_in Last } }  }
	{ s_in_V_id_V int 1 regular {axi_s 0 volatile  { s_in ID } }  }
	{ s_in_V_dest_V int 1 regular {axi_s 0 volatile  { s_in Dest } }  }
	{ w_in int 129 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s_in_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "w_in", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_in_TVALID sc_in sc_logic 1 invld 6 } 
	{ w_in_din sc_out sc_lv 129 signal 7 } 
	{ w_in_num_data_valid sc_in sc_lv 10 signal 7 } 
	{ w_in_fifo_cap sc_in sc_lv 10 signal 7 } 
	{ w_in_full_n sc_in sc_logic 1 signal 7 } 
	{ w_in_write sc_out sc_logic 1 signal 7 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ s_in_TDATA sc_in sc_lv 128 signal 0 } 
	{ s_in_TREADY sc_out sc_logic 1 inacc 6 } 
	{ s_in_TKEEP sc_in sc_lv 16 signal 1 } 
	{ s_in_TSTRB sc_in sc_lv 16 signal 2 } 
	{ s_in_TUSER sc_in sc_lv 1 signal 3 } 
	{ s_in_TLAST sc_in sc_lv 1 signal 4 } 
	{ s_in_TID sc_in sc_lv 1 signal 5 } 
	{ s_in_TDEST sc_in sc_lv 1 signal 6 } 
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
 	{ "name": "s_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "w_in_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_in", "role": "din" }} , 
 	{ "name": "w_in_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "num_data_valid" }} , 
 	{ "name": "w_in_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "fifo_cap" }} , 
 	{ "name": "w_in_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "full_n" }} , 
 	{ "name": "w_in_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "s_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_in_V_data_V", "role": "default" }} , 
 	{ "name": "s_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_keep_V", "role": "default" }} , 
 	{ "name": "s_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_strb_V", "role": "default" }} , 
 	{ "name": "s_in_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_user_V", "role": "default" }} , 
 	{ "name": "s_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_last_V", "role": "default" }} , 
 	{ "name": "s_in_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_id_V", "role": "default" }} , 
 	{ "name": "s_in_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "axis_to_word",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s_in_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"BlockSignal" : [
					{"Name" : "s_in_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_in_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_in_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_301_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_user_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_last_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_id_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	axis_to_word {
		s_in_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_dest_V {Type I LastRead 0 FirstWrite -1}
		w_in {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "258", "Max" : "258"}
	, {"Name" : "Interval", "Min" : "258", "Max" : "258"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_in_V_data_V { axis {  { s_in_TDATA in_data 0 128 } } }
	s_in_V_keep_V { axis {  { s_in_TKEEP in_data 0 16 } } }
	s_in_V_strb_V { axis {  { s_in_TSTRB in_data 0 16 } } }
	s_in_V_user_V { axis {  { s_in_TUSER in_data 0 1 } } }
	s_in_V_last_V { axis {  { s_in_TLAST in_data 0 1 } } }
	s_in_V_id_V { axis {  { s_in_TID in_data 0 1 } } }
	s_in_V_dest_V { axis {  { s_in_TVALID in_vld 0 1 }  { s_in_TREADY in_acc 1 1 }  { s_in_TDEST in_data 0 1 } } }
	w_in { ap_fifo {  { w_in_din fifo_data_in 1 129 }  { w_in_num_data_valid fifo_status_num_data_valid 0 10 }  { w_in_fifo_cap fifo_update 0 10 }  { w_in_full_n fifo_status 0 1 }  { w_in_write fifo_port_we 1 1 } } }
}
set moduleName axis_to_word
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
set C_modelName {axis_to_word}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_in_V_data_V int 128 regular {axi_s 0 volatile  { s_in Data } }  }
	{ s_in_V_keep_V int 16 regular {axi_s 0 volatile  { s_in Keep } }  }
	{ s_in_V_strb_V int 16 regular {axi_s 0 volatile  { s_in Strb } }  }
	{ s_in_V_user_V int 1 regular {axi_s 0 volatile  { s_in User } }  }
	{ s_in_V_last_V int 1 regular {axi_s 0 volatile  { s_in Last } }  }
	{ s_in_V_id_V int 1 regular {axi_s 0 volatile  { s_in ID } }  }
	{ s_in_V_dest_V int 1 regular {axi_s 0 volatile  { s_in Dest } }  }
	{ w_in int 129 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s_in_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "w_in", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_in_TVALID sc_in sc_logic 1 invld 6 } 
	{ w_in_din sc_out sc_lv 129 signal 7 } 
	{ w_in_num_data_valid sc_in sc_lv 10 signal 7 } 
	{ w_in_fifo_cap sc_in sc_lv 10 signal 7 } 
	{ w_in_full_n sc_in sc_logic 1 signal 7 } 
	{ w_in_write sc_out sc_logic 1 signal 7 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ s_in_TDATA sc_in sc_lv 128 signal 0 } 
	{ s_in_TREADY sc_out sc_logic 1 inacc 6 } 
	{ s_in_TKEEP sc_in sc_lv 16 signal 1 } 
	{ s_in_TSTRB sc_in sc_lv 16 signal 2 } 
	{ s_in_TUSER sc_in sc_lv 1 signal 3 } 
	{ s_in_TLAST sc_in sc_lv 1 signal 4 } 
	{ s_in_TID sc_in sc_lv 1 signal 5 } 
	{ s_in_TDEST sc_in sc_lv 1 signal 6 } 
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
 	{ "name": "s_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "w_in_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_in", "role": "din" }} , 
 	{ "name": "w_in_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "num_data_valid" }} , 
 	{ "name": "w_in_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "fifo_cap" }} , 
 	{ "name": "w_in_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "full_n" }} , 
 	{ "name": "w_in_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "s_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_in_V_data_V", "role": "default" }} , 
 	{ "name": "s_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_keep_V", "role": "default" }} , 
 	{ "name": "s_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_strb_V", "role": "default" }} , 
 	{ "name": "s_in_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_user_V", "role": "default" }} , 
 	{ "name": "s_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_last_V", "role": "default" }} , 
 	{ "name": "s_in_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_id_V", "role": "default" }} , 
 	{ "name": "s_in_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "axis_to_word",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s_in_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"BlockSignal" : [
					{"Name" : "s_in_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_in_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_in_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_301_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_user_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_last_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_id_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	axis_to_word {
		s_in_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_dest_V {Type I LastRead 0 FirstWrite -1}
		w_in {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "258", "Max" : "258"}
	, {"Name" : "Interval", "Min" : "258", "Max" : "258"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_in_V_data_V { axis {  { s_in_TDATA in_data 0 128 } } }
	s_in_V_keep_V { axis {  { s_in_TKEEP in_data 0 16 } } }
	s_in_V_strb_V { axis {  { s_in_TSTRB in_data 0 16 } } }
	s_in_V_user_V { axis {  { s_in_TUSER in_data 0 1 } } }
	s_in_V_last_V { axis {  { s_in_TLAST in_data 0 1 } } }
	s_in_V_id_V { axis {  { s_in_TID in_data 0 1 } } }
	s_in_V_dest_V { axis {  { s_in_TVALID in_vld 0 1 }  { s_in_TREADY in_acc 1 1 }  { s_in_TDEST in_data 0 1 } } }
	w_in { ap_fifo {  { w_in_din fifo_data_in 1 129 }  { w_in_num_data_valid fifo_status_num_data_valid 0 10 }  { w_in_fifo_cap fifo_update 0 10 }  { w_in_full_n fifo_status 0 1 }  { w_in_write fifo_port_we 1 1 } } }
}
set moduleName axis_to_word
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
set C_modelName {axis_to_word}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_in_V_data_V int 128 regular {axi_s 0 volatile  { s_in Data } }  }
	{ s_in_V_keep_V int 16 regular {axi_s 0 volatile  { s_in Keep } }  }
	{ s_in_V_strb_V int 16 regular {axi_s 0 volatile  { s_in Strb } }  }
	{ s_in_V_user_V int 1 regular {axi_s 0 volatile  { s_in User } }  }
	{ s_in_V_last_V int 1 regular {axi_s 0 volatile  { s_in Last } }  }
	{ s_in_V_id_V int 1 regular {axi_s 0 volatile  { s_in ID } }  }
	{ s_in_V_dest_V int 1 regular {axi_s 0 volatile  { s_in Dest } }  }
	{ w_in int 129 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "s_in_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "w_in", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_in_TVALID sc_in sc_logic 1 invld 6 } 
	{ w_in_din sc_out sc_lv 129 signal 7 } 
	{ w_in_num_data_valid sc_in sc_lv 10 signal 7 } 
	{ w_in_fifo_cap sc_in sc_lv 10 signal 7 } 
	{ w_in_full_n sc_in sc_logic 1 signal 7 } 
	{ w_in_write sc_out sc_logic 1 signal 7 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ s_in_TDATA sc_in sc_lv 128 signal 0 } 
	{ s_in_TREADY sc_out sc_logic 1 inacc 6 } 
	{ s_in_TKEEP sc_in sc_lv 16 signal 1 } 
	{ s_in_TSTRB sc_in sc_lv 16 signal 2 } 
	{ s_in_TUSER sc_in sc_lv 1 signal 3 } 
	{ s_in_TLAST sc_in sc_lv 1 signal 4 } 
	{ s_in_TID sc_in sc_lv 1 signal 5 } 
	{ s_in_TDEST sc_in sc_lv 1 signal 6 } 
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
 	{ "name": "s_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "w_in_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_in", "role": "din" }} , 
 	{ "name": "w_in_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "num_data_valid" }} , 
 	{ "name": "w_in_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_in", "role": "fifo_cap" }} , 
 	{ "name": "w_in_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "full_n" }} , 
 	{ "name": "w_in_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_in", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "s_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_in_V_data_V", "role": "default" }} , 
 	{ "name": "s_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_keep_V", "role": "default" }} , 
 	{ "name": "s_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_strb_V", "role": "default" }} , 
 	{ "name": "s_in_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_user_V", "role": "default" }} , 
 	{ "name": "s_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_last_V", "role": "default" }} , 
 	{ "name": "s_in_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_id_V", "role": "default" }} , 
 	{ "name": "s_in_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "axis_to_word",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s_in_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"BlockSignal" : [
					{"Name" : "s_in_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_in_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "s_in_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in"},
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_in_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_301_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_user_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_last_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_id_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_s_in_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	axis_to_word {
		s_in_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_dest_V {Type I LastRead 0 FirstWrite -1}
		w_in {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "258", "Max" : "258"}
	, {"Name" : "Interval", "Min" : "258", "Max" : "258"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_in_V_data_V { axis {  { s_in_TDATA in_data 0 128 } } }
	s_in_V_keep_V { axis {  { s_in_TKEEP in_data 0 16 } } }
	s_in_V_strb_V { axis {  { s_in_TSTRB in_data 0 16 } } }
	s_in_V_user_V { axis {  { s_in_TUSER in_data 0 1 } } }
	s_in_V_last_V { axis {  { s_in_TLAST in_data 0 1 } } }
	s_in_V_id_V { axis {  { s_in_TID in_data 0 1 } } }
	s_in_V_dest_V { axis {  { s_in_TVALID in_vld 0 1 }  { s_in_TREADY in_acc 1 1 }  { s_in_TDEST in_data 0 1 } } }
	w_in { ap_fifo {  { w_in_din fifo_data_in 1 129 }  { w_in_num_data_valid fifo_status_num_data_valid 0 10 }  { w_in_fifo_cap fifo_update 0 10 }  { w_in_full_n fifo_status 0 1 }  { w_in_write fifo_port_we 1 1 } } }
}
