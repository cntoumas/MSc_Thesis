//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Tue Jun 30 20:49:44 2026
//Host        : CHNtoumas running 64-bit major release  (build 9200)
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
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
  input ap_clk;
  input ap_rst_n;
  output interrupt;
  output [63:0]m_axi_AXI_IN_araddr;
  output [1:0]m_axi_AXI_IN_arburst;
  output [3:0]m_axi_AXI_IN_arcache;
  output [0:0]m_axi_AXI_IN_arid;
  output [7:0]m_axi_AXI_IN_arlen;
  output [1:0]m_axi_AXI_IN_arlock;
  output [2:0]m_axi_AXI_IN_arprot;
  output [3:0]m_axi_AXI_IN_arqos;
  input m_axi_AXI_IN_arready;
  output [3:0]m_axi_AXI_IN_arregion;
  output [2:0]m_axi_AXI_IN_arsize;
  output m_axi_AXI_IN_arvalid;
  output [63:0]m_axi_AXI_IN_awaddr;
  output [1:0]m_axi_AXI_IN_awburst;
  output [3:0]m_axi_AXI_IN_awcache;
  output [0:0]m_axi_AXI_IN_awid;
  output [7:0]m_axi_AXI_IN_awlen;
  output [1:0]m_axi_AXI_IN_awlock;
  output [2:0]m_axi_AXI_IN_awprot;
  output [3:0]m_axi_AXI_IN_awqos;
  input m_axi_AXI_IN_awready;
  output [3:0]m_axi_AXI_IN_awregion;
  output [2:0]m_axi_AXI_IN_awsize;
  output m_axi_AXI_IN_awvalid;
  input [0:0]m_axi_AXI_IN_bid;
  output m_axi_AXI_IN_bready;
  input [1:0]m_axi_AXI_IN_bresp;
  input m_axi_AXI_IN_bvalid;
  input [31:0]m_axi_AXI_IN_rdata;
  input [0:0]m_axi_AXI_IN_rid;
  input m_axi_AXI_IN_rlast;
  output m_axi_AXI_IN_rready;
  input [1:0]m_axi_AXI_IN_rresp;
  input m_axi_AXI_IN_rvalid;
  output [31:0]m_axi_AXI_IN_wdata;
  output [0:0]m_axi_AXI_IN_wid;
  output m_axi_AXI_IN_wlast;
  input m_axi_AXI_IN_wready;
  output [3:0]m_axi_AXI_IN_wstrb;
  output m_axi_AXI_IN_wvalid;
  output [63:0]m_axi_AXI_OUT_araddr;
  output [1:0]m_axi_AXI_OUT_arburst;
  output [3:0]m_axi_AXI_OUT_arcache;
  output [0:0]m_axi_AXI_OUT_arid;
  output [7:0]m_axi_AXI_OUT_arlen;
  output [1:0]m_axi_AXI_OUT_arlock;
  output [2:0]m_axi_AXI_OUT_arprot;
  output [3:0]m_axi_AXI_OUT_arqos;
  input m_axi_AXI_OUT_arready;
  output [3:0]m_axi_AXI_OUT_arregion;
  output [2:0]m_axi_AXI_OUT_arsize;
  output m_axi_AXI_OUT_arvalid;
  output [63:0]m_axi_AXI_OUT_awaddr;
  output [1:0]m_axi_AXI_OUT_awburst;
  output [3:0]m_axi_AXI_OUT_awcache;
  output [0:0]m_axi_AXI_OUT_awid;
  output [7:0]m_axi_AXI_OUT_awlen;
  output [1:0]m_axi_AXI_OUT_awlock;
  output [2:0]m_axi_AXI_OUT_awprot;
  output [3:0]m_axi_AXI_OUT_awqos;
  input m_axi_AXI_OUT_awready;
  output [3:0]m_axi_AXI_OUT_awregion;
  output [2:0]m_axi_AXI_OUT_awsize;
  output m_axi_AXI_OUT_awvalid;
  input [0:0]m_axi_AXI_OUT_bid;
  output m_axi_AXI_OUT_bready;
  input [1:0]m_axi_AXI_OUT_bresp;
  input m_axi_AXI_OUT_bvalid;
  input [31:0]m_axi_AXI_OUT_rdata;
  input [0:0]m_axi_AXI_OUT_rid;
  input m_axi_AXI_OUT_rlast;
  output m_axi_AXI_OUT_rready;
  input [1:0]m_axi_AXI_OUT_rresp;
  input m_axi_AXI_OUT_rvalid;
  output [31:0]m_axi_AXI_OUT_wdata;
  output [0:0]m_axi_AXI_OUT_wid;
  output m_axi_AXI_OUT_wlast;
  input m_axi_AXI_OUT_wready;
  output [3:0]m_axi_AXI_OUT_wstrb;
  output m_axi_AXI_OUT_wvalid;
  input [6:0]s_axi_control_araddr;
  output s_axi_control_arready;
  input s_axi_control_arvalid;
  input [6:0]s_axi_control_awaddr;
  output s_axi_control_awready;
  input s_axi_control_awvalid;
  input s_axi_control_bready;
  output [1:0]s_axi_control_bresp;
  output s_axi_control_bvalid;
  output [31:0]s_axi_control_rdata;
  input s_axi_control_rready;
  output [1:0]s_axi_control_rresp;
  output s_axi_control_rvalid;
  input [31:0]s_axi_control_wdata;
  output s_axi_control_wready;
  input [3:0]s_axi_control_wstrb;
  input s_axi_control_wvalid;

  wire ap_clk;
  wire ap_rst_n;
  wire interrupt;
  wire [63:0]m_axi_AXI_IN_araddr;
  wire [1:0]m_axi_AXI_IN_arburst;
  wire [3:0]m_axi_AXI_IN_arcache;
  wire [0:0]m_axi_AXI_IN_arid;
  wire [7:0]m_axi_AXI_IN_arlen;
  wire [1:0]m_axi_AXI_IN_arlock;
  wire [2:0]m_axi_AXI_IN_arprot;
  wire [3:0]m_axi_AXI_IN_arqos;
  wire m_axi_AXI_IN_arready;
  wire [3:0]m_axi_AXI_IN_arregion;
  wire [2:0]m_axi_AXI_IN_arsize;
  wire m_axi_AXI_IN_arvalid;
  wire [63:0]m_axi_AXI_IN_awaddr;
  wire [1:0]m_axi_AXI_IN_awburst;
  wire [3:0]m_axi_AXI_IN_awcache;
  wire [0:0]m_axi_AXI_IN_awid;
  wire [7:0]m_axi_AXI_IN_awlen;
  wire [1:0]m_axi_AXI_IN_awlock;
  wire [2:0]m_axi_AXI_IN_awprot;
  wire [3:0]m_axi_AXI_IN_awqos;
  wire m_axi_AXI_IN_awready;
  wire [3:0]m_axi_AXI_IN_awregion;
  wire [2:0]m_axi_AXI_IN_awsize;
  wire m_axi_AXI_IN_awvalid;
  wire [0:0]m_axi_AXI_IN_bid;
  wire m_axi_AXI_IN_bready;
  wire [1:0]m_axi_AXI_IN_bresp;
  wire m_axi_AXI_IN_bvalid;
  wire [31:0]m_axi_AXI_IN_rdata;
  wire [0:0]m_axi_AXI_IN_rid;
  wire m_axi_AXI_IN_rlast;
  wire m_axi_AXI_IN_rready;
  wire [1:0]m_axi_AXI_IN_rresp;
  wire m_axi_AXI_IN_rvalid;
  wire [31:0]m_axi_AXI_IN_wdata;
  wire [0:0]m_axi_AXI_IN_wid;
  wire m_axi_AXI_IN_wlast;
  wire m_axi_AXI_IN_wready;
  wire [3:0]m_axi_AXI_IN_wstrb;
  wire m_axi_AXI_IN_wvalid;
  wire [63:0]m_axi_AXI_OUT_araddr;
  wire [1:0]m_axi_AXI_OUT_arburst;
  wire [3:0]m_axi_AXI_OUT_arcache;
  wire [0:0]m_axi_AXI_OUT_arid;
  wire [7:0]m_axi_AXI_OUT_arlen;
  wire [1:0]m_axi_AXI_OUT_arlock;
  wire [2:0]m_axi_AXI_OUT_arprot;
  wire [3:0]m_axi_AXI_OUT_arqos;
  wire m_axi_AXI_OUT_arready;
  wire [3:0]m_axi_AXI_OUT_arregion;
  wire [2:0]m_axi_AXI_OUT_arsize;
  wire m_axi_AXI_OUT_arvalid;
  wire [63:0]m_axi_AXI_OUT_awaddr;
  wire [1:0]m_axi_AXI_OUT_awburst;
  wire [3:0]m_axi_AXI_OUT_awcache;
  wire [0:0]m_axi_AXI_OUT_awid;
  wire [7:0]m_axi_AXI_OUT_awlen;
  wire [1:0]m_axi_AXI_OUT_awlock;
  wire [2:0]m_axi_AXI_OUT_awprot;
  wire [3:0]m_axi_AXI_OUT_awqos;
  wire m_axi_AXI_OUT_awready;
  wire [3:0]m_axi_AXI_OUT_awregion;
  wire [2:0]m_axi_AXI_OUT_awsize;
  wire m_axi_AXI_OUT_awvalid;
  wire [0:0]m_axi_AXI_OUT_bid;
  wire m_axi_AXI_OUT_bready;
  wire [1:0]m_axi_AXI_OUT_bresp;
  wire m_axi_AXI_OUT_bvalid;
  wire [31:0]m_axi_AXI_OUT_rdata;
  wire [0:0]m_axi_AXI_OUT_rid;
  wire m_axi_AXI_OUT_rlast;
  wire m_axi_AXI_OUT_rready;
  wire [1:0]m_axi_AXI_OUT_rresp;
  wire m_axi_AXI_OUT_rvalid;
  wire [31:0]m_axi_AXI_OUT_wdata;
  wire [0:0]m_axi_AXI_OUT_wid;
  wire m_axi_AXI_OUT_wlast;
  wire m_axi_AXI_OUT_wready;
  wire [3:0]m_axi_AXI_OUT_wstrb;
  wire m_axi_AXI_OUT_wvalid;
  wire [6:0]s_axi_control_araddr;
  wire s_axi_control_arready;
  wire s_axi_control_arvalid;
  wire [6:0]s_axi_control_awaddr;
  wire s_axi_control_awready;
  wire s_axi_control_awvalid;
  wire s_axi_control_bready;
  wire [1:0]s_axi_control_bresp;
  wire s_axi_control_bvalid;
  wire [31:0]s_axi_control_rdata;
  wire s_axi_control_rready;
  wire [1:0]s_axi_control_rresp;
  wire s_axi_control_rvalid;
  wire [31:0]s_axi_control_wdata;
  wire s_axi_control_wready;
  wire [3:0]s_axi_control_wstrb;
  wire s_axi_control_wvalid;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .interrupt(interrupt),
        .m_axi_AXI_IN_araddr(m_axi_AXI_IN_araddr),
        .m_axi_AXI_IN_arburst(m_axi_AXI_IN_arburst),
        .m_axi_AXI_IN_arcache(m_axi_AXI_IN_arcache),
        .m_axi_AXI_IN_arid(m_axi_AXI_IN_arid),
        .m_axi_AXI_IN_arlen(m_axi_AXI_IN_arlen),
        .m_axi_AXI_IN_arlock(m_axi_AXI_IN_arlock),
        .m_axi_AXI_IN_arprot(m_axi_AXI_IN_arprot),
        .m_axi_AXI_IN_arqos(m_axi_AXI_IN_arqos),
        .m_axi_AXI_IN_arready(m_axi_AXI_IN_arready),
        .m_axi_AXI_IN_arregion(m_axi_AXI_IN_arregion),
        .m_axi_AXI_IN_arsize(m_axi_AXI_IN_arsize),
        .m_axi_AXI_IN_arvalid(m_axi_AXI_IN_arvalid),
        .m_axi_AXI_IN_awaddr(m_axi_AXI_IN_awaddr),
        .m_axi_AXI_IN_awburst(m_axi_AXI_IN_awburst),
        .m_axi_AXI_IN_awcache(m_axi_AXI_IN_awcache),
        .m_axi_AXI_IN_awid(m_axi_AXI_IN_awid),
        .m_axi_AXI_IN_awlen(m_axi_AXI_IN_awlen),
        .m_axi_AXI_IN_awlock(m_axi_AXI_IN_awlock),
        .m_axi_AXI_IN_awprot(m_axi_AXI_IN_awprot),
        .m_axi_AXI_IN_awqos(m_axi_AXI_IN_awqos),
        .m_axi_AXI_IN_awready(m_axi_AXI_IN_awready),
        .m_axi_AXI_IN_awregion(m_axi_AXI_IN_awregion),
        .m_axi_AXI_IN_awsize(m_axi_AXI_IN_awsize),
        .m_axi_AXI_IN_awvalid(m_axi_AXI_IN_awvalid),
        .m_axi_AXI_IN_bid(m_axi_AXI_IN_bid),
        .m_axi_AXI_IN_bready(m_axi_AXI_IN_bready),
        .m_axi_AXI_IN_bresp(m_axi_AXI_IN_bresp),
        .m_axi_AXI_IN_bvalid(m_axi_AXI_IN_bvalid),
        .m_axi_AXI_IN_rdata(m_axi_AXI_IN_rdata),
        .m_axi_AXI_IN_rid(m_axi_AXI_IN_rid),
        .m_axi_AXI_IN_rlast(m_axi_AXI_IN_rlast),
        .m_axi_AXI_IN_rready(m_axi_AXI_IN_rready),
        .m_axi_AXI_IN_rresp(m_axi_AXI_IN_rresp),
        .m_axi_AXI_IN_rvalid(m_axi_AXI_IN_rvalid),
        .m_axi_AXI_IN_wdata(m_axi_AXI_IN_wdata),
        .m_axi_AXI_IN_wid(m_axi_AXI_IN_wid),
        .m_axi_AXI_IN_wlast(m_axi_AXI_IN_wlast),
        .m_axi_AXI_IN_wready(m_axi_AXI_IN_wready),
        .m_axi_AXI_IN_wstrb(m_axi_AXI_IN_wstrb),
        .m_axi_AXI_IN_wvalid(m_axi_AXI_IN_wvalid),
        .m_axi_AXI_OUT_araddr(m_axi_AXI_OUT_araddr),
        .m_axi_AXI_OUT_arburst(m_axi_AXI_OUT_arburst),
        .m_axi_AXI_OUT_arcache(m_axi_AXI_OUT_arcache),
        .m_axi_AXI_OUT_arid(m_axi_AXI_OUT_arid),
        .m_axi_AXI_OUT_arlen(m_axi_AXI_OUT_arlen),
        .m_axi_AXI_OUT_arlock(m_axi_AXI_OUT_arlock),
        .m_axi_AXI_OUT_arprot(m_axi_AXI_OUT_arprot),
        .m_axi_AXI_OUT_arqos(m_axi_AXI_OUT_arqos),
        .m_axi_AXI_OUT_arready(m_axi_AXI_OUT_arready),
        .m_axi_AXI_OUT_arregion(m_axi_AXI_OUT_arregion),
        .m_axi_AXI_OUT_arsize(m_axi_AXI_OUT_arsize),
        .m_axi_AXI_OUT_arvalid(m_axi_AXI_OUT_arvalid),
        .m_axi_AXI_OUT_awaddr(m_axi_AXI_OUT_awaddr),
        .m_axi_AXI_OUT_awburst(m_axi_AXI_OUT_awburst),
        .m_axi_AXI_OUT_awcache(m_axi_AXI_OUT_awcache),
        .m_axi_AXI_OUT_awid(m_axi_AXI_OUT_awid),
        .m_axi_AXI_OUT_awlen(m_axi_AXI_OUT_awlen),
        .m_axi_AXI_OUT_awlock(m_axi_AXI_OUT_awlock),
        .m_axi_AXI_OUT_awprot(m_axi_AXI_OUT_awprot),
        .m_axi_AXI_OUT_awqos(m_axi_AXI_OUT_awqos),
        .m_axi_AXI_OUT_awready(m_axi_AXI_OUT_awready),
        .m_axi_AXI_OUT_awregion(m_axi_AXI_OUT_awregion),
        .m_axi_AXI_OUT_awsize(m_axi_AXI_OUT_awsize),
        .m_axi_AXI_OUT_awvalid(m_axi_AXI_OUT_awvalid),
        .m_axi_AXI_OUT_bid(m_axi_AXI_OUT_bid),
        .m_axi_AXI_OUT_bready(m_axi_AXI_OUT_bready),
        .m_axi_AXI_OUT_bresp(m_axi_AXI_OUT_bresp),
        .m_axi_AXI_OUT_bvalid(m_axi_AXI_OUT_bvalid),
        .m_axi_AXI_OUT_rdata(m_axi_AXI_OUT_rdata),
        .m_axi_AXI_OUT_rid(m_axi_AXI_OUT_rid),
        .m_axi_AXI_OUT_rlast(m_axi_AXI_OUT_rlast),
        .m_axi_AXI_OUT_rready(m_axi_AXI_OUT_rready),
        .m_axi_AXI_OUT_rresp(m_axi_AXI_OUT_rresp),
        .m_axi_AXI_OUT_rvalid(m_axi_AXI_OUT_rvalid),
        .m_axi_AXI_OUT_wdata(m_axi_AXI_OUT_wdata),
        .m_axi_AXI_OUT_wid(m_axi_AXI_OUT_wid),
        .m_axi_AXI_OUT_wlast(m_axi_AXI_OUT_wlast),
        .m_axi_AXI_OUT_wready(m_axi_AXI_OUT_wready),
        .m_axi_AXI_OUT_wstrb(m_axi_AXI_OUT_wstrb),
        .m_axi_AXI_OUT_wvalid(m_axi_AXI_OUT_wvalid),
        .s_axi_control_araddr(s_axi_control_araddr),
        .s_axi_control_arready(s_axi_control_arready),
        .s_axi_control_arvalid(s_axi_control_arvalid),
        .s_axi_control_awaddr(s_axi_control_awaddr),
        .s_axi_control_awready(s_axi_control_awready),
        .s_axi_control_awvalid(s_axi_control_awvalid),
        .s_axi_control_bready(s_axi_control_bready),
        .s_axi_control_bresp(s_axi_control_bresp),
        .s_axi_control_bvalid(s_axi_control_bvalid),
        .s_axi_control_rdata(s_axi_control_rdata),
        .s_axi_control_rready(s_axi_control_rready),
        .s_axi_control_rresp(s_axi_control_rresp),
        .s_axi_control_rvalid(s_axi_control_rvalid),
        .s_axi_control_wdata(s_axi_control_wdata),
        .s_axi_control_wready(s_axi_control_wready),
        .s_axi_control_wstrb(s_axi_control_wstrb),
        .s_axi_control_wvalid(s_axi_control_wvalid));
endmodule
