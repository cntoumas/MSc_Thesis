// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:fft_serial:1.0
// IP Revision: 2114676588

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_0_hls_inst_0 (
  s_axi_control_AWADDR,
  s_axi_control_AWVALID,
  s_axi_control_AWREADY,
  s_axi_control_WDATA,
  s_axi_control_WSTRB,
  s_axi_control_WVALID,
  s_axi_control_WREADY,
  s_axi_control_BRESP,
  s_axi_control_BVALID,
  s_axi_control_BREADY,
  s_axi_control_ARADDR,
  s_axi_control_ARVALID,
  s_axi_control_ARREADY,
  s_axi_control_RDATA,
  s_axi_control_RRESP,
  s_axi_control_RVALID,
  s_axi_control_RREADY,
  ap_clk,
  ap_rst_n,
  interrupt,
  m_axi_AXI_IN_AWID,
  m_axi_AXI_IN_AWADDR,
  m_axi_AXI_IN_AWLEN,
  m_axi_AXI_IN_AWSIZE,
  m_axi_AXI_IN_AWBURST,
  m_axi_AXI_IN_AWLOCK,
  m_axi_AXI_IN_AWREGION,
  m_axi_AXI_IN_AWCACHE,
  m_axi_AXI_IN_AWPROT,
  m_axi_AXI_IN_AWQOS,
  m_axi_AXI_IN_AWVALID,
  m_axi_AXI_IN_AWREADY,
  m_axi_AXI_IN_WID,
  m_axi_AXI_IN_WDATA,
  m_axi_AXI_IN_WSTRB,
  m_axi_AXI_IN_WLAST,
  m_axi_AXI_IN_WVALID,
  m_axi_AXI_IN_WREADY,
  m_axi_AXI_IN_BID,
  m_axi_AXI_IN_BRESP,
  m_axi_AXI_IN_BVALID,
  m_axi_AXI_IN_BREADY,
  m_axi_AXI_IN_ARID,
  m_axi_AXI_IN_ARADDR,
  m_axi_AXI_IN_ARLEN,
  m_axi_AXI_IN_ARSIZE,
  m_axi_AXI_IN_ARBURST,
  m_axi_AXI_IN_ARLOCK,
  m_axi_AXI_IN_ARREGION,
  m_axi_AXI_IN_ARCACHE,
  m_axi_AXI_IN_ARPROT,
  m_axi_AXI_IN_ARQOS,
  m_axi_AXI_IN_ARVALID,
  m_axi_AXI_IN_ARREADY,
  m_axi_AXI_IN_RID,
  m_axi_AXI_IN_RDATA,
  m_axi_AXI_IN_RRESP,
  m_axi_AXI_IN_RLAST,
  m_axi_AXI_IN_RVALID,
  m_axi_AXI_IN_RREADY,
  m_axi_AXI_OUT_AWID,
  m_axi_AXI_OUT_AWADDR,
  m_axi_AXI_OUT_AWLEN,
  m_axi_AXI_OUT_AWSIZE,
  m_axi_AXI_OUT_AWBURST,
  m_axi_AXI_OUT_AWLOCK,
  m_axi_AXI_OUT_AWREGION,
  m_axi_AXI_OUT_AWCACHE,
  m_axi_AXI_OUT_AWPROT,
  m_axi_AXI_OUT_AWQOS,
  m_axi_AXI_OUT_AWVALID,
  m_axi_AXI_OUT_AWREADY,
  m_axi_AXI_OUT_WID,
  m_axi_AXI_OUT_WDATA,
  m_axi_AXI_OUT_WSTRB,
  m_axi_AXI_OUT_WLAST,
  m_axi_AXI_OUT_WVALID,
  m_axi_AXI_OUT_WREADY,
  m_axi_AXI_OUT_BID,
  m_axi_AXI_OUT_BRESP,
  m_axi_AXI_OUT_BVALID,
  m_axi_AXI_OUT_BREADY,
  m_axi_AXI_OUT_ARID,
  m_axi_AXI_OUT_ARADDR,
  m_axi_AXI_OUT_ARLEN,
  m_axi_AXI_OUT_ARSIZE,
  m_axi_AXI_OUT_ARBURST,
  m_axi_AXI_OUT_ARLOCK,
  m_axi_AXI_OUT_ARREGION,
  m_axi_AXI_OUT_ARCACHE,
  m_axi_AXI_OUT_ARPROT,
  m_axi_AXI_OUT_ARQOS,
  m_axi_AXI_OUT_ARVALID,
  m_axi_AXI_OUT_ARREADY,
  m_axi_AXI_OUT_RID,
  m_axi_AXI_OUT_RDATA,
  m_axi_AXI_OUT_RRESP,
  m_axi_AXI_OUT_RLAST,
  m_axi_AXI_OUT_RVALID,
  m_axi_AXI_OUT_RREADY
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *)
input wire [6 : 0] s_axi_control_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *)
input wire s_axi_control_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *)
output wire s_axi_control_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *)
input wire [31 : 0] s_axi_control_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *)
input wire [3 : 0] s_axi_control_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *)
input wire s_axi_control_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *)
output wire s_axi_control_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *)
output wire [1 : 0] s_axi_control_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *)
output wire s_axi_control_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *)
input wire s_axi_control_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *)
input wire [6 : 0] s_axi_control_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *)
input wire s_axi_control_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *)
output wire s_axi_control_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *)
output wire [31 : 0] s_axi_control_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *)
output wire [1 : 0] s_axi_control_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *)
output wire s_axi_control_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 7, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000.0, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREAD\
S 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *)
input wire s_axi_control_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:m_axi_AXI_IN:m_axi_AXI_OUT, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWID" *)
output wire [0 : 0] m_axi_AXI_IN_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWADDR" *)
output wire [63 : 0] m_axi_AXI_IN_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWLEN" *)
output wire [7 : 0] m_axi_AXI_IN_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWSIZE" *)
output wire [2 : 0] m_axi_AXI_IN_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWBURST" *)
output wire [1 : 0] m_axi_AXI_IN_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWLOCK" *)
output wire [1 : 0] m_axi_AXI_IN_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWREGION" *)
output wire [3 : 0] m_axi_AXI_IN_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWCACHE" *)
output wire [3 : 0] m_axi_AXI_IN_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWPROT" *)
output wire [2 : 0] m_axi_AXI_IN_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWQOS" *)
output wire [3 : 0] m_axi_AXI_IN_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWVALID" *)
output wire m_axi_AXI_IN_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWREADY" *)
input wire m_axi_AXI_IN_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WID" *)
output wire [0 : 0] m_axi_AXI_IN_WID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WDATA" *)
output wire [31 : 0] m_axi_AXI_IN_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WSTRB" *)
output wire [3 : 0] m_axi_AXI_IN_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WLAST" *)
output wire m_axi_AXI_IN_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WVALID" *)
output wire m_axi_AXI_IN_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WREADY" *)
input wire m_axi_AXI_IN_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN BID" *)
input wire [0 : 0] m_axi_AXI_IN_BID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN BRESP" *)
input wire [1 : 0] m_axi_AXI_IN_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN BVALID" *)
input wire m_axi_AXI_IN_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN BREADY" *)
output wire m_axi_AXI_IN_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARID" *)
output wire [0 : 0] m_axi_AXI_IN_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARADDR" *)
output wire [63 : 0] m_axi_AXI_IN_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARLEN" *)
output wire [7 : 0] m_axi_AXI_IN_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARSIZE" *)
output wire [2 : 0] m_axi_AXI_IN_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARBURST" *)
output wire [1 : 0] m_axi_AXI_IN_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARLOCK" *)
output wire [1 : 0] m_axi_AXI_IN_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARREGION" *)
output wire [3 : 0] m_axi_AXI_IN_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARCACHE" *)
output wire [3 : 0] m_axi_AXI_IN_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARPROT" *)
output wire [2 : 0] m_axi_AXI_IN_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARQOS" *)
output wire [3 : 0] m_axi_AXI_IN_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARVALID" *)
output wire m_axi_AXI_IN_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARREADY" *)
input wire m_axi_AXI_IN_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RID" *)
input wire [0 : 0] m_axi_AXI_IN_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RDATA" *)
input wire [31 : 0] m_axi_AXI_IN_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RRESP" *)
input wire [1 : 0] m_axi_AXI_IN_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RLAST" *)
input wire m_axi_AXI_IN_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RVALID" *)
input wire m_axi_AXI_IN_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_AXI_IN, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000.0, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN\
 bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RREADY" *)
output wire m_axi_AXI_IN_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWID" *)
output wire [0 : 0] m_axi_AXI_OUT_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWADDR" *)
output wire [63 : 0] m_axi_AXI_OUT_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWLEN" *)
output wire [7 : 0] m_axi_AXI_OUT_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWSIZE" *)
output wire [2 : 0] m_axi_AXI_OUT_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWBURST" *)
output wire [1 : 0] m_axi_AXI_OUT_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWLOCK" *)
output wire [1 : 0] m_axi_AXI_OUT_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWREGION" *)
output wire [3 : 0] m_axi_AXI_OUT_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWCACHE" *)
output wire [3 : 0] m_axi_AXI_OUT_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWPROT" *)
output wire [2 : 0] m_axi_AXI_OUT_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWQOS" *)
output wire [3 : 0] m_axi_AXI_OUT_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWVALID" *)
output wire m_axi_AXI_OUT_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWREADY" *)
input wire m_axi_AXI_OUT_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WID" *)
output wire [0 : 0] m_axi_AXI_OUT_WID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WDATA" *)
output wire [31 : 0] m_axi_AXI_OUT_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WSTRB" *)
output wire [3 : 0] m_axi_AXI_OUT_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WLAST" *)
output wire m_axi_AXI_OUT_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WVALID" *)
output wire m_axi_AXI_OUT_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WREADY" *)
input wire m_axi_AXI_OUT_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT BID" *)
input wire [0 : 0] m_axi_AXI_OUT_BID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT BRESP" *)
input wire [1 : 0] m_axi_AXI_OUT_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT BVALID" *)
input wire m_axi_AXI_OUT_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT BREADY" *)
output wire m_axi_AXI_OUT_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARID" *)
output wire [0 : 0] m_axi_AXI_OUT_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARADDR" *)
output wire [63 : 0] m_axi_AXI_OUT_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARLEN" *)
output wire [7 : 0] m_axi_AXI_OUT_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARSIZE" *)
output wire [2 : 0] m_axi_AXI_OUT_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARBURST" *)
output wire [1 : 0] m_axi_AXI_OUT_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARLOCK" *)
output wire [1 : 0] m_axi_AXI_OUT_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARREGION" *)
output wire [3 : 0] m_axi_AXI_OUT_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARCACHE" *)
output wire [3 : 0] m_axi_AXI_OUT_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARPROT" *)
output wire [2 : 0] m_axi_AXI_OUT_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARQOS" *)
output wire [3 : 0] m_axi_AXI_OUT_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARVALID" *)
output wire m_axi_AXI_OUT_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARREADY" *)
input wire m_axi_AXI_OUT_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RID" *)
input wire [0 : 0] m_axi_AXI_OUT_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RDATA" *)
input wire [31 : 0] m_axi_AXI_OUT_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RRESP" *)
input wire [1 : 0] m_axi_AXI_OUT_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RLAST" *)
input wire m_axi_AXI_OUT_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RVALID" *)
input wire m_axi_AXI_OUT_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_AXI_OUT, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000.0, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMA\
IN bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RREADY" *)
output wire m_axi_AXI_OUT_RREADY;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SIM_INST = "" *)
  fft_serial #(
    .C_S_AXI_CONTROL_ADDR_WIDTH(7),
    .C_S_AXI_CONTROL_DATA_WIDTH(32),
    .C_M_AXI_AXI_IN_ID_WIDTH(1),
    .C_M_AXI_AXI_IN_ADDR_WIDTH(64),
    .C_M_AXI_AXI_IN_DATA_WIDTH(32),
    .C_M_AXI_AXI_IN_AWUSER_WIDTH(1),
    .C_M_AXI_AXI_IN_ARUSER_WIDTH(1),
    .C_M_AXI_AXI_IN_WUSER_WIDTH(1),
    .C_M_AXI_AXI_IN_RUSER_WIDTH(1),
    .C_M_AXI_AXI_IN_BUSER_WIDTH(1),
    .C_M_AXI_AXI_IN_USER_VALUE(32'H00000000),
    .C_M_AXI_AXI_IN_PROT_VALUE(3'B000),
    .C_M_AXI_AXI_IN_CACHE_VALUE(4'B0011),
    .C_M_AXI_AXI_OUT_ID_WIDTH(1),
    .C_M_AXI_AXI_OUT_ADDR_WIDTH(64),
    .C_M_AXI_AXI_OUT_DATA_WIDTH(32),
    .C_M_AXI_AXI_OUT_AWUSER_WIDTH(1),
    .C_M_AXI_AXI_OUT_ARUSER_WIDTH(1),
    .C_M_AXI_AXI_OUT_WUSER_WIDTH(1),
    .C_M_AXI_AXI_OUT_RUSER_WIDTH(1),
    .C_M_AXI_AXI_OUT_BUSER_WIDTH(1),
    .C_M_AXI_AXI_OUT_USER_VALUE(32'H00000000),
    .C_M_AXI_AXI_OUT_PROT_VALUE(3'B000),
    .C_M_AXI_AXI_OUT_CACHE_VALUE(4'B0011)
  ) inst (
    .s_axi_control_AWADDR(s_axi_control_AWADDR),
    .s_axi_control_AWVALID(s_axi_control_AWVALID),
    .s_axi_control_AWREADY(s_axi_control_AWREADY),
    .s_axi_control_WDATA(s_axi_control_WDATA),
    .s_axi_control_WSTRB(s_axi_control_WSTRB),
    .s_axi_control_WVALID(s_axi_control_WVALID),
    .s_axi_control_WREADY(s_axi_control_WREADY),
    .s_axi_control_BRESP(s_axi_control_BRESP),
    .s_axi_control_BVALID(s_axi_control_BVALID),
    .s_axi_control_BREADY(s_axi_control_BREADY),
    .s_axi_control_ARADDR(s_axi_control_ARADDR),
    .s_axi_control_ARVALID(s_axi_control_ARVALID),
    .s_axi_control_ARREADY(s_axi_control_ARREADY),
    .s_axi_control_RDATA(s_axi_control_RDATA),
    .s_axi_control_RRESP(s_axi_control_RRESP),
    .s_axi_control_RVALID(s_axi_control_RVALID),
    .s_axi_control_RREADY(s_axi_control_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .m_axi_AXI_IN_AWID(m_axi_AXI_IN_AWID),
    .m_axi_AXI_IN_AWADDR(m_axi_AXI_IN_AWADDR),
    .m_axi_AXI_IN_AWLEN(m_axi_AXI_IN_AWLEN),
    .m_axi_AXI_IN_AWSIZE(m_axi_AXI_IN_AWSIZE),
    .m_axi_AXI_IN_AWBURST(m_axi_AXI_IN_AWBURST),
    .m_axi_AXI_IN_AWLOCK(m_axi_AXI_IN_AWLOCK),
    .m_axi_AXI_IN_AWREGION(m_axi_AXI_IN_AWREGION),
    .m_axi_AXI_IN_AWCACHE(m_axi_AXI_IN_AWCACHE),
    .m_axi_AXI_IN_AWPROT(m_axi_AXI_IN_AWPROT),
    .m_axi_AXI_IN_AWQOS(m_axi_AXI_IN_AWQOS),
    .m_axi_AXI_IN_AWUSER(),
    .m_axi_AXI_IN_AWVALID(m_axi_AXI_IN_AWVALID),
    .m_axi_AXI_IN_AWREADY(m_axi_AXI_IN_AWREADY),
    .m_axi_AXI_IN_WID(m_axi_AXI_IN_WID),
    .m_axi_AXI_IN_WDATA(m_axi_AXI_IN_WDATA),
    .m_axi_AXI_IN_WSTRB(m_axi_AXI_IN_WSTRB),
    .m_axi_AXI_IN_WLAST(m_axi_AXI_IN_WLAST),
    .m_axi_AXI_IN_WUSER(),
    .m_axi_AXI_IN_WVALID(m_axi_AXI_IN_WVALID),
    .m_axi_AXI_IN_WREADY(m_axi_AXI_IN_WREADY),
    .m_axi_AXI_IN_BID(m_axi_AXI_IN_BID),
    .m_axi_AXI_IN_BRESP(m_axi_AXI_IN_BRESP),
    .m_axi_AXI_IN_BUSER(1'B0),
    .m_axi_AXI_IN_BVALID(m_axi_AXI_IN_BVALID),
    .m_axi_AXI_IN_BREADY(m_axi_AXI_IN_BREADY),
    .m_axi_AXI_IN_ARID(m_axi_AXI_IN_ARID),
    .m_axi_AXI_IN_ARADDR(m_axi_AXI_IN_ARADDR),
    .m_axi_AXI_IN_ARLEN(m_axi_AXI_IN_ARLEN),
    .m_axi_AXI_IN_ARSIZE(m_axi_AXI_IN_ARSIZE),
    .m_axi_AXI_IN_ARBURST(m_axi_AXI_IN_ARBURST),
    .m_axi_AXI_IN_ARLOCK(m_axi_AXI_IN_ARLOCK),
    .m_axi_AXI_IN_ARREGION(m_axi_AXI_IN_ARREGION),
    .m_axi_AXI_IN_ARCACHE(m_axi_AXI_IN_ARCACHE),
    .m_axi_AXI_IN_ARPROT(m_axi_AXI_IN_ARPROT),
    .m_axi_AXI_IN_ARQOS(m_axi_AXI_IN_ARQOS),
    .m_axi_AXI_IN_ARUSER(),
    .m_axi_AXI_IN_ARVALID(m_axi_AXI_IN_ARVALID),
    .m_axi_AXI_IN_ARREADY(m_axi_AXI_IN_ARREADY),
    .m_axi_AXI_IN_RID(m_axi_AXI_IN_RID),
    .m_axi_AXI_IN_RDATA(m_axi_AXI_IN_RDATA),
    .m_axi_AXI_IN_RRESP(m_axi_AXI_IN_RRESP),
    .m_axi_AXI_IN_RLAST(m_axi_AXI_IN_RLAST),
    .m_axi_AXI_IN_RUSER(1'B0),
    .m_axi_AXI_IN_RVALID(m_axi_AXI_IN_RVALID),
    .m_axi_AXI_IN_RREADY(m_axi_AXI_IN_RREADY),
    .m_axi_AXI_OUT_AWID(m_axi_AXI_OUT_AWID),
    .m_axi_AXI_OUT_AWADDR(m_axi_AXI_OUT_AWADDR),
    .m_axi_AXI_OUT_AWLEN(m_axi_AXI_OUT_AWLEN),
    .m_axi_AXI_OUT_AWSIZE(m_axi_AXI_OUT_AWSIZE),
    .m_axi_AXI_OUT_AWBURST(m_axi_AXI_OUT_AWBURST),
    .m_axi_AXI_OUT_AWLOCK(m_axi_AXI_OUT_AWLOCK),
    .m_axi_AXI_OUT_AWREGION(m_axi_AXI_OUT_AWREGION),
    .m_axi_AXI_OUT_AWCACHE(m_axi_AXI_OUT_AWCACHE),
    .m_axi_AXI_OUT_AWPROT(m_axi_AXI_OUT_AWPROT),
    .m_axi_AXI_OUT_AWQOS(m_axi_AXI_OUT_AWQOS),
    .m_axi_AXI_OUT_AWUSER(),
    .m_axi_AXI_OUT_AWVALID(m_axi_AXI_OUT_AWVALID),
    .m_axi_AXI_OUT_AWREADY(m_axi_AXI_OUT_AWREADY),
    .m_axi_AXI_OUT_WID(m_axi_AXI_OUT_WID),
    .m_axi_AXI_OUT_WDATA(m_axi_AXI_OUT_WDATA),
    .m_axi_AXI_OUT_WSTRB(m_axi_AXI_OUT_WSTRB),
    .m_axi_AXI_OUT_WLAST(m_axi_AXI_OUT_WLAST),
    .m_axi_AXI_OUT_WUSER(),
    .m_axi_AXI_OUT_WVALID(m_axi_AXI_OUT_WVALID),
    .m_axi_AXI_OUT_WREADY(m_axi_AXI_OUT_WREADY),
    .m_axi_AXI_OUT_BID(m_axi_AXI_OUT_BID),
    .m_axi_AXI_OUT_BRESP(m_axi_AXI_OUT_BRESP),
    .m_axi_AXI_OUT_BUSER(1'B0),
    .m_axi_AXI_OUT_BVALID(m_axi_AXI_OUT_BVALID),
    .m_axi_AXI_OUT_BREADY(m_axi_AXI_OUT_BREADY),
    .m_axi_AXI_OUT_ARID(m_axi_AXI_OUT_ARID),
    .m_axi_AXI_OUT_ARADDR(m_axi_AXI_OUT_ARADDR),
    .m_axi_AXI_OUT_ARLEN(m_axi_AXI_OUT_ARLEN),
    .m_axi_AXI_OUT_ARSIZE(m_axi_AXI_OUT_ARSIZE),
    .m_axi_AXI_OUT_ARBURST(m_axi_AXI_OUT_ARBURST),
    .m_axi_AXI_OUT_ARLOCK(m_axi_AXI_OUT_ARLOCK),
    .m_axi_AXI_OUT_ARREGION(m_axi_AXI_OUT_ARREGION),
    .m_axi_AXI_OUT_ARCACHE(m_axi_AXI_OUT_ARCACHE),
    .m_axi_AXI_OUT_ARPROT(m_axi_AXI_OUT_ARPROT),
    .m_axi_AXI_OUT_ARQOS(m_axi_AXI_OUT_ARQOS),
    .m_axi_AXI_OUT_ARUSER(),
    .m_axi_AXI_OUT_ARVALID(m_axi_AXI_OUT_ARVALID),
    .m_axi_AXI_OUT_ARREADY(m_axi_AXI_OUT_ARREADY),
    .m_axi_AXI_OUT_RID(m_axi_AXI_OUT_RID),
    .m_axi_AXI_OUT_RDATA(m_axi_AXI_OUT_RDATA),
    .m_axi_AXI_OUT_RRESP(m_axi_AXI_OUT_RRESP),
    .m_axi_AXI_OUT_RLAST(m_axi_AXI_OUT_RLAST),
    .m_axi_AXI_OUT_RUSER(1'B0),
    .m_axi_AXI_OUT_RVALID(m_axi_AXI_OUT_RVALID),
    .m_axi_AXI_OUT_RREADY(m_axi_AXI_OUT_RREADY)
  );
endmodule
