set moduleName fft_serial_Pipeline_load_loop
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
set C_modelName {fft_serial_Pipeline_load_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ im_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ im int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ sext_ln196 int 63 regular  }
	{ sext_ln196_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sext_ln196", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln196_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ im_1_address0 sc_out sc_lv 9 signal 1 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_1_we0 sc_out sc_logic 1 signal 1 } 
	{ im_1_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address0 sc_out sc_lv 9 signal 2 } 
	{ im_ce0 sc_out sc_logic 1 signal 2 } 
	{ im_we0 sc_out sc_logic 1 signal 2 } 
	{ im_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address0 sc_out sc_lv 9 signal 3 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_1_we0 sc_out sc_logic 1 signal 3 } 
	{ re_1_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address0 sc_out sc_lv 9 signal 4 } 
	{ re_ce0 sc_out sc_logic 1 signal 4 } 
	{ re_we0 sc_out sc_logic 1 signal 4 } 
	{ re_d0 sc_out sc_lv 17 signal 4 } 
	{ sext_ln196 sc_in sc_lv 63 signal 5 } 
	{ sext_ln196_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_IN_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_IN_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_IN_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_IN_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_IN_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_IN_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_IN_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_IN_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_IN_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_IN_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_IN_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_IN_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_IN_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "sext_ln196", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln196", "role": "default" }} , 
 	{ "name": "sext_ln196_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln196_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_load_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2059", "EstimateLatencyMax" : "2059",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "AXI_IN_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "AXI_IN_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln196", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln196_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "load_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln196 {Type I LastRead 0 FirstWrite -1}
		sext_ln196_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2059", "Max" : "2059"}
	, {"Name" : "Interval", "Min" : "2059", "Max" : "2059"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 32 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 16 }  { m_axi_AXI_IN_WSTRB STRB 1 2 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 32 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 16 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RFIFONUM LEN 0 10 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 } } }
	sext_ln196 { ap_none {  { sext_ln196 in_data 0 63 } } }
	sext_ln196_1 { ap_none {  { sext_ln196_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_load_loop
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
set C_modelName {fft_serial_Pipeline_load_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ im_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ im int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ sext_ln196 int 63 regular  }
	{ sext_ln196_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sext_ln196", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln196_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ im_1_address0 sc_out sc_lv 9 signal 1 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_1_we0 sc_out sc_logic 1 signal 1 } 
	{ im_1_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address0 sc_out sc_lv 9 signal 2 } 
	{ im_ce0 sc_out sc_logic 1 signal 2 } 
	{ im_we0 sc_out sc_logic 1 signal 2 } 
	{ im_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address0 sc_out sc_lv 9 signal 3 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_1_we0 sc_out sc_logic 1 signal 3 } 
	{ re_1_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address0 sc_out sc_lv 9 signal 4 } 
	{ re_ce0 sc_out sc_logic 1 signal 4 } 
	{ re_we0 sc_out sc_logic 1 signal 4 } 
	{ re_d0 sc_out sc_lv 17 signal 4 } 
	{ sext_ln196 sc_in sc_lv 63 signal 5 } 
	{ sext_ln196_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_IN_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_IN_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_IN_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_IN_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_IN_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_IN_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_IN_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_IN_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_IN_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_IN_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_IN_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_IN_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_IN_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "sext_ln196", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln196", "role": "default" }} , 
 	{ "name": "sext_ln196_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln196_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_load_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2059", "EstimateLatencyMax" : "2059",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "AXI_IN_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "AXI_IN_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln196", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln196_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "load_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln196 {Type I LastRead 0 FirstWrite -1}
		sext_ln196_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2059", "Max" : "2059"}
	, {"Name" : "Interval", "Min" : "2059", "Max" : "2059"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 32 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 16 }  { m_axi_AXI_IN_WSTRB STRB 1 2 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 32 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 16 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RFIFONUM LEN 0 10 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 } } }
	sext_ln196 { ap_none {  { sext_ln196 in_data 0 63 } } }
	sext_ln196_1 { ap_none {  { sext_ln196_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_load_loop
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
set C_modelName {fft_serial_Pipeline_load_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ im_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ im int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ sext_ln196 int 63 regular  }
	{ sext_ln196_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sext_ln196", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln196_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ im_1_address0 sc_out sc_lv 9 signal 1 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_1_we0 sc_out sc_logic 1 signal 1 } 
	{ im_1_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address0 sc_out sc_lv 9 signal 2 } 
	{ im_ce0 sc_out sc_logic 1 signal 2 } 
	{ im_we0 sc_out sc_logic 1 signal 2 } 
	{ im_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address0 sc_out sc_lv 9 signal 3 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_1_we0 sc_out sc_logic 1 signal 3 } 
	{ re_1_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address0 sc_out sc_lv 9 signal 4 } 
	{ re_ce0 sc_out sc_logic 1 signal 4 } 
	{ re_we0 sc_out sc_logic 1 signal 4 } 
	{ re_d0 sc_out sc_lv 17 signal 4 } 
	{ sext_ln196 sc_in sc_lv 63 signal 5 } 
	{ sext_ln196_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_IN_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_IN_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_IN_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_IN_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_IN_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_IN_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_IN_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_IN_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_IN_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_IN_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_IN_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_IN_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_IN_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "sext_ln196", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln196", "role": "default" }} , 
 	{ "name": "sext_ln196_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln196_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_load_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2059", "EstimateLatencyMax" : "2059",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "AXI_IN_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "AXI_IN_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln196", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln196_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "load_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln196 {Type I LastRead 0 FirstWrite -1}
		sext_ln196_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2059", "Max" : "2059"}
	, {"Name" : "Interval", "Min" : "2059", "Max" : "2059"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 32 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 16 }  { m_axi_AXI_IN_WSTRB STRB 1 2 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 32 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 16 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RFIFONUM LEN 0 10 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 } } }
	sext_ln196 { ap_none {  { sext_ln196 in_data 0 63 } } }
	sext_ln196_1 { ap_none {  { sext_ln196_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_load_loop
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
set C_modelName {fft_serial_Pipeline_load_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ im_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ im int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ sext_ln208 int 63 regular  }
	{ sext_ln208_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sext_ln208", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln208_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ im_1_address0 sc_out sc_lv 9 signal 1 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_1_we0 sc_out sc_logic 1 signal 1 } 
	{ im_1_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address0 sc_out sc_lv 9 signal 2 } 
	{ im_ce0 sc_out sc_logic 1 signal 2 } 
	{ im_we0 sc_out sc_logic 1 signal 2 } 
	{ im_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address0 sc_out sc_lv 9 signal 3 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_1_we0 sc_out sc_logic 1 signal 3 } 
	{ re_1_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address0 sc_out sc_lv 9 signal 4 } 
	{ re_ce0 sc_out sc_logic 1 signal 4 } 
	{ re_we0 sc_out sc_logic 1 signal 4 } 
	{ re_d0 sc_out sc_lv 17 signal 4 } 
	{ sext_ln208 sc_in sc_lv 63 signal 5 } 
	{ sext_ln208_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_IN_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_IN_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_IN_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_IN_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_IN_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_IN_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_IN_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_IN_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_IN_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_IN_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_IN_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_IN_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_IN_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "sext_ln208", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln208", "role": "default" }} , 
 	{ "name": "sext_ln208_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln208_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_load_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2059", "EstimateLatencyMax" : "2059",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "AXI_IN_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "AXI_IN_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln208", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln208_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "load_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln208 {Type I LastRead 0 FirstWrite -1}
		sext_ln208_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2059", "Max" : "2059"}
	, {"Name" : "Interval", "Min" : "2059", "Max" : "2059"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 32 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 16 }  { m_axi_AXI_IN_WSTRB STRB 1 2 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 32 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 16 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RFIFONUM LEN 0 10 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 } } }
	sext_ln208 { ap_none {  { sext_ln208 in_data 0 63 } } }
	sext_ln208_1 { ap_none {  { sext_ln208_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_load_loop
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
set C_modelName {fft_serial_Pipeline_load_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ im_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ im int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ sext_ln219 int 63 regular  }
	{ sext_ln219_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sext_ln219", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln219_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ im_1_address0 sc_out sc_lv 9 signal 1 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_1_we0 sc_out sc_logic 1 signal 1 } 
	{ im_1_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address0 sc_out sc_lv 9 signal 2 } 
	{ im_ce0 sc_out sc_logic 1 signal 2 } 
	{ im_we0 sc_out sc_logic 1 signal 2 } 
	{ im_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address0 sc_out sc_lv 9 signal 3 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_1_we0 sc_out sc_logic 1 signal 3 } 
	{ re_1_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address0 sc_out sc_lv 9 signal 4 } 
	{ re_ce0 sc_out sc_logic 1 signal 4 } 
	{ re_we0 sc_out sc_logic 1 signal 4 } 
	{ re_d0 sc_out sc_lv 17 signal 4 } 
	{ sext_ln219 sc_in sc_lv 63 signal 5 } 
	{ sext_ln219_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_IN_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_IN_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_IN_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_IN_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_IN_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_IN_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_IN_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_IN_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_IN_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_IN_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_IN_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_IN_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_IN_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "sext_ln219", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln219", "role": "default" }} , 
 	{ "name": "sext_ln219_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln219_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_load_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2059", "EstimateLatencyMax" : "2059",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "AXI_IN_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "AXI_IN_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln219", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln219_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "load_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln219 {Type I LastRead 0 FirstWrite -1}
		sext_ln219_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2059", "Max" : "2059"}
	, {"Name" : "Interval", "Min" : "2059", "Max" : "2059"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 32 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 16 }  { m_axi_AXI_IN_WSTRB STRB 1 2 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 32 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 16 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RFIFONUM LEN 0 10 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 } } }
	sext_ln219 { ap_none {  { sext_ln219 in_data 0 63 } } }
	sext_ln219_1 { ap_none {  { sext_ln219_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_load_loop
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
set C_modelName {fft_serial_Pipeline_load_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ im_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ im int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ sext_ln219 int 63 regular  }
	{ sext_ln219_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sext_ln219", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln219_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ im_1_address0 sc_out sc_lv 9 signal 1 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_1_we0 sc_out sc_logic 1 signal 1 } 
	{ im_1_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address0 sc_out sc_lv 9 signal 2 } 
	{ im_ce0 sc_out sc_logic 1 signal 2 } 
	{ im_we0 sc_out sc_logic 1 signal 2 } 
	{ im_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address0 sc_out sc_lv 9 signal 3 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_1_we0 sc_out sc_logic 1 signal 3 } 
	{ re_1_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address0 sc_out sc_lv 9 signal 4 } 
	{ re_ce0 sc_out sc_logic 1 signal 4 } 
	{ re_we0 sc_out sc_logic 1 signal 4 } 
	{ re_d0 sc_out sc_lv 17 signal 4 } 
	{ sext_ln219 sc_in sc_lv 63 signal 5 } 
	{ sext_ln219_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_IN_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_IN_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_IN_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_IN_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_IN_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_IN_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_IN_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_IN_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_IN_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_IN_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_IN_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_IN_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_IN_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "sext_ln219", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln219", "role": "default" }} , 
 	{ "name": "sext_ln219_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln219_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_load_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2059", "EstimateLatencyMax" : "2059",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "AXI_IN_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "AXI_IN_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln219", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln219_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "load_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln219 {Type I LastRead 0 FirstWrite -1}
		sext_ln219_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2059", "Max" : "2059"}
	, {"Name" : "Interval", "Min" : "2059", "Max" : "2059"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 32 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 16 }  { m_axi_AXI_IN_WSTRB STRB 1 2 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 32 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 16 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RFIFONUM LEN 0 10 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 } } }
	sext_ln219 { ap_none {  { sext_ln219 in_data 0 63 } } }
	sext_ln219_1 { ap_none {  { sext_ln219_1 in_data 0 63 } } }
}
set moduleName fft_serial_Pipeline_load_loop
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
set C_modelName {fft_serial_Pipeline_load_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ im_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ im int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re_1 int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ re int 17 regular {array 512 { 0 3 } 0 1 }  }
	{ sext_ln219 int 63 regular  }
	{ sext_ln219_1 int 63 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "im_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "im", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re_1", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "re", "interface" : "memory", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sext_ln219", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln219_1", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 16 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ im_1_address0 sc_out sc_lv 9 signal 1 } 
	{ im_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ im_1_we0 sc_out sc_logic 1 signal 1 } 
	{ im_1_d0 sc_out sc_lv 17 signal 1 } 
	{ im_address0 sc_out sc_lv 9 signal 2 } 
	{ im_ce0 sc_out sc_logic 1 signal 2 } 
	{ im_we0 sc_out sc_logic 1 signal 2 } 
	{ im_d0 sc_out sc_lv 17 signal 2 } 
	{ re_1_address0 sc_out sc_lv 9 signal 3 } 
	{ re_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ re_1_we0 sc_out sc_logic 1 signal 3 } 
	{ re_1_d0 sc_out sc_lv 17 signal 3 } 
	{ re_address0 sc_out sc_lv 9 signal 4 } 
	{ re_ce0 sc_out sc_logic 1 signal 4 } 
	{ re_we0 sc_out sc_logic 1 signal 4 } 
	{ re_d0 sc_out sc_lv 17 signal 4 } 
	{ sext_ln219 sc_in sc_lv 63 signal 5 } 
	{ sext_ln219_1 sc_in sc_lv 63 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_IN_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_IN_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_IN_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_IN_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_IN_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_IN_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_IN_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_IN_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_IN_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_IN_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_IN_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_IN_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_IN_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "im_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im_1", "role": "address0" }} , 
 	{ "name": "im_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "ce0" }} , 
 	{ "name": "im_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im_1", "role": "we0" }} , 
 	{ "name": "im_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im_1", "role": "d0" }} , 
 	{ "name": "im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "im", "role": "address0" }} , 
 	{ "name": "im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "ce0" }} , 
 	{ "name": "im_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "im", "role": "we0" }} , 
 	{ "name": "im_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "im", "role": "d0" }} , 
 	{ "name": "re_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re_1", "role": "address0" }} , 
 	{ "name": "re_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "ce0" }} , 
 	{ "name": "re_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re_1", "role": "we0" }} , 
 	{ "name": "re_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re_1", "role": "d0" }} , 
 	{ "name": "re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "re", "role": "address0" }} , 
 	{ "name": "re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "ce0" }} , 
 	{ "name": "re_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "re", "role": "we0" }} , 
 	{ "name": "re_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "re", "role": "d0" }} , 
 	{ "name": "sext_ln219", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln219", "role": "default" }} , 
 	{ "name": "sext_ln219_1", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "sext_ln219_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_serial_Pipeline_load_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2059", "EstimateLatencyMax" : "2059",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "AXI_IN_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "AXI_IN_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln219", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln219_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "load_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln219 {Type I LastRead 0 FirstWrite -1}
		sext_ln219_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2059", "Max" : "2059"}
	, {"Name" : "Interval", "Min" : "2059", "Max" : "2059"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 32 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 16 }  { m_axi_AXI_IN_WSTRB STRB 1 2 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 32 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 16 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RFIFONUM LEN 0 10 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	im_1 { ap_memory {  { im_1_address0 mem_address 1 9 }  { im_1_ce0 mem_ce 1 1 }  { im_1_we0 mem_we 1 1 }  { im_1_d0 mem_din 1 17 } } }
	im { ap_memory {  { im_address0 mem_address 1 9 }  { im_ce0 mem_ce 1 1 }  { im_we0 mem_we 1 1 }  { im_d0 mem_din 1 17 } } }
	re_1 { ap_memory {  { re_1_address0 mem_address 1 9 }  { re_1_ce0 mem_ce 1 1 }  { re_1_we0 mem_we 1 1 }  { re_1_d0 mem_din 1 17 } } }
	re { ap_memory {  { re_address0 mem_address 1 9 }  { re_ce0 mem_ce 1 1 }  { re_we0 mem_we 1 1 }  { re_d0 mem_din 1 17 } } }
	sext_ln219 { ap_none {  { sext_ln219 in_data 0 63 } } }
	sext_ln219_1 { ap_none {  { sext_ln219_1 in_data 0 63 } } }
}
