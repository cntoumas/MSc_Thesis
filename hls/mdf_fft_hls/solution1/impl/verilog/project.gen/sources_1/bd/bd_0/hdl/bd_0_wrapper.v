//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Tue Jun 30 20:58:45 2026
//Host        : CHNtoumas running 64-bit major release  (build 9200)
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
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
  input ap_clk;
  input ap_rst_n;
  input [127:0]s_in_tdata;
  input [0:0]s_in_tdest;
  input [0:0]s_in_tid;
  input [15:0]s_in_tkeep;
  input [0:0]s_in_tlast;
  output s_in_tready;
  input [15:0]s_in_tstrb;
  input [0:0]s_in_tuser;
  input s_in_tvalid;
  output [127:0]s_out_tdata;
  output [0:0]s_out_tdest;
  output [0:0]s_out_tid;
  output [15:0]s_out_tkeep;
  output [0:0]s_out_tlast;
  input s_out_tready;
  output [15:0]s_out_tstrb;
  output [0:0]s_out_tuser;
  output s_out_tvalid;

  wire ap_clk;
  wire ap_rst_n;
  wire [127:0]s_in_tdata;
  wire [0:0]s_in_tdest;
  wire [0:0]s_in_tid;
  wire [15:0]s_in_tkeep;
  wire [0:0]s_in_tlast;
  wire s_in_tready;
  wire [15:0]s_in_tstrb;
  wire [0:0]s_in_tuser;
  wire s_in_tvalid;
  wire [127:0]s_out_tdata;
  wire [0:0]s_out_tdest;
  wire [0:0]s_out_tid;
  wire [15:0]s_out_tkeep;
  wire [0:0]s_out_tlast;
  wire s_out_tready;
  wire [15:0]s_out_tstrb;
  wire [0:0]s_out_tuser;
  wire s_out_tvalid;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .s_in_tdata(s_in_tdata),
        .s_in_tdest(s_in_tdest),
        .s_in_tid(s_in_tid),
        .s_in_tkeep(s_in_tkeep),
        .s_in_tlast(s_in_tlast),
        .s_in_tready(s_in_tready),
        .s_in_tstrb(s_in_tstrb),
        .s_in_tuser(s_in_tuser),
        .s_in_tvalid(s_in_tvalid),
        .s_out_tdata(s_out_tdata),
        .s_out_tdest(s_out_tdest),
        .s_out_tid(s_out_tid),
        .s_out_tkeep(s_out_tkeep),
        .s_out_tlast(s_out_tlast),
        .s_out_tready(s_out_tready),
        .s_out_tstrb(s_out_tstrb),
        .s_out_tuser(s_out_tuser),
        .s_out_tvalid(s_out_tvalid));
endmodule
