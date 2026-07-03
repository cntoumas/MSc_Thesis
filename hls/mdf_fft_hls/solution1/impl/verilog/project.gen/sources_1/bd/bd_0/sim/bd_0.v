//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Tue Jun 30 20:58:45 2026
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
    s_in_tdata,
    s_in_tdest,
    s_in_tid,
    s_in_tkeep,
    s_in_tlast,
    s_in_tready,
    s_in_tstrb,
    s_in_tuser,
    s_in_tvalid,
    s_out_tdata,
    s_out_tdest,
    s_out_tid,
    s_out_tkeep,
    s_out_tlast,
    s_out_tready,
    s_out_tstrb,
    s_out_tuser,
    s_out_tvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF s_in:s_out, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_in, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1" *) input [127:0]s_in_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in " *) input [0:0]s_in_tdest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in " *) input [0:0]s_in_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in " *) input [15:0]s_in_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in " *) input [0:0]s_in_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in " *) output s_in_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in " *) input [15:0]s_in_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in " *) input [0:0]s_in_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in " *) input s_in_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_out, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1" *) output [127:0]s_out_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out " *) output [0:0]s_out_tdest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out " *) output [0:0]s_out_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out " *) output [15:0]s_out_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out " *) output [0:0]s_out_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out " *) input s_out_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out " *) output [15:0]s_out_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out " *) output [0:0]s_out_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out " *) output s_out_tvalid;

  wire ap_clk_0_1;
  wire ap_rst_n_0_1;
  wire [127:0]hls_inst_s_out_TDATA;
  wire [0:0]hls_inst_s_out_TDEST;
  wire [0:0]hls_inst_s_out_TID;
  wire [15:0]hls_inst_s_out_TKEEP;
  wire [0:0]hls_inst_s_out_TLAST;
  wire hls_inst_s_out_TREADY;
  wire [15:0]hls_inst_s_out_TSTRB;
  wire [0:0]hls_inst_s_out_TUSER;
  wire hls_inst_s_out_TVALID;
  wire [127:0]s_in_0_1_TDATA;
  wire [0:0]s_in_0_1_TDEST;
  wire [0:0]s_in_0_1_TID;
  wire [15:0]s_in_0_1_TKEEP;
  wire [0:0]s_in_0_1_TLAST;
  wire s_in_0_1_TREADY;
  wire [15:0]s_in_0_1_TSTRB;
  wire [0:0]s_in_0_1_TUSER;
  wire s_in_0_1_TVALID;

  assign ap_clk_0_1 = ap_clk;
  assign ap_rst_n_0_1 = ap_rst_n;
  assign hls_inst_s_out_TREADY = s_out_tready;
  assign s_in_0_1_TDATA = s_in_tdata[127:0];
  assign s_in_0_1_TDEST = s_in_tdest[0];
  assign s_in_0_1_TID = s_in_tid[0];
  assign s_in_0_1_TKEEP = s_in_tkeep[15:0];
  assign s_in_0_1_TLAST = s_in_tlast[0];
  assign s_in_0_1_TSTRB = s_in_tstrb[15:0];
  assign s_in_0_1_TUSER = s_in_tuser[0];
  assign s_in_0_1_TVALID = s_in_tvalid;
  assign s_in_tready = s_in_0_1_TREADY;
  assign s_out_tdata[127:0] = hls_inst_s_out_TDATA;
  assign s_out_tdest[0] = hls_inst_s_out_TDEST;
  assign s_out_tid[0] = hls_inst_s_out_TID;
  assign s_out_tkeep[15:0] = hls_inst_s_out_TKEEP;
  assign s_out_tlast[0] = hls_inst_s_out_TLAST;
  assign s_out_tstrb[15:0] = hls_inst_s_out_TSTRB;
  assign s_out_tuser[0] = hls_inst_s_out_TUSER;
  assign s_out_tvalid = hls_inst_s_out_TVALID;
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_rst_n(ap_rst_n_0_1),
        .s_in_TDATA(s_in_0_1_TDATA),
        .s_in_TDEST(s_in_0_1_TDEST),
        .s_in_TID(s_in_0_1_TID),
        .s_in_TKEEP(s_in_0_1_TKEEP),
        .s_in_TLAST(s_in_0_1_TLAST),
        .s_in_TREADY(s_in_0_1_TREADY),
        .s_in_TSTRB(s_in_0_1_TSTRB),
        .s_in_TUSER(s_in_0_1_TUSER),
        .s_in_TVALID(s_in_0_1_TVALID),
        .s_out_TDATA(hls_inst_s_out_TDATA),
        .s_out_TDEST(hls_inst_s_out_TDEST),
        .s_out_TID(hls_inst_s_out_TID),
        .s_out_TKEEP(hls_inst_s_out_TKEEP),
        .s_out_TLAST(hls_inst_s_out_TLAST),
        .s_out_TREADY(hls_inst_s_out_TREADY),
        .s_out_TSTRB(hls_inst_s_out_TSTRB),
        .s_out_TUSER(hls_inst_s_out_TUSER),
        .s_out_TVALID(hls_inst_s_out_TVALID));
endmodule
