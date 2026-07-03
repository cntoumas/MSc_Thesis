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


// IP VLNV: xilinx.com:hls:fft_mdf:1.0
// IP Revision: 2114676598

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_0_hls_inst_0 (
  s_in_TVALID,
  s_in_TREADY,
  s_in_TDATA,
  s_in_TKEEP,
  s_in_TSTRB,
  s_in_TUSER,
  s_in_TLAST,
  s_in_TID,
  s_in_TDEST,
  s_out_TVALID,
  s_out_TREADY,
  s_out_TDATA,
  s_out_TKEEP,
  s_out_TSTRB,
  s_out_TUSER,
  s_out_TLAST,
  s_out_TID,
  s_out_TDEST,
  ap_clk,
  ap_rst_n
);

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in TVALID" *)
input wire s_in_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in TREADY" *)
output wire s_in_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in TDATA" *)
input wire [127 : 0] s_in_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in TKEEP" *)
input wire [15 : 0] s_in_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in TSTRB" *)
input wire [15 : 0] s_in_TSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in TUSER" *)
input wire [0 : 0] s_in_TUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in TLAST" *)
input wire [0 : 0] s_in_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in TID" *)
input wire [0 : 0] s_in_TID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_in, TDATA_NUM_BYTES 16, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_in TDEST" *)
input wire [0 : 0] s_in_TDEST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out TVALID" *)
output wire s_out_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out TREADY" *)
input wire s_out_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out TDATA" *)
output wire [127 : 0] s_out_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out TKEEP" *)
output wire [15 : 0] s_out_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out TSTRB" *)
output wire [15 : 0] s_out_TSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out TUSER" *)
output wire [0 : 0] s_out_TUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out TLAST" *)
output wire [0 : 0] s_out_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out TID" *)
output wire [0 : 0] s_out_TID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_out, TDATA_NUM_BYTES 16, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_out TDEST" *)
output wire [0 : 0] s_out_TDEST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_in:s_out, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SIM_INST = "" *)
  fft_mdf inst (
    .s_in_TVALID(s_in_TVALID),
    .s_in_TREADY(s_in_TREADY),
    .s_in_TDATA(s_in_TDATA),
    .s_in_TKEEP(s_in_TKEEP),
    .s_in_TSTRB(s_in_TSTRB),
    .s_in_TUSER(s_in_TUSER),
    .s_in_TLAST(s_in_TLAST),
    .s_in_TID(s_in_TID),
    .s_in_TDEST(s_in_TDEST),
    .s_out_TVALID(s_out_TVALID),
    .s_out_TREADY(s_out_TREADY),
    .s_out_TDATA(s_out_TDATA),
    .s_out_TKEEP(s_out_TKEEP),
    .s_out_TSTRB(s_out_TSTRB),
    .s_out_TUSER(s_out_TUSER),
    .s_out_TLAST(s_out_TLAST),
    .s_out_TID(s_out_TID),
    .s_out_TDEST(s_out_TDEST),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n)
  );
endmodule
