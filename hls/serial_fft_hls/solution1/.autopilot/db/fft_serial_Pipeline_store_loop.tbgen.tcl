set moduleName fft_serial_Pipeline_store_loop
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
set C_modelName {fft_serial_Pipeline_store_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ re int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln250 int 63 regular  }
	{ im int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ im_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln250_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln250", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln250_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 66
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 0 } 
	{ re_address0 sc_out sc_lv 9 signal 1 } 
	{ re_ce0 sc_out sc_logic 1 signal 1 } 
	{ re_q0 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_q0 sc_in sc_lv 17 signal 2 } 
	{ sext_ln250 sc_in sc_lv 63 signal 3 } 
	{ im_address0 sc_out sc_lv 9 signal 4 } 
	{ im_ce0 sc_out sc_logic 1 signal 4 } 
	{ im_q0 sc_in sc_lv 17 signal 4 } 
	{ im_1_address0 sc_out sc_lv 9 signal 5 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ im_1_q0 sc_in sc_lv 17 signal 5 } 
	{ sext_ln250_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q0" }} , 
 	{ "name": "sext_ln250", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln250", "role": "default" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q0" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q0" }} , 
 	{ "name": "sext_ln250_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln250_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_store_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2056", "EstimateLatencyMax" : "2056",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "AXI_OUT_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln250", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln250_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "store_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_store_loop {
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln250 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln250_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2056", "Max" : "2056"}
	, {"Name" : "Interval", "Min" : "2056", "Max" : "2056"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 32 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 16 }  { m_axi_AXI_OUT_WSTRB STRB 1 2 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 32 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 16 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RFIFONUM LEN 0 10 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_q0 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_q0 in_data 0 17 } } }
	sext_ln250 { ap_none {  { sext_ln250 in_data 0 63 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_q0 in_data 0 17 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_q0 in_data 0 17 } } }
	sext_ln250_1 { ap_none {  { sext_ln250_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_store_loop
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
set C_modelName {fft_serial_Pipeline_store_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ re int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln250 int 63 regular  }
	{ im int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ im_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln250_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln250", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln250_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 66
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 0 } 
	{ re_address0 sc_out sc_lv 9 signal 1 } 
	{ re_ce0 sc_out sc_logic 1 signal 1 } 
	{ re_q0 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_q0 sc_in sc_lv 17 signal 2 } 
	{ sext_ln250 sc_in sc_lv 63 signal 3 } 
	{ im_address0 sc_out sc_lv 9 signal 4 } 
	{ im_ce0 sc_out sc_logic 1 signal 4 } 
	{ im_q0 sc_in sc_lv 17 signal 4 } 
	{ im_1_address0 sc_out sc_lv 9 signal 5 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ im_1_q0 sc_in sc_lv 17 signal 5 } 
	{ sext_ln250_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q0" }} , 
 	{ "name": "sext_ln250", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln250", "role": "default" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q0" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q0" }} , 
 	{ "name": "sext_ln250_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln250_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_store_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2056", "EstimateLatencyMax" : "2056",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "AXI_OUT_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln250", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln250_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "store_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_store_loop {
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln250 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln250_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2056", "Max" : "2056"}
	, {"Name" : "Interval", "Min" : "2056", "Max" : "2056"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 32 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 16 }  { m_axi_AXI_OUT_WSTRB STRB 1 2 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 32 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 16 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RFIFONUM LEN 0 10 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_q0 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_q0 in_data 0 17 } } }
	sext_ln250 { ap_none {  { sext_ln250 in_data 0 63 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_q0 in_data 0 17 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_q0 in_data 0 17 } } }
	sext_ln250_1 { ap_none {  { sext_ln250_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_store_loop
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
set C_modelName {fft_serial_Pipeline_store_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ re int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln250 int 63 regular  }
	{ im int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ im_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln250_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln250", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln250_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 66
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 0 } 
	{ re_address0 sc_out sc_lv 9 signal 1 } 
	{ re_ce0 sc_out sc_logic 1 signal 1 } 
	{ re_q0 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_q0 sc_in sc_lv 17 signal 2 } 
	{ sext_ln250 sc_in sc_lv 63 signal 3 } 
	{ im_address0 sc_out sc_lv 9 signal 4 } 
	{ im_ce0 sc_out sc_logic 1 signal 4 } 
	{ im_q0 sc_in sc_lv 17 signal 4 } 
	{ im_1_address0 sc_out sc_lv 9 signal 5 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ im_1_q0 sc_in sc_lv 17 signal 5 } 
	{ sext_ln250_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q0" }} , 
 	{ "name": "sext_ln250", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln250", "role": "default" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q0" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q0" }} , 
 	{ "name": "sext_ln250_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln250_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_store_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2056", "EstimateLatencyMax" : "2056",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "AXI_OUT_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln250", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln250_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "store_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_store_loop {
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln250 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln250_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2056", "Max" : "2056"}
	, {"Name" : "Interval", "Min" : "2056", "Max" : "2056"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 32 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 16 }  { m_axi_AXI_OUT_WSTRB STRB 1 2 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 32 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 16 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RFIFONUM LEN 0 10 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_q0 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_q0 in_data 0 17 } } }
	sext_ln250 { ap_none {  { sext_ln250 in_data 0 63 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_q0 in_data 0 17 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_q0 in_data 0 17 } } }
	sext_ln250_1 { ap_none {  { sext_ln250_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_store_loop
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
set C_modelName {fft_serial_Pipeline_store_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ re int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln262 int 63 regular  }
	{ im int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ im_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln262_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln262", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln262_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 66
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 0 } 
	{ re_address0 sc_out sc_lv 9 signal 1 } 
	{ re_ce0 sc_out sc_logic 1 signal 1 } 
	{ re_q0 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_q0 sc_in sc_lv 17 signal 2 } 
	{ sext_ln262 sc_in sc_lv 63 signal 3 } 
	{ im_address0 sc_out sc_lv 9 signal 4 } 
	{ im_ce0 sc_out sc_logic 1 signal 4 } 
	{ im_q0 sc_in sc_lv 17 signal 4 } 
	{ im_1_address0 sc_out sc_lv 9 signal 5 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ im_1_q0 sc_in sc_lv 17 signal 5 } 
	{ sext_ln262_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q0" }} , 
 	{ "name": "sext_ln262", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln262", "role": "default" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q0" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q0" }} , 
 	{ "name": "sext_ln262_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln262_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_store_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2056", "EstimateLatencyMax" : "2056",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "AXI_OUT_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln262", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln262_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "store_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_store_loop {
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln262 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln262_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2056", "Max" : "2056"}
	, {"Name" : "Interval", "Min" : "2056", "Max" : "2056"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 32 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 16 }  { m_axi_AXI_OUT_WSTRB STRB 1 2 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 32 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 16 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RFIFONUM LEN 0 10 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_q0 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_q0 in_data 0 17 } } }
	sext_ln262 { ap_none {  { sext_ln262 in_data 0 63 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_q0 in_data 0 17 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_q0 in_data 0 17 } } }
	sext_ln262_1 { ap_none {  { sext_ln262_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_store_loop
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
set C_modelName {fft_serial_Pipeline_store_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ re int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln273 int 63 regular  }
	{ im int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ im_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln273_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln273", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln273_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 66
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 0 } 
	{ re_address0 sc_out sc_lv 9 signal 1 } 
	{ re_ce0 sc_out sc_logic 1 signal 1 } 
	{ re_q0 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_q0 sc_in sc_lv 17 signal 2 } 
	{ sext_ln273 sc_in sc_lv 63 signal 3 } 
	{ im_address0 sc_out sc_lv 9 signal 4 } 
	{ im_ce0 sc_out sc_logic 1 signal 4 } 
	{ im_q0 sc_in sc_lv 17 signal 4 } 
	{ im_1_address0 sc_out sc_lv 9 signal 5 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ im_1_q0 sc_in sc_lv 17 signal 5 } 
	{ sext_ln273_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q0" }} , 
 	{ "name": "sext_ln273", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln273", "role": "default" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q0" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q0" }} , 
 	{ "name": "sext_ln273_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln273_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_store_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2056", "EstimateLatencyMax" : "2056",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "AXI_OUT_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln273", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln273_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "store_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_store_loop {
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln273 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln273_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2056", "Max" : "2056"}
	, {"Name" : "Interval", "Min" : "2056", "Max" : "2056"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 32 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 16 }  { m_axi_AXI_OUT_WSTRB STRB 1 2 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 32 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 16 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RFIFONUM LEN 0 10 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_q0 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_q0 in_data 0 17 } } }
	sext_ln273 { ap_none {  { sext_ln273 in_data 0 63 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_q0 in_data 0 17 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_q0 in_data 0 17 } } }
	sext_ln273_1 { ap_none {  { sext_ln273_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_store_loop
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
set C_modelName {fft_serial_Pipeline_store_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ re int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln273 int 63 regular  }
	{ im int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ im_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln273_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln273", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln273_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 66
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 0 } 
	{ re_address0 sc_out sc_lv 9 signal 1 } 
	{ re_ce0 sc_out sc_logic 1 signal 1 } 
	{ re_q0 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_q0 sc_in sc_lv 17 signal 2 } 
	{ sext_ln273 sc_in sc_lv 63 signal 3 } 
	{ im_address0 sc_out sc_lv 9 signal 4 } 
	{ im_ce0 sc_out sc_logic 1 signal 4 } 
	{ im_q0 sc_in sc_lv 17 signal 4 } 
	{ im_1_address0 sc_out sc_lv 9 signal 5 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ im_1_q0 sc_in sc_lv 17 signal 5 } 
	{ sext_ln273_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q0" }} , 
 	{ "name": "sext_ln273", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln273", "role": "default" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q0" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q0" }} , 
 	{ "name": "sext_ln273_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln273_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_store_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2056", "EstimateLatencyMax" : "2056",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "AXI_OUT_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln273", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln273_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "store_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_store_loop {
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln273 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln273_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2056", "Max" : "2056"}
	, {"Name" : "Interval", "Min" : "2056", "Max" : "2056"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 32 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 16 }  { m_axi_AXI_OUT_WSTRB STRB 1 2 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 32 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 16 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RFIFONUM LEN 0 10 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_q0 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_q0 in_data 0 17 } } }
	sext_ln273 { ap_none {  { sext_ln273 in_data 0 63 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_q0 in_data 0 17 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_q0 in_data 0 17 } } }
	sext_ln273_1 { ap_none {  { sext_ln273_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_store_loop
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
set C_modelName {fft_serial_Pipeline_store_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ re int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ re_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln273 int 63 regular  }
	{ im int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ im_1 int 17 regular {array 512 { 1 3 } 1 1 }  }
	{ sext_ln273_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln273", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln273_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 66
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 0 } 
	{ re_address0 sc_out sc_lv 9 signal 1 } 
	{ re_ce0 sc_out sc_logic 1 signal 1 } 
	{ re_q0 sc_in sc_lv 17 signal 1 } 
	{ re_1_address0 sc_out sc_lv 9 signal 2 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ re_1_q0 sc_in sc_lv 17 signal 2 } 
	{ sext_ln273 sc_in sc_lv 63 signal 3 } 
	{ im_address0 sc_out sc_lv 9 signal 4 } 
	{ im_ce0 sc_out sc_logic 1 signal 4 } 
	{ im_q0 sc_in sc_lv 17 signal 4 } 
	{ im_1_address0 sc_out sc_lv 9 signal 5 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ im_1_q0 sc_in sc_lv 17 signal 5 } 
	{ sext_ln273_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "q0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "q0" }} , 
 	{ "name": "sext_ln273", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln273", "role": "default" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "q0" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "q0" }} , 
 	{ "name": "sext_ln273_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln273_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_store_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2056", "EstimateLatencyMax" : "2056",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "AXI_OUT_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln273", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln273_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "store_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_store_loop {
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln273 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln273_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2056", "Max" : "2056"}
	, {"Name" : "Interval", "Min" : "2056", "Max" : "2056"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 32 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 16 }  { m_axi_AXI_OUT_WSTRB STRB 1 2 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 32 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 16 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RFIFONUM LEN 0 10 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_q0 in_data 0 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_q0 in_data 0 17 } } }
	sext_ln273 { ap_none {  { sext_ln273 in_data 0 63 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_q0 in_data 0 17 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_q0 in_data 0 17 } } }
	sext_ln273_1 { ap_none {  { sext_ln273_1 in_data 0 63 } } }
}
