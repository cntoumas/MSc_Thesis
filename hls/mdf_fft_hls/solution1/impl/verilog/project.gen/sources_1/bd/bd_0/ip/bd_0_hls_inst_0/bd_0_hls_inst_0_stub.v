// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Jun 30 21:00:36 2026
// Host        : CHNtoumas running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/ntoum/Desktop/thesis_repo/hls/mdf_fft_hls/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "fft_mdf,Vivado 2023.2" *)
module bd_0_hls_inst_0(s_in_TVALID, s_in_TREADY, s_in_TDATA, 
  s_in_TKEEP, s_in_TSTRB, s_in_TUSER, s_in_TLAST, s_in_TID, s_in_TDEST, s_out_TVALID, 
  s_out_TREADY, s_out_TDATA, s_out_TKEEP, s_out_TSTRB, s_out_TUSER, s_out_TLAST, s_out_TID, 
  s_out_TDEST, ap_clk, ap_rst_n)
/* synthesis syn_black_box black_box_pad_pin="s_in_TVALID,s_in_TREADY,s_in_TDATA[127:0],s_in_TKEEP[15:0],s_in_TSTRB[15:0],s_in_TUSER[0:0],s_in_TLAST[0:0],s_in_TID[0:0],s_in_TDEST[0:0],s_out_TVALID,s_out_TREADY,s_out_TDATA[127:0],s_out_TKEEP[15:0],s_out_TSTRB[15:0],s_out_TUSER[0:0],s_out_TLAST[0:0],s_out_TID[0:0],s_out_TDEST[0:0],ap_rst_n" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  input s_in_TVALID;
  output s_in_TREADY;
  input [127:0]s_in_TDATA;
  input [15:0]s_in_TKEEP;
  input [15:0]s_in_TSTRB;
  input [0:0]s_in_TUSER;
  input [0:0]s_in_TLAST;
  input [0:0]s_in_TID;
  input [0:0]s_in_TDEST;
  output s_out_TVALID;
  input s_out_TREADY;
  output [127:0]s_out_TDATA;
  output [15:0]s_out_TKEEP;
  output [15:0]s_out_TSTRB;
  output [0:0]s_out_TUSER;
  output [0:0]s_out_TLAST;
  output [0:0]s_out_TID;
  output [0:0]s_out_TDEST;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst_n;
endmodule
