set moduleName Loop_read_loop_proc
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
set C_modelName {Loop_read_loop_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ p_read int 1 regular  }
	{ w_out int 129 regular {fifo 1 volatile }  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank int 128 regular {array 256 { 1 3 } 1 1 } {global 0}  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 int 128 regular {array 256 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "w_out", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ w_out_din sc_out sc_lv 129 signal 1 } 
	{ w_out_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ w_out_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ w_out_full_n sc_in sc_logic 1 signal 1 } 
	{ w_out_write sc_out sc_logic 1 signal 1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ p_read sc_in sc_lv 1 signal 0 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 sc_out sc_lv 8 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 sc_out sc_logic 1 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_q0 sc_in sc_lv 128 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 sc_out sc_lv 8 signal 3 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_q0 sc_in sc_lv 128 signal 3 } 
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
 	{ "name": "w_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_out", "role": "din" }} , 
 	{ "name": "w_out_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "num_data_valid" }} , 
 	{ "name": "w_out_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "fifo_cap" }} , 
 	{ "name": "w_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "full_n" }} , 
 	{ "name": "w_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "q0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Loop_read_loop_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0"},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0"}],
		"Loop" : [
			{"Name" : "read_loop", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_read_loop_proc {
		p_read {Type I LastRead 0 FirstWrite -1}
		w_out {Type O LastRead -1 FirstWrite 2}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type I LastRead 0 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 1 } } }
	w_out { ap_fifo {  { w_out_din fifo_data_in 1 129 }  { w_out_num_data_valid fifo_status_num_data_valid 0 10 }  { w_out_fifo_cap fifo_update 0 10 }  { w_out_full_n fifo_status 0 1 }  { w_out_write fifo_port_we 1 1 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_q0 in_data 0 128 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_q0 in_data 0 128 } } }
}
set moduleName Loop_read_loop_proc
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
set C_modelName {Loop_read_loop_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ p_read int 1 regular  }
	{ w_out int 129 regular {fifo 1 volatile }  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank int 128 regular {array 256 { 1 3 } 1 1 } {global 0}  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 int 128 regular {array 256 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "w_out", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ w_out_din sc_out sc_lv 129 signal 1 } 
	{ w_out_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ w_out_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ w_out_full_n sc_in sc_logic 1 signal 1 } 
	{ w_out_write sc_out sc_logic 1 signal 1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ p_read sc_in sc_lv 1 signal 0 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 sc_out sc_lv 8 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 sc_out sc_logic 1 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_q0 sc_in sc_lv 128 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 sc_out sc_lv 8 signal 3 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_q0 sc_in sc_lv 128 signal 3 } 
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
 	{ "name": "w_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_out", "role": "din" }} , 
 	{ "name": "w_out_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "num_data_valid" }} , 
 	{ "name": "w_out_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "fifo_cap" }} , 
 	{ "name": "w_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "full_n" }} , 
 	{ "name": "w_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "q0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Loop_read_loop_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0"},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0"}],
		"Loop" : [
			{"Name" : "read_loop", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_read_loop_proc {
		p_read {Type I LastRead 0 FirstWrite -1}
		w_out {Type O LastRead -1 FirstWrite 2}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type I LastRead 0 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 1 } } }
	w_out { ap_fifo {  { w_out_din fifo_data_in 1 129 }  { w_out_num_data_valid fifo_status_num_data_valid 0 10 }  { w_out_fifo_cap fifo_update 0 10 }  { w_out_full_n fifo_status 0 1 }  { w_out_write fifo_port_we 1 1 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_q0 in_data 0 128 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_q0 in_data 0 128 } } }
}
set moduleName Loop_read_loop_proc
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
set C_modelName {Loop_read_loop_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ p_read int 1 regular  }
	{ w_out int 129 regular {fifo 1 volatile }  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank int 128 regular {array 256 { 1 3 } 1 1 } {global 0}  }
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 int 128 regular {array 256 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "w_out", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ w_out_din sc_out sc_lv 129 signal 1 } 
	{ w_out_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ w_out_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ w_out_full_n sc_in sc_logic 1 signal 1 } 
	{ w_out_write sc_out sc_logic 1 signal 1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ p_read sc_in sc_lv 1 signal 0 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 sc_out sc_lv 8 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 sc_out sc_logic 1 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_q0 sc_in sc_lv 128 signal 2 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 sc_out sc_lv 8 signal 3 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_q0 sc_in sc_lv 128 signal 3 } 
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
 	{ "name": "w_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "w_out", "role": "din" }} , 
 	{ "name": "w_out_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "num_data_valid" }} , 
 	{ "name": "w_out_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "w_out", "role": "fifo_cap" }} , 
 	{ "name": "w_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "full_n" }} , 
 	{ "name": "w_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_out", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "role": "q0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "address0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "ce0" }} , 
 	{ "name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Loop_read_loop_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0"},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0"}],
		"Loop" : [
			{"Name" : "read_loop", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_read_loop_proc {
		p_read {Type I LastRead 0 FirstWrite -1}
		w_out {Type O LastRead -1 FirstWrite 2}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type I LastRead 0 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 1 } } }
	w_out { ap_fifo {  { w_out_din fifo_data_in 1 129 }  { w_out_num_data_valid fifo_status_num_data_valid 0 10 }  { w_out_fifo_cap fifo_update 0 10 }  { w_out_full_n fifo_status 0 1 }  { w_out_write fifo_port_we 1 1 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_q0 in_data 0 128 } } }
	bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 { ap_memory {  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_address0 mem_address 1 8 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_ce0 mem_ce 1 1 }  { bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_q0 in_data 0 128 } } }
}
