// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Jun 30 20:52:32 2026
// Host        : CHNtoumas running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/ntoum/Desktop/thesis_repo/hls/serial_fft_hls/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "fft_serial,Vivado 2023.2" *)
module bd_0_hls_inst_0(s_axi_control_AWADDR, 
  s_axi_control_AWVALID, s_axi_control_AWREADY, s_axi_control_WDATA, s_axi_control_WSTRB, 
  s_axi_control_WVALID, s_axi_control_WREADY, s_axi_control_BRESP, s_axi_control_BVALID, 
  s_axi_control_BREADY, s_axi_control_ARADDR, s_axi_control_ARVALID, 
  s_axi_control_ARREADY, s_axi_control_RDATA, s_axi_control_RRESP, s_axi_control_RVALID, 
  s_axi_control_RREADY, ap_clk, ap_rst_n, interrupt, m_axi_AXI_IN_AWID, m_axi_AXI_IN_AWADDR, 
  m_axi_AXI_IN_AWLEN, m_axi_AXI_IN_AWSIZE, m_axi_AXI_IN_AWBURST, m_axi_AXI_IN_AWLOCK, 
  m_axi_AXI_IN_AWREGION, m_axi_AXI_IN_AWCACHE, m_axi_AXI_IN_AWPROT, m_axi_AXI_IN_AWQOS, 
  m_axi_AXI_IN_AWVALID, m_axi_AXI_IN_AWREADY, m_axi_AXI_IN_WID, m_axi_AXI_IN_WDATA, 
  m_axi_AXI_IN_WSTRB, m_axi_AXI_IN_WLAST, m_axi_AXI_IN_WVALID, m_axi_AXI_IN_WREADY, 
  m_axi_AXI_IN_BID, m_axi_AXI_IN_BRESP, m_axi_AXI_IN_BVALID, m_axi_AXI_IN_BREADY, 
  m_axi_AXI_IN_ARID, m_axi_AXI_IN_ARADDR, m_axi_AXI_IN_ARLEN, m_axi_AXI_IN_ARSIZE, 
  m_axi_AXI_IN_ARBURST, m_axi_AXI_IN_ARLOCK, m_axi_AXI_IN_ARREGION, m_axi_AXI_IN_ARCACHE, 
  m_axi_AXI_IN_ARPROT, m_axi_AXI_IN_ARQOS, m_axi_AXI_IN_ARVALID, m_axi_AXI_IN_ARREADY, 
  m_axi_AXI_IN_RID, m_axi_AXI_IN_RDATA, m_axi_AXI_IN_RRESP, m_axi_AXI_IN_RLAST, 
  m_axi_AXI_IN_RVALID, m_axi_AXI_IN_RREADY, m_axi_AXI_OUT_AWID, m_axi_AXI_OUT_AWADDR, 
  m_axi_AXI_OUT_AWLEN, m_axi_AXI_OUT_AWSIZE, m_axi_AXI_OUT_AWBURST, m_axi_AXI_OUT_AWLOCK, 
  m_axi_AXI_OUT_AWREGION, m_axi_AXI_OUT_AWCACHE, m_axi_AXI_OUT_AWPROT, 
  m_axi_AXI_OUT_AWQOS, m_axi_AXI_OUT_AWVALID, m_axi_AXI_OUT_AWREADY, m_axi_AXI_OUT_WID, 
  m_axi_AXI_OUT_WDATA, m_axi_AXI_OUT_WSTRB, m_axi_AXI_OUT_WLAST, m_axi_AXI_OUT_WVALID, 
  m_axi_AXI_OUT_WREADY, m_axi_AXI_OUT_BID, m_axi_AXI_OUT_BRESP, m_axi_AXI_OUT_BVALID, 
  m_axi_AXI_OUT_BREADY, m_axi_AXI_OUT_ARID, m_axi_AXI_OUT_ARADDR, m_axi_AXI_OUT_ARLEN, 
  m_axi_AXI_OUT_ARSIZE, m_axi_AXI_OUT_ARBURST, m_axi_AXI_OUT_ARLOCK, 
  m_axi_AXI_OUT_ARREGION, m_axi_AXI_OUT_ARCACHE, m_axi_AXI_OUT_ARPROT, 
  m_axi_AXI_OUT_ARQOS, m_axi_AXI_OUT_ARVALID, m_axi_AXI_OUT_ARREADY, m_axi_AXI_OUT_RID, 
  m_axi_AXI_OUT_RDATA, m_axi_AXI_OUT_RRESP, m_axi_AXI_OUT_RLAST, m_axi_AXI_OUT_RVALID, 
  m_axi_AXI_OUT_RREADY)
/* synthesis syn_black_box black_box_pad_pin="s_axi_control_AWADDR[6:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[6:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_rst_n,interrupt,m_axi_AXI_IN_AWID[0:0],m_axi_AXI_IN_AWADDR[63:0],m_axi_AXI_IN_AWLEN[7:0],m_axi_AXI_IN_AWSIZE[2:0],m_axi_AXI_IN_AWBURST[1:0],m_axi_AXI_IN_AWLOCK[1:0],m_axi_AXI_IN_AWREGION[3:0],m_axi_AXI_IN_AWCACHE[3:0],m_axi_AXI_IN_AWPROT[2:0],m_axi_AXI_IN_AWQOS[3:0],m_axi_AXI_IN_AWVALID,m_axi_AXI_IN_AWREADY,m_axi_AXI_IN_WID[0:0],m_axi_AXI_IN_WDATA[31:0],m_axi_AXI_IN_WSTRB[3:0],m_axi_AXI_IN_WLAST,m_axi_AXI_IN_WVALID,m_axi_AXI_IN_WREADY,m_axi_AXI_IN_BID[0:0],m_axi_AXI_IN_BRESP[1:0],m_axi_AXI_IN_BVALID,m_axi_AXI_IN_BREADY,m_axi_AXI_IN_ARID[0:0],m_axi_AXI_IN_ARADDR[63:0],m_axi_AXI_IN_ARLEN[7:0],m_axi_AXI_IN_ARSIZE[2:0],m_axi_AXI_IN_ARBURST[1:0],m_axi_AXI_IN_ARLOCK[1:0],m_axi_AXI_IN_ARREGION[3:0],m_axi_AXI_IN_ARCACHE[3:0],m_axi_AXI_IN_ARPROT[2:0],m_axi_AXI_IN_ARQOS[3:0],m_axi_AXI_IN_ARVALID,m_axi_AXI_IN_ARREADY,m_axi_AXI_IN_RID[0:0],m_axi_AXI_IN_RDATA[31:0],m_axi_AXI_IN_RRESP[1:0],m_axi_AXI_IN_RLAST,m_axi_AXI_IN_RVALID,m_axi_AXI_IN_RREADY,m_axi_AXI_OUT_AWID[0:0],m_axi_AXI_OUT_AWADDR[63:0],m_axi_AXI_OUT_AWLEN[7:0],m_axi_AXI_OUT_AWSIZE[2:0],m_axi_AXI_OUT_AWBURST[1:0],m_axi_AXI_OUT_AWLOCK[1:0],m_axi_AXI_OUT_AWREGION[3:0],m_axi_AXI_OUT_AWCACHE[3:0],m_axi_AXI_OUT_AWPROT[2:0],m_axi_AXI_OUT_AWQOS[3:0],m_axi_AXI_OUT_AWVALID,m_axi_AXI_OUT_AWREADY,m_axi_AXI_OUT_WID[0:0],m_axi_AXI_OUT_WDATA[31:0],m_axi_AXI_OUT_WSTRB[3:0],m_axi_AXI_OUT_WLAST,m_axi_AXI_OUT_WVALID,m_axi_AXI_OUT_WREADY,m_axi_AXI_OUT_BID[0:0],m_axi_AXI_OUT_BRESP[1:0],m_axi_AXI_OUT_BVALID,m_axi_AXI_OUT_BREADY,m_axi_AXI_OUT_ARID[0:0],m_axi_AXI_OUT_ARADDR[63:0],m_axi_AXI_OUT_ARLEN[7:0],m_axi_AXI_OUT_ARSIZE[2:0],m_axi_AXI_OUT_ARBURST[1:0],m_axi_AXI_OUT_ARLOCK[1:0],m_axi_AXI_OUT_ARREGION[3:0],m_axi_AXI_OUT_ARCACHE[3:0],m_axi_AXI_OUT_ARPROT[2:0],m_axi_AXI_OUT_ARQOS[3:0],m_axi_AXI_OUT_ARVALID,m_axi_AXI_OUT_ARREADY,m_axi_AXI_OUT_RID[0:0],m_axi_AXI_OUT_RDATA[31:0],m_axi_AXI_OUT_RRESP[1:0],m_axi_AXI_OUT_RLAST,m_axi_AXI_OUT_RVALID,m_axi_AXI_OUT_RREADY" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  input [6:0]s_axi_control_AWADDR;
  input s_axi_control_AWVALID;
  output s_axi_control_AWREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_WVALID;
  output s_axi_control_WREADY;
  output [1:0]s_axi_control_BRESP;
  output s_axi_control_BVALID;
  input s_axi_control_BREADY;
  input [6:0]s_axi_control_ARADDR;
  input s_axi_control_ARVALID;
  output s_axi_control_ARREADY;
  output [31:0]s_axi_control_RDATA;
  output [1:0]s_axi_control_RRESP;
  output s_axi_control_RVALID;
  input s_axi_control_RREADY;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst_n;
  output interrupt;
  output [0:0]m_axi_AXI_IN_AWID;
  output [63:0]m_axi_AXI_IN_AWADDR;
  output [7:0]m_axi_AXI_IN_AWLEN;
  output [2:0]m_axi_AXI_IN_AWSIZE;
  output [1:0]m_axi_AXI_IN_AWBURST;
  output [1:0]m_axi_AXI_IN_AWLOCK;
  output [3:0]m_axi_AXI_IN_AWREGION;
  output [3:0]m_axi_AXI_IN_AWCACHE;
  output [2:0]m_axi_AXI_IN_AWPROT;
  output [3:0]m_axi_AXI_IN_AWQOS;
  output m_axi_AXI_IN_AWVALID;
  input m_axi_AXI_IN_AWREADY;
  output [0:0]m_axi_AXI_IN_WID;
  output [31:0]m_axi_AXI_IN_WDATA;
  output [3:0]m_axi_AXI_IN_WSTRB;
  output m_axi_AXI_IN_WLAST;
  output m_axi_AXI_IN_WVALID;
  input m_axi_AXI_IN_WREADY;
  input [0:0]m_axi_AXI_IN_BID;
  input [1:0]m_axi_AXI_IN_BRESP;
  input m_axi_AXI_IN_BVALID;
  output m_axi_AXI_IN_BREADY;
  output [0:0]m_axi_AXI_IN_ARID;
  output [63:0]m_axi_AXI_IN_ARADDR;
  output [7:0]m_axi_AXI_IN_ARLEN;
  output [2:0]m_axi_AXI_IN_ARSIZE;
  output [1:0]m_axi_AXI_IN_ARBURST;
  output [1:0]m_axi_AXI_IN_ARLOCK;
  output [3:0]m_axi_AXI_IN_ARREGION;
  output [3:0]m_axi_AXI_IN_ARCACHE;
  output [2:0]m_axi_AXI_IN_ARPROT;
  output [3:0]m_axi_AXI_IN_ARQOS;
  output m_axi_AXI_IN_ARVALID;
  input m_axi_AXI_IN_ARREADY;
  input [0:0]m_axi_AXI_IN_RID;
  input [31:0]m_axi_AXI_IN_RDATA;
  input [1:0]m_axi_AXI_IN_RRESP;
  input m_axi_AXI_IN_RLAST;
  input m_axi_AXI_IN_RVALID;
  output m_axi_AXI_IN_RREADY;
  output [0:0]m_axi_AXI_OUT_AWID;
  output [63:0]m_axi_AXI_OUT_AWADDR;
  output [7:0]m_axi_AXI_OUT_AWLEN;
  output [2:0]m_axi_AXI_OUT_AWSIZE;
  output [1:0]m_axi_AXI_OUT_AWBURST;
  output [1:0]m_axi_AXI_OUT_AWLOCK;
  output [3:0]m_axi_AXI_OUT_AWREGION;
  output [3:0]m_axi_AXI_OUT_AWCACHE;
  output [2:0]m_axi_AXI_OUT_AWPROT;
  output [3:0]m_axi_AXI_OUT_AWQOS;
  output m_axi_AXI_OUT_AWVALID;
  input m_axi_AXI_OUT_AWREADY;
  output [0:0]m_axi_AXI_OUT_WID;
  output [31:0]m_axi_AXI_OUT_WDATA;
  output [3:0]m_axi_AXI_OUT_WSTRB;
  output m_axi_AXI_OUT_WLAST;
  output m_axi_AXI_OUT_WVALID;
  input m_axi_AXI_OUT_WREADY;
  input [0:0]m_axi_AXI_OUT_BID;
  input [1:0]m_axi_AXI_OUT_BRESP;
  input m_axi_AXI_OUT_BVALID;
  output m_axi_AXI_OUT_BREADY;
  output [0:0]m_axi_AXI_OUT_ARID;
  output [63:0]m_axi_AXI_OUT_ARADDR;
  output [7:0]m_axi_AXI_OUT_ARLEN;
  output [2:0]m_axi_AXI_OUT_ARSIZE;
  output [1:0]m_axi_AXI_OUT_ARBURST;
  output [1:0]m_axi_AXI_OUT_ARLOCK;
  output [3:0]m_axi_AXI_OUT_ARREGION;
  output [3:0]m_axi_AXI_OUT_ARCACHE;
  output [2:0]m_axi_AXI_OUT_ARPROT;
  output [3:0]m_axi_AXI_OUT_ARQOS;
  output m_axi_AXI_OUT_ARVALID;
  input m_axi_AXI_OUT_ARREADY;
  input [0:0]m_axi_AXI_OUT_RID;
  input [31:0]m_axi_AXI_OUT_RDATA;
  input [1:0]m_axi_AXI_OUT_RRESP;
  input m_axi_AXI_OUT_RLAST;
  input m_axi_AXI_OUT_RVALID;
  output m_axi_AXI_OUT_RREADY;
endmodule
