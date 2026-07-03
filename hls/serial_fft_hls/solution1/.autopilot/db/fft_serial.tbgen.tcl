set moduleName fft_serial
set isTopModule 1
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
set C_modelName {fft_serial}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ in_re int 64 regular {axi_slave 0}  }
	{ in_im int 64 regular {axi_slave 0}  }
	{ out_re int 64 regular {axi_slave 0}  }
	{ out_im int 64 regular {axi_slave 0}  }
	{ blk_exp int 8 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "in_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "in_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "out_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "out_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} , 
 	{ "Name" : "blk_exp", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 8, "direction" : "WRITEONLY", "offset" : {"out":64}, "offset_end" : {"out":71}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"continue","value":"0","valid_bit":"4"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"in_re","role":"data","value":"16"},{"name":"in_im","role":"data","value":"28"},{"name":"out_re","role":"data","value":"40"},{"name":"out_im","role":"data","value":"52"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"done","value":"0","valid_bit":"1"},{"name":"fft_serial","role":"idle","value":"0","valid_bit":"2"},{"name":"fft_serial","role":"ready","value":"0","valid_bit":"3"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"blk_exp","role":"data","value":"64"}, {"name":"blk_exp","role":"valid","value":"68","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "9", "11", "13", "19", "25", "31", "37", "43", "49", "55", "61", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75"],
		"CDFG" : "fft_serial",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19017", "EstimateLatencyMax" : "19017",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_serial_Pipeline_load_loop_fu_243", "Port" : "AXI_IN", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_fft_serial_Pipeline_store_loop_fu_390", "Port" : "AXI_OUT", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "in_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "blk_exp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop6_fu_334", "Port" : "TW_COS_LUT", "Inst_start_state" : "21", "Inst_end_state" : "22"},
					{"ID" : "43", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_348", "Port" : "TW_COS_LUT", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "25", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop4_fu_306", "Port" : "TW_COS_LUT", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "49", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop8_fu_362", "Port" : "TW_COS_LUT", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_376", "Port" : "TW_COS_LUT", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "13", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop2_fu_278", "Port" : "TW_COS_LUT", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "19", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_292", "Port" : "TW_COS_LUT", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_320", "Port" : "TW_COS_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop6_fu_334", "Port" : "TW_SIN_LUT", "Inst_start_state" : "21", "Inst_end_state" : "22"},
					{"ID" : "43", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_348", "Port" : "TW_SIN_LUT", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "25", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop4_fu_306", "Port" : "TW_SIN_LUT", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "49", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop8_fu_362", "Port" : "TW_SIN_LUT", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_376", "Port" : "TW_SIN_LUT", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "13", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop2_fu_278", "Port" : "TW_SIN_LUT", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "19", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_292", "Port" : "TW_SIN_LUT", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_320", "Port" : "TW_SIN_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_COS_LUT_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_SIN_LUT_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_1_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_243", "Parent" : "0", "Child" : ["8"],
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
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_243.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_259", "Parent" : "0", "Child" : ["10"],
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
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_259.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_268", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_268.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278", "Parent" : "0", "Child" : ["14", "15", "16", "17", "18"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mul_16s_16s_32_1_1_U19", "Parent" : "13"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mul_16s_16s_32_1_1_U20", "Parent" : "13"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mac_mulsub_16s_16s_32s_32_3_1_U21", "Parent" : "13"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mac_muladd_16s_16s_32s_32_2_1_U22", "Parent" : "13"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292", "Parent" : "0", "Child" : ["20", "21", "22", "23", "24"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mul_16s_16s_32_1_1_U34", "Parent" : "19"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mul_16s_16s_32_1_1_U35", "Parent" : "19"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mac_mulsub_16s_16s_32s_32_3_1_U36", "Parent" : "19"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mac_muladd_16s_16s_32s_32_2_1_U37", "Parent" : "19"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306", "Parent" : "0", "Child" : ["26", "27", "28", "29", "30"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mul_16s_16s_32_1_1_U46", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mul_16s_16s_32_1_1_U47", "Parent" : "25"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mac_mulsub_16s_16s_32s_32_3_1_U48", "Parent" : "25"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mac_muladd_16s_16s_32s_32_2_1_U49", "Parent" : "25"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320", "Parent" : "0", "Child" : ["32", "33", "34", "35", "36"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mul_16s_16s_32_1_1_U58", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mul_16s_16s_32_1_1_U59", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mac_mulsub_16s_16s_32s_32_3_1_U60", "Parent" : "31"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mac_muladd_16s_16s_32s_32_2_1_U61", "Parent" : "31"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334", "Parent" : "0", "Child" : ["38", "39", "40", "41", "42"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mul_16s_16s_32_1_1_U70", "Parent" : "37"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mul_16s_16s_32_1_1_U71", "Parent" : "37"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mac_mulsub_16s_16s_32s_32_3_1_U72", "Parent" : "37"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mac_muladd_16s_16s_32s_32_2_1_U73", "Parent" : "37"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348", "Parent" : "0", "Child" : ["44", "45", "46", "47", "48"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mul_16s_16s_32_1_1_U82", "Parent" : "43"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mul_16s_16s_32_1_1_U83", "Parent" : "43"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mac_mulsub_16s_16s_32s_32_3_1_U84", "Parent" : "43"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mac_muladd_16s_16s_32s_32_2_1_U85", "Parent" : "43"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.flow_control_loop_pipe_sequential_init_U", "Parent" : "43"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362", "Parent" : "0", "Child" : ["50", "51", "52", "53", "54"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mul_16s_16s_32_1_1_U94", "Parent" : "49"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mul_16s_16s_32_1_1_U95", "Parent" : "49"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mac_mulsub_16s_16s_32s_32_3_1_U96", "Parent" : "49"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mac_muladd_16s_16s_32s_32_2_1_U97", "Parent" : "49"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.flow_control_loop_pipe_sequential_init_U", "Parent" : "49"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376", "Parent" : "0", "Child" : ["56", "57", "58", "59", "60"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mul_16s_16s_32_1_1_U106", "Parent" : "55"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mul_16s_16s_32_1_1_U107", "Parent" : "55"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mac_mulsub_16s_16s_32s_32_3_1_U108", "Parent" : "55"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mac_muladd_16s_16s_32s_32_2_1_U109", "Parent" : "55"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.flow_control_loop_pipe_sequential_init_U", "Parent" : "55"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_390", "Parent" : "0", "Child" : ["62"],
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
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_390.flow_control_loop_pipe_sequential_init_U", "Parent" : "61"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_IN_m_axi_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_OUT_m_axi_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U125", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U126", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U127", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U128", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U129", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U130", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U131", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U132", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U133", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U134", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		in_re {Type I LastRead 0 FirstWrite -1}
		in_im {Type I LastRead 0 FirstWrite -1}
		out_re {Type I LastRead 0 FirstWrite -1}
		out_im {Type I LastRead 0 FirstWrite -1}
		blk_exp {Type O LastRead -1 FirstWrite 33}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}}
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln196 {Type I LastRead 0 FirstWrite -1}
		sext_ln196_1 {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 3}
		im {Type IO LastRead 0 FirstWrite 3}
		re_1 {Type IO LastRead 0 FirstWrite 3}
		re {Type IO LastRead 0 FirstWrite 3}
		or_mask_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop1 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_1 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		or_mask_2_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop2 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_2 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_3_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop3 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_3 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_5_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop4 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_4 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_7_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop5 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_5 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_9_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop6 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_6 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_11_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop7 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_7 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_13_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop8 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_8 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_15_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop9 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_9 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_17_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "19017", "Max" : "19017"}
	, {"Name" : "Interval", "Min" : "19018", "Max" : "19018"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AXI_IN { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 8 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 32 }  { m_axi_AXI_IN_WSTRB STRB 1 4 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 8 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 32 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	AXI_OUT { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 8 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 32 }  { m_axi_AXI_OUT_WSTRB STRB 1 4 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 8 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 32 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict AXI_IN {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict AXI_OUT {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName fft_serial
set isTopModule 1
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
set C_modelName {fft_serial}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ in_re int 64 regular {axi_slave 0}  }
	{ in_im int 64 regular {axi_slave 0}  }
	{ out_re int 64 regular {axi_slave 0}  }
	{ out_im int 64 regular {axi_slave 0}  }
	{ blk_exp int 8 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "in_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "in_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "out_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "out_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} , 
 	{ "Name" : "blk_exp", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 8, "direction" : "WRITEONLY", "offset" : {"out":64}, "offset_end" : {"out":71}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"continue","value":"0","valid_bit":"4"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"in_re","role":"data","value":"16"},{"name":"in_im","role":"data","value":"28"},{"name":"out_re","role":"data","value":"40"},{"name":"out_im","role":"data","value":"52"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"done","value":"0","valid_bit":"1"},{"name":"fft_serial","role":"idle","value":"0","valid_bit":"2"},{"name":"fft_serial","role":"ready","value":"0","valid_bit":"3"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"blk_exp","role":"data","value":"64"}, {"name":"blk_exp","role":"valid","value":"68","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "9", "11", "13", "19", "25", "31", "37", "43", "49", "55", "61", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75"],
		"CDFG" : "fft_serial",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19017", "EstimateLatencyMax" : "19017",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_serial_Pipeline_load_loop_fu_243", "Port" : "AXI_IN", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_fft_serial_Pipeline_store_loop_fu_390", "Port" : "AXI_OUT", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "in_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "blk_exp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop6_fu_334", "Port" : "TW_COS_LUT", "Inst_start_state" : "21", "Inst_end_state" : "22"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_320", "Port" : "TW_COS_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "43", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_348", "Port" : "TW_COS_LUT", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "13", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop2_fu_278", "Port" : "TW_COS_LUT", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_376", "Port" : "TW_COS_LUT", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "49", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop8_fu_362", "Port" : "TW_COS_LUT", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "19", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_292", "Port" : "TW_COS_LUT", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "25", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop4_fu_306", "Port" : "TW_COS_LUT", "Inst_start_state" : "15", "Inst_end_state" : "16"}]},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop6_fu_334", "Port" : "TW_SIN_LUT", "Inst_start_state" : "21", "Inst_end_state" : "22"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_320", "Port" : "TW_SIN_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "43", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_348", "Port" : "TW_SIN_LUT", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "13", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop2_fu_278", "Port" : "TW_SIN_LUT", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_376", "Port" : "TW_SIN_LUT", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "49", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop8_fu_362", "Port" : "TW_SIN_LUT", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "19", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_292", "Port" : "TW_SIN_LUT", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "25", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop4_fu_306", "Port" : "TW_SIN_LUT", "Inst_start_state" : "15", "Inst_end_state" : "16"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_COS_LUT_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_SIN_LUT_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_1_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_243", "Parent" : "0", "Child" : ["8"],
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
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_243.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_259", "Parent" : "0", "Child" : ["10"],
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
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_259.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_268", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_268.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278", "Parent" : "0", "Child" : ["14", "15", "16", "17", "18"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mul_16s_16s_32_1_1_U19", "Parent" : "13"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mul_16s_16s_32_1_1_U20", "Parent" : "13"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mac_mulsub_16s_16s_32s_32_3_1_U21", "Parent" : "13"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mac_muladd_16s_16s_32s_32_2_1_U22", "Parent" : "13"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292", "Parent" : "0", "Child" : ["20", "21", "22", "23", "24"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mul_16s_16s_32_1_1_U34", "Parent" : "19"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mul_16s_16s_32_1_1_U35", "Parent" : "19"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mac_mulsub_16s_16s_32s_32_3_1_U36", "Parent" : "19"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mac_muladd_16s_16s_32s_32_2_1_U37", "Parent" : "19"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306", "Parent" : "0", "Child" : ["26", "27", "28", "29", "30"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mul_16s_16s_32_1_1_U46", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mul_16s_16s_32_1_1_U47", "Parent" : "25"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mac_mulsub_16s_16s_32s_32_3_1_U48", "Parent" : "25"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mac_muladd_16s_16s_32s_32_2_1_U49", "Parent" : "25"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320", "Parent" : "0", "Child" : ["32", "33", "34", "35", "36"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mul_16s_16s_32_1_1_U58", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mul_16s_16s_32_1_1_U59", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mac_mulsub_16s_16s_32s_32_3_1_U60", "Parent" : "31"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mac_muladd_16s_16s_32s_32_2_1_U61", "Parent" : "31"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334", "Parent" : "0", "Child" : ["38", "39", "40", "41", "42"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mul_16s_16s_32_1_1_U70", "Parent" : "37"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mul_16s_16s_32_1_1_U71", "Parent" : "37"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mac_mulsub_16s_16s_32s_32_3_1_U72", "Parent" : "37"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mac_muladd_16s_16s_32s_32_2_1_U73", "Parent" : "37"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348", "Parent" : "0", "Child" : ["44", "45", "46", "47", "48"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mul_16s_16s_32_1_1_U82", "Parent" : "43"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mul_16s_16s_32_1_1_U83", "Parent" : "43"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mac_mulsub_16s_16s_32s_32_3_1_U84", "Parent" : "43"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mac_muladd_16s_16s_32s_32_2_1_U85", "Parent" : "43"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.flow_control_loop_pipe_sequential_init_U", "Parent" : "43"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362", "Parent" : "0", "Child" : ["50", "51", "52", "53", "54"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mul_16s_16s_32_1_1_U94", "Parent" : "49"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mul_16s_16s_32_1_1_U95", "Parent" : "49"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mac_mulsub_16s_16s_32s_32_3_1_U96", "Parent" : "49"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mac_muladd_16s_16s_32s_32_2_1_U97", "Parent" : "49"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.flow_control_loop_pipe_sequential_init_U", "Parent" : "49"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376", "Parent" : "0", "Child" : ["56", "57", "58", "59", "60"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mul_16s_16s_32_1_1_U106", "Parent" : "55"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mul_16s_16s_32_1_1_U107", "Parent" : "55"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mac_mulsub_16s_16s_32s_32_3_1_U108", "Parent" : "55"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mac_muladd_16s_16s_32s_32_2_1_U109", "Parent" : "55"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.flow_control_loop_pipe_sequential_init_U", "Parent" : "55"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_390", "Parent" : "0", "Child" : ["62"],
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
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_390.flow_control_loop_pipe_sequential_init_U", "Parent" : "61"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_IN_m_axi_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_OUT_m_axi_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U125", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U126", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U127", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U128", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U129", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U130", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U131", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U132", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U133", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U134", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		in_re {Type I LastRead 0 FirstWrite -1}
		in_im {Type I LastRead 0 FirstWrite -1}
		out_re {Type I LastRead 0 FirstWrite -1}
		out_im {Type I LastRead 0 FirstWrite -1}
		blk_exp {Type O LastRead -1 FirstWrite 33}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}}
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln196 {Type I LastRead 0 FirstWrite -1}
		sext_ln196_1 {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 3}
		im {Type IO LastRead 0 FirstWrite 3}
		re_1 {Type IO LastRead 0 FirstWrite 3}
		re {Type IO LastRead 0 FirstWrite 3}
		or_mask_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop1 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_1 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		or_mask_2_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop2 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_2 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_3_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop3 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_3 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_5_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop4 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_4 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_7_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop5 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_5 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_9_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop6 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_6 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_11_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop7 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_7 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_13_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop8 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_8 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_15_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop9 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_9 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_17_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "19017", "Max" : "19017"}
	, {"Name" : "Interval", "Min" : "19018", "Max" : "19018"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AXI_IN { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 8 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 32 }  { m_axi_AXI_IN_WSTRB STRB 1 4 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 8 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 32 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	AXI_OUT { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 8 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 32 }  { m_axi_AXI_OUT_WSTRB STRB 1 4 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 8 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 32 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict AXI_IN {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict AXI_OUT {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName fft_serial
set isTopModule 1
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
set C_modelName {fft_serial}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ in_re int 64 regular {axi_slave 0}  }
	{ in_im int 64 regular {axi_slave 0}  }
	{ out_re int 64 regular {axi_slave 0}  }
	{ out_im int 64 regular {axi_slave 0}  }
	{ blk_exp int 8 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "in_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "in_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "out_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "out_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} , 
 	{ "Name" : "blk_exp", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 8, "direction" : "WRITEONLY", "offset" : {"out":64}, "offset_end" : {"out":71}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"continue","value":"0","valid_bit":"4"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"in_re","role":"data","value":"16"},{"name":"in_im","role":"data","value":"28"},{"name":"out_re","role":"data","value":"40"},{"name":"out_im","role":"data","value":"52"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"done","value":"0","valid_bit":"1"},{"name":"fft_serial","role":"idle","value":"0","valid_bit":"2"},{"name":"fft_serial","role":"ready","value":"0","valid_bit":"3"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"blk_exp","role":"data","value":"64"}, {"name":"blk_exp","role":"valid","value":"68","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "9", "11", "13", "19", "25", "31", "37", "43", "49", "55", "61", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75"],
		"CDFG" : "fft_serial",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19017", "EstimateLatencyMax" : "19017",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_serial_Pipeline_load_loop_fu_243", "Port" : "AXI_IN", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_fft_serial_Pipeline_store_loop_fu_390", "Port" : "AXI_OUT", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "in_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "blk_exp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_292", "Port" : "TW_COS_LUT", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_320", "Port" : "TW_COS_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "13", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop2_fu_278", "Port" : "TW_COS_LUT", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "25", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop4_fu_306", "Port" : "TW_COS_LUT", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "37", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop6_fu_334", "Port" : "TW_COS_LUT", "Inst_start_state" : "21", "Inst_end_state" : "22"},
					{"ID" : "43", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_348", "Port" : "TW_COS_LUT", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "49", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop8_fu_362", "Port" : "TW_COS_LUT", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_376", "Port" : "TW_COS_LUT", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_292", "Port" : "TW_SIN_LUT", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_320", "Port" : "TW_SIN_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "13", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop2_fu_278", "Port" : "TW_SIN_LUT", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "25", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop4_fu_306", "Port" : "TW_SIN_LUT", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "37", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop6_fu_334", "Port" : "TW_SIN_LUT", "Inst_start_state" : "21", "Inst_end_state" : "22"},
					{"ID" : "43", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_348", "Port" : "TW_SIN_LUT", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "49", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop8_fu_362", "Port" : "TW_SIN_LUT", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_376", "Port" : "TW_SIN_LUT", "Inst_start_state" : "30", "Inst_end_state" : "31"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_COS_LUT_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_SIN_LUT_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_1_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_243", "Parent" : "0", "Child" : ["8"],
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
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_243.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_259", "Parent" : "0", "Child" : ["10"],
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
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_259.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_268", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_268.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278", "Parent" : "0", "Child" : ["14", "15", "16", "17", "18"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mul_16s_16s_32_1_1_U19", "Parent" : "13"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mul_16s_16s_32_1_1_U20", "Parent" : "13"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mac_mulsub_16s_16s_32s_32_3_1_U21", "Parent" : "13"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.mac_muladd_16s_16s_32s_32_2_1_U22", "Parent" : "13"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop2_fu_278.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292", "Parent" : "0", "Child" : ["20", "21", "22", "23", "24"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mul_16s_16s_32_1_1_U34", "Parent" : "19"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mul_16s_16s_32_1_1_U35", "Parent" : "19"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mac_mulsub_16s_16s_32s_32_3_1_U36", "Parent" : "19"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.mac_muladd_16s_16s_32s_32_2_1_U37", "Parent" : "19"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_292.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306", "Parent" : "0", "Child" : ["26", "27", "28", "29", "30"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mul_16s_16s_32_1_1_U46", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mul_16s_16s_32_1_1_U47", "Parent" : "25"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mac_mulsub_16s_16s_32s_32_3_1_U48", "Parent" : "25"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.mac_muladd_16s_16s_32s_32_2_1_U49", "Parent" : "25"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop4_fu_306.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320", "Parent" : "0", "Child" : ["32", "33", "34", "35", "36"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mul_16s_16s_32_1_1_U58", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mul_16s_16s_32_1_1_U59", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mac_mulsub_16s_16s_32s_32_3_1_U60", "Parent" : "31"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.mac_muladd_16s_16s_32s_32_2_1_U61", "Parent" : "31"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_320.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334", "Parent" : "0", "Child" : ["38", "39", "40", "41", "42"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mul_16s_16s_32_1_1_U70", "Parent" : "37"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mul_16s_16s_32_1_1_U71", "Parent" : "37"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mac_mulsub_16s_16s_32s_32_3_1_U72", "Parent" : "37"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.mac_muladd_16s_16s_32s_32_2_1_U73", "Parent" : "37"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop6_fu_334.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348", "Parent" : "0", "Child" : ["44", "45", "46", "47", "48"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mul_16s_16s_32_1_1_U82", "Parent" : "43"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mul_16s_16s_32_1_1_U83", "Parent" : "43"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mac_mulsub_16s_16s_32s_32_3_1_U84", "Parent" : "43"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.mac_muladd_16s_16s_32s_32_2_1_U85", "Parent" : "43"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_348.flow_control_loop_pipe_sequential_init_U", "Parent" : "43"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362", "Parent" : "0", "Child" : ["50", "51", "52", "53", "54"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mul_16s_16s_32_1_1_U94", "Parent" : "49"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mul_16s_16s_32_1_1_U95", "Parent" : "49"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mac_mulsub_16s_16s_32s_32_3_1_U96", "Parent" : "49"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.mac_muladd_16s_16s_32s_32_2_1_U97", "Parent" : "49"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop8_fu_362.flow_control_loop_pipe_sequential_init_U", "Parent" : "49"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376", "Parent" : "0", "Child" : ["56", "57", "58", "59", "60"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "or_mask_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mul_16s_16s_32_1_1_U106", "Parent" : "55"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mul_16s_16s_32_1_1_U107", "Parent" : "55"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mac_mulsub_16s_16s_32s_32_3_1_U108", "Parent" : "55"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.mac_muladd_16s_16s_32s_32_2_1_U109", "Parent" : "55"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_376.flow_control_loop_pipe_sequential_init_U", "Parent" : "55"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_390", "Parent" : "0", "Child" : ["62"],
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
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_390.flow_control_loop_pipe_sequential_init_U", "Parent" : "61"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_IN_m_axi_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_OUT_m_axi_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U125", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U126", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U127", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U128", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U129", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U130", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U131", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U132", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U133", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U134", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		in_re {Type I LastRead 0 FirstWrite -1}
		in_im {Type I LastRead 0 FirstWrite -1}
		out_re {Type I LastRead 0 FirstWrite -1}
		out_im {Type I LastRead 0 FirstWrite -1}
		blk_exp {Type O LastRead -1 FirstWrite 33}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}}
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln196 {Type I LastRead 0 FirstWrite -1}
		sext_ln196_1 {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 3}
		im {Type IO LastRead 0 FirstWrite 3}
		re_1 {Type IO LastRead 0 FirstWrite 3}
		re {Type IO LastRead 0 FirstWrite 3}
		or_mask_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop1 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_1 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		or_mask_2_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop2 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_2 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_3_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop3 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_3 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_5_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop4 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_4 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_7_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop5 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_5 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_9_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop6 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_6 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_11_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop7 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_7 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_13_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop8 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_8 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_15_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop9 {
		re {Type IO LastRead 2 FirstWrite 3}
		re_1 {Type IO LastRead 2 FirstWrite 3}
		clz_next_9 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 2}
		im_1 {Type IO LastRead 1 FirstWrite 2}
		or_mask_17_out {Type O LastRead -1 FirstWrite 0}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "19017", "Max" : "19017"}
	, {"Name" : "Interval", "Min" : "19018", "Max" : "19018"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AXI_IN { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 8 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 32 }  { m_axi_AXI_IN_WSTRB STRB 1 4 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 8 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 32 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	AXI_OUT { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 8 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 32 }  { m_axi_AXI_OUT_WSTRB STRB 1 4 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 8 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 32 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict AXI_IN {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict AXI_OUT {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName fft_serial
set isTopModule 1
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
set C_modelName {fft_serial}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ in_re int 64 regular {axi_slave 0}  }
	{ in_im int 64 regular {axi_slave 0}  }
	{ out_re int 64 regular {axi_slave 0}  }
	{ out_im int 64 regular {axi_slave 0}  }
	{ blk_exp int 8 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "in_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "in_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "out_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "out_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} , 
 	{ "Name" : "blk_exp", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 8, "direction" : "WRITEONLY", "offset" : {"out":64}, "offset_end" : {"out":71}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"continue","value":"0","valid_bit":"4"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"in_re","role":"data","value":"16"},{"name":"in_im","role":"data","value":"28"},{"name":"out_re","role":"data","value":"40"},{"name":"out_im","role":"data","value":"52"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"done","value":"0","valid_bit":"1"},{"name":"fft_serial","role":"idle","value":"0","valid_bit":"2"},{"name":"fft_serial","role":"ready","value":"0","valid_bit":"3"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"blk_exp","role":"data","value":"64"}, {"name":"blk_exp","role":"valid","value":"68","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "9", "11", "13", "15", "17", "23", "25", "31", "33", "39", "41", "47", "49", "55", "57", "63", "65", "71", "73", "79", "81", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95"],
		"CDFG" : "fft_serial",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24700", "EstimateLatencyMax" : "24700",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_serial_Pipeline_load_loop_fu_263", "Port" : "AXI_IN", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "81", "SubInstance" : "grp_fft_serial_Pipeline_store_loop_fu_490", "Port" : "AXI_OUT", "Inst_start_state" : "52", "Inst_end_state" : "53"}]},
			{"Name" : "in_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "blk_exp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Port" : "TW_COS_LUT", "Inst_start_state" : "23", "Inst_end_state" : "24"},
					{"ID" : "73", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Port" : "TW_COS_LUT", "Inst_start_state" : "48", "Inst_end_state" : "49"},
					{"ID" : "25", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Port" : "TW_COS_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "41", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Port" : "TW_COS_LUT", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "57", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Port" : "TW_COS_LUT", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "17", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Port" : "TW_COS_LUT", "Inst_start_state" : "13", "Inst_end_state" : "14"},
					{"ID" : "49", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Port" : "TW_COS_LUT", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "65", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Port" : "TW_COS_LUT", "Inst_start_state" : "43", "Inst_end_state" : "44"}]},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Port" : "TW_SIN_LUT", "Inst_start_state" : "23", "Inst_end_state" : "24"},
					{"ID" : "73", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Port" : "TW_SIN_LUT", "Inst_start_state" : "48", "Inst_end_state" : "49"},
					{"ID" : "25", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Port" : "TW_SIN_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "41", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Port" : "TW_SIN_LUT", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "57", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Port" : "TW_SIN_LUT", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "17", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Port" : "TW_SIN_LUT", "Inst_start_state" : "13", "Inst_end_state" : "14"},
					{"ID" : "49", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Port" : "TW_SIN_LUT", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "65", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Port" : "TW_SIN_LUT", "Inst_start_state" : "43", "Inst_end_state" : "44"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_COS_LUT_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_SIN_LUT_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_1_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_263", "Parent" : "0", "Child" : ["8"],
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
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_263.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279", "Parent" : "0", "Child" : ["10"],
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
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop_fu_287", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "fft_serial_Pipeline_scan_loop",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop_fu_287.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1538", "EstimateLatencyMax" : "1538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop2_fu_305", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "fft_serial_Pipeline_scan_loop2",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop2_fu_305.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Parent" : "0", "Child" : ["18", "19", "20", "21", "22"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mul_16s_16s_32_1_1_U27", "Parent" : "17"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mul_16s_16s_32_1_1_U28", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mac_mulsub_16s_16s_32s_32_1_1_U29", "Parent" : "17"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mac_muladd_16s_16s_32s_32_1_1_U30", "Parent" : "17"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop4_fu_327", "Parent" : "0", "Child" : ["24"],
		"CDFG" : "fft_serial_Pipeline_scan_loop4",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop4_fu_327.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Parent" : "0", "Child" : ["26", "27", "28", "29", "30"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mul_16s_16s_32_1_1_U46", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mul_16s_16s_32_1_1_U47", "Parent" : "25"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mac_mulsub_16s_16s_32s_32_1_1_U48", "Parent" : "25"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mac_muladd_16s_16s_32s_32_1_1_U49", "Parent" : "25"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop6_fu_349", "Parent" : "0", "Child" : ["32"],
		"CDFG" : "fft_serial_Pipeline_scan_loop6",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop6_fu_349.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Parent" : "0", "Child" : ["34", "35", "36", "37", "38"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mul_16s_16s_32_1_1_U62", "Parent" : "33"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mul_16s_16s_32_1_1_U63", "Parent" : "33"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mac_mulsub_16s_16s_32s_32_1_1_U64", "Parent" : "33"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mac_muladd_16s_16s_32s_32_1_1_U65", "Parent" : "33"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop8_fu_371", "Parent" : "0", "Child" : ["40"],
		"CDFG" : "fft_serial_Pipeline_scan_loop8",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_8_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop8_fu_371.flow_control_loop_pipe_sequential_init_U", "Parent" : "39"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Parent" : "0", "Child" : ["42", "43", "44", "45", "46"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mul_16s_16s_32_1_1_U78", "Parent" : "41"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mul_16s_16s_32_1_1_U79", "Parent" : "41"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mac_mulsub_16s_16s_32s_32_1_1_U80", "Parent" : "41"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mac_muladd_16s_16s_32s_32_1_1_U81", "Parent" : "41"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.flow_control_loop_pipe_sequential_init_U", "Parent" : "41"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop10_fu_393", "Parent" : "0", "Child" : ["48"],
		"CDFG" : "fft_serial_Pipeline_scan_loop10",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_10_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop10_fu_393.flow_control_loop_pipe_sequential_init_U", "Parent" : "47"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Parent" : "0", "Child" : ["50", "51", "52", "53", "54"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mul_16s_16s_32_1_1_U94", "Parent" : "49"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mul_16s_16s_32_1_1_U95", "Parent" : "49"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mac_mulsub_16s_16s_32s_32_1_1_U96", "Parent" : "49"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mac_muladd_16s_16s_32s_32_1_1_U97", "Parent" : "49"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.flow_control_loop_pipe_sequential_init_U", "Parent" : "49"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop12_fu_415", "Parent" : "0", "Child" : ["56"],
		"CDFG" : "fft_serial_Pipeline_scan_loop12",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop12_fu_415.flow_control_loop_pipe_sequential_init_U", "Parent" : "55"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Parent" : "0", "Child" : ["58", "59", "60", "61", "62"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mul_16s_16s_32_1_1_U110", "Parent" : "57"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mul_16s_16s_32_1_1_U111", "Parent" : "57"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mac_mulsub_16s_16s_32s_32_1_1_U112", "Parent" : "57"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mac_muladd_16s_16s_32s_32_1_1_U113", "Parent" : "57"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.flow_control_loop_pipe_sequential_init_U", "Parent" : "57"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop14_fu_437", "Parent" : "0", "Child" : ["64"],
		"CDFG" : "fft_serial_Pipeline_scan_loop14",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_14_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop14_fu_437.flow_control_loop_pipe_sequential_init_U", "Parent" : "63"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Parent" : "0", "Child" : ["66", "67", "68", "69", "70"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop15",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mul_16s_16s_32_1_1_U126", "Parent" : "65"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mul_16s_16s_32_1_1_U127", "Parent" : "65"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mac_mulsub_16s_16s_32s_32_1_1_U128", "Parent" : "65"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mac_muladd_16s_16s_32s_32_1_1_U129", "Parent" : "65"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.flow_control_loop_pipe_sequential_init_U", "Parent" : "65"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop16_fu_459", "Parent" : "0", "Child" : ["72"],
		"CDFG" : "fft_serial_Pipeline_scan_loop16",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_16_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop16_fu_459.flow_control_loop_pipe_sequential_init_U", "Parent" : "71"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Parent" : "0", "Child" : ["74", "75", "76", "77", "78"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop17",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mul_16s_16s_32_1_1_U142", "Parent" : "73"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mul_16s_16s_32_1_1_U143", "Parent" : "73"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mac_mulsub_16s_16s_32s_32_1_1_U144", "Parent" : "73"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mac_muladd_16s_16s_32s_32_1_1_U145", "Parent" : "73"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.flow_control_loop_pipe_sequential_init_U", "Parent" : "73"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop18_fu_481", "Parent" : "0", "Child" : ["80"],
		"CDFG" : "fft_serial_Pipeline_scan_loop18",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop18_fu_481.flow_control_loop_pipe_sequential_init_U", "Parent" : "79"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_490", "Parent" : "0", "Child" : ["82"],
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
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_490.flow_control_loop_pipe_sequential_init_U", "Parent" : "81"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_IN_m_axi_U", "Parent" : "0"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_OUT_m_axi_U", "Parent" : "0"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U165", "Parent" : "0"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U166", "Parent" : "0"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U167", "Parent" : "0"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U168", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U169", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U170", "Parent" : "0"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U171", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U172", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U173", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U174", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		in_re {Type I LastRead 0 FirstWrite -1}
		in_im {Type I LastRead 0 FirstWrite -1}
		out_re {Type I LastRead 0 FirstWrite -1}
		out_im {Type I LastRead 0 FirstWrite -1}
		blk_exp {Type O LastRead -1 FirstWrite 53}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}}
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln208 {Type I LastRead 0 FirstWrite -1}
		sext_ln208_1 {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 3}
		im {Type IO LastRead 1 FirstWrite 3}
		re_1 {Type IO LastRead 0 FirstWrite 3}
		re {Type IO LastRead 1 FirstWrite 3}}
	fft_serial_Pipeline_scan_loop {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop1 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_1 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}}
	fft_serial_Pipeline_scan_loop2 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_2_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop3 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_2 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop4 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_4_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop5 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_3 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop6 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_6_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop7 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_4 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop8 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_8_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop9 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_5 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop10 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_10_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop11 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_6 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop12 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_12_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop13 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_7 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop14 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_14_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop15 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_8 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop16 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_16_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop17 {
		re {Type IO LastRead 1 FirstWrite 1}
		re_1 {Type IO LastRead 1 FirstWrite 1}
		clz_next_9 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 1}
		im_1 {Type IO LastRead 1 FirstWrite 1}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop18 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_18_out {Type O LastRead -1 FirstWrite 1}}
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
	{"Name" : "Latency", "Min" : "24700", "Max" : "24700"}
	, {"Name" : "Interval", "Min" : "24701", "Max" : "24701"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AXI_IN { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 8 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 32 }  { m_axi_AXI_IN_WSTRB STRB 1 4 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 8 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 32 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	AXI_OUT { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 8 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 32 }  { m_axi_AXI_OUT_WSTRB STRB 1 4 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 8 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 32 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict AXI_IN {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict AXI_OUT {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName fft_serial
set isTopModule 1
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
set C_modelName {fft_serial}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ in_re int 64 regular {axi_slave 0}  }
	{ in_im int 64 regular {axi_slave 0}  }
	{ out_re int 64 regular {axi_slave 0}  }
	{ out_im int 64 regular {axi_slave 0}  }
	{ blk_exp int 8 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "in_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "in_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "out_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "out_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} , 
 	{ "Name" : "blk_exp", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 8, "direction" : "WRITEONLY", "offset" : {"out":64}, "offset_end" : {"out":71}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"continue","value":"0","valid_bit":"4"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"in_re","role":"data","value":"16"},{"name":"in_im","role":"data","value":"28"},{"name":"out_re","role":"data","value":"40"},{"name":"out_im","role":"data","value":"52"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"done","value":"0","valid_bit":"1"},{"name":"fft_serial","role":"idle","value":"0","valid_bit":"2"},{"name":"fft_serial","role":"ready","value":"0","valid_bit":"3"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"blk_exp","role":"data","value":"64"}, {"name":"blk_exp","role":"valid","value":"68","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "9", "13", "15", "21", "23", "29", "31", "37", "39", "45", "47", "53", "55", "61", "63", "69", "71", "77", "79", "85", "87", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101"],
		"CDFG" : "fft_serial",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "39038", "EstimateLatencyMax" : "39038",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_serial_Pipeline_load_loop_fu_263", "Port" : "AXI_IN", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "87", "SubInstance" : "grp_fft_serial_Pipeline_store_loop_fu_490", "Port" : "AXI_OUT", "Inst_start_state" : "52", "Inst_end_state" : "53"}]},
			{"Name" : "in_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "blk_exp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "71", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Port" : "TW_COS_LUT", "Inst_start_state" : "43", "Inst_end_state" : "44"},
					{"ID" : "39", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Port" : "TW_COS_LUT", "Inst_start_state" : "23", "Inst_end_state" : "24"},
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Port" : "TW_COS_LUT", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "23", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Port" : "TW_COS_LUT", "Inst_start_state" : "13", "Inst_end_state" : "14"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Port" : "TW_COS_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "47", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Port" : "TW_COS_LUT", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "63", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Port" : "TW_COS_LUT", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "79", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Port" : "TW_COS_LUT", "Inst_start_state" : "48", "Inst_end_state" : "49"}]},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "71", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Port" : "TW_SIN_LUT", "Inst_start_state" : "43", "Inst_end_state" : "44"},
					{"ID" : "39", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Port" : "TW_SIN_LUT", "Inst_start_state" : "23", "Inst_end_state" : "24"},
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Port" : "TW_SIN_LUT", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "23", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Port" : "TW_SIN_LUT", "Inst_start_state" : "13", "Inst_end_state" : "14"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Port" : "TW_SIN_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "47", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Port" : "TW_SIN_LUT", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "63", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Port" : "TW_SIN_LUT", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "79", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Port" : "TW_SIN_LUT", "Inst_start_state" : "48", "Inst_end_state" : "49"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_COS_LUT_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_SIN_LUT_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_1_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_263", "Parent" : "0", "Child" : ["8"],
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
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_263.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279", "Parent" : "0", "Child" : ["10", "11", "12"],
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
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279.mul_16s_16ns_32_4_1_U8", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279.mul_16s_16ns_32_4_1_U9", "Parent" : "9"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop_fu_287", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "fft_serial_Pipeline_scan_loop",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop_fu_287.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296", "Parent" : "0", "Child" : ["16", "17", "18", "19", "20"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3586", "EstimateLatencyMax" : "3586",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state7", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state7_blk", "QuitState" : "ap_ST_fsm_state7", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state7_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mul_16s_16s_32_4_1_U20", "Parent" : "15"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mul_16s_16s_32_4_1_U21", "Parent" : "15"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mac_mulsub_16s_16s_31s_32_4_1_U22", "Parent" : "15"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mac_muladd_16s_16s_31s_32_4_1_U23", "Parent" : "15"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop2_fu_305", "Parent" : "0", "Child" : ["22"],
		"CDFG" : "fft_serial_Pipeline_scan_loop2",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop2_fu_305.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Parent" : "0", "Child" : ["24", "25", "26", "27", "28"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mul_16s_16s_32_4_1_U37", "Parent" : "23"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mul_16s_16s_32_4_1_U38", "Parent" : "23"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mac_mulsub_16s_16s_32s_32_1_1_U39", "Parent" : "23"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mac_muladd_16s_16s_32s_32_1_1_U40", "Parent" : "23"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop4_fu_327", "Parent" : "0", "Child" : ["30"],
		"CDFG" : "fft_serial_Pipeline_scan_loop4",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop4_fu_327.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Parent" : "0", "Child" : ["32", "33", "34", "35", "36"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mul_16s_16s_32_4_1_U55", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mul_16s_16s_32_4_1_U56", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mac_mulsub_16s_16s_32s_32_1_1_U57", "Parent" : "31"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mac_muladd_16s_16s_32s_32_1_1_U58", "Parent" : "31"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop6_fu_349", "Parent" : "0", "Child" : ["38"],
		"CDFG" : "fft_serial_Pipeline_scan_loop6",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop6_fu_349.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Parent" : "0", "Child" : ["40", "41", "42", "43", "44"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mul_16s_16s_32_4_1_U71", "Parent" : "39"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mul_16s_16s_32_4_1_U72", "Parent" : "39"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mac_mulsub_16s_16s_32s_32_1_1_U73", "Parent" : "39"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mac_muladd_16s_16s_32s_32_1_1_U74", "Parent" : "39"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.flow_control_loop_pipe_sequential_init_U", "Parent" : "39"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop8_fu_371", "Parent" : "0", "Child" : ["46"],
		"CDFG" : "fft_serial_Pipeline_scan_loop8",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_8_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop8_fu_371.flow_control_loop_pipe_sequential_init_U", "Parent" : "45"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Parent" : "0", "Child" : ["48", "49", "50", "51", "52"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mul_16s_16s_32_4_1_U87", "Parent" : "47"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mul_16s_16s_32_4_1_U88", "Parent" : "47"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mac_mulsub_16s_16s_32s_32_1_1_U89", "Parent" : "47"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mac_muladd_16s_16s_32s_32_1_1_U90", "Parent" : "47"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.flow_control_loop_pipe_sequential_init_U", "Parent" : "47"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop10_fu_393", "Parent" : "0", "Child" : ["54"],
		"CDFG" : "fft_serial_Pipeline_scan_loop10",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_10_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop10_fu_393.flow_control_loop_pipe_sequential_init_U", "Parent" : "53"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Parent" : "0", "Child" : ["56", "57", "58", "59", "60"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mul_16s_16s_32_4_1_U103", "Parent" : "55"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mul_16s_16s_32_4_1_U104", "Parent" : "55"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mac_mulsub_16s_16s_32s_32_1_1_U105", "Parent" : "55"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mac_muladd_16s_16s_32s_32_1_1_U106", "Parent" : "55"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.flow_control_loop_pipe_sequential_init_U", "Parent" : "55"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop12_fu_415", "Parent" : "0", "Child" : ["62"],
		"CDFG" : "fft_serial_Pipeline_scan_loop12",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop12_fu_415.flow_control_loop_pipe_sequential_init_U", "Parent" : "61"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Parent" : "0", "Child" : ["64", "65", "66", "67", "68"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mul_16s_16s_32_4_1_U119", "Parent" : "63"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mul_16s_16s_32_4_1_U120", "Parent" : "63"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mac_mulsub_16s_16s_32s_32_1_1_U121", "Parent" : "63"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mac_muladd_16s_16s_32s_32_1_1_U122", "Parent" : "63"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.flow_control_loop_pipe_sequential_init_U", "Parent" : "63"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop14_fu_437", "Parent" : "0", "Child" : ["70"],
		"CDFG" : "fft_serial_Pipeline_scan_loop14",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_14_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop14_fu_437.flow_control_loop_pipe_sequential_init_U", "Parent" : "69"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Parent" : "0", "Child" : ["72", "73", "74", "75", "76"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop15",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mul_16s_16s_32_4_1_U135", "Parent" : "71"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mul_16s_16s_32_4_1_U136", "Parent" : "71"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mac_mulsub_16s_16s_32s_32_1_1_U137", "Parent" : "71"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mac_muladd_16s_16s_32s_32_1_1_U138", "Parent" : "71"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.flow_control_loop_pipe_sequential_init_U", "Parent" : "71"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop16_fu_459", "Parent" : "0", "Child" : ["78"],
		"CDFG" : "fft_serial_Pipeline_scan_loop16",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_16_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop16_fu_459.flow_control_loop_pipe_sequential_init_U", "Parent" : "77"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Parent" : "0", "Child" : ["80", "81", "82", "83", "84"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop17",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mul_16s_16s_32_4_1_U151", "Parent" : "79"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mul_16s_16s_32_4_1_U152", "Parent" : "79"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mac_mulsub_16s_16s_32s_32_1_1_U153", "Parent" : "79"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mac_muladd_16s_16s_32s_32_1_1_U154", "Parent" : "79"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.flow_control_loop_pipe_sequential_init_U", "Parent" : "79"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop18_fu_481", "Parent" : "0", "Child" : ["86"],
		"CDFG" : "fft_serial_Pipeline_scan_loop18",
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
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop18_fu_481.flow_control_loop_pipe_sequential_init_U", "Parent" : "85"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_490", "Parent" : "0", "Child" : ["88"],
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
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_490.flow_control_loop_pipe_sequential_init_U", "Parent" : "87"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_IN_m_axi_U", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_OUT_m_axi_U", "Parent" : "0"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U174", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U175", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U176", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U177", "Parent" : "0"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U178", "Parent" : "0"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U179", "Parent" : "0"},
	{"ID" : "98", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U180", "Parent" : "0"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U181", "Parent" : "0"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U182", "Parent" : "0"},
	{"ID" : "101", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U183", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		in_re {Type I LastRead 0 FirstWrite -1}
		in_im {Type I LastRead 0 FirstWrite -1}
		out_re {Type I LastRead 0 FirstWrite -1}
		out_im {Type I LastRead 0 FirstWrite -1}
		blk_exp {Type O LastRead -1 FirstWrite 53}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}}
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln219 {Type I LastRead 0 FirstWrite -1}
		sext_ln219_1 {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 5}
		im {Type IO LastRead 3 FirstWrite 5}
		re_1 {Type IO LastRead 0 FirstWrite 5}
		re {Type IO LastRead 3 FirstWrite 5}}
	fft_serial_Pipeline_scan_loop {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop1 {
		re {Type IO LastRead 1 FirstWrite 5}
		re_1 {Type IO LastRead 1 FirstWrite 5}
		clz_next_1 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 5}
		im_1 {Type IO LastRead 1 FirstWrite 5}}
	fft_serial_Pipeline_scan_loop2 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_2_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop3 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_2 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop4 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_4_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop5 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_3 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop6 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_6_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop7 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_4 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop8 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_8_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop9 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_5 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop10 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_10_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop11 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_6 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop12 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_12_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop13 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_7 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop14 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_14_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop15 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_8 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop16 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_16_out {Type O LastRead -1 FirstWrite 1}}
	fft_serial_Pipeline_bfly_loop17 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_9 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop18 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_18_out {Type O LastRead -1 FirstWrite 1}}
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
	{"Name" : "Latency", "Min" : "39038", "Max" : "39038"}
	, {"Name" : "Interval", "Min" : "39039", "Max" : "39039"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AXI_IN { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 8 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 32 }  { m_axi_AXI_IN_WSTRB STRB 1 4 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 8 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 32 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	AXI_OUT { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 8 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 32 }  { m_axi_AXI_OUT_WSTRB STRB 1 4 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 8 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 32 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict AXI_IN {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict AXI_OUT {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName fft_serial
set isTopModule 1
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
set C_modelName {fft_serial}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ in_re int 64 regular {axi_slave 0}  }
	{ in_im int 64 regular {axi_slave 0}  }
	{ out_re int 64 regular {axi_slave 0}  }
	{ out_im int 64 regular {axi_slave 0}  }
	{ blk_exp int 8 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "in_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "in_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "out_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "out_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} , 
 	{ "Name" : "blk_exp", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 8, "direction" : "WRITEONLY", "offset" : {"out":64}, "offset_end" : {"out":71}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"continue","value":"0","valid_bit":"4"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"in_re","role":"data","value":"16"},{"name":"in_im","role":"data","value":"28"},{"name":"out_re","role":"data","value":"40"},{"name":"out_im","role":"data","value":"52"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"done","value":"0","valid_bit":"1"},{"name":"fft_serial","role":"idle","value":"0","valid_bit":"2"},{"name":"fft_serial","role":"ready","value":"0","valid_bit":"3"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"blk_exp","role":"data","value":"64"}, {"name":"blk_exp","role":"valid","value":"68","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "9", "13", "15", "21", "23", "29", "31", "37", "39", "45", "47", "53", "55", "61", "63", "69", "71", "77", "79", "85", "87", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101"],
		"CDFG" : "fft_serial",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "39027", "EstimateLatencyMax" : "39027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_serial_Pipeline_load_loop_fu_263", "Port" : "AXI_IN", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "87", "SubInstance" : "grp_fft_serial_Pipeline_store_loop_fu_490", "Port" : "AXI_OUT", "Inst_start_state" : "52", "Inst_end_state" : "53"}]},
			{"Name" : "in_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "blk_exp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Port" : "TW_COS_LUT", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "39", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Port" : "TW_COS_LUT", "Inst_start_state" : "23", "Inst_end_state" : "24"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Port" : "TW_COS_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "47", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Port" : "TW_COS_LUT", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "63", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Port" : "TW_COS_LUT", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "79", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Port" : "TW_COS_LUT", "Inst_start_state" : "48", "Inst_end_state" : "49"},
					{"ID" : "71", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Port" : "TW_COS_LUT", "Inst_start_state" : "43", "Inst_end_state" : "44"},
					{"ID" : "23", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Port" : "TW_COS_LUT", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Port" : "TW_SIN_LUT", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "39", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Port" : "TW_SIN_LUT", "Inst_start_state" : "23", "Inst_end_state" : "24"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Port" : "TW_SIN_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "47", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Port" : "TW_SIN_LUT", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "63", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Port" : "TW_SIN_LUT", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "79", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Port" : "TW_SIN_LUT", "Inst_start_state" : "48", "Inst_end_state" : "49"},
					{"ID" : "71", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Port" : "TW_SIN_LUT", "Inst_start_state" : "43", "Inst_end_state" : "44"},
					{"ID" : "23", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Port" : "TW_SIN_LUT", "Inst_start_state" : "13", "Inst_end_state" : "14"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_COS_LUT_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_SIN_LUT_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_1_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_263", "Parent" : "0", "Child" : ["8"],
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
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_263.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279", "Parent" : "0", "Child" : ["10", "11", "12"],
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
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279.mul_16s_16ns_32_4_1_U8", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279.mul_16s_16ns_32_4_1_U9", "Parent" : "9"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop_fu_287", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "fft_serial_Pipeline_scan_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop_fu_287.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296", "Parent" : "0", "Child" : ["16", "17", "18", "19", "20"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3586", "EstimateLatencyMax" : "3586",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state7", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state7_blk", "QuitState" : "ap_ST_fsm_state7", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state7_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mul_16s_16s_32_4_1_U20", "Parent" : "15"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mul_16s_16s_32_4_1_U21", "Parent" : "15"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mac_mulsub_16s_16s_31s_32_4_1_U22", "Parent" : "15"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mac_muladd_16s_16s_31s_32_4_1_U23", "Parent" : "15"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop2_fu_305", "Parent" : "0", "Child" : ["22"],
		"CDFG" : "fft_serial_Pipeline_scan_loop2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop2_fu_305.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Parent" : "0", "Child" : ["24", "25", "26", "27", "28"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mul_16s_16s_32_4_1_U37", "Parent" : "23"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mul_16s_16s_32_4_1_U38", "Parent" : "23"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mac_mulsub_16s_16s_32s_32_1_1_U39", "Parent" : "23"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mac_muladd_16s_16s_32s_32_1_1_U40", "Parent" : "23"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop4_fu_327", "Parent" : "0", "Child" : ["30"],
		"CDFG" : "fft_serial_Pipeline_scan_loop4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop4_fu_327.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Parent" : "0", "Child" : ["32", "33", "34", "35", "36"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mul_16s_16s_32_4_1_U55", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mul_16s_16s_32_4_1_U56", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mac_mulsub_16s_16s_32s_32_1_1_U57", "Parent" : "31"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mac_muladd_16s_16s_32s_32_1_1_U58", "Parent" : "31"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop6_fu_349", "Parent" : "0", "Child" : ["38"],
		"CDFG" : "fft_serial_Pipeline_scan_loop6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop6_fu_349.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Parent" : "0", "Child" : ["40", "41", "42", "43", "44"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mul_16s_16s_32_4_1_U71", "Parent" : "39"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mul_16s_16s_32_4_1_U72", "Parent" : "39"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mac_mulsub_16s_16s_32s_32_1_1_U73", "Parent" : "39"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mac_muladd_16s_16s_32s_32_1_1_U74", "Parent" : "39"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.flow_control_loop_pipe_sequential_init_U", "Parent" : "39"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop8_fu_371", "Parent" : "0", "Child" : ["46"],
		"CDFG" : "fft_serial_Pipeline_scan_loop8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_8_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop8_fu_371.flow_control_loop_pipe_sequential_init_U", "Parent" : "45"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Parent" : "0", "Child" : ["48", "49", "50", "51", "52"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mul_16s_16s_32_4_1_U87", "Parent" : "47"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mul_16s_16s_32_4_1_U88", "Parent" : "47"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mac_mulsub_16s_16s_32s_32_1_1_U89", "Parent" : "47"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mac_muladd_16s_16s_32s_32_1_1_U90", "Parent" : "47"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.flow_control_loop_pipe_sequential_init_U", "Parent" : "47"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop10_fu_393", "Parent" : "0", "Child" : ["54"],
		"CDFG" : "fft_serial_Pipeline_scan_loop10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_10_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop10_fu_393.flow_control_loop_pipe_sequential_init_U", "Parent" : "53"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Parent" : "0", "Child" : ["56", "57", "58", "59", "60"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mul_16s_16s_32_4_1_U103", "Parent" : "55"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mul_16s_16s_32_4_1_U104", "Parent" : "55"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mac_mulsub_16s_16s_32s_32_1_1_U105", "Parent" : "55"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mac_muladd_16s_16s_32s_32_1_1_U106", "Parent" : "55"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.flow_control_loop_pipe_sequential_init_U", "Parent" : "55"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop12_fu_415", "Parent" : "0", "Child" : ["62"],
		"CDFG" : "fft_serial_Pipeline_scan_loop12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop12_fu_415.flow_control_loop_pipe_sequential_init_U", "Parent" : "61"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Parent" : "0", "Child" : ["64", "65", "66", "67", "68"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mul_16s_16s_32_4_1_U119", "Parent" : "63"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mul_16s_16s_32_4_1_U120", "Parent" : "63"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mac_mulsub_16s_16s_32s_32_1_1_U121", "Parent" : "63"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mac_muladd_16s_16s_32s_32_1_1_U122", "Parent" : "63"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.flow_control_loop_pipe_sequential_init_U", "Parent" : "63"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop14_fu_437", "Parent" : "0", "Child" : ["70"],
		"CDFG" : "fft_serial_Pipeline_scan_loop14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_14_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop14_fu_437.flow_control_loop_pipe_sequential_init_U", "Parent" : "69"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Parent" : "0", "Child" : ["72", "73", "74", "75", "76"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop15",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mul_16s_16s_32_4_1_U135", "Parent" : "71"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mul_16s_16s_32_4_1_U136", "Parent" : "71"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mac_mulsub_16s_16s_32s_32_1_1_U137", "Parent" : "71"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mac_muladd_16s_16s_32s_32_1_1_U138", "Parent" : "71"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.flow_control_loop_pipe_sequential_init_U", "Parent" : "71"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop16_fu_459", "Parent" : "0", "Child" : ["78"],
		"CDFG" : "fft_serial_Pipeline_scan_loop16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_16_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop16_fu_459.flow_control_loop_pipe_sequential_init_U", "Parent" : "77"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Parent" : "0", "Child" : ["80", "81", "82", "83", "84"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop17",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mul_16s_16s_32_4_1_U151", "Parent" : "79"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mul_16s_16s_32_4_1_U152", "Parent" : "79"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mac_mulsub_16s_16s_32s_32_1_1_U153", "Parent" : "79"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mac_muladd_16s_16s_32s_32_1_1_U154", "Parent" : "79"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.flow_control_loop_pipe_sequential_init_U", "Parent" : "79"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop18_fu_481", "Parent" : "0", "Child" : ["86"],
		"CDFG" : "fft_serial_Pipeline_scan_loop18",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop18_fu_481.flow_control_loop_pipe_sequential_init_U", "Parent" : "85"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_490", "Parent" : "0", "Child" : ["88"],
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
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_490.flow_control_loop_pipe_sequential_init_U", "Parent" : "87"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_IN_m_axi_U", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_OUT_m_axi_U", "Parent" : "0"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U174", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U175", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U176", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U177", "Parent" : "0"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U178", "Parent" : "0"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U179", "Parent" : "0"},
	{"ID" : "98", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U180", "Parent" : "0"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U181", "Parent" : "0"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U182", "Parent" : "0"},
	{"ID" : "101", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U183", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		in_re {Type I LastRead 0 FirstWrite -1}
		in_im {Type I LastRead 0 FirstWrite -1}
		out_re {Type I LastRead 0 FirstWrite -1}
		out_im {Type I LastRead 0 FirstWrite -1}
		blk_exp {Type O LastRead -1 FirstWrite 52}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}}
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln219 {Type I LastRead 0 FirstWrite -1}
		sext_ln219_1 {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 5}
		im {Type IO LastRead 3 FirstWrite 5}
		re_1 {Type IO LastRead 0 FirstWrite 5}
		re {Type IO LastRead 3 FirstWrite 5}}
	fft_serial_Pipeline_scan_loop {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop1 {
		re {Type IO LastRead 1 FirstWrite 5}
		re_1 {Type IO LastRead 1 FirstWrite 5}
		clz_next_1 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 5}
		im_1 {Type IO LastRead 1 FirstWrite 5}}
	fft_serial_Pipeline_scan_loop2 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_2_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop3 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_2 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop4 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_4_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop5 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_3 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop6 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_6_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop7 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_4 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop8 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_8_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop9 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_5 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop10 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_10_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop11 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_6 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop12 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_12_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop13 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_7 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop14 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_14_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop15 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_8 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop16 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_16_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop17 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_9 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop18 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_18_out {Type O LastRead -1 FirstWrite 0}}
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
	{"Name" : "Latency", "Min" : "39027", "Max" : "39027"}
	, {"Name" : "Interval", "Min" : "39028", "Max" : "39028"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AXI_IN { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 8 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 32 }  { m_axi_AXI_IN_WSTRB STRB 1 4 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 8 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 32 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	AXI_OUT { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 8 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 32 }  { m_axi_AXI_OUT_WSTRB STRB 1 4 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 8 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 32 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict AXI_IN {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict AXI_OUT {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName fft_serial
set isTopModule 1
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
set C_modelName {fft_serial}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_IN int 16 regular {axi_master 0}  }
	{ AXI_OUT int 16 regular {axi_master 1}  }
	{ in_re int 64 regular {axi_slave 0}  }
	{ in_im int 64 regular {axi_slave 0}  }
	{ out_re int 64 regular {axi_slave 0}  }
	{ out_im int 64 regular {axi_slave 0}  }
	{ blk_exp int 8 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_re","offset": { "type": "dynamic","port_name": "in_re","bundle": "control"},"direction": "READONLY"},{"cName": "in_im","offset": { "type": "dynamic","port_name": "in_im","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_re","offset": { "type": "dynamic","port_name": "out_re","bundle": "control"},"direction": "WRITEONLY"},{"cName": "out_im","offset": { "type": "dynamic","port_name": "out_im","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "in_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "in_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "out_re", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "out_im", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} , 
 	{ "Name" : "blk_exp", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 8, "direction" : "WRITEONLY", "offset" : {"out":64}, "offset_end" : {"out":71}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"continue","value":"0","valid_bit":"4"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"in_re","role":"data","value":"16"},{"name":"in_im","role":"data","value":"28"},{"name":"out_re","role":"data","value":"40"},{"name":"out_im","role":"data","value":"52"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"fft_serial","role":"start","value":"0","valid_bit":"0"},{"name":"fft_serial","role":"done","value":"0","valid_bit":"1"},{"name":"fft_serial","role":"idle","value":"0","valid_bit":"2"},{"name":"fft_serial","role":"ready","value":"0","valid_bit":"3"},{"name":"fft_serial","role":"auto_start","value":"0","valid_bit":"7"},{"name":"blk_exp","role":"data","value":"64"}, {"name":"blk_exp","role":"valid","value":"68","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "9", "13", "15", "21", "23", "29", "31", "37", "39", "45", "47", "53", "55", "61", "63", "69", "71", "77", "79", "85", "87", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101"],
		"CDFG" : "fft_serial",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "39027", "EstimateLatencyMax" : "39027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_serial_Pipeline_load_loop_fu_263", "Port" : "AXI_IN", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "87", "SubInstance" : "grp_fft_serial_Pipeline_store_loop_fu_490", "Port" : "AXI_OUT", "Inst_start_state" : "52", "Inst_end_state" : "53"}]},
			{"Name" : "in_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_re", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_im", "Type" : "None", "Direction" : "I"},
			{"Name" : "blk_exp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Port" : "TW_COS_LUT", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "23", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Port" : "TW_COS_LUT", "Inst_start_state" : "13", "Inst_end_state" : "14"},
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Port" : "TW_COS_LUT", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "63", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Port" : "TW_COS_LUT", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "79", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Port" : "TW_COS_LUT", "Inst_start_state" : "48", "Inst_end_state" : "49"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Port" : "TW_COS_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "71", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Port" : "TW_COS_LUT", "Inst_start_state" : "43", "Inst_end_state" : "44"},
					{"ID" : "39", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Port" : "TW_COS_LUT", "Inst_start_state" : "23", "Inst_end_state" : "24"}]},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Port" : "TW_SIN_LUT", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "23", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Port" : "TW_SIN_LUT", "Inst_start_state" : "13", "Inst_end_state" : "14"},
					{"ID" : "55", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Port" : "TW_SIN_LUT", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "63", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Port" : "TW_SIN_LUT", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "79", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Port" : "TW_SIN_LUT", "Inst_start_state" : "48", "Inst_end_state" : "49"},
					{"ID" : "31", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Port" : "TW_SIN_LUT", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "71", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Port" : "TW_SIN_LUT", "Inst_start_state" : "43", "Inst_end_state" : "44"},
					{"ID" : "39", "SubInstance" : "grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Port" : "TW_SIN_LUT", "Inst_start_state" : "23", "Inst_end_state" : "24"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_COS_LUT_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TW_SIN_LUT_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.re_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.im_1_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_263", "Parent" : "0", "Child" : ["8"],
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
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_load_loop_fu_263.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279", "Parent" : "0", "Child" : ["10", "11", "12"],
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
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279.mul_16s_16ns_32_4_1_U8", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279.mul_16s_16ns_32_4_1_U9", "Parent" : "9"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop_fu_279.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop_fu_287", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "fft_serial_Pipeline_scan_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop_fu_287.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296", "Parent" : "0", "Child" : ["16", "17", "18", "19", "20"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3586", "EstimateLatencyMax" : "3586",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state7", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state7_blk", "QuitState" : "ap_ST_fsm_state7", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state7_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mul_16s_16s_32_4_1_U20", "Parent" : "15"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mul_16s_16s_32_4_1_U21", "Parent" : "15"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mac_mulsub_16s_16s_31s_32_4_1_U22", "Parent" : "15"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.mac_muladd_16s_16s_31s_32_4_1_U23", "Parent" : "15"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop1_fu_296.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop2_fu_305", "Parent" : "0", "Child" : ["22"],
		"CDFG" : "fft_serial_Pipeline_scan_loop2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop2_fu_305.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314", "Parent" : "0", "Child" : ["24", "25", "26", "27", "28"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mul_16s_16s_32_4_1_U37", "Parent" : "23"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mul_16s_16s_32_4_1_U38", "Parent" : "23"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mac_mulsub_16s_16s_32s_32_1_1_U39", "Parent" : "23"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.mac_muladd_16s_16s_32s_32_1_1_U40", "Parent" : "23"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop3_fu_314.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop4_fu_327", "Parent" : "0", "Child" : ["30"],
		"CDFG" : "fft_serial_Pipeline_scan_loop4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop4_fu_327.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336", "Parent" : "0", "Child" : ["32", "33", "34", "35", "36"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mul_16s_16s_32_4_1_U55", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mul_16s_16s_32_4_1_U56", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mac_mulsub_16s_16s_32s_32_1_1_U57", "Parent" : "31"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.mac_muladd_16s_16s_32s_32_1_1_U58", "Parent" : "31"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop5_fu_336.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop6_fu_349", "Parent" : "0", "Child" : ["38"],
		"CDFG" : "fft_serial_Pipeline_scan_loop6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop6_fu_349.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358", "Parent" : "0", "Child" : ["40", "41", "42", "43", "44"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mul_16s_16s_32_4_1_U71", "Parent" : "39"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mul_16s_16s_32_4_1_U72", "Parent" : "39"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mac_mulsub_16s_16s_32s_32_1_1_U73", "Parent" : "39"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.mac_muladd_16s_16s_32s_32_1_1_U74", "Parent" : "39"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop7_fu_358.flow_control_loop_pipe_sequential_init_U", "Parent" : "39"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop8_fu_371", "Parent" : "0", "Child" : ["46"],
		"CDFG" : "fft_serial_Pipeline_scan_loop8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_8_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop8_fu_371.flow_control_loop_pipe_sequential_init_U", "Parent" : "45"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380", "Parent" : "0", "Child" : ["48", "49", "50", "51", "52"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mul_16s_16s_32_4_1_U87", "Parent" : "47"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mul_16s_16s_32_4_1_U88", "Parent" : "47"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mac_mulsub_16s_16s_32s_32_1_1_U89", "Parent" : "47"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.mac_muladd_16s_16s_32s_32_1_1_U90", "Parent" : "47"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop9_fu_380.flow_control_loop_pipe_sequential_init_U", "Parent" : "47"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop10_fu_393", "Parent" : "0", "Child" : ["54"],
		"CDFG" : "fft_serial_Pipeline_scan_loop10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_10_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop10_fu_393.flow_control_loop_pipe_sequential_init_U", "Parent" : "53"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402", "Parent" : "0", "Child" : ["56", "57", "58", "59", "60"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mul_16s_16s_32_4_1_U103", "Parent" : "55"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mul_16s_16s_32_4_1_U104", "Parent" : "55"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mac_mulsub_16s_16s_32s_32_1_1_U105", "Parent" : "55"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.mac_muladd_16s_16s_32s_32_1_1_U106", "Parent" : "55"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop11_fu_402.flow_control_loop_pipe_sequential_init_U", "Parent" : "55"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop12_fu_415", "Parent" : "0", "Child" : ["62"],
		"CDFG" : "fft_serial_Pipeline_scan_loop12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop12_fu_415.flow_control_loop_pipe_sequential_init_U", "Parent" : "61"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424", "Parent" : "0", "Child" : ["64", "65", "66", "67", "68"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mul_16s_16s_32_4_1_U119", "Parent" : "63"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mul_16s_16s_32_4_1_U120", "Parent" : "63"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mac_mulsub_16s_16s_32s_32_1_1_U121", "Parent" : "63"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.mac_muladd_16s_16s_32s_32_1_1_U122", "Parent" : "63"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop13_fu_424.flow_control_loop_pipe_sequential_init_U", "Parent" : "63"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop14_fu_437", "Parent" : "0", "Child" : ["70"],
		"CDFG" : "fft_serial_Pipeline_scan_loop14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_14_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop14_fu_437.flow_control_loop_pipe_sequential_init_U", "Parent" : "69"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446", "Parent" : "0", "Child" : ["72", "73", "74", "75", "76"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop15",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mul_16s_16s_32_4_1_U135", "Parent" : "71"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mul_16s_16s_32_4_1_U136", "Parent" : "71"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mac_mulsub_16s_16s_32s_32_1_1_U137", "Parent" : "71"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.mac_muladd_16s_16s_32s_32_1_1_U138", "Parent" : "71"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop15_fu_446.flow_control_loop_pipe_sequential_init_U", "Parent" : "71"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop16_fu_459", "Parent" : "0", "Child" : ["78"],
		"CDFG" : "fft_serial_Pipeline_scan_loop16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_16_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop16_fu_459.flow_control_loop_pipe_sequential_init_U", "Parent" : "77"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468", "Parent" : "0", "Child" : ["80", "81", "82", "83", "84"],
		"CDFG" : "fft_serial_Pipeline_bfly_loop17",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2562", "EstimateLatencyMax" : "2562",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "clz_next_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "bfly_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mul_16s_16s_32_4_1_U151", "Parent" : "79"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mul_16s_16s_32_4_1_U152", "Parent" : "79"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mac_mulsub_16s_16s_32s_32_1_1_U153", "Parent" : "79"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.mac_muladd_16s_16s_32s_32_1_1_U154", "Parent" : "79"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_bfly_loop17_fu_468.flow_control_loop_pipe_sequential_init_U", "Parent" : "79"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop18_fu_481", "Parent" : "0", "Child" : ["86"],
		"CDFG" : "fft_serial_Pipeline_scan_loop18",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "re_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "im_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "or_mask_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "scan_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_scan_loop18_fu_481.flow_control_loop_pipe_sequential_init_U", "Parent" : "85"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_490", "Parent" : "0", "Child" : ["88"],
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
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_serial_Pipeline_store_loop_fu_490.flow_control_loop_pipe_sequential_init_U", "Parent" : "87"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_IN_m_axi_U", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_OUT_m_axi_U", "Parent" : "0"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U174", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U175", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U176", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U177", "Parent" : "0"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U178", "Parent" : "0"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U179", "Parent" : "0"},
	{"ID" : "98", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U180", "Parent" : "0"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U181", "Parent" : "0"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U182", "Parent" : "0"},
	{"ID" : "101", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_32_4_1_1_U183", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_serial {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		AXI_OUT {Type O LastRead 4 FirstWrite 2}
		in_re {Type I LastRead 0 FirstWrite -1}
		in_im {Type I LastRead 0 FirstWrite -1}
		out_re {Type I LastRead 0 FirstWrite -1}
		out_im {Type I LastRead 0 FirstWrite -1}
		blk_exp {Type O LastRead -1 FirstWrite 52}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}}
	fft_serial_Pipeline_load_loop {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		im_1 {Type O LastRead -1 FirstWrite 11}
		im {Type O LastRead -1 FirstWrite 11}
		re_1 {Type O LastRead -1 FirstWrite 10}
		re {Type O LastRead -1 FirstWrite 10}
		sext_ln219 {Type I LastRead 0 FirstWrite -1}
		sext_ln219_1 {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_bfly_loop {
		im_1 {Type IO LastRead 0 FirstWrite 5}
		im {Type IO LastRead 3 FirstWrite 5}
		re_1 {Type IO LastRead 0 FirstWrite 5}
		re {Type IO LastRead 3 FirstWrite 5}}
	fft_serial_Pipeline_scan_loop {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop1 {
		re {Type IO LastRead 1 FirstWrite 5}
		re_1 {Type IO LastRead 1 FirstWrite 5}
		clz_next_1 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 1 FirstWrite 5}
		im_1 {Type IO LastRead 1 FirstWrite 5}}
	fft_serial_Pipeline_scan_loop2 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_2_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop3 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_2 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop4 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_4_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop5 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_3 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop6 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_6_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop7 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_4 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop8 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_8_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop9 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_5 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop10 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_10_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop11 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_6 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop12 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_12_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop13 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_7 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop14 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_14_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop15 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_8 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop16 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_16_out {Type O LastRead -1 FirstWrite 0}}
	fft_serial_Pipeline_bfly_loop17 {
		re {Type IO LastRead 1 FirstWrite 4}
		re_1 {Type IO LastRead 1 FirstWrite 4}
		clz_next_9 {Type I LastRead 0 FirstWrite -1}
		im {Type IO LastRead 2 FirstWrite 5}
		im_1 {Type IO LastRead 2 FirstWrite 5}
		TW_COS_LUT {Type I LastRead 0 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead 0 FirstWrite -1}}
	fft_serial_Pipeline_scan_loop18 {
		re {Type I LastRead 0 FirstWrite -1}
		re_1 {Type I LastRead 0 FirstWrite -1}
		im {Type I LastRead 0 FirstWrite -1}
		im_1 {Type I LastRead 0 FirstWrite -1}
		or_mask_18_out {Type O LastRead -1 FirstWrite 0}}
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
	{"Name" : "Latency", "Min" : "39027", "Max" : "39027"}
	, {"Name" : "Interval", "Min" : "39028", "Max" : "39028"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AXI_IN { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 8 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 32 }  { m_axi_AXI_IN_WSTRB STRB 1 4 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 8 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 32 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	AXI_OUT { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 8 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 32 }  { m_axi_AXI_OUT_WSTRB STRB 1 4 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 8 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 32 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict AXI_IN {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict AXI_OUT {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ AXI_IN 1 }
	{ AXI_OUT 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
