//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Tue Jun 30 20:49:44 2026
//Host        : CHNtoumas running 64-bit major release  (build 9200)
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (ap_clk,
    ap_rst_n,
    interrupt,
    m_axi_AXI_IN_araddr,
    m_axi_AXI_IN_arburst,
    m_axi_AXI_IN_arcache,
    m_axi_AXI_IN_arid,
    m_axi_AXI_IN_arlen,
    m_axi_AXI_IN_arlock,
    m_axi_AXI_IN_arprot,
    m_axi_AXI_IN_arqos,
    m_axi_AXI_IN_arready,
    m_axi_AXI_IN_arregion,
    m_axi_AXI_IN_arsize,
    m_axi_AXI_IN_arvalid,
    m_axi_AXI_IN_awaddr,
    m_axi_AXI_IN_awburst,
    m_axi_AXI_IN_awcache,
    m_axi_AXI_IN_awid,
    m_axi_AXI_IN_awlen,
    m_axi_AXI_IN_awlock,
    m_axi_AXI_IN_awprot,
    m_axi_AXI_IN_awqos,
    m_axi_AXI_IN_awready,
    m_axi_AXI_IN_awregion,
    m_axi_AXI_IN_awsize,
    m_axi_AXI_IN_awvalid,
    m_axi_AXI_IN_bid,
    m_axi_AXI_IN_bready,
    m_axi_AXI_IN_bresp,
    m_axi_AXI_IN_bvalid,
    m_axi_AXI_IN_rdata,
    m_axi_AXI_IN_rid,
    m_axi_AXI_IN_rlast,
    m_axi_AXI_IN_rready,
    m_axi_AXI_IN_rresp,
    m_axi_AXI_IN_rvalid,
    m_axi_AXI_IN_wdata,
    m_axi_AXI_IN_wid,
    m_axi_AXI_IN_wlast,
    m_axi_AXI_IN_wready,
    m_axi_AXI_IN_wstrb,
    m_axi_AXI_IN_wvalid,
    m_axi_AXI_OUT_araddr,
    m_axi_AXI_OUT_arburst,
    m_axi_AXI_OUT_arcache,
    m_axi_AXI_OUT_arid,
    m_axi_AXI_OUT_arlen,
    m_axi_AXI_OUT_arlock,
    m_axi_AXI_OUT_arprot,
    m_axi_AXI_OUT_arqos,
    m_axi_AXI_OUT_arready,
    m_axi_AXI_OUT_arregion,
    m_axi_AXI_OUT_arsize,
    m_axi_AXI_OUT_arvalid,
    m_axi_AXI_OUT_awaddr,
    m_axi_AXI_OUT_awburst,
    m_axi_AXI_OUT_awcache,
    m_axi_AXI_OUT_awid,
    m_axi_AXI_OUT_awlen,
    m_axi_AXI_OUT_awlock,
    m_axi_AXI_OUT_awprot,
    m_axi_AXI_OUT_awqos,
    m_axi_AXI_OUT_awready,
    m_axi_AXI_OUT_awregion,
    m_axi_AXI_OUT_awsize,
    m_axi_AXI_OUT_awvalid,
    m_axi_AXI_OUT_bid,
    m_axi_AXI_OUT_bready,
    m_axi_AXI_OUT_bresp,
    m_axi_AXI_OUT_bvalid,
    m_axi_AXI_OUT_rdata,
    m_axi_AXI_OUT_rid,
    m_axi_AXI_OUT_rlast,
    m_axi_AXI_OUT_rready,
    m_axi_AXI_OUT_rresp,
    m_axi_AXI_OUT_rvalid,
    m_axi_AXI_OUT_wdata,
    m_axi_AXI_OUT_wid,
    m_axi_AXI_OUT_wlast,
    m_axi_AXI_OUT_wready,
    m_axi_AXI_OUT_wstrb,
    m_axi_AXI_OUT_wvalid,
    s_axi_control_araddr,
    s_axi_control_arready,
    s_axi_control_arvalid,
    s_axi_control_awaddr,
    s_axi_control_awready,
    s_axi_control_awvalid,
    s_axi_control_bready,
    s_axi_control_bresp,
    s_axi_control_bvalid,
    s_axi_control_rdata,
    s_axi_control_rready,
    s_axi_control_rresp,
    s_axi_control_rvalid,
    s_axi_control_wdata,
    s_axi_control_wready,
    s_axi_control_wstrb,
    s_axi_control_wvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF m_axi_AXI_IN:m_axi_AXI_OUT:s_axi_control, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_AXI_IN, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [63:0]m_axi_AXI_IN_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [1:0]m_axi_AXI_IN_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [3:0]m_axi_AXI_IN_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [0:0]m_axi_AXI_IN_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [7:0]m_axi_AXI_IN_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [1:0]m_axi_AXI_IN_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [2:0]m_axi_AXI_IN_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [3:0]m_axi_AXI_IN_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input m_axi_AXI_IN_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [3:0]m_axi_AXI_IN_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [2:0]m_axi_AXI_IN_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output m_axi_AXI_IN_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [63:0]m_axi_AXI_IN_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [1:0]m_axi_AXI_IN_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [3:0]m_axi_AXI_IN_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [0:0]m_axi_AXI_IN_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [7:0]m_axi_AXI_IN_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [1:0]m_axi_AXI_IN_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [2:0]m_axi_AXI_IN_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [3:0]m_axi_AXI_IN_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input m_axi_AXI_IN_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [3:0]m_axi_AXI_IN_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [2:0]m_axi_AXI_IN_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output m_axi_AXI_IN_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input [0:0]m_axi_AXI_IN_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output m_axi_AXI_IN_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input [1:0]m_axi_AXI_IN_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input m_axi_AXI_IN_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input [31:0]m_axi_AXI_IN_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input [0:0]m_axi_AXI_IN_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input m_axi_AXI_IN_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output m_axi_AXI_IN_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input [1:0]m_axi_AXI_IN_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input m_axi_AXI_IN_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [31:0]m_axi_AXI_IN_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [0:0]m_axi_AXI_IN_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output m_axi_AXI_IN_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) input m_axi_AXI_IN_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output [3:0]m_axi_AXI_IN_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN " *) output m_axi_AXI_IN_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_AXI_OUT, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE WRITE_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [63:0]m_axi_AXI_OUT_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [1:0]m_axi_AXI_OUT_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [3:0]m_axi_AXI_OUT_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [0:0]m_axi_AXI_OUT_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [7:0]m_axi_AXI_OUT_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [1:0]m_axi_AXI_OUT_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [2:0]m_axi_AXI_OUT_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [3:0]m_axi_AXI_OUT_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input m_axi_AXI_OUT_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [3:0]m_axi_AXI_OUT_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [2:0]m_axi_AXI_OUT_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output m_axi_AXI_OUT_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [63:0]m_axi_AXI_OUT_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [1:0]m_axi_AXI_OUT_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [3:0]m_axi_AXI_OUT_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [0:0]m_axi_AXI_OUT_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [7:0]m_axi_AXI_OUT_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [1:0]m_axi_AXI_OUT_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [2:0]m_axi_AXI_OUT_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [3:0]m_axi_AXI_OUT_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input m_axi_AXI_OUT_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [3:0]m_axi_AXI_OUT_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [2:0]m_axi_AXI_OUT_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output m_axi_AXI_OUT_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input [0:0]m_axi_AXI_OUT_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output m_axi_AXI_OUT_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input [1:0]m_axi_AXI_OUT_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input m_axi_AXI_OUT_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input [31:0]m_axi_AXI_OUT_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input [0:0]m_axi_AXI_OUT_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input m_axi_AXI_OUT_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output m_axi_AXI_OUT_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input [1:0]m_axi_AXI_OUT_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input m_axi_AXI_OUT_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [31:0]m_axi_AXI_OUT_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [0:0]m_axi_AXI_OUT_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output m_axi_AXI_OUT_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) input m_axi_AXI_OUT_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output [3:0]m_axi_AXI_OUT_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT " *) output m_axi_AXI_OUT_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [6:0]s_axi_control_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) output s_axi_control_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) input s_axi_control_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) input [6:0]s_axi_control_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) output s_axi_control_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) input s_axi_control_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) input s_axi_control_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) output [1:0]s_axi_control_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) output s_axi_control_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) output [31:0]s_axi_control_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) input s_axi_control_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) output [1:0]s_axi_control_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) output s_axi_control_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) input [31:0]s_axi_control_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) output s_axi_control_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) input [3:0]s_axi_control_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control " *) input s_axi_control_wvalid;

  wire ap_clk_0_1;
  wire ap_rst_n_0_1;
  wire hls_inst_interrupt;
  wire [63:0]hls_inst_m_axi_AXI_IN_ARADDR;
  wire [1:0]hls_inst_m_axi_AXI_IN_ARBURST;
  wire [3:0]hls_inst_m_axi_AXI_IN_ARCACHE;
  wire [0:0]hls_inst_m_axi_AXI_IN_ARID;
  wire [7:0]hls_inst_m_axi_AXI_IN_ARLEN;
  wire [1:0]hls_inst_m_axi_AXI_IN_ARLOCK;
  wire [2:0]hls_inst_m_axi_AXI_IN_ARPROT;
  wire [3:0]hls_inst_m_axi_AXI_IN_ARQOS;
  wire hls_inst_m_axi_AXI_IN_ARREADY;
  wire [3:0]hls_inst_m_axi_AXI_IN_ARREGION;
  wire [2:0]hls_inst_m_axi_AXI_IN_ARSIZE;
  wire hls_inst_m_axi_AXI_IN_ARVALID;
  wire [63:0]hls_inst_m_axi_AXI_IN_AWADDR;
  wire [1:0]hls_inst_m_axi_AXI_IN_AWBURST;
  wire [3:0]hls_inst_m_axi_AXI_IN_AWCACHE;
  wire [0:0]hls_inst_m_axi_AXI_IN_AWID;
  wire [7:0]hls_inst_m_axi_AXI_IN_AWLEN;
  wire [1:0]hls_inst_m_axi_AXI_IN_AWLOCK;
  wire [2:0]hls_inst_m_axi_AXI_IN_AWPROT;
  wire [3:0]hls_inst_m_axi_AXI_IN_AWQOS;
  wire hls_inst_m_axi_AXI_IN_AWREADY;
  wire [3:0]hls_inst_m_axi_AXI_IN_AWREGION;
  wire [2:0]hls_inst_m_axi_AXI_IN_AWSIZE;
  wire hls_inst_m_axi_AXI_IN_AWVALID;
  wire [0:0]hls_inst_m_axi_AXI_IN_BID;
  wire hls_inst_m_axi_AXI_IN_BREADY;
  wire [1:0]hls_inst_m_axi_AXI_IN_BRESP;
  wire hls_inst_m_axi_AXI_IN_BVALID;
  wire [31:0]hls_inst_m_axi_AXI_IN_RDATA;
  wire [0:0]hls_inst_m_axi_AXI_IN_RID;
  wire hls_inst_m_axi_AXI_IN_RLAST;
  wire hls_inst_m_axi_AXI_IN_RREADY;
  wire [1:0]hls_inst_m_axi_AXI_IN_RRESP;
  wire hls_inst_m_axi_AXI_IN_RVALID;
  wire [31:0]hls_inst_m_axi_AXI_IN_WDATA;
  wire [0:0]hls_inst_m_axi_AXI_IN_WID;
  wire hls_inst_m_axi_AXI_IN_WLAST;
  wire hls_inst_m_axi_AXI_IN_WREADY;
  wire [3:0]hls_inst_m_axi_AXI_IN_WSTRB;
  wire hls_inst_m_axi_AXI_IN_WVALID;
  wire [63:0]hls_inst_m_axi_AXI_OUT_ARADDR;
  wire [1:0]hls_inst_m_axi_AXI_OUT_ARBURST;
  wire [3:0]hls_inst_m_axi_AXI_OUT_ARCACHE;
  wire [0:0]hls_inst_m_axi_AXI_OUT_ARID;
  wire [7:0]hls_inst_m_axi_AXI_OUT_ARLEN;
  wire [1:0]hls_inst_m_axi_AXI_OUT_ARLOCK;
  wire [2:0]hls_inst_m_axi_AXI_OUT_ARPROT;
  wire [3:0]hls_inst_m_axi_AXI_OUT_ARQOS;
  wire hls_inst_m_axi_AXI_OUT_ARREADY;
  wire [3:0]hls_inst_m_axi_AXI_OUT_ARREGION;
  wire [2:0]hls_inst_m_axi_AXI_OUT_ARSIZE;
  wire hls_inst_m_axi_AXI_OUT_ARVALID;
  wire [63:0]hls_inst_m_axi_AXI_OUT_AWADDR;
  wire [1:0]hls_inst_m_axi_AXI_OUT_AWBURST;
  wire [3:0]hls_inst_m_axi_AXI_OUT_AWCACHE;
  wire [0:0]hls_inst_m_axi_AXI_OUT_AWID;
  wire [7:0]hls_inst_m_axi_AXI_OUT_AWLEN;
  wire [1:0]hls_inst_m_axi_AXI_OUT_AWLOCK;
  wire [2:0]hls_inst_m_axi_AXI_OUT_AWPROT;
  wire [3:0]hls_inst_m_axi_AXI_OUT_AWQOS;
  wire hls_inst_m_axi_AXI_OUT_AWREADY;
  wire [3:0]hls_inst_m_axi_AXI_OUT_AWREGION;
  wire [2:0]hls_inst_m_axi_AXI_OUT_AWSIZE;
  wire hls_inst_m_axi_AXI_OUT_AWVALID;
  wire [0:0]hls_inst_m_axi_AXI_OUT_BID;
  wire hls_inst_m_axi_AXI_OUT_BREADY;
  wire [1:0]hls_inst_m_axi_AXI_OUT_BRESP;
  wire hls_inst_m_axi_AXI_OUT_BVALID;
  wire [31:0]hls_inst_m_axi_AXI_OUT_RDATA;
  wire [0:0]hls_inst_m_axi_AXI_OUT_RID;
  wire hls_inst_m_axi_AXI_OUT_RLAST;
  wire hls_inst_m_axi_AXI_OUT_RREADY;
  wire [1:0]hls_inst_m_axi_AXI_OUT_RRESP;
  wire hls_inst_m_axi_AXI_OUT_RVALID;
  wire [31:0]hls_inst_m_axi_AXI_OUT_WDATA;
  wire [0:0]hls_inst_m_axi_AXI_OUT_WID;
  wire hls_inst_m_axi_AXI_OUT_WLAST;
  wire hls_inst_m_axi_AXI_OUT_WREADY;
  wire [3:0]hls_inst_m_axi_AXI_OUT_WSTRB;
  wire hls_inst_m_axi_AXI_OUT_WVALID;
  wire [6:0]s_axi_control_0_1_ARADDR;
  wire s_axi_control_0_1_ARREADY;
  wire s_axi_control_0_1_ARVALID;
  wire [6:0]s_axi_control_0_1_AWADDR;
  wire s_axi_control_0_1_AWREADY;
  wire s_axi_control_0_1_AWVALID;
  wire s_axi_control_0_1_BREADY;
  wire [1:0]s_axi_control_0_1_BRESP;
  wire s_axi_control_0_1_BVALID;
  wire [31:0]s_axi_control_0_1_RDATA;
  wire s_axi_control_0_1_RREADY;
  wire [1:0]s_axi_control_0_1_RRESP;
  wire s_axi_control_0_1_RVALID;
  wire [31:0]s_axi_control_0_1_WDATA;
  wire s_axi_control_0_1_WREADY;
  wire [3:0]s_axi_control_0_1_WSTRB;
  wire s_axi_control_0_1_WVALID;

  assign ap_clk_0_1 = ap_clk;
  assign ap_rst_n_0_1 = ap_rst_n;
  assign hls_inst_m_axi_AXI_IN_ARREADY = m_axi_AXI_IN_arready;
  assign hls_inst_m_axi_AXI_IN_AWREADY = m_axi_AXI_IN_awready;
  assign hls_inst_m_axi_AXI_IN_BID = m_axi_AXI_IN_bid[0];
  assign hls_inst_m_axi_AXI_IN_BRESP = m_axi_AXI_IN_bresp[1:0];
  assign hls_inst_m_axi_AXI_IN_BVALID = m_axi_AXI_IN_bvalid;
  assign hls_inst_m_axi_AXI_IN_RDATA = m_axi_AXI_IN_rdata[31:0];
  assign hls_inst_m_axi_AXI_IN_RID = m_axi_AXI_IN_rid[0];
  assign hls_inst_m_axi_AXI_IN_RLAST = m_axi_AXI_IN_rlast;
  assign hls_inst_m_axi_AXI_IN_RRESP = m_axi_AXI_IN_rresp[1:0];
  assign hls_inst_m_axi_AXI_IN_RVALID = m_axi_AXI_IN_rvalid;
  assign hls_inst_m_axi_AXI_IN_WREADY = m_axi_AXI_IN_wready;
  assign hls_inst_m_axi_AXI_OUT_ARREADY = m_axi_AXI_OUT_arready;
  assign hls_inst_m_axi_AXI_OUT_AWREADY = m_axi_AXI_OUT_awready;
  assign hls_inst_m_axi_AXI_OUT_BID = m_axi_AXI_OUT_bid[0];
  assign hls_inst_m_axi_AXI_OUT_BRESP = m_axi_AXI_OUT_bresp[1:0];
  assign hls_inst_m_axi_AXI_OUT_BVALID = m_axi_AXI_OUT_bvalid;
  assign hls_inst_m_axi_AXI_OUT_RDATA = m_axi_AXI_OUT_rdata[31:0];
  assign hls_inst_m_axi_AXI_OUT_RID = m_axi_AXI_OUT_rid[0];
  assign hls_inst_m_axi_AXI_OUT_RLAST = m_axi_AXI_OUT_rlast;
  assign hls_inst_m_axi_AXI_OUT_RRESP = m_axi_AXI_OUT_rresp[1:0];
  assign hls_inst_m_axi_AXI_OUT_RVALID = m_axi_AXI_OUT_rvalid;
  assign hls_inst_m_axi_AXI_OUT_WREADY = m_axi_AXI_OUT_wready;
  assign interrupt = hls_inst_interrupt;
  assign m_axi_AXI_IN_araddr[63:0] = hls_inst_m_axi_AXI_IN_ARADDR;
  assign m_axi_AXI_IN_arburst[1:0] = hls_inst_m_axi_AXI_IN_ARBURST;
  assign m_axi_AXI_IN_arcache[3:0] = hls_inst_m_axi_AXI_IN_ARCACHE;
  assign m_axi_AXI_IN_arid[0] = hls_inst_m_axi_AXI_IN_ARID;
  assign m_axi_AXI_IN_arlen[7:0] = hls_inst_m_axi_AXI_IN_ARLEN;
  assign m_axi_AXI_IN_arlock[1:0] = hls_inst_m_axi_AXI_IN_ARLOCK;
  assign m_axi_AXI_IN_arprot[2:0] = hls_inst_m_axi_AXI_IN_ARPROT;
  assign m_axi_AXI_IN_arqos[3:0] = hls_inst_m_axi_AXI_IN_ARQOS;
  assign m_axi_AXI_IN_arregion[3:0] = hls_inst_m_axi_AXI_IN_ARREGION;
  assign m_axi_AXI_IN_arsize[2:0] = hls_inst_m_axi_AXI_IN_ARSIZE;
  assign m_axi_AXI_IN_arvalid = hls_inst_m_axi_AXI_IN_ARVALID;
  assign m_axi_AXI_IN_awaddr[63:0] = hls_inst_m_axi_AXI_IN_AWADDR;
  assign m_axi_AXI_IN_awburst[1:0] = hls_inst_m_axi_AXI_IN_AWBURST;
  assign m_axi_AXI_IN_awcache[3:0] = hls_inst_m_axi_AXI_IN_AWCACHE;
  assign m_axi_AXI_IN_awid[0] = hls_inst_m_axi_AXI_IN_AWID;
  assign m_axi_AXI_IN_awlen[7:0] = hls_inst_m_axi_AXI_IN_AWLEN;
  assign m_axi_AXI_IN_awlock[1:0] = hls_inst_m_axi_AXI_IN_AWLOCK;
  assign m_axi_AXI_IN_awprot[2:0] = hls_inst_m_axi_AXI_IN_AWPROT;
  assign m_axi_AXI_IN_awqos[3:0] = hls_inst_m_axi_AXI_IN_AWQOS;
  assign m_axi_AXI_IN_awregion[3:0] = hls_inst_m_axi_AXI_IN_AWREGION;
  assign m_axi_AXI_IN_awsize[2:0] = hls_inst_m_axi_AXI_IN_AWSIZE;
  assign m_axi_AXI_IN_awvalid = hls_inst_m_axi_AXI_IN_AWVALID;
  assign m_axi_AXI_IN_bready = hls_inst_m_axi_AXI_IN_BREADY;
  assign m_axi_AXI_IN_rready = hls_inst_m_axi_AXI_IN_RREADY;
  assign m_axi_AXI_IN_wdata[31:0] = hls_inst_m_axi_AXI_IN_WDATA;
  assign m_axi_AXI_IN_wid[0] = hls_inst_m_axi_AXI_IN_WID;
  assign m_axi_AXI_IN_wlast = hls_inst_m_axi_AXI_IN_WLAST;
  assign m_axi_AXI_IN_wstrb[3:0] = hls_inst_m_axi_AXI_IN_WSTRB;
  assign m_axi_AXI_IN_wvalid = hls_inst_m_axi_AXI_IN_WVALID;
  assign m_axi_AXI_OUT_araddr[63:0] = hls_inst_m_axi_AXI_OUT_ARADDR;
  assign m_axi_AXI_OUT_arburst[1:0] = hls_inst_m_axi_AXI_OUT_ARBURST;
  assign m_axi_AXI_OUT_arcache[3:0] = hls_inst_m_axi_AXI_OUT_ARCACHE;
  assign m_axi_AXI_OUT_arid[0] = hls_inst_m_axi_AXI_OUT_ARID;
  assign m_axi_AXI_OUT_arlen[7:0] = hls_inst_m_axi_AXI_OUT_ARLEN;
  assign m_axi_AXI_OUT_arlock[1:0] = hls_inst_m_axi_AXI_OUT_ARLOCK;
  assign m_axi_AXI_OUT_arprot[2:0] = hls_inst_m_axi_AXI_OUT_ARPROT;
  assign m_axi_AXI_OUT_arqos[3:0] = hls_inst_m_axi_AXI_OUT_ARQOS;
  assign m_axi_AXI_OUT_arregion[3:0] = hls_inst_m_axi_AXI_OUT_ARREGION;
  assign m_axi_AXI_OUT_arsize[2:0] = hls_inst_m_axi_AXI_OUT_ARSIZE;
  assign m_axi_AXI_OUT_arvalid = hls_inst_m_axi_AXI_OUT_ARVALID;
  assign m_axi_AXI_OUT_awaddr[63:0] = hls_inst_m_axi_AXI_OUT_AWADDR;
  assign m_axi_AXI_OUT_awburst[1:0] = hls_inst_m_axi_AXI_OUT_AWBURST;
  assign m_axi_AXI_OUT_awcache[3:0] = hls_inst_m_axi_AXI_OUT_AWCACHE;
  assign m_axi_AXI_OUT_awid[0] = hls_inst_m_axi_AXI_OUT_AWID;
  assign m_axi_AXI_OUT_awlen[7:0] = hls_inst_m_axi_AXI_OUT_AWLEN;
  assign m_axi_AXI_OUT_awlock[1:0] = hls_inst_m_axi_AXI_OUT_AWLOCK;
  assign m_axi_AXI_OUT_awprot[2:0] = hls_inst_m_axi_AXI_OUT_AWPROT;
  assign m_axi_AXI_OUT_awqos[3:0] = hls_inst_m_axi_AXI_OUT_AWQOS;
  assign m_axi_AXI_OUT_awregion[3:0] = hls_inst_m_axi_AXI_OUT_AWREGION;
  assign m_axi_AXI_OUT_awsize[2:0] = hls_inst_m_axi_AXI_OUT_AWSIZE;
  assign m_axi_AXI_OUT_awvalid = hls_inst_m_axi_AXI_OUT_AWVALID;
  assign m_axi_AXI_OUT_bready = hls_inst_m_axi_AXI_OUT_BREADY;
  assign m_axi_AXI_OUT_rready = hls_inst_m_axi_AXI_OUT_RREADY;
  assign m_axi_AXI_OUT_wdata[31:0] = hls_inst_m_axi_AXI_OUT_WDATA;
  assign m_axi_AXI_OUT_wid[0] = hls_inst_m_axi_AXI_OUT_WID;
  assign m_axi_AXI_OUT_wlast = hls_inst_m_axi_AXI_OUT_WLAST;
  assign m_axi_AXI_OUT_wstrb[3:0] = hls_inst_m_axi_AXI_OUT_WSTRB;
  assign m_axi_AXI_OUT_wvalid = hls_inst_m_axi_AXI_OUT_WVALID;
  assign s_axi_control_0_1_ARADDR = s_axi_control_araddr[6:0];
  assign s_axi_control_0_1_ARVALID = s_axi_control_arvalid;
  assign s_axi_control_0_1_AWADDR = s_axi_control_awaddr[6:0];
  assign s_axi_control_0_1_AWVALID = s_axi_control_awvalid;
  assign s_axi_control_0_1_BREADY = s_axi_control_bready;
  assign s_axi_control_0_1_RREADY = s_axi_control_rready;
  assign s_axi_control_0_1_WDATA = s_axi_control_wdata[31:0];
  assign s_axi_control_0_1_WSTRB = s_axi_control_wstrb[3:0];
  assign s_axi_control_0_1_WVALID = s_axi_control_wvalid;
  assign s_axi_control_arready = s_axi_control_0_1_ARREADY;
  assign s_axi_control_awready = s_axi_control_0_1_AWREADY;
  assign s_axi_control_bresp[1:0] = s_axi_control_0_1_BRESP;
  assign s_axi_control_bvalid = s_axi_control_0_1_BVALID;
  assign s_axi_control_rdata[31:0] = s_axi_control_0_1_RDATA;
  assign s_axi_control_rresp[1:0] = s_axi_control_0_1_RRESP;
  assign s_axi_control_rvalid = s_axi_control_0_1_RVALID;
  assign s_axi_control_wready = s_axi_control_0_1_WREADY;
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_rst_n(ap_rst_n_0_1),
        .interrupt(hls_inst_interrupt),
        .m_axi_AXI_IN_ARADDR(hls_inst_m_axi_AXI_IN_ARADDR),
        .m_axi_AXI_IN_ARBURST(hls_inst_m_axi_AXI_IN_ARBURST),
        .m_axi_AXI_IN_ARCACHE(hls_inst_m_axi_AXI_IN_ARCACHE),
        .m_axi_AXI_IN_ARID(hls_inst_m_axi_AXI_IN_ARID),
        .m_axi_AXI_IN_ARLEN(hls_inst_m_axi_AXI_IN_ARLEN),
        .m_axi_AXI_IN_ARLOCK(hls_inst_m_axi_AXI_IN_ARLOCK),
        .m_axi_AXI_IN_ARPROT(hls_inst_m_axi_AXI_IN_ARPROT),
        .m_axi_AXI_IN_ARQOS(hls_inst_m_axi_AXI_IN_ARQOS),
        .m_axi_AXI_IN_ARREADY(hls_inst_m_axi_AXI_IN_ARREADY),
        .m_axi_AXI_IN_ARREGION(hls_inst_m_axi_AXI_IN_ARREGION),
        .m_axi_AXI_IN_ARSIZE(hls_inst_m_axi_AXI_IN_ARSIZE),
        .m_axi_AXI_IN_ARVALID(hls_inst_m_axi_AXI_IN_ARVALID),
        .m_axi_AXI_IN_AWADDR(hls_inst_m_axi_AXI_IN_AWADDR),
        .m_axi_AXI_IN_AWBURST(hls_inst_m_axi_AXI_IN_AWBURST),
        .m_axi_AXI_IN_AWCACHE(hls_inst_m_axi_AXI_IN_AWCACHE),
        .m_axi_AXI_IN_AWID(hls_inst_m_axi_AXI_IN_AWID),
        .m_axi_AXI_IN_AWLEN(hls_inst_m_axi_AXI_IN_AWLEN),
        .m_axi_AXI_IN_AWLOCK(hls_inst_m_axi_AXI_IN_AWLOCK),
        .m_axi_AXI_IN_AWPROT(hls_inst_m_axi_AXI_IN_AWPROT),
        .m_axi_AXI_IN_AWQOS(hls_inst_m_axi_AXI_IN_AWQOS),
        .m_axi_AXI_IN_AWREADY(hls_inst_m_axi_AXI_IN_AWREADY),
        .m_axi_AXI_IN_AWREGION(hls_inst_m_axi_AXI_IN_AWREGION),
        .m_axi_AXI_IN_AWSIZE(hls_inst_m_axi_AXI_IN_AWSIZE),
        .m_axi_AXI_IN_AWVALID(hls_inst_m_axi_AXI_IN_AWVALID),
        .m_axi_AXI_IN_BID(hls_inst_m_axi_AXI_IN_BID),
        .m_axi_AXI_IN_BREADY(hls_inst_m_axi_AXI_IN_BREADY),
        .m_axi_AXI_IN_BRESP(hls_inst_m_axi_AXI_IN_BRESP),
        .m_axi_AXI_IN_BVALID(hls_inst_m_axi_AXI_IN_BVALID),
        .m_axi_AXI_IN_RDATA(hls_inst_m_axi_AXI_IN_RDATA),
        .m_axi_AXI_IN_RID(hls_inst_m_axi_AXI_IN_RID),
        .m_axi_AXI_IN_RLAST(hls_inst_m_axi_AXI_IN_RLAST),
        .m_axi_AXI_IN_RREADY(hls_inst_m_axi_AXI_IN_RREADY),
        .m_axi_AXI_IN_RRESP(hls_inst_m_axi_AXI_IN_RRESP),
        .m_axi_AXI_IN_RVALID(hls_inst_m_axi_AXI_IN_RVALID),
        .m_axi_AXI_IN_WDATA(hls_inst_m_axi_AXI_IN_WDATA),
        .m_axi_AXI_IN_WID(hls_inst_m_axi_AXI_IN_WID),
        .m_axi_AXI_IN_WLAST(hls_inst_m_axi_AXI_IN_WLAST),
        .m_axi_AXI_IN_WREADY(hls_inst_m_axi_AXI_IN_WREADY),
        .m_axi_AXI_IN_WSTRB(hls_inst_m_axi_AXI_IN_WSTRB),
        .m_axi_AXI_IN_WVALID(hls_inst_m_axi_AXI_IN_WVALID),
        .m_axi_AXI_OUT_ARADDR(hls_inst_m_axi_AXI_OUT_ARADDR),
        .m_axi_AXI_OUT_ARBURST(hls_inst_m_axi_AXI_OUT_ARBURST),
        .m_axi_AXI_OUT_ARCACHE(hls_inst_m_axi_AXI_OUT_ARCACHE),
        .m_axi_AXI_OUT_ARID(hls_inst_m_axi_AXI_OUT_ARID),
        .m_axi_AXI_OUT_ARLEN(hls_inst_m_axi_AXI_OUT_ARLEN),
        .m_axi_AXI_OUT_ARLOCK(hls_inst_m_axi_AXI_OUT_ARLOCK),
        .m_axi_AXI_OUT_ARPROT(hls_inst_m_axi_AXI_OUT_ARPROT),
        .m_axi_AXI_OUT_ARQOS(hls_inst_m_axi_AXI_OUT_ARQOS),
        .m_axi_AXI_OUT_ARREADY(hls_inst_m_axi_AXI_OUT_ARREADY),
        .m_axi_AXI_OUT_ARREGION(hls_inst_m_axi_AXI_OUT_ARREGION),
        .m_axi_AXI_OUT_ARSIZE(hls_inst_m_axi_AXI_OUT_ARSIZE),
        .m_axi_AXI_OUT_ARVALID(hls_inst_m_axi_AXI_OUT_ARVALID),
        .m_axi_AXI_OUT_AWADDR(hls_inst_m_axi_AXI_OUT_AWADDR),
        .m_axi_AXI_OUT_AWBURST(hls_inst_m_axi_AXI_OUT_AWBURST),
        .m_axi_AXI_OUT_AWCACHE(hls_inst_m_axi_AXI_OUT_AWCACHE),
        .m_axi_AXI_OUT_AWID(hls_inst_m_axi_AXI_OUT_AWID),
        .m_axi_AXI_OUT_AWLEN(hls_inst_m_axi_AXI_OUT_AWLEN),
        .m_axi_AXI_OUT_AWLOCK(hls_inst_m_axi_AXI_OUT_AWLOCK),
        .m_axi_AXI_OUT_AWPROT(hls_inst_m_axi_AXI_OUT_AWPROT),
        .m_axi_AXI_OUT_AWQOS(hls_inst_m_axi_AXI_OUT_AWQOS),
        .m_axi_AXI_OUT_AWREADY(hls_inst_m_axi_AXI_OUT_AWREADY),
        .m_axi_AXI_OUT_AWREGION(hls_inst_m_axi_AXI_OUT_AWREGION),
        .m_axi_AXI_OUT_AWSIZE(hls_inst_m_axi_AXI_OUT_AWSIZE),
        .m_axi_AXI_OUT_AWVALID(hls_inst_m_axi_AXI_OUT_AWVALID),
        .m_axi_AXI_OUT_BID(hls_inst_m_axi_AXI_OUT_BID),
        .m_axi_AXI_OUT_BREADY(hls_inst_m_axi_AXI_OUT_BREADY),
        .m_axi_AXI_OUT_BRESP(hls_inst_m_axi_AXI_OUT_BRESP),
        .m_axi_AXI_OUT_BVALID(hls_inst_m_axi_AXI_OUT_BVALID),
        .m_axi_AXI_OUT_RDATA(hls_inst_m_axi_AXI_OUT_RDATA),
        .m_axi_AXI_OUT_RID(hls_inst_m_axi_AXI_OUT_RID),
        .m_axi_AXI_OUT_RLAST(hls_inst_m_axi_AXI_OUT_RLAST),
        .m_axi_AXI_OUT_RREADY(hls_inst_m_axi_AXI_OUT_RREADY),
        .m_axi_AXI_OUT_RRESP(hls_inst_m_axi_AXI_OUT_RRESP),
        .m_axi_AXI_OUT_RVALID(hls_inst_m_axi_AXI_OUT_RVALID),
        .m_axi_AXI_OUT_WDATA(hls_inst_m_axi_AXI_OUT_WDATA),
        .m_axi_AXI_OUT_WID(hls_inst_m_axi_AXI_OUT_WID),
        .m_axi_AXI_OUT_WLAST(hls_inst_m_axi_AXI_OUT_WLAST),
        .m_axi_AXI_OUT_WREADY(hls_inst_m_axi_AXI_OUT_WREADY),
        .m_axi_AXI_OUT_WSTRB(hls_inst_m_axi_AXI_OUT_WSTRB),
        .m_axi_AXI_OUT_WVALID(hls_inst_m_axi_AXI_OUT_WVALID),
        .s_axi_control_ARADDR(s_axi_control_0_1_ARADDR),
        .s_axi_control_ARREADY(s_axi_control_0_1_ARREADY),
        .s_axi_control_ARVALID(s_axi_control_0_1_ARVALID),
        .s_axi_control_AWADDR(s_axi_control_0_1_AWADDR),
        .s_axi_control_AWREADY(s_axi_control_0_1_AWREADY),
        .s_axi_control_AWVALID(s_axi_control_0_1_AWVALID),
        .s_axi_control_BREADY(s_axi_control_0_1_BREADY),
        .s_axi_control_BRESP(s_axi_control_0_1_BRESP),
        .s_axi_control_BVALID(s_axi_control_0_1_BVALID),
        .s_axi_control_RDATA(s_axi_control_0_1_RDATA),
        .s_axi_control_RREADY(s_axi_control_0_1_RREADY),
        .s_axi_control_RRESP(s_axi_control_0_1_RRESP),
        .s_axi_control_RVALID(s_axi_control_0_1_RVALID),
        .s_axi_control_WDATA(s_axi_control_0_1_WDATA),
        .s_axi_control_WREADY(s_axi_control_0_1_WREADY),
        .s_axi_control_WSTRB(s_axi_control_0_1_WSTRB),
        .s_axi_control_WVALID(s_axi_control_0_1_WVALID));
endmodule
