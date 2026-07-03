set moduleName fft_serial_Pipeline_bfly_loop
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
set C_modelName {fft_serial_Pipeline_bfly_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ im_1 int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ im int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ re int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ or_mask_out int 8 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "or_mask_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ im_1_address0 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 0 } 
	{ im_1_we0 sc_out sc_logic 1 signal 0 } 
	{ im_1_d0 sc_out sc_lv 17 signal 0 } 
	{ im_1_q0 sc_in sc_lv 17 signal 0 } 
	{ im_address0 sc_out sc_lv 9 signal 1 } 
	{ im_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_we0 sc_out sc_logic 1 signal 1 } 
	{ im_d0 sc_out sc_lv 17 signal 1 } 
	{ im_q0 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_we0 sc_out sc_logic 1 signal 2 } 
	{ re_1_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_q0 sc_in sc_lv 17 signal 2 } 
	{ re_address0 sc_out sc_lv 9 signal 3 } 
	{ re_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_we0 sc_out sc_logic 1 signal 3 } 
	{ re_d0 sc_out sc_lv 17 signal 3 } 
	{ re_q0 sc_in sc_lv 17 signal 3 } 
	{ or_mask_out sc_out sc_lv 8 signal 4 } 
	{ or_mask_out_ap_vld sc_out sc_logic 1 outvld 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q0" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q0" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q0" }} , 
 	{ "name": "or_mask_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "or_mask_out", "role": "default" }} , 
 	{ "name": "or_mask_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "or_mask_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 3}
		im {Type IO LastRead 0 FirstWrite 3}
		re_1 {Type IO LastRead 0 FirstWrite 3}
		re {Type IO LastRead 0 FirstWrite 3}
		or_mask_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1027", "Max" : "1027"}
	, {"Name" : "Interval", "Min" : "1027", "Max" : "1027"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 }  { im_1_q0 in_data 0 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 }  { im_q0 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 }  { re_1_q0 in_data 0 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 }  { re_q0 in_data 0 17 } } }
	or_mask_out { ap_vld {  { or_mask_out out_data 1 8 }  { or_mask_out_ap_vld out_vld 1 1 } } }
}
set moduleName fft_serial_Pipeline_bfly_loop
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
set C_modelName {fft_serial_Pipeline_bfly_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ im_1 int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ im int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ re int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ or_mask_out int 8 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "or_mask_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ im_1_address0 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 0 } 
	{ im_1_we0 sc_out sc_logic 1 signal 0 } 
	{ im_1_d0 sc_out sc_lv 17 signal 0 } 
	{ im_1_q0 sc_in sc_lv 17 signal 0 } 
	{ im_address0 sc_out sc_lv 9 signal 1 } 
	{ im_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_we0 sc_out sc_logic 1 signal 1 } 
	{ im_d0 sc_out sc_lv 17 signal 1 } 
	{ im_q0 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_we0 sc_out sc_logic 1 signal 2 } 
	{ re_1_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_q0 sc_in sc_lv 17 signal 2 } 
	{ re_address0 sc_out sc_lv 9 signal 3 } 
	{ re_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_we0 sc_out sc_logic 1 signal 3 } 
	{ re_d0 sc_out sc_lv 17 signal 3 } 
	{ re_q0 sc_in sc_lv 17 signal 3 } 
	{ or_mask_out sc_out sc_lv 8 signal 4 } 
	{ or_mask_out_ap_vld sc_out sc_logic 1 outvld 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q0" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q0" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q0" }} , 
 	{ "name": "or_mask_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "or_mask_out", "role": "default" }} , 
 	{ "name": "or_mask_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "or_mask_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 3}
		im {Type IO LastRead 0 FirstWrite 3}
		re_1 {Type IO LastRead 0 FirstWrite 3}
		re {Type IO LastRead 0 FirstWrite 3}
		or_mask_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1027", "Max" : "1027"}
	, {"Name" : "Interval", "Min" : "1027", "Max" : "1027"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 }  { im_1_q0 in_data 0 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 }  { im_q0 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 }  { re_1_q0 in_data 0 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 }  { re_q0 in_data 0 17 } } }
	or_mask_out { ap_vld {  { or_mask_out out_data 1 8 }  { or_mask_out_ap_vld out_vld 1 1 } } }
}
set moduleName fft_serial_Pipeline_bfly_loop
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
set C_modelName {fft_serial_Pipeline_bfly_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ im_1 int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ im int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ re int 17 regular {array 512 { 2 3 } 1 1 }  }
	{ or_mask_out int 8 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "or_mask_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ im_1_address0 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 0 } 
	{ im_1_we0 sc_out sc_logic 1 signal 0 } 
	{ im_1_d0 sc_out sc_lv 17 signal 0 } 
	{ im_1_q0 sc_in sc_lv 17 signal 0 } 
	{ im_address0 sc_out sc_lv 9 signal 1 } 
	{ im_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_we0 sc_out sc_logic 1 signal 1 } 
	{ im_d0 sc_out sc_lv 17 signal 1 } 
	{ im_q0 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_we0 sc_out sc_logic 1 signal 2 } 
	{ re_1_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_q0 sc_in sc_lv 17 signal 2 } 
	{ re_address0 sc_out sc_lv 9 signal 3 } 
	{ re_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_we0 sc_out sc_logic 1 signal 3 } 
	{ re_d0 sc_out sc_lv 17 signal 3 } 
	{ re_q0 sc_in sc_lv 17 signal 3 } 
	{ or_mask_out sc_out sc_lv 8 signal 4 } 
	{ or_mask_out_ap_vld sc_out sc_logic 1 outvld 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q0" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q0" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q0" }} , 
 	{ "name": "or_mask_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "or_mask_out", "role": "default" }} , 
 	{ "name": "or_mask_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "or_mask_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 3}
		im {Type IO LastRead 0 FirstWrite 3}
		re_1 {Type IO LastRead 0 FirstWrite 3}
		re {Type IO LastRead 0 FirstWrite 3}
		or_mask_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1027", "Max" : "1027"}
	, {"Name" : "Interval", "Min" : "1027", "Max" : "1027"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 }  { im_1_q0 in_data 0 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 }  { im_q0 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 }  { re_1_q0 in_data 0 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 }  { re_q0 in_data 0 17 } } }
	or_mask_out { ap_vld {  { or_mask_out out_data 1 8 }  { or_mask_out_ap_vld out_vld 1 1 } } }
}
set moduleName fft_serial_Pipeline_bfly_loop
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
set C_modelName {fft_serial_Pipeline_bfly_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ im_1 int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ im int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ re int 17 regular {array 512 { 0 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ im_1_address0 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 0 } 
	{ im_1_we0 sc_out sc_logic 1 signal 0 } 
	{ im_1_d0 sc_out sc_lv 17 signal 0 } 
	{ im_1_address1 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce1 sc_out sc_logic 1 signal 0 } 
	{ im_1_q1 sc_in sc_lv 17 signal 0 } 
	{ im_address0 sc_out sc_lv 9 signal 1 } 
	{ im_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_we0 sc_out sc_logic 1 signal 1 } 
	{ im_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address1 sc_out sc_lv 9 signal 1 } 
	{ im_ce1 sc_out sc_logic 1 signal 1 } 
	{ im_q1 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_we0 sc_out sc_logic 1 signal 2 } 
	{ re_1_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address1 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce1 sc_out sc_logic 1 signal 2 } 
	{ re_1_q1 sc_in sc_lv 17 signal 2 } 
	{ re_address0 sc_out sc_lv 9 signal 3 } 
	{ re_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_we0 sc_out sc_logic 1 signal 3 } 
	{ re_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address1 sc_out sc_lv 9 signal 3 } 
	{ re_ce1 sc_out sc_logic 1 signal 3 } 
	{ re_q1 sc_in sc_lv 17 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address1" }} , 
 	{ "name": "im_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce1" }} , 
 	{ "name": "im_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q1" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "im_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address1" }} , 
 	{ "name": "im_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce1" }} , 
 	{ "name": "im_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q1" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address1" }} , 
 	{ "name": "re_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce1" }} , 
 	{ "name": "re_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q1" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "re_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address1" }} , 
 	{ "name": "re_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce1" }} , 
 	{ "name": "re_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "516", "EstimateLatencyMax" : "516",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 3}
		im {Type IO LastRead 1 FirstWrite 3}
		re_1 {Type IO LastRead 0 FirstWrite 3}
		re {Type IO LastRead 1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "516", "Max" : "516"}
	, {"Name" : "Interval", "Min" : "516", "Max" : "516"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 }  { im_1_address1 MemPortADDR2 1 9 }  { im_1_ce1 MemPortCE2 1 1 }  { im_1_q1 in_data 0 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 }  { im_address1 MemPortADDR2 1 9 }  { im_ce1 MemPortCE2 1 1 }  { im_q1 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 }  { re_1_address1 MemPortADDR2 1 9 }  { re_1_ce1 MemPortCE2 1 1 }  { re_1_q1 in_data 0 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 }  { re_address1 MemPortADDR2 1 9 }  { re_ce1 MemPortCE2 1 1 }  { re_q1 in_data 0 17 } } }
}
set moduleName fft_serial_Pipeline_bfly_loop
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
set C_modelName {fft_serial_Pipeline_bfly_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ im_1 int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ im int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ re int 17 regular {array 512 { 0 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ im_1_address0 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 0 } 
	{ im_1_we0 sc_out sc_logic 1 signal 0 } 
	{ im_1_d0 sc_out sc_lv 17 signal 0 } 
	{ im_1_address1 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce1 sc_out sc_logic 1 signal 0 } 
	{ im_1_q1 sc_in sc_lv 17 signal 0 } 
	{ im_address0 sc_out sc_lv 9 signal 1 } 
	{ im_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_we0 sc_out sc_logic 1 signal 1 } 
	{ im_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address1 sc_out sc_lv 9 signal 1 } 
	{ im_ce1 sc_out sc_logic 1 signal 1 } 
	{ im_q1 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_we0 sc_out sc_logic 1 signal 2 } 
	{ re_1_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address1 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce1 sc_out sc_logic 1 signal 2 } 
	{ re_1_q1 sc_in sc_lv 17 signal 2 } 
	{ re_address0 sc_out sc_lv 9 signal 3 } 
	{ re_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_we0 sc_out sc_logic 1 signal 3 } 
	{ re_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address1 sc_out sc_lv 9 signal 3 } 
	{ re_ce1 sc_out sc_logic 1 signal 3 } 
	{ re_q1 sc_in sc_lv 17 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address1" }} , 
 	{ "name": "im_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce1" }} , 
 	{ "name": "im_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q1" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "im_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address1" }} , 
 	{ "name": "im_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce1" }} , 
 	{ "name": "im_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q1" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address1" }} , 
 	{ "name": "re_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce1" }} , 
 	{ "name": "re_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q1" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "re_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address1" }} , 
 	{ "name": "re_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce1" }} , 
 	{ "name": "re_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "518", "EstimateLatencyMax" : "518",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_32_4_1_U8", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_32_4_1_U9", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 5}
		im {Type IO LastRead 3 FirstWrite 5}
		re_1 {Type IO LastRead 0 FirstWrite 5}
		re {Type IO LastRead 3 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "518", "Max" : "518"}
	, {"Name" : "Interval", "Min" : "518", "Max" : "518"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 }  { im_1_address1 MemPortADDR2 1 9 }  { im_1_ce1 MemPortCE2 1 1 }  { im_1_q1 in_data 0 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 }  { im_address1 MemPortADDR2 1 9 }  { im_ce1 MemPortCE2 1 1 }  { im_q1 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 }  { re_1_address1 MemPortADDR2 1 9 }  { re_1_ce1 MemPortCE2 1 1 }  { re_1_q1 in_data 0 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 }  { re_address1 MemPortADDR2 1 9 }  { re_ce1 MemPortCE2 1 1 }  { re_q1 in_data 0 17 } } }
}
set moduleName fft_serial_Pipeline_bfly_loop
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
set C_modelName {fft_serial_Pipeline_bfly_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ im_1 int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ im int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ re int 17 regular {array 512 { 0 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ im_1_address0 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 0 } 
	{ im_1_we0 sc_out sc_logic 1 signal 0 } 
	{ im_1_d0 sc_out sc_lv 17 signal 0 } 
	{ im_1_address1 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce1 sc_out sc_logic 1 signal 0 } 
	{ im_1_q1 sc_in sc_lv 17 signal 0 } 
	{ im_address0 sc_out sc_lv 9 signal 1 } 
	{ im_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_we0 sc_out sc_logic 1 signal 1 } 
	{ im_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address1 sc_out sc_lv 9 signal 1 } 
	{ im_ce1 sc_out sc_logic 1 signal 1 } 
	{ im_q1 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_we0 sc_out sc_logic 1 signal 2 } 
	{ re_1_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address1 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce1 sc_out sc_logic 1 signal 2 } 
	{ re_1_q1 sc_in sc_lv 17 signal 2 } 
	{ re_address0 sc_out sc_lv 9 signal 3 } 
	{ re_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_we0 sc_out sc_logic 1 signal 3 } 
	{ re_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address1 sc_out sc_lv 9 signal 3 } 
	{ re_ce1 sc_out sc_logic 1 signal 3 } 
	{ re_q1 sc_in sc_lv 17 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address1" }} , 
 	{ "name": "im_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce1" }} , 
 	{ "name": "im_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q1" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "im_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address1" }} , 
 	{ "name": "im_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce1" }} , 
 	{ "name": "im_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q1" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address1" }} , 
 	{ "name": "re_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce1" }} , 
 	{ "name": "re_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q1" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "re_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address1" }} , 
 	{ "name": "re_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce1" }} , 
 	{ "name": "re_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "518", "EstimateLatencyMax" : "518",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_32_4_1_U8", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_32_4_1_U9", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 5}
		im {Type IO LastRead 3 FirstWrite 5}
		re_1 {Type IO LastRead 0 FirstWrite 5}
		re {Type IO LastRead 3 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "518", "Max" : "518"}
	, {"Name" : "Interval", "Min" : "518", "Max" : "518"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 }  { im_1_address1 MemPortADDR2 1 9 }  { im_1_ce1 MemPortCE2 1 1 }  { im_1_q1 in_data 0 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 }  { im_address1 MemPortADDR2 1 9 }  { im_ce1 MemPortCE2 1 1 }  { im_q1 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 }  { re_1_address1 MemPortADDR2 1 9 }  { re_1_ce1 MemPortCE2 1 1 }  { re_1_q1 in_data 0 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 }  { re_address1 MemPortADDR2 1 9 }  { re_ce1 MemPortCE2 1 1 }  { re_q1 in_data 0 17 } } }
}
set moduleName fft_serial_Pipeline_bfly_loop
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
set C_modelName {fft_serial_Pipeline_bfly_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ im_1 int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ im int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 0 1 } 1 1 }  }
	{ re int 17 regular {array 512 { 0 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ im_1_address0 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 0 } 
	{ im_1_we0 sc_out sc_logic 1 signal 0 } 
	{ im_1_d0 sc_out sc_lv 17 signal 0 } 
	{ im_1_address1 sc_out sc_lv 9 signal 0 } 
	{ im_1_ce1 sc_out sc_logic 1 signal 0 } 
	{ im_1_q1 sc_in sc_lv 17 signal 0 } 
	{ im_address0 sc_out sc_lv 9 signal 1 } 
	{ im_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_we0 sc_out sc_logic 1 signal 1 } 
	{ im_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address1 sc_out sc_lv 9 signal 1 } 
	{ im_ce1 sc_out sc_logic 1 signal 1 } 
	{ im_q1 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_we0 sc_out sc_logic 1 signal 2 } 
	{ re_1_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address1 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce1 sc_out sc_logic 1 signal 2 } 
	{ re_1_q1 sc_in sc_lv 17 signal 2 } 
	{ re_address0 sc_out sc_lv 9 signal 3 } 
	{ re_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_we0 sc_out sc_logic 1 signal 3 } 
	{ re_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address1 sc_out sc_lv 9 signal 3 } 
	{ re_ce1 sc_out sc_logic 1 signal 3 } 
	{ re_q1 sc_in sc_lv 17 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address1" }} , 
 	{ "name": "im_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce1" }} , 
 	{ "name": "im_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q1" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "im_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address1" }} , 
 	{ "name": "im_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce1" }} , 
 	{ "name": "im_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q1" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address1" }} , 
 	{ "name": "re_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce1" }} , 
 	{ "name": "re_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q1" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "re_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address1" }} , 
 	{ "name": "re_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce1" }} , 
 	{ "name": "re_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "518", "EstimateLatencyMax" : "518",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_32_4_1_U8", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16ns_32_4_1_U9", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 5}
		im {Type IO LastRead 3 FirstWrite 5}
		re_1 {Type IO LastRead 0 FirstWrite 5}
		re {Type IO LastRead 3 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "518", "Max" : "518"}
	, {"Name" : "Interval", "Min" : "518", "Max" : "518"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 }  { im_1_address1 MemPortADDR2 1 9 }  { im_1_ce1 MemPortCE2 1 1 }  { im_1_q1 in_data 0 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 }  { im_address1 MemPortADDR2 1 9 }  { im_ce1 MemPortCE2 1 1 }  { im_q1 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 }  { re_1_address1 MemPortADDR2 1 9 }  { re_1_ce1 MemPortCE2 1 1 }  { re_1_q1 in_data 0 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 }  { re_address1 MemPortADDR2 1 9 }  { re_ce1 MemPortCE2 1 1 }  { re_q1 in_data 0 17 } } }
}
