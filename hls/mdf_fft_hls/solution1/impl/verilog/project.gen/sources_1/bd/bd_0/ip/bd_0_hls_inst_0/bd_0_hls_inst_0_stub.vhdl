-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Tue Jun 30 21:00:36 2026
-- Host        : CHNtoumas running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/ntoum/Desktop/thesis_repo/hls/mdf_fft_hls/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bd_0_hls_inst_0 is
  Port ( 
    s_in_TVALID : in STD_LOGIC;
    s_in_TREADY : out STD_LOGIC;
    s_in_TDATA : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_in_TKEEP : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_in_TSTRB : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_in_TUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_in_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_in_TID : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_in_TDEST : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_out_TVALID : out STD_LOGIC;
    s_out_TREADY : in STD_LOGIC;
    s_out_TDATA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_out_TKEEP : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_out_TSTRB : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_out_TUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_out_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_out_TID : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_out_TDEST : out STD_LOGIC_VECTOR ( 0 to 0 );
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC
  );

end bd_0_hls_inst_0;

architecture stub of bd_0_hls_inst_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_in_TVALID,s_in_TREADY,s_in_TDATA[127:0],s_in_TKEEP[15:0],s_in_TSTRB[15:0],s_in_TUSER[0:0],s_in_TLAST[0:0],s_in_TID[0:0],s_in_TDEST[0:0],s_out_TVALID,s_out_TREADY,s_out_TDATA[127:0],s_out_TKEEP[15:0],s_out_TSTRB[15:0],s_out_TUSER[0:0],s_out_TLAST[0:0],s_out_TID[0:0],s_out_TDEST[0:0],ap_clk,ap_rst_n";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "fft_mdf,Vivado 2023.2";
begin
end;
