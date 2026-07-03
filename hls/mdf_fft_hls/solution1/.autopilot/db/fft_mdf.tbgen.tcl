set moduleName fft_mdf
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {fft_mdf}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_in_V_data_V int 128 regular {axi_s 0 volatile  { s_in Data } }  }
	{ s_in_V_keep_V int 16 regular {axi_s 0 volatile  { s_in Keep } }  }
	{ s_in_V_strb_V int 16 regular {axi_s 0 volatile  { s_in Strb } }  }
	{ s_in_V_user_V int 1 regular {axi_s 0 volatile  { s_in User } }  }
	{ s_in_V_last_V int 1 regular {axi_s 0 volatile  { s_in Last } }  }
	{ s_in_V_id_V int 1 regular {axi_s 0 volatile  { s_in ID } }  }
	{ s_in_V_dest_V int 1 regular {axi_s 0 volatile  { s_in Dest } }  }
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
	{ "Name" : "s_in_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_out_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ s_in_TDATA sc_in sc_lv 128 signal 0 } 
	{ s_in_TKEEP sc_in sc_lv 16 signal 1 } 
	{ s_in_TSTRB sc_in sc_lv 16 signal 2 } 
	{ s_in_TUSER sc_in sc_lv 1 signal 3 } 
	{ s_in_TLAST sc_in sc_lv 1 signal 4 } 
	{ s_in_TID sc_in sc_lv 1 signal 5 } 
	{ s_in_TDEST sc_in sc_lv 1 signal 6 } 
	{ s_out_TDATA sc_out sc_lv 128 signal 7 } 
	{ s_out_TKEEP sc_out sc_lv 16 signal 8 } 
	{ s_out_TSTRB sc_out sc_lv 16 signal 9 } 
	{ s_out_TUSER sc_out sc_lv 1 signal 10 } 
	{ s_out_TLAST sc_out sc_lv 1 signal 11 } 
	{ s_out_TID sc_out sc_lv 1 signal 12 } 
	{ s_out_TDEST sc_out sc_lv 1 signal 13 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_in_TVALID sc_in sc_logic 1 invld 6 } 
	{ s_in_TREADY sc_out sc_logic 1 inacc 6 } 
	{ s_out_TVALID sc_out sc_logic 1 outvld 13 } 
	{ s_out_TREADY sc_in sc_logic 1 outacc 13 } 
}
set NewPortList {[ 
	{ "name": "s_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_in_V_data_V", "role": "default" }} , 
 	{ "name": "s_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_keep_V", "role": "default" }} , 
 	{ "name": "s_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_strb_V", "role": "default" }} , 
 	{ "name": "s_in_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_user_V", "role": "default" }} , 
 	{ "name": "s_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_last_V", "role": "default" }} , 
 	{ "name": "s_in_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_id_V", "role": "default" }} , 
 	{ "name": "s_in_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_out_V_data_V", "role": "default" }} , 
 	{ "name": "s_out_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_keep_V", "role": "default" }} , 
 	{ "name": "s_out_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_strb_V", "role": "default" }} , 
 	{ "name": "s_out_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_user_V", "role": "default" }} , 
 	{ "name": "s_out_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_last_V", "role": "default" }} , 
 	{ "name": "s_out_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_id_V", "role": "default" }} , 
 	{ "name": "s_out_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "s_out_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "10", "38", "66", "94", "122", "150", "180", "202", "210", "212", "214", "217", "219", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254"],
		"CDFG" : "fft_mdf",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "581", "EstimateLatencyMax" : "581",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "axis_to_word_U0"}],
		"OutputProcess" : [
			{"ID" : "219", "Name" : "word_to_axis_U0"}],
		"Port" : [
			{"Name" : "s_in_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_data_V"}]},
			{"Name" : "s_in_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_keep_V"}]},
			{"Name" : "s_in_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_strb_V"}]},
			{"Name" : "s_in_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_user_V"}]},
			{"Name" : "s_in_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_last_V"}]},
			{"Name" : "s_in_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_id_V"}]},
			{"Name" : "s_in_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_dest_V"}]},
			{"Name" : "s_out_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_data_V"}]},
			{"Name" : "s_out_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_keep_V"}]},
			{"Name" : "s_out_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_strb_V"}]},
			{"Name" : "s_out_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_user_V"}]},
			{"Name" : "s_out_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_last_V"}]},
			{"Name" : "s_out_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_id_V"}]},
			{"Name" : "s_out_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_dest_V"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49"}]},
			{"Name" : "TW_COS_LUT25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "TW_COS_LUT25"}]},
			{"Name" : "TW_SIN_LUT30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "TW_SIN_LUT30"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43"}]},
			{"Name" : "TW_COS_LUT24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "TW_COS_LUT24"}]},
			{"Name" : "TW_SIN_LUT29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "TW_SIN_LUT29"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37"}]},
			{"Name" : "TW_COS_LUT23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "TW_COS_LUT23"}]},
			{"Name" : "TW_SIN_LUT28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "TW_SIN_LUT28"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31"}]},
			{"Name" : "TW_COS_LUT22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "TW_COS_LUT22"}]},
			{"Name" : "TW_SIN_LUT27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "TW_SIN_LUT27"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25"}]},
			{"Name" : "TW_COS_LUT21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "TW_COS_LUT21"}]},
			{"Name" : "TW_SIN_LUT26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "TW_SIN_LUT26"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19"}]},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "TW_COS_LUT"}]},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "TW_SIN_LUT"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0"}]},
			{"Name" : "wr_bank", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "wr_bank"}]},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "wr_cnt"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "217", "SubInstance" : "Loop_read_loop_proc_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank"},
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "217", "SubInstance" : "Loop_read_loop_proc_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1"},
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9"],
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
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["10"], "DependentChan" : "230", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_in_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_301_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.flow_control_loop_pipe_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_data_V_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_keep_V_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_strb_V_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_user_V_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_last_V_U", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_id_V_U", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_dest_V_U", "Parent" : "1"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0", "Parent" : "0", "Child" : ["11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37"],
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
		"StartSource" : "1",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U",
		"Port" : [
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["38"], "DependentChan" : "231", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "230", "DependentChanDepth" : "260", "DependentChanType" : "0",
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
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44_U", "Parent" : "10"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45_U", "Parent" : "10"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46_U", "Parent" : "10"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "10"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47_U", "Parent" : "10"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48_U", "Parent" : "10"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49_U", "Parent" : "10"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.TW_COS_LUT25_U", "Parent" : "10"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.TW_SIN_LUT30_U", "Parent" : "10"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U16", "Parent" : "10"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U17", "Parent" : "10"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U18", "Parent" : "10"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U19", "Parent" : "10"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U20", "Parent" : "10"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U21", "Parent" : "10"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U22", "Parent" : "10"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U23", "Parent" : "10"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U24", "Parent" : "10"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U25", "Parent" : "10"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U26", "Parent" : "10"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U27", "Parent" : "10"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U28", "Parent" : "10"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U29", "Parent" : "10"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U30", "Parent" : "10"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U31", "Parent" : "10"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.flow_control_loop_pipe_U", "Parent" : "10"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0", "Parent" : "0", "Child" : ["39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc111",
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
		"StartSource" : "10",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U",
		"Port" : [
			{"Name" : "s1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "232", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["10"], "DependentChan" : "231", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT29", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "38"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38_U", "Parent" : "38"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39_U", "Parent" : "38"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40_U", "Parent" : "38"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "38"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41_U", "Parent" : "38"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42_U", "Parent" : "38"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43_U", "Parent" : "38"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.TW_COS_LUT24_U", "Parent" : "38"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.TW_SIN_LUT29_U", "Parent" : "38"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U40", "Parent" : "38"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U41", "Parent" : "38"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U42", "Parent" : "38"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U43", "Parent" : "38"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U44", "Parent" : "38"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U45", "Parent" : "38"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U46", "Parent" : "38"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U47", "Parent" : "38"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U48", "Parent" : "38"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U49", "Parent" : "38"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U50", "Parent" : "38"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U51", "Parent" : "38"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U52", "Parent" : "38"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U53", "Parent" : "38"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U54", "Parent" : "38"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U55", "Parent" : "38"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.flow_control_loop_pipe_U", "Parent" : "38"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0", "Parent" : "0", "Child" : ["67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc212",
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
		"StartSource" : "38",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U",
		"Port" : [
			{"Name" : "s2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["94"], "DependentChan" : "233", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["38"], "DependentChan" : "232", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT28", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "66"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32_U", "Parent" : "66"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33_U", "Parent" : "66"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34_U", "Parent" : "66"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "66"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35_U", "Parent" : "66"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36_U", "Parent" : "66"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37_U", "Parent" : "66"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.TW_COS_LUT23_U", "Parent" : "66"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.TW_SIN_LUT28_U", "Parent" : "66"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U59", "Parent" : "66"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U60", "Parent" : "66"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U61", "Parent" : "66"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U62", "Parent" : "66"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U63", "Parent" : "66"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U64", "Parent" : "66"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U65", "Parent" : "66"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U66", "Parent" : "66"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U67", "Parent" : "66"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U68", "Parent" : "66"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U69", "Parent" : "66"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U70", "Parent" : "66"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U71", "Parent" : "66"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U72", "Parent" : "66"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U73", "Parent" : "66"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U74", "Parent" : "66"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.flow_control_loop_pipe_U", "Parent" : "66"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0", "Parent" : "0", "Child" : ["95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc313",
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
		"StartSource" : "66",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U",
		"Port" : [
			{"Name" : "s3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["122"], "DependentChan" : "234", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "233", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT27", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "94"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26_U", "Parent" : "94"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27_U", "Parent" : "94"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28_U", "Parent" : "94"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "94"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29_U", "Parent" : "94"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30_U", "Parent" : "94"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31_U", "Parent" : "94"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.TW_COS_LUT22_U", "Parent" : "94"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.TW_SIN_LUT27_U", "Parent" : "94"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U78", "Parent" : "94"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U79", "Parent" : "94"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U80", "Parent" : "94"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U81", "Parent" : "94"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U82", "Parent" : "94"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U83", "Parent" : "94"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U84", "Parent" : "94"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U85", "Parent" : "94"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U86", "Parent" : "94"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U87", "Parent" : "94"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U88", "Parent" : "94"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U89", "Parent" : "94"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U90", "Parent" : "94"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U91", "Parent" : "94"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U92", "Parent" : "94"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U93", "Parent" : "94"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.flow_control_loop_pipe_U", "Parent" : "94"},
	{"ID" : "122", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0", "Parent" : "0", "Child" : ["123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc414",
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
		"StartSource" : "94",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U",
		"Port" : [
			{"Name" : "s4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["150"], "DependentChan" : "235", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["94"], "DependentChan" : "234", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT26", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "122"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20_U", "Parent" : "122"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21_U", "Parent" : "122"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22_U", "Parent" : "122"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "122"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23_U", "Parent" : "122"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24_U", "Parent" : "122"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25_U", "Parent" : "122"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.TW_COS_LUT21_U", "Parent" : "122"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.TW_SIN_LUT26_U", "Parent" : "122"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U97", "Parent" : "122"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U98", "Parent" : "122"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U99", "Parent" : "122"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U100", "Parent" : "122"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U101", "Parent" : "122"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U102", "Parent" : "122"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U103", "Parent" : "122"},
	{"ID" : "140", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U104", "Parent" : "122"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U105", "Parent" : "122"},
	{"ID" : "142", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U106", "Parent" : "122"},
	{"ID" : "143", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U107", "Parent" : "122"},
	{"ID" : "144", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U108", "Parent" : "122"},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U109", "Parent" : "122"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U110", "Parent" : "122"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U111", "Parent" : "122"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U112", "Parent" : "122"},
	{"ID" : "149", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.flow_control_loop_pipe_U", "Parent" : "122"},
	{"ID" : "150", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0", "Parent" : "0", "Child" : ["151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc515",
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
		"StartSource" : "122",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U",
		"Port" : [
			{"Name" : "s5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["180"], "DependentChan" : "236", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["122"], "DependentChan" : "235", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "151", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "150"},
	{"ID" : "152", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14_U", "Parent" : "150"},
	{"ID" : "153", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15_U", "Parent" : "150"},
	{"ID" : "154", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16_U", "Parent" : "150"},
	{"ID" : "155", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "150"},
	{"ID" : "156", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17_U", "Parent" : "150"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18_U", "Parent" : "150"},
	{"ID" : "158", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19_U", "Parent" : "150"},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.TW_COS_LUT_U", "Parent" : "150"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.TW_SIN_LUT_U", "Parent" : "150"},
	{"ID" : "161", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.sparsemux_7_32_16_1_1_U116", "Parent" : "150"},
	{"ID" : "162", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.sparsemux_7_32_16_1_1_U117", "Parent" : "150"},
	{"ID" : "163", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U118", "Parent" : "150"},
	{"ID" : "164", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U119", "Parent" : "150"},
	{"ID" : "165", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U120", "Parent" : "150"},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U121", "Parent" : "150"},
	{"ID" : "167", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U122", "Parent" : "150"},
	{"ID" : "168", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U123", "Parent" : "150"},
	{"ID" : "169", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U124", "Parent" : "150"},
	{"ID" : "170", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U125", "Parent" : "150"},
	{"ID" : "171", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U126", "Parent" : "150"},
	{"ID" : "172", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U127", "Parent" : "150"},
	{"ID" : "173", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U128", "Parent" : "150"},
	{"ID" : "174", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U129", "Parent" : "150"},
	{"ID" : "175", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U130", "Parent" : "150"},
	{"ID" : "176", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U131", "Parent" : "150"},
	{"ID" : "177", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U132", "Parent" : "150"},
	{"ID" : "178", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U133", "Parent" : "150"},
	{"ID" : "179", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.flow_control_loop_pipe_U", "Parent" : "150"},
	{"ID" : "180", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0", "Parent" : "0", "Child" : ["181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc616",
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
		"StartSource" : "150",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U",
		"Port" : [
			{"Name" : "s6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["202"], "DependentChan" : "237", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["150"], "DependentChan" : "236", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "181", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "180"},
	{"ID" : "182", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8_U", "Parent" : "180"},
	{"ID" : "183", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9_U", "Parent" : "180"},
	{"ID" : "184", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10_U", "Parent" : "180"},
	{"ID" : "185", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "180"},
	{"ID" : "186", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11_U", "Parent" : "180"},
	{"ID" : "187", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12_U", "Parent" : "180"},
	{"ID" : "188", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13_U", "Parent" : "180"},
	{"ID" : "189", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U141", "Parent" : "180"},
	{"ID" : "190", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U142", "Parent" : "180"},
	{"ID" : "191", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U143", "Parent" : "180"},
	{"ID" : "192", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16ns_31_1_1_U144", "Parent" : "180"},
	{"ID" : "193", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U145", "Parent" : "180"},
	{"ID" : "194", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U146", "Parent" : "180"},
	{"ID" : "195", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U147", "Parent" : "180"},
	{"ID" : "196", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_mulsub_16s_16s_31s_31_4_1_U148", "Parent" : "180"},
	{"ID" : "197", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U149", "Parent" : "180"},
	{"ID" : "198", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U150", "Parent" : "180"},
	{"ID" : "199", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U151", "Parent" : "180"},
	{"ID" : "200", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_mulsub_16s_16s_31s_31_4_1_U152", "Parent" : "180"},
	{"ID" : "201", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.flow_control_loop_pipe_U", "Parent" : "180"},
	{"ID" : "202", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0", "Parent" : "0", "Child" : ["203", "204", "205", "206", "207", "208", "209"],
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
		"StartSource" : "180",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U",
		"Port" : [
			{"Name" : "s7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["210"], "DependentChan" : "238", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["180"], "DependentChan" : "237", "DependentChanDepth" : "260", "DependentChanType" : "0",
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
	{"ID" : "203", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mul_16s_16ns_31_1_1_U157", "Parent" : "202"},
	{"ID" : "204", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mul_16s_16ns_31_1_1_U158", "Parent" : "202"},
	{"ID" : "205", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mac_muladd_16s_15ns_31s_31_4_1_U159", "Parent" : "202"},
	{"ID" : "206", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mac_muladd_16s_16s_31s_31_4_1_U160", "Parent" : "202"},
	{"ID" : "207", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.am_addmul_16s_16s_16s_31_4_1_U161", "Parent" : "202"},
	{"ID" : "208", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.am_submul_16s_16s_16s_31_4_1_U162", "Parent" : "202"},
	{"ID" : "209", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.flow_control_loop_pipe_U", "Parent" : "202"},
	{"ID" : "210", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc18_U0", "Parent" : "0", "Child" : ["211"],
		"CDFG" : "Loop_VITIS_LOOP_168_1_proc18",
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
		"StartSource" : "202",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U",
		"Port" : [
			{"Name" : "s7", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["202"], "DependentChan" : "238", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s8", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["212"], "DependentChan" : "239", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s8_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_168_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "211", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc18_U0.flow_control_loop_pipe_U", "Parent" : "210"},
	{"ID" : "212", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc819_U0", "Parent" : "0", "Child" : ["213"],
		"CDFG" : "Loop_VITIS_LOOP_168_1_proc819",
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
		"StartSource" : "210",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U",
		"Port" : [
			{"Name" : "s8", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "239", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s8_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["214"], "DependentChan" : "240", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s9_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_168_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "213", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc819_U0.flow_control_loop_pipe_U", "Parent" : "212"},
	{"ID" : "214", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Parent" : "0", "Child" : ["215"],
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
		"StartSource" : "212",
		"StartFifo" : "start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U",
		"Port" : [
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["212"], "DependentChan" : "240", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "s9", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["217"], "DependentChan" : "228",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["217"], "DependentChan" : "229",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "wr_bank", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "wr_cnt", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "215", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Parent" : "214", "Child" : ["216"],
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
	{"ID" : "216", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26.flow_control_loop_pipe_sequential_init_U", "Parent" : "215"},
	{"ID" : "217", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_read_loop_proc_U0", "Parent" : "0", "Child" : ["218"],
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "241", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["219"], "DependentChan" : "242", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "228"},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "229"}],
		"Loop" : [
			{"Name" : "read_loop", "PipelineType" : "NotSupport"}]},
	{"ID" : "218", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_read_loop_proc_U0.flow_control_loop_pipe_U", "Parent" : "217"},
	{"ID" : "219", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0", "Parent" : "0", "Child" : ["220", "221", "222", "223", "224", "225", "226", "227"],
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
		"StartSource" : "217",
		"StartFifo" : "start_for_word_to_axis_U0_U",
		"Port" : [
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["217"], "DependentChan" : "242", "DependentChanDepth" : "260", "DependentChanType" : "0",
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
	{"ID" : "220", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.flow_control_loop_pipe_U", "Parent" : "219"},
	{"ID" : "221", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_data_V_U", "Parent" : "219"},
	{"ID" : "222", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_keep_V_U", "Parent" : "219"},
	{"ID" : "223", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_strb_V_U", "Parent" : "219"},
	{"ID" : "224", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_user_V_U", "Parent" : "219"},
	{"ID" : "225", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_last_V_U", "Parent" : "219"},
	{"ID" : "226", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_id_V_U", "Parent" : "219"},
	{"ID" : "227", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_dest_V_U", "Parent" : "219"},
	{"ID" : "228", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U", "Parent" : "0"},
	{"ID" : "229", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U", "Parent" : "0"},
	{"ID" : "230", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w_in_U", "Parent" : "0"},
	{"ID" : "231", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s0_U", "Parent" : "0"},
	{"ID" : "232", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s1_U", "Parent" : "0"},
	{"ID" : "233", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s2_U", "Parent" : "0"},
	{"ID" : "234", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s3_U", "Parent" : "0"},
	{"ID" : "235", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s4_U", "Parent" : "0"},
	{"ID" : "236", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s5_U", "Parent" : "0"},
	{"ID" : "237", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s6_U", "Parent" : "0"},
	{"ID" : "238", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s7_U", "Parent" : "0"},
	{"ID" : "239", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s8_U", "Parent" : "0"},
	{"ID" : "240", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s9_U", "Parent" : "0"},
	{"ID" : "241", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rd_bank_cast_loc_channel_U", "Parent" : "0"},
	{"ID" : "242", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w_out_U", "Parent" : "0"},
	{"ID" : "243", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U", "Parent" : "0"},
	{"ID" : "244", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U", "Parent" : "0"},
	{"ID" : "245", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U", "Parent" : "0"},
	{"ID" : "246", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U", "Parent" : "0"},
	{"ID" : "247", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U", "Parent" : "0"},
	{"ID" : "248", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U", "Parent" : "0"},
	{"ID" : "249", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U", "Parent" : "0"},
	{"ID" : "250", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U", "Parent" : "0"},
	{"ID" : "251", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U", "Parent" : "0"},
	{"ID" : "252", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U", "Parent" : "0"},
	{"ID" : "253", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U", "Parent" : "0"},
	{"ID" : "254", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_word_to_axis_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_mdf {
		s_in_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_dest_V {Type I LastRead 0 FirstWrite -1}
		s_out_V_data_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_keep_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_strb_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_user_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_last_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_id_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_dest_V {Type O LastRead -1 FirstWrite 1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT25 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT30 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT24 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT29 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT23 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT28 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT22 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT27 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT21 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT26 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0 {Type IO LastRead -1 FirstWrite -1}
		wr_bank {Type IO LastRead -1 FirstWrite -1}
		wr_cnt {Type IO LastRead -1 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type IO LastRead -1 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type IO LastRead -1 FirstWrite -1}}
	axis_to_word {
		s_in_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_dest_V {Type I LastRead 0 FirstWrite -1}
		w_in {Type O LastRead -1 FirstWrite 1}}
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
		TW_SIN_LUT30 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc111 {
		s1 {Type O LastRead -1 FirstWrite 6}
		s0 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT24 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT29 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc212 {
		s2 {Type O LastRead -1 FirstWrite 6}
		s1 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT23 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT28 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc313 {
		s3 {Type O LastRead -1 FirstWrite 6}
		s2 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT22 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT27 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc414 {
		s4 {Type O LastRead -1 FirstWrite 6}
		s3 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT21 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT26 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc515 {
		s5 {Type O LastRead -1 FirstWrite 6}
		s4 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc616 {
		s6 {Type O LastRead -1 FirstWrite 6}
		s5 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13 {Type IO LastRead -1 FirstWrite -1}}
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
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0 {Type IO LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_168_1_proc18 {
		s7 {Type I LastRead 1 FirstWrite -1}
		s8 {Type O LastRead -1 FirstWrite 2}}
	Loop_VITIS_LOOP_168_1_proc819 {
		s8 {Type I LastRead 1 FirstWrite -1}
		s9 {Type O LastRead -1 FirstWrite 2}}
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
		wr_cnt {Type IO LastRead -1 FirstWrite -1}}
	Loop_read_loop_proc {
		p_read {Type I LastRead 0 FirstWrite -1}
		w_out {Type O LastRead -1 FirstWrite 2}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type I LastRead 0 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "581", "Max" : "581"}
	, {"Name" : "Interval", "Min" : "264", "Max" : "264"}
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
	s_in_V_dest_V { axis {  { s_in_TDEST in_data 0 1 }  { s_in_TVALID in_vld 0 1 }  { s_in_TREADY in_acc 1 1 } } }
	s_out_V_data_V { axis {  { s_out_TDATA out_data 1 128 } } }
	s_out_V_keep_V { axis {  { s_out_TKEEP out_data 1 16 } } }
	s_out_V_strb_V { axis {  { s_out_TSTRB out_data 1 16 } } }
	s_out_V_user_V { axis {  { s_out_TUSER out_data 1 1 } } }
	s_out_V_last_V { axis {  { s_out_TLAST out_data 1 1 } } }
	s_out_V_id_V { axis {  { s_out_TID out_data 1 1 } } }
	s_out_V_dest_V { axis {  { s_out_TDEST out_data 1 1 }  { s_out_TVALID out_vld 1 1 }  { s_out_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName fft_mdf
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {fft_mdf}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_in_V_data_V int 128 regular {axi_s 0 volatile  { s_in Data } }  }
	{ s_in_V_keep_V int 16 regular {axi_s 0 volatile  { s_in Keep } }  }
	{ s_in_V_strb_V int 16 regular {axi_s 0 volatile  { s_in Strb } }  }
	{ s_in_V_user_V int 1 regular {axi_s 0 volatile  { s_in User } }  }
	{ s_in_V_last_V int 1 regular {axi_s 0 volatile  { s_in Last } }  }
	{ s_in_V_id_V int 1 regular {axi_s 0 volatile  { s_in ID } }  }
	{ s_in_V_dest_V int 1 regular {axi_s 0 volatile  { s_in Dest } }  }
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
	{ "Name" : "s_in_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_out_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ s_in_TDATA sc_in sc_lv 128 signal 0 } 
	{ s_in_TKEEP sc_in sc_lv 16 signal 1 } 
	{ s_in_TSTRB sc_in sc_lv 16 signal 2 } 
	{ s_in_TUSER sc_in sc_lv 1 signal 3 } 
	{ s_in_TLAST sc_in sc_lv 1 signal 4 } 
	{ s_in_TID sc_in sc_lv 1 signal 5 } 
	{ s_in_TDEST sc_in sc_lv 1 signal 6 } 
	{ s_out_TDATA sc_out sc_lv 128 signal 7 } 
	{ s_out_TKEEP sc_out sc_lv 16 signal 8 } 
	{ s_out_TSTRB sc_out sc_lv 16 signal 9 } 
	{ s_out_TUSER sc_out sc_lv 1 signal 10 } 
	{ s_out_TLAST sc_out sc_lv 1 signal 11 } 
	{ s_out_TID sc_out sc_lv 1 signal 12 } 
	{ s_out_TDEST sc_out sc_lv 1 signal 13 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_in_TVALID sc_in sc_logic 1 invld 6 } 
	{ s_in_TREADY sc_out sc_logic 1 inacc 6 } 
	{ s_out_TVALID sc_out sc_logic 1 outvld 13 } 
	{ s_out_TREADY sc_in sc_logic 1 outacc 13 } 
}
set NewPortList {[ 
	{ "name": "s_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_in_V_data_V", "role": "default" }} , 
 	{ "name": "s_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_keep_V", "role": "default" }} , 
 	{ "name": "s_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_strb_V", "role": "default" }} , 
 	{ "name": "s_in_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_user_V", "role": "default" }} , 
 	{ "name": "s_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_last_V", "role": "default" }} , 
 	{ "name": "s_in_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_id_V", "role": "default" }} , 
 	{ "name": "s_in_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_out_V_data_V", "role": "default" }} , 
 	{ "name": "s_out_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_keep_V", "role": "default" }} , 
 	{ "name": "s_out_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_strb_V", "role": "default" }} , 
 	{ "name": "s_out_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_user_V", "role": "default" }} , 
 	{ "name": "s_out_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_last_V", "role": "default" }} , 
 	{ "name": "s_out_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_id_V", "role": "default" }} , 
 	{ "name": "s_out_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "s_out_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "10", "38", "66", "94", "122", "150", "180", "202", "210", "212", "214", "217", "219", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254"],
		"CDFG" : "fft_mdf",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "573", "EstimateLatencyMax" : "573",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "axis_to_word_U0"}],
		"OutputProcess" : [
			{"ID" : "219", "Name" : "word_to_axis_U0"}],
		"Port" : [
			{"Name" : "s_in_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_data_V"}]},
			{"Name" : "s_in_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_keep_V"}]},
			{"Name" : "s_in_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_strb_V"}]},
			{"Name" : "s_in_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_user_V"}]},
			{"Name" : "s_in_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_last_V"}]},
			{"Name" : "s_in_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_id_V"}]},
			{"Name" : "s_in_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_dest_V"}]},
			{"Name" : "s_out_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_data_V"}]},
			{"Name" : "s_out_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_keep_V"}]},
			{"Name" : "s_out_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_strb_V"}]},
			{"Name" : "s_out_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_user_V"}]},
			{"Name" : "s_out_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_last_V"}]},
			{"Name" : "s_out_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_id_V"}]},
			{"Name" : "s_out_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_dest_V"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49"}]},
			{"Name" : "TW_COS_LUT25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "TW_COS_LUT25"}]},
			{"Name" : "TW_SIN_LUT30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "TW_SIN_LUT30"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43"}]},
			{"Name" : "TW_COS_LUT24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "TW_COS_LUT24"}]},
			{"Name" : "TW_SIN_LUT29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "TW_SIN_LUT29"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37"}]},
			{"Name" : "TW_COS_LUT23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "TW_COS_LUT23"}]},
			{"Name" : "TW_SIN_LUT28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "TW_SIN_LUT28"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31"}]},
			{"Name" : "TW_COS_LUT22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "TW_COS_LUT22"}]},
			{"Name" : "TW_SIN_LUT27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "TW_SIN_LUT27"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25"}]},
			{"Name" : "TW_COS_LUT21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "TW_COS_LUT21"}]},
			{"Name" : "TW_SIN_LUT26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "TW_SIN_LUT26"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19"}]},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "TW_COS_LUT"}]},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "TW_SIN_LUT"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0"}]},
			{"Name" : "wr_bank", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "wr_bank"}]},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "wr_cnt"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank"},
					{"ID" : "217", "SubInstance" : "Loop_read_loop_proc_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1"},
					{"ID" : "217", "SubInstance" : "Loop_read_loop_proc_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9"],
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
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["10"], "DependentChan" : "230", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_in_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_301_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.flow_control_loop_pipe_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_data_V_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_keep_V_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_strb_V_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_user_V_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_last_V_U", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_id_V_U", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_dest_V_U", "Parent" : "1"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0", "Parent" : "0", "Child" : ["11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37"],
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
		"StartSource" : "1",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U",
		"Port" : [
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["38"], "DependentChan" : "231", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "230", "DependentChanDepth" : "260", "DependentChanType" : "0",
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
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44_U", "Parent" : "10"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45_U", "Parent" : "10"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46_U", "Parent" : "10"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "10"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47_U", "Parent" : "10"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48_U", "Parent" : "10"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49_U", "Parent" : "10"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.TW_COS_LUT25_U", "Parent" : "10"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.TW_SIN_LUT30_U", "Parent" : "10"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U16", "Parent" : "10"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U17", "Parent" : "10"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U18", "Parent" : "10"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U19", "Parent" : "10"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U20", "Parent" : "10"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U21", "Parent" : "10"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U22", "Parent" : "10"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U23", "Parent" : "10"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U24", "Parent" : "10"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U25", "Parent" : "10"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U26", "Parent" : "10"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U27", "Parent" : "10"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U28", "Parent" : "10"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U29", "Parent" : "10"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U30", "Parent" : "10"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U31", "Parent" : "10"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.flow_control_loop_pipe_U", "Parent" : "10"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0", "Parent" : "0", "Child" : ["39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc111",
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
		"StartSource" : "10",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U",
		"Port" : [
			{"Name" : "s1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "232", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["10"], "DependentChan" : "231", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT29", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "38"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38_U", "Parent" : "38"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39_U", "Parent" : "38"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40_U", "Parent" : "38"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "38"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41_U", "Parent" : "38"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42_U", "Parent" : "38"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43_U", "Parent" : "38"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.TW_COS_LUT24_U", "Parent" : "38"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.TW_SIN_LUT29_U", "Parent" : "38"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U40", "Parent" : "38"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U41", "Parent" : "38"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U42", "Parent" : "38"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U43", "Parent" : "38"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U44", "Parent" : "38"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U45", "Parent" : "38"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U46", "Parent" : "38"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U47", "Parent" : "38"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U48", "Parent" : "38"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U49", "Parent" : "38"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U50", "Parent" : "38"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U51", "Parent" : "38"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U52", "Parent" : "38"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U53", "Parent" : "38"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U54", "Parent" : "38"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U55", "Parent" : "38"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.flow_control_loop_pipe_U", "Parent" : "38"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0", "Parent" : "0", "Child" : ["67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc212",
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
		"StartSource" : "38",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U",
		"Port" : [
			{"Name" : "s2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["94"], "DependentChan" : "233", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["38"], "DependentChan" : "232", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT28", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "66"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32_U", "Parent" : "66"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33_U", "Parent" : "66"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34_U", "Parent" : "66"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "66"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35_U", "Parent" : "66"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36_U", "Parent" : "66"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37_U", "Parent" : "66"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.TW_COS_LUT23_U", "Parent" : "66"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.TW_SIN_LUT28_U", "Parent" : "66"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U59", "Parent" : "66"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U60", "Parent" : "66"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U61", "Parent" : "66"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U62", "Parent" : "66"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U63", "Parent" : "66"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U64", "Parent" : "66"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U65", "Parent" : "66"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U66", "Parent" : "66"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U67", "Parent" : "66"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U68", "Parent" : "66"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U69", "Parent" : "66"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U70", "Parent" : "66"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U71", "Parent" : "66"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U72", "Parent" : "66"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U73", "Parent" : "66"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U74", "Parent" : "66"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.flow_control_loop_pipe_U", "Parent" : "66"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0", "Parent" : "0", "Child" : ["95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc313",
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
		"StartSource" : "66",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U",
		"Port" : [
			{"Name" : "s3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["122"], "DependentChan" : "234", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "233", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT27", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "94"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26_U", "Parent" : "94"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27_U", "Parent" : "94"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28_U", "Parent" : "94"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "94"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29_U", "Parent" : "94"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30_U", "Parent" : "94"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31_U", "Parent" : "94"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.TW_COS_LUT22_U", "Parent" : "94"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.TW_SIN_LUT27_U", "Parent" : "94"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U78", "Parent" : "94"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U79", "Parent" : "94"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U80", "Parent" : "94"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U81", "Parent" : "94"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U82", "Parent" : "94"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U83", "Parent" : "94"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U84", "Parent" : "94"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U85", "Parent" : "94"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U86", "Parent" : "94"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U87", "Parent" : "94"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U88", "Parent" : "94"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U89", "Parent" : "94"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U90", "Parent" : "94"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U91", "Parent" : "94"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U92", "Parent" : "94"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U93", "Parent" : "94"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.flow_control_loop_pipe_U", "Parent" : "94"},
	{"ID" : "122", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0", "Parent" : "0", "Child" : ["123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc414",
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
		"StartSource" : "94",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U",
		"Port" : [
			{"Name" : "s4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["150"], "DependentChan" : "235", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["94"], "DependentChan" : "234", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT26", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "122"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20_U", "Parent" : "122"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21_U", "Parent" : "122"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22_U", "Parent" : "122"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "122"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23_U", "Parent" : "122"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24_U", "Parent" : "122"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25_U", "Parent" : "122"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.TW_COS_LUT21_U", "Parent" : "122"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.TW_SIN_LUT26_U", "Parent" : "122"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U97", "Parent" : "122"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U98", "Parent" : "122"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U99", "Parent" : "122"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U100", "Parent" : "122"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U101", "Parent" : "122"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U102", "Parent" : "122"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U103", "Parent" : "122"},
	{"ID" : "140", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U104", "Parent" : "122"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U105", "Parent" : "122"},
	{"ID" : "142", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U106", "Parent" : "122"},
	{"ID" : "143", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U107", "Parent" : "122"},
	{"ID" : "144", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U108", "Parent" : "122"},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U109", "Parent" : "122"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U110", "Parent" : "122"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U111", "Parent" : "122"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U112", "Parent" : "122"},
	{"ID" : "149", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.flow_control_loop_pipe_U", "Parent" : "122"},
	{"ID" : "150", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0", "Parent" : "0", "Child" : ["151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc515",
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
		"StartSource" : "122",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U",
		"Port" : [
			{"Name" : "s5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["180"], "DependentChan" : "236", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["122"], "DependentChan" : "235", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "151", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "150"},
	{"ID" : "152", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14_U", "Parent" : "150"},
	{"ID" : "153", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15_U", "Parent" : "150"},
	{"ID" : "154", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16_U", "Parent" : "150"},
	{"ID" : "155", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "150"},
	{"ID" : "156", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17_U", "Parent" : "150"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18_U", "Parent" : "150"},
	{"ID" : "158", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19_U", "Parent" : "150"},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.TW_COS_LUT_U", "Parent" : "150"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.TW_SIN_LUT_U", "Parent" : "150"},
	{"ID" : "161", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.sparsemux_7_32_16_1_1_U116", "Parent" : "150"},
	{"ID" : "162", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.sparsemux_7_32_16_1_1_U117", "Parent" : "150"},
	{"ID" : "163", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U118", "Parent" : "150"},
	{"ID" : "164", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U119", "Parent" : "150"},
	{"ID" : "165", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U120", "Parent" : "150"},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U121", "Parent" : "150"},
	{"ID" : "167", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U122", "Parent" : "150"},
	{"ID" : "168", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U123", "Parent" : "150"},
	{"ID" : "169", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U124", "Parent" : "150"},
	{"ID" : "170", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U125", "Parent" : "150"},
	{"ID" : "171", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U126", "Parent" : "150"},
	{"ID" : "172", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U127", "Parent" : "150"},
	{"ID" : "173", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U128", "Parent" : "150"},
	{"ID" : "174", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U129", "Parent" : "150"},
	{"ID" : "175", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U130", "Parent" : "150"},
	{"ID" : "176", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U131", "Parent" : "150"},
	{"ID" : "177", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U132", "Parent" : "150"},
	{"ID" : "178", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U133", "Parent" : "150"},
	{"ID" : "179", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.flow_control_loop_pipe_U", "Parent" : "150"},
	{"ID" : "180", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0", "Parent" : "0", "Child" : ["181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc616",
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
		"StartSource" : "150",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U",
		"Port" : [
			{"Name" : "s6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["202"], "DependentChan" : "237", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["150"], "DependentChan" : "236", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "181", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "180"},
	{"ID" : "182", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8_U", "Parent" : "180"},
	{"ID" : "183", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9_U", "Parent" : "180"},
	{"ID" : "184", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10_U", "Parent" : "180"},
	{"ID" : "185", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "180"},
	{"ID" : "186", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11_U", "Parent" : "180"},
	{"ID" : "187", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12_U", "Parent" : "180"},
	{"ID" : "188", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13_U", "Parent" : "180"},
	{"ID" : "189", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U141", "Parent" : "180"},
	{"ID" : "190", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U142", "Parent" : "180"},
	{"ID" : "191", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U143", "Parent" : "180"},
	{"ID" : "192", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U144", "Parent" : "180"},
	{"ID" : "193", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U145", "Parent" : "180"},
	{"ID" : "194", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16ns_31_1_1_U146", "Parent" : "180"},
	{"ID" : "195", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U147", "Parent" : "180"},
	{"ID" : "196", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_mulsub_16s_16s_31s_31_4_1_U148", "Parent" : "180"},
	{"ID" : "197", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U149", "Parent" : "180"},
	{"ID" : "198", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U150", "Parent" : "180"},
	{"ID" : "199", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U151", "Parent" : "180"},
	{"ID" : "200", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_mulsub_16s_16s_31s_31_4_1_U152", "Parent" : "180"},
	{"ID" : "201", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.flow_control_loop_pipe_U", "Parent" : "180"},
	{"ID" : "202", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0", "Parent" : "0", "Child" : ["203", "204", "205", "206", "207", "208", "209"],
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
		"StartSource" : "180",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U",
		"Port" : [
			{"Name" : "s7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["210"], "DependentChan" : "238", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["180"], "DependentChan" : "237", "DependentChanDepth" : "260", "DependentChanType" : "0",
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
	{"ID" : "203", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mul_16s_16ns_31_1_1_U157", "Parent" : "202"},
	{"ID" : "204", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mul_16s_16ns_31_1_1_U158", "Parent" : "202"},
	{"ID" : "205", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mac_muladd_16s_15ns_31s_31_4_1_U159", "Parent" : "202"},
	{"ID" : "206", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mac_muladd_16s_16s_31s_31_4_1_U160", "Parent" : "202"},
	{"ID" : "207", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.am_addmul_16s_16s_16s_31_4_1_U161", "Parent" : "202"},
	{"ID" : "208", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.am_submul_16s_16s_16s_31_4_1_U162", "Parent" : "202"},
	{"ID" : "209", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.flow_control_loop_pipe_U", "Parent" : "202"},
	{"ID" : "210", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc18_U0", "Parent" : "0", "Child" : ["211"],
		"CDFG" : "Loop_VITIS_LOOP_168_1_proc18",
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
		"StartSource" : "202",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U",
		"Port" : [
			{"Name" : "s7", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["202"], "DependentChan" : "238", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s8", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["212"], "DependentChan" : "239", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s8_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_168_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "211", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc18_U0.flow_control_loop_pipe_U", "Parent" : "210"},
	{"ID" : "212", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc819_U0", "Parent" : "0", "Child" : ["213"],
		"CDFG" : "Loop_VITIS_LOOP_168_1_proc819",
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
		"StartSource" : "210",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U",
		"Port" : [
			{"Name" : "s8", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "239", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s8_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["214"], "DependentChan" : "240", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s9_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_168_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "213", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc819_U0.flow_control_loop_pipe_U", "Parent" : "212"},
	{"ID" : "214", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Parent" : "0", "Child" : ["215"],
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
		"StartSource" : "212",
		"StartFifo" : "start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U",
		"Port" : [
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["212"], "DependentChan" : "240", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "s9", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["217"], "DependentChan" : "228",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["217"], "DependentChan" : "229",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "wr_bank", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "wr_cnt", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "215", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Parent" : "214", "Child" : ["216"],
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
	{"ID" : "216", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26.flow_control_loop_pipe_sequential_init_U", "Parent" : "215"},
	{"ID" : "217", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_read_loop_proc_U0", "Parent" : "0", "Child" : ["218"],
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "241", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["219"], "DependentChan" : "242", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "228"},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "229"}],
		"Loop" : [
			{"Name" : "read_loop", "PipelineType" : "NotSupport"}]},
	{"ID" : "218", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_read_loop_proc_U0.flow_control_loop_pipe_U", "Parent" : "217"},
	{"ID" : "219", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0", "Parent" : "0", "Child" : ["220", "221", "222", "223", "224", "225", "226", "227"],
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
		"StartSource" : "217",
		"StartFifo" : "start_for_word_to_axis_U0_U",
		"Port" : [
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["217"], "DependentChan" : "242", "DependentChanDepth" : "260", "DependentChanType" : "0",
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
	{"ID" : "220", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.flow_control_loop_pipe_U", "Parent" : "219"},
	{"ID" : "221", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_data_V_U", "Parent" : "219"},
	{"ID" : "222", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_keep_V_U", "Parent" : "219"},
	{"ID" : "223", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_strb_V_U", "Parent" : "219"},
	{"ID" : "224", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_user_V_U", "Parent" : "219"},
	{"ID" : "225", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_last_V_U", "Parent" : "219"},
	{"ID" : "226", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_id_V_U", "Parent" : "219"},
	{"ID" : "227", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_dest_V_U", "Parent" : "219"},
	{"ID" : "228", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U", "Parent" : "0"},
	{"ID" : "229", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U", "Parent" : "0"},
	{"ID" : "230", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w_in_U", "Parent" : "0"},
	{"ID" : "231", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s0_U", "Parent" : "0"},
	{"ID" : "232", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s1_U", "Parent" : "0"},
	{"ID" : "233", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s2_U", "Parent" : "0"},
	{"ID" : "234", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s3_U", "Parent" : "0"},
	{"ID" : "235", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s4_U", "Parent" : "0"},
	{"ID" : "236", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s5_U", "Parent" : "0"},
	{"ID" : "237", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s6_U", "Parent" : "0"},
	{"ID" : "238", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s7_U", "Parent" : "0"},
	{"ID" : "239", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s8_U", "Parent" : "0"},
	{"ID" : "240", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s9_U", "Parent" : "0"},
	{"ID" : "241", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rd_bank_cast_loc_channel_U", "Parent" : "0"},
	{"ID" : "242", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w_out_U", "Parent" : "0"},
	{"ID" : "243", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U", "Parent" : "0"},
	{"ID" : "244", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U", "Parent" : "0"},
	{"ID" : "245", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U", "Parent" : "0"},
	{"ID" : "246", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U", "Parent" : "0"},
	{"ID" : "247", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U", "Parent" : "0"},
	{"ID" : "248", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U", "Parent" : "0"},
	{"ID" : "249", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U", "Parent" : "0"},
	{"ID" : "250", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U", "Parent" : "0"},
	{"ID" : "251", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U", "Parent" : "0"},
	{"ID" : "252", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U", "Parent" : "0"},
	{"ID" : "253", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U", "Parent" : "0"},
	{"ID" : "254", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_word_to_axis_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_mdf {
		s_in_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_dest_V {Type I LastRead 0 FirstWrite -1}
		s_out_V_data_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_keep_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_strb_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_user_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_last_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_id_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_dest_V {Type O LastRead -1 FirstWrite 1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT25 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT30 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT24 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT29 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT23 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT28 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT22 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT27 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT21 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT26 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0 {Type IO LastRead -1 FirstWrite -1}
		wr_bank {Type IO LastRead -1 FirstWrite -1}
		wr_cnt {Type IO LastRead -1 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type IO LastRead -1 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type IO LastRead -1 FirstWrite -1}}
	axis_to_word {
		s_in_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_dest_V {Type I LastRead 0 FirstWrite -1}
		w_in {Type O LastRead -1 FirstWrite 1}}
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
		TW_SIN_LUT30 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc111 {
		s1 {Type O LastRead -1 FirstWrite 5}
		s0 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT24 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT29 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc212 {
		s2 {Type O LastRead -1 FirstWrite 5}
		s1 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT23 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT28 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc313 {
		s3 {Type O LastRead -1 FirstWrite 5}
		s2 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT22 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT27 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc414 {
		s4 {Type O LastRead -1 FirstWrite 5}
		s3 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT21 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT26 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc515 {
		s5 {Type O LastRead -1 FirstWrite 5}
		s4 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc616 {
		s6 {Type O LastRead -1 FirstWrite 5}
		s5 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13 {Type IO LastRead -1 FirstWrite -1}}
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
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0 {Type IO LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_168_1_proc18 {
		s7 {Type I LastRead 1 FirstWrite -1}
		s8 {Type O LastRead -1 FirstWrite 2}}
	Loop_VITIS_LOOP_168_1_proc819 {
		s8 {Type I LastRead 1 FirstWrite -1}
		s9 {Type O LastRead -1 FirstWrite 2}}
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
		wr_cnt {Type IO LastRead -1 FirstWrite -1}}
	Loop_read_loop_proc {
		p_read {Type I LastRead 0 FirstWrite -1}
		w_out {Type O LastRead -1 FirstWrite 2}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type I LastRead 0 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "573", "Max" : "573"}
	, {"Name" : "Interval", "Min" : "263", "Max" : "263"}
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
	s_in_V_dest_V { axis {  { s_in_TDEST in_data 0 1 }  { s_in_TVALID in_vld 0 1 }  { s_in_TREADY in_acc 1 1 } } }
	s_out_V_data_V { axis {  { s_out_TDATA out_data 1 128 } } }
	s_out_V_keep_V { axis {  { s_out_TKEEP out_data 1 16 } } }
	s_out_V_strb_V { axis {  { s_out_TSTRB out_data 1 16 } } }
	s_out_V_user_V { axis {  { s_out_TUSER out_data 1 1 } } }
	s_out_V_last_V { axis {  { s_out_TLAST out_data 1 1 } } }
	s_out_V_id_V { axis {  { s_out_TID out_data 1 1 } } }
	s_out_V_dest_V { axis {  { s_out_TDEST out_data 1 1 }  { s_out_TVALID out_vld 1 1 }  { s_out_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName fft_mdf
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {fft_mdf}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_in_V_data_V int 128 regular {axi_s 0 volatile  { s_in Data } }  }
	{ s_in_V_keep_V int 16 regular {axi_s 0 volatile  { s_in Keep } }  }
	{ s_in_V_strb_V int 16 regular {axi_s 0 volatile  { s_in Strb } }  }
	{ s_in_V_user_V int 1 regular {axi_s 0 volatile  { s_in User } }  }
	{ s_in_V_last_V int 1 regular {axi_s 0 volatile  { s_in Last } }  }
	{ s_in_V_id_V int 1 regular {axi_s 0 volatile  { s_in ID } }  }
	{ s_in_V_dest_V int 1 regular {axi_s 0 volatile  { s_in Dest } }  }
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
	{ "Name" : "s_in_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_in_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_out_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_out_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ s_in_TDATA sc_in sc_lv 128 signal 0 } 
	{ s_in_TKEEP sc_in sc_lv 16 signal 1 } 
	{ s_in_TSTRB sc_in sc_lv 16 signal 2 } 
	{ s_in_TUSER sc_in sc_lv 1 signal 3 } 
	{ s_in_TLAST sc_in sc_lv 1 signal 4 } 
	{ s_in_TID sc_in sc_lv 1 signal 5 } 
	{ s_in_TDEST sc_in sc_lv 1 signal 6 } 
	{ s_out_TDATA sc_out sc_lv 128 signal 7 } 
	{ s_out_TKEEP sc_out sc_lv 16 signal 8 } 
	{ s_out_TSTRB sc_out sc_lv 16 signal 9 } 
	{ s_out_TUSER sc_out sc_lv 1 signal 10 } 
	{ s_out_TLAST sc_out sc_lv 1 signal 11 } 
	{ s_out_TID sc_out sc_lv 1 signal 12 } 
	{ s_out_TDEST sc_out sc_lv 1 signal 13 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_in_TVALID sc_in sc_logic 1 invld 6 } 
	{ s_in_TREADY sc_out sc_logic 1 inacc 6 } 
	{ s_out_TVALID sc_out sc_logic 1 outvld 13 } 
	{ s_out_TREADY sc_in sc_logic 1 outacc 13 } 
}
set NewPortList {[ 
	{ "name": "s_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_in_V_data_V", "role": "default" }} , 
 	{ "name": "s_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_keep_V", "role": "default" }} , 
 	{ "name": "s_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_in_V_strb_V", "role": "default" }} , 
 	{ "name": "s_in_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_user_V", "role": "default" }} , 
 	{ "name": "s_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_last_V", "role": "default" }} , 
 	{ "name": "s_in_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_id_V", "role": "default" }} , 
 	{ "name": "s_in_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "s_out_V_data_V", "role": "default" }} , 
 	{ "name": "s_out_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_keep_V", "role": "default" }} , 
 	{ "name": "s_out_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "s_out_V_strb_V", "role": "default" }} , 
 	{ "name": "s_out_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_user_V", "role": "default" }} , 
 	{ "name": "s_out_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_last_V", "role": "default" }} , 
 	{ "name": "s_out_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_id_V", "role": "default" }} , 
 	{ "name": "s_out_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_in_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_out_V_dest_V", "role": "default" }} , 
 	{ "name": "s_out_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "s_out_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "10", "38", "66", "94", "122", "150", "180", "202", "210", "212", "214", "217", "219", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254"],
		"CDFG" : "fft_mdf",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "573", "EstimateLatencyMax" : "573",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "axis_to_word_U0"}],
		"OutputProcess" : [
			{"ID" : "219", "Name" : "word_to_axis_U0"}],
		"Port" : [
			{"Name" : "s_in_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_data_V"}]},
			{"Name" : "s_in_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_keep_V"}]},
			{"Name" : "s_in_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_strb_V"}]},
			{"Name" : "s_in_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_user_V"}]},
			{"Name" : "s_in_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_last_V"}]},
			{"Name" : "s_in_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_id_V"}]},
			{"Name" : "s_in_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "s_in",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "axis_to_word_U0", "Port" : "s_in_V_dest_V"}]},
			{"Name" : "s_out_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_data_V"}]},
			{"Name" : "s_out_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_keep_V"}]},
			{"Name" : "s_out_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_strb_V"}]},
			{"Name" : "s_out_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_user_V"}]},
			{"Name" : "s_out_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_last_V"}]},
			{"Name" : "s_out_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_id_V"}]},
			{"Name" : "s_out_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "s_out",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "word_to_axis_U0", "Port" : "s_out_V_dest_V"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48"}]},
			{"Name" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49"}]},
			{"Name" : "TW_COS_LUT25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "TW_COS_LUT25"}]},
			{"Name" : "TW_SIN_LUT30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc10_U0", "Port" : "TW_SIN_LUT30"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43"}]},
			{"Name" : "TW_COS_LUT24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "TW_COS_LUT24"}]},
			{"Name" : "TW_SIN_LUT29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc111_U0", "Port" : "TW_SIN_LUT29"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37"}]},
			{"Name" : "TW_COS_LUT23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "TW_COS_LUT23"}]},
			{"Name" : "TW_SIN_LUT28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc212_U0", "Port" : "TW_SIN_LUT28"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31"}]},
			{"Name" : "TW_COS_LUT22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "TW_COS_LUT22"}]},
			{"Name" : "TW_SIN_LUT27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc313_U0", "Port" : "TW_SIN_LUT27"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25"}]},
			{"Name" : "TW_COS_LUT21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "TW_COS_LUT21"}]},
			{"Name" : "TW_SIN_LUT26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc414_U0", "Port" : "TW_SIN_LUT26"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19"}]},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "TW_COS_LUT"}]},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc515_U0", "Port" : "TW_SIN_LUT"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc616_U0", "Port" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0"}]},
			{"Name" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "Loop_VITIS_LOOP_95_1_proc717_U0", "Port" : "void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0"}]},
			{"Name" : "wr_bank", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "wr_bank"}]},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "wr_cnt"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank"},
					{"ID" : "217", "SubInstance" : "Loop_read_loop_proc_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1"},
					{"ID" : "217", "SubInstance" : "Loop_read_loop_proc_U0", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9"],
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
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["10"], "DependentChan" : "230", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_in_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_301_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.flow_control_loop_pipe_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_data_V_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_keep_V_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_strb_V_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_user_V_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_last_V_U", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_id_V_U", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.axis_to_word_U0.regslice_both_s_in_V_dest_V_U", "Parent" : "1"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0", "Parent" : "0", "Child" : ["11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37"],
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
		"StartSource" : "1",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U",
		"Port" : [
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["38"], "DependentChan" : "231", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "230", "DependentChanDepth" : "260", "DependentChanType" : "0",
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
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44_U", "Parent" : "10"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45_U", "Parent" : "10"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46_U", "Parent" : "10"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "10"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47_U", "Parent" : "10"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48_U", "Parent" : "10"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49_U", "Parent" : "10"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.TW_COS_LUT25_U", "Parent" : "10"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.TW_SIN_LUT30_U", "Parent" : "10"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U16", "Parent" : "10"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U17", "Parent" : "10"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U18", "Parent" : "10"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U19", "Parent" : "10"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U20", "Parent" : "10"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U21", "Parent" : "10"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U22", "Parent" : "10"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mul_16s_16s_31_1_1_U23", "Parent" : "10"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U24", "Parent" : "10"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U25", "Parent" : "10"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U26", "Parent" : "10"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U27", "Parent" : "10"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U28", "Parent" : "10"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U29", "Parent" : "10"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_muladd_16s_16s_31s_31_4_1_U30", "Parent" : "10"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.mac_mulsub_16s_16s_31s_31_4_1_U31", "Parent" : "10"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc10_U0.flow_control_loop_pipe_U", "Parent" : "10"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0", "Parent" : "0", "Child" : ["39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc111",
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
		"StartSource" : "10",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U",
		"Port" : [
			{"Name" : "s1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "232", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["10"], "DependentChan" : "231", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT29", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "38"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38_U", "Parent" : "38"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39_U", "Parent" : "38"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40_U", "Parent" : "38"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "38"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41_U", "Parent" : "38"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42_U", "Parent" : "38"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43_U", "Parent" : "38"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.TW_COS_LUT24_U", "Parent" : "38"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.TW_SIN_LUT29_U", "Parent" : "38"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U40", "Parent" : "38"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U41", "Parent" : "38"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U42", "Parent" : "38"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U43", "Parent" : "38"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U44", "Parent" : "38"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U45", "Parent" : "38"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U46", "Parent" : "38"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mul_16s_16s_31_1_1_U47", "Parent" : "38"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U48", "Parent" : "38"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U49", "Parent" : "38"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U50", "Parent" : "38"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U51", "Parent" : "38"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U52", "Parent" : "38"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U53", "Parent" : "38"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_muladd_16s_16s_31s_31_4_1_U54", "Parent" : "38"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.mac_mulsub_16s_16s_31s_31_4_1_U55", "Parent" : "38"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc111_U0.flow_control_loop_pipe_U", "Parent" : "38"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0", "Parent" : "0", "Child" : ["67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc212",
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
		"StartSource" : "38",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U",
		"Port" : [
			{"Name" : "s2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["94"], "DependentChan" : "233", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["38"], "DependentChan" : "232", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT28", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "66"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32_U", "Parent" : "66"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33_U", "Parent" : "66"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34_U", "Parent" : "66"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "66"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35_U", "Parent" : "66"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36_U", "Parent" : "66"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37_U", "Parent" : "66"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.TW_COS_LUT23_U", "Parent" : "66"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.TW_SIN_LUT28_U", "Parent" : "66"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U59", "Parent" : "66"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U60", "Parent" : "66"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U61", "Parent" : "66"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U62", "Parent" : "66"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U63", "Parent" : "66"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U64", "Parent" : "66"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U65", "Parent" : "66"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mul_16s_16s_31_1_1_U66", "Parent" : "66"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U67", "Parent" : "66"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U68", "Parent" : "66"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U69", "Parent" : "66"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U70", "Parent" : "66"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U71", "Parent" : "66"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U72", "Parent" : "66"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_muladd_16s_16s_31s_31_4_1_U73", "Parent" : "66"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.mac_mulsub_16s_16s_31s_31_4_1_U74", "Parent" : "66"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc212_U0.flow_control_loop_pipe_U", "Parent" : "66"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0", "Parent" : "0", "Child" : ["95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc313",
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
		"StartSource" : "66",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U",
		"Port" : [
			{"Name" : "s3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["122"], "DependentChan" : "234", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "233", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT27", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "94"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26_U", "Parent" : "94"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27_U", "Parent" : "94"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28_U", "Parent" : "94"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "94"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29_U", "Parent" : "94"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30_U", "Parent" : "94"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31_U", "Parent" : "94"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.TW_COS_LUT22_U", "Parent" : "94"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.TW_SIN_LUT27_U", "Parent" : "94"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U78", "Parent" : "94"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U79", "Parent" : "94"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U80", "Parent" : "94"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U81", "Parent" : "94"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U82", "Parent" : "94"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U83", "Parent" : "94"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U84", "Parent" : "94"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mul_16s_16s_31_1_1_U85", "Parent" : "94"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U86", "Parent" : "94"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U87", "Parent" : "94"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U88", "Parent" : "94"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U89", "Parent" : "94"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U90", "Parent" : "94"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U91", "Parent" : "94"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_muladd_16s_16s_31s_31_4_1_U92", "Parent" : "94"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.mac_mulsub_16s_16s_31s_31_4_1_U93", "Parent" : "94"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc313_U0.flow_control_loop_pipe_U", "Parent" : "94"},
	{"ID" : "122", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0", "Parent" : "0", "Child" : ["123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc414",
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
		"StartSource" : "94",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U",
		"Port" : [
			{"Name" : "s4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["150"], "DependentChan" : "235", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["94"], "DependentChan" : "234", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT26", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "122"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20_U", "Parent" : "122"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21_U", "Parent" : "122"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22_U", "Parent" : "122"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "122"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23_U", "Parent" : "122"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24_U", "Parent" : "122"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25_U", "Parent" : "122"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.TW_COS_LUT21_U", "Parent" : "122"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.TW_SIN_LUT26_U", "Parent" : "122"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U97", "Parent" : "122"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U98", "Parent" : "122"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U99", "Parent" : "122"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U100", "Parent" : "122"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U101", "Parent" : "122"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U102", "Parent" : "122"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U103", "Parent" : "122"},
	{"ID" : "140", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mul_16s_16s_31_1_1_U104", "Parent" : "122"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U105", "Parent" : "122"},
	{"ID" : "142", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U106", "Parent" : "122"},
	{"ID" : "143", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U107", "Parent" : "122"},
	{"ID" : "144", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U108", "Parent" : "122"},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U109", "Parent" : "122"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U110", "Parent" : "122"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_muladd_16s_16s_31s_31_4_1_U111", "Parent" : "122"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.mac_mulsub_16s_16s_31s_31_4_1_U112", "Parent" : "122"},
	{"ID" : "149", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc414_U0.flow_control_loop_pipe_U", "Parent" : "122"},
	{"ID" : "150", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0", "Parent" : "0", "Child" : ["151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc515",
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
		"StartSource" : "122",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U",
		"Port" : [
			{"Name" : "s5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["180"], "DependentChan" : "236", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["122"], "DependentChan" : "235", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "TW_COS_LUT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TW_SIN_LUT", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "151", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "150"},
	{"ID" : "152", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14_U", "Parent" : "150"},
	{"ID" : "153", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15_U", "Parent" : "150"},
	{"ID" : "154", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16_U", "Parent" : "150"},
	{"ID" : "155", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "150"},
	{"ID" : "156", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17_U", "Parent" : "150"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18_U", "Parent" : "150"},
	{"ID" : "158", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19_U", "Parent" : "150"},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.TW_COS_LUT_U", "Parent" : "150"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.TW_SIN_LUT_U", "Parent" : "150"},
	{"ID" : "161", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.sparsemux_7_32_16_1_1_U116", "Parent" : "150"},
	{"ID" : "162", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.sparsemux_7_32_16_1_1_U117", "Parent" : "150"},
	{"ID" : "163", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U118", "Parent" : "150"},
	{"ID" : "164", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U119", "Parent" : "150"},
	{"ID" : "165", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U120", "Parent" : "150"},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U121", "Parent" : "150"},
	{"ID" : "167", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U122", "Parent" : "150"},
	{"ID" : "168", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U123", "Parent" : "150"},
	{"ID" : "169", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U124", "Parent" : "150"},
	{"ID" : "170", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mul_16s_16s_31_1_1_U125", "Parent" : "150"},
	{"ID" : "171", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U126", "Parent" : "150"},
	{"ID" : "172", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U127", "Parent" : "150"},
	{"ID" : "173", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U128", "Parent" : "150"},
	{"ID" : "174", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U129", "Parent" : "150"},
	{"ID" : "175", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U130", "Parent" : "150"},
	{"ID" : "176", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U131", "Parent" : "150"},
	{"ID" : "177", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_muladd_16s_16s_31s_31_4_1_U132", "Parent" : "150"},
	{"ID" : "178", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.mac_mulsub_16s_16s_31s_31_4_1_U133", "Parent" : "150"},
	{"ID" : "179", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc515_U0.flow_control_loop_pipe_U", "Parent" : "150"},
	{"ID" : "180", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0", "Parent" : "0", "Child" : ["181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201"],
		"CDFG" : "Loop_VITIS_LOOP_95_1_proc616",
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
		"StartSource" : "150",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U",
		"Port" : [
			{"Name" : "s6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["202"], "DependentChan" : "237", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["150"], "DependentChan" : "236", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "181", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_U", "Parent" : "180"},
	{"ID" : "182", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8_U", "Parent" : "180"},
	{"ID" : "183", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9_U", "Parent" : "180"},
	{"ID" : "184", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10_U", "Parent" : "180"},
	{"ID" : "185", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_U", "Parent" : "180"},
	{"ID" : "186", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11_U", "Parent" : "180"},
	{"ID" : "187", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12_U", "Parent" : "180"},
	{"ID" : "188", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13_U", "Parent" : "180"},
	{"ID" : "189", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U141", "Parent" : "180"},
	{"ID" : "190", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U142", "Parent" : "180"},
	{"ID" : "191", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U143", "Parent" : "180"},
	{"ID" : "192", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U144", "Parent" : "180"},
	{"ID" : "193", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16s_31_1_1_U145", "Parent" : "180"},
	{"ID" : "194", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mul_16s_16ns_31_1_1_U146", "Parent" : "180"},
	{"ID" : "195", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U147", "Parent" : "180"},
	{"ID" : "196", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_mulsub_16s_16s_31s_31_4_1_U148", "Parent" : "180"},
	{"ID" : "197", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U149", "Parent" : "180"},
	{"ID" : "198", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U150", "Parent" : "180"},
	{"ID" : "199", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_muladd_16s_16s_31s_31_4_1_U151", "Parent" : "180"},
	{"ID" : "200", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.mac_mulsub_16s_16s_31s_31_4_1_U152", "Parent" : "180"},
	{"ID" : "201", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc616_U0.flow_control_loop_pipe_U", "Parent" : "180"},
	{"ID" : "202", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0", "Parent" : "0", "Child" : ["203", "204", "205", "206", "207", "208", "209"],
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
		"StartSource" : "180",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U",
		"Port" : [
			{"Name" : "s7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["210"], "DependentChan" : "238", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["180"], "DependentChan" : "237", "DependentChanDepth" : "260", "DependentChanType" : "0",
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
	{"ID" : "203", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mul_16s_16ns_31_1_1_U157", "Parent" : "202"},
	{"ID" : "204", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mul_16s_16ns_31_1_1_U158", "Parent" : "202"},
	{"ID" : "205", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mac_muladd_16s_15ns_31s_31_4_1_U159", "Parent" : "202"},
	{"ID" : "206", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.mac_muladd_16s_16s_31s_31_4_1_U160", "Parent" : "202"},
	{"ID" : "207", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.am_addmul_16s_16s_16s_31_4_1_U161", "Parent" : "202"},
	{"ID" : "208", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.am_submul_16s_16s_16s_31_4_1_U162", "Parent" : "202"},
	{"ID" : "209", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_95_1_proc717_U0.flow_control_loop_pipe_U", "Parent" : "202"},
	{"ID" : "210", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc18_U0", "Parent" : "0", "Child" : ["211"],
		"CDFG" : "Loop_VITIS_LOOP_168_1_proc18",
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
		"StartSource" : "202",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U",
		"Port" : [
			{"Name" : "s7", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["202"], "DependentChan" : "238", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s8", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["212"], "DependentChan" : "239", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s8_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_168_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "211", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc18_U0.flow_control_loop_pipe_U", "Parent" : "210"},
	{"ID" : "212", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc819_U0", "Parent" : "0", "Child" : ["213"],
		"CDFG" : "Loop_VITIS_LOOP_168_1_proc819",
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
		"StartSource" : "210",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U",
		"Port" : [
			{"Name" : "s8", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "239", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s8_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["214"], "DependentChan" : "240", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s9_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_168_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "213", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_168_1_proc819_U0.flow_control_loop_pipe_U", "Parent" : "212"},
	{"ID" : "214", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0", "Parent" : "0", "Child" : ["215"],
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
		"StartSource" : "212",
		"StartFifo" : "start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U",
		"Port" : [
			{"Name" : "s9", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["212"], "DependentChan" : "240", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "s9", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["217"], "DependentChan" : "228",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "O", "DependentProc" : ["217"], "DependentChan" : "229",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "wr_bank", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wr_cnt", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Port" : "wr_cnt", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "215", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26", "Parent" : "214", "Child" : ["216"],
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
	{"ID" : "216", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26.flow_control_loop_pipe_sequential_init_U", "Parent" : "215"},
	{"ID" : "217", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_read_loop_proc_U0", "Parent" : "0", "Child" : ["218"],
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "241", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["219"], "DependentChan" : "242", "DependentChanDepth" : "260", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "228"},
			{"Name" : "bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "229"}],
		"Loop" : [
			{"Name" : "read_loop", "PipelineType" : "NotSupport"}]},
	{"ID" : "218", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_read_loop_proc_U0.flow_control_loop_pipe_U", "Parent" : "217"},
	{"ID" : "219", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0", "Parent" : "0", "Child" : ["220", "221", "222", "223", "224", "225", "226", "227"],
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
		"StartSource" : "217",
		"StartFifo" : "start_for_word_to_axis_U0_U",
		"Port" : [
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["217"], "DependentChan" : "242", "DependentChanDepth" : "260", "DependentChanType" : "0",
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
	{"ID" : "220", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.flow_control_loop_pipe_U", "Parent" : "219"},
	{"ID" : "221", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_data_V_U", "Parent" : "219"},
	{"ID" : "222", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_keep_V_U", "Parent" : "219"},
	{"ID" : "223", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_strb_V_U", "Parent" : "219"},
	{"ID" : "224", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_user_V_U", "Parent" : "219"},
	{"ID" : "225", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_last_V_U", "Parent" : "219"},
	{"ID" : "226", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_id_V_U", "Parent" : "219"},
	{"ID" : "227", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.word_to_axis_U0.regslice_both_s_out_V_dest_V_U", "Parent" : "219"},
	{"ID" : "228", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U", "Parent" : "0"},
	{"ID" : "229", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U", "Parent" : "0"},
	{"ID" : "230", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w_in_U", "Parent" : "0"},
	{"ID" : "231", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s0_U", "Parent" : "0"},
	{"ID" : "232", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s1_U", "Parent" : "0"},
	{"ID" : "233", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s2_U", "Parent" : "0"},
	{"ID" : "234", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s3_U", "Parent" : "0"},
	{"ID" : "235", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s4_U", "Parent" : "0"},
	{"ID" : "236", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s5_U", "Parent" : "0"},
	{"ID" : "237", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s6_U", "Parent" : "0"},
	{"ID" : "238", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s7_U", "Parent" : "0"},
	{"ID" : "239", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s8_U", "Parent" : "0"},
	{"ID" : "240", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s9_U", "Parent" : "0"},
	{"ID" : "241", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rd_bank_cast_loc_channel_U", "Parent" : "0"},
	{"ID" : "242", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w_out_U", "Parent" : "0"},
	{"ID" : "243", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U", "Parent" : "0"},
	{"ID" : "244", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U", "Parent" : "0"},
	{"ID" : "245", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U", "Parent" : "0"},
	{"ID" : "246", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U", "Parent" : "0"},
	{"ID" : "247", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U", "Parent" : "0"},
	{"ID" : "248", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U", "Parent" : "0"},
	{"ID" : "249", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U", "Parent" : "0"},
	{"ID" : "250", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U", "Parent" : "0"},
	{"ID" : "251", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U", "Parent" : "0"},
	{"ID" : "252", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U", "Parent" : "0"},
	{"ID" : "253", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U", "Parent" : "0"},
	{"ID" : "254", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_word_to_axis_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_mdf {
		s_in_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_dest_V {Type I LastRead 0 FirstWrite -1}
		s_out_V_data_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_keep_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_strb_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_user_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_last_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_id_V {Type O LastRead -1 FirstWrite 1}
		s_out_V_dest_V {Type O LastRead -1 FirstWrite 1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_44 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_45 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_46 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_47 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_48 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_0_128_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_49 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT25 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT30 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT24 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT29 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT23 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT28 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT22 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT27 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT21 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT26 {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_2_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_3_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_4_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_5_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_6_0 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0 {Type IO LastRead -1 FirstWrite -1}
		wr_bank {Type IO LastRead -1 FirstWrite -1}
		wr_cnt {Type IO LastRead -1 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type IO LastRead -1 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type IO LastRead -1 FirstWrite -1}}
	axis_to_word {
		s_in_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_in_V_dest_V {Type I LastRead 0 FirstWrite -1}
		w_in {Type O LastRead -1 FirstWrite 1}}
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
		TW_SIN_LUT30 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc111 {
		s1 {Type O LastRead -1 FirstWrite 5}
		s0 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_38 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_39 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_40 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_41 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_42 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_1_64_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_43 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT24 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT29 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc212 {
		s2 {Type O LastRead -1 FirstWrite 5}
		s1 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_32 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_33 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_34 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_35 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_36 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_2_32_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_37 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT23 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT28 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc313 {
		s3 {Type O LastRead -1 FirstWrite 5}
		s2 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_26 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_27 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_28 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_29 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_30 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_3_16_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_31 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT22 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT27 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc414 {
		s4 {Type O LastRead -1 FirstWrite 5}
		s3 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_20 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_21 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_22 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_23 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_24 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_4_8_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_25 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT21 {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT26 {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc515 {
		s5 {Type O LastRead -1 FirstWrite 5}
		s4 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_14 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_15 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_16 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_17 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_18 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_5_4_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_19 {Type IO LastRead -1 FirstWrite -1}
		TW_COS_LUT {Type I LastRead -1 FirstWrite -1}
		TW_SIN_LUT {Type I LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_95_1_proc616 {
		s6 {Type O LastRead -1 FirstWrite 5}
		s5 {Type I LastRead 0 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_8 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_9 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_re_10 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_11 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_12 {Type IO LastRead -1 FirstWrite -1}
		void_stage_fb_6_2_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_13 {Type IO LastRead -1 FirstWrite -1}}
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
		void_stage_fb_7_1_stream_mdf_word_t_0_stream_mdf_word_t_0_delay_im_7_0 {Type IO LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_168_1_proc18 {
		s7 {Type I LastRead 1 FirstWrite -1}
		s8 {Type O LastRead -1 FirstWrite 2}}
	Loop_VITIS_LOOP_168_1_proc819 {
		s8 {Type I LastRead 1 FirstWrite -1}
		s9 {Type O LastRead -1 FirstWrite 2}}
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
		wr_cnt {Type IO LastRead -1 FirstWrite -1}}
	Loop_read_loop_proc {
		p_read {Type I LastRead 0 FirstWrite -1}
		w_out {Type O LastRead -1 FirstWrite 2}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank {Type I LastRead 0 FirstWrite -1}
		bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1 {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "573", "Max" : "573"}
	, {"Name" : "Interval", "Min" : "263", "Max" : "263"}
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
	s_in_V_dest_V { axis {  { s_in_TDEST in_data 0 1 }  { s_in_TVALID in_vld 0 1 }  { s_in_TREADY in_acc 1 1 } } }
	s_out_V_data_V { axis {  { s_out_TDATA out_data 1 128 } } }
	s_out_V_keep_V { axis {  { s_out_TKEEP out_data 1 16 } } }
	s_out_V_strb_V { axis {  { s_out_TSTRB out_data 1 16 } } }
	s_out_V_user_V { axis {  { s_out_TUSER out_data 1 1 } } }
	s_out_V_last_V { axis {  { s_out_TLAST out_data 1 1 } } }
	s_out_V_id_V { axis {  { s_out_TID out_data 1 1 } } }
	s_out_V_dest_V { axis {  { s_out_TDEST out_data 1 1 }  { s_out_TVALID out_vld 1 1 }  { s_out_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
