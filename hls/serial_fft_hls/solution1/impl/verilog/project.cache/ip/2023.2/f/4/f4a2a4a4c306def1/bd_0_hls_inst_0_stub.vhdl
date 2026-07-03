-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Tue Jun 30 20:52:29 2026
-- Host        : CHNtoumas running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_AXI_IN_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_AXI_IN_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_AXI_IN_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_AXI_IN_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_AXI_IN_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_IN_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_IN_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_IN_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_IN_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_AXI_IN_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_IN_AWVALID : out STD_LOGIC;
    m_axi_AXI_IN_AWREADY : in STD_LOGIC;
    m_axi_AXI_IN_WID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_AXI_IN_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_AXI_IN_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_IN_WLAST : out STD_LOGIC;
    m_axi_AXI_IN_WVALID : out STD_LOGIC;
    m_axi_AXI_IN_WREADY : in STD_LOGIC;
    m_axi_AXI_IN_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_AXI_IN_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_IN_BVALID : in STD_LOGIC;
    m_axi_AXI_IN_BREADY : out STD_LOGIC;
    m_axi_AXI_IN_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_AXI_IN_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_AXI_IN_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_AXI_IN_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_AXI_IN_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_IN_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_IN_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_IN_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_IN_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_AXI_IN_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_IN_ARVALID : out STD_LOGIC;
    m_axi_AXI_IN_ARREADY : in STD_LOGIC;
    m_axi_AXI_IN_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_AXI_IN_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_AXI_IN_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_IN_RLAST : in STD_LOGIC;
    m_axi_AXI_IN_RVALID : in STD_LOGIC;
    m_axi_AXI_IN_RREADY : out STD_LOGIC;
    m_axi_AXI_OUT_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_AXI_OUT_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_AXI_OUT_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_AXI_OUT_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_AXI_OUT_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_OUT_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_OUT_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_OUT_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_OUT_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_AXI_OUT_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_OUT_AWVALID : out STD_LOGIC;
    m_axi_AXI_OUT_AWREADY : in STD_LOGIC;
    m_axi_AXI_OUT_WID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_AXI_OUT_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_AXI_OUT_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_OUT_WLAST : out STD_LOGIC;
    m_axi_AXI_OUT_WVALID : out STD_LOGIC;
    m_axi_AXI_OUT_WREADY : in STD_LOGIC;
    m_axi_AXI_OUT_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_AXI_OUT_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_OUT_BVALID : in STD_LOGIC;
    m_axi_AXI_OUT_BREADY : out STD_LOGIC;
    m_axi_AXI_OUT_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_AXI_OUT_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_AXI_OUT_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_AXI_OUT_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_AXI_OUT_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_OUT_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_OUT_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_OUT_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_OUT_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_AXI_OUT_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_AXI_OUT_ARVALID : out STD_LOGIC;
    m_axi_AXI_OUT_ARREADY : in STD_LOGIC;
    m_axi_AXI_OUT_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_AXI_OUT_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_AXI_OUT_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_AXI_OUT_RLAST : in STD_LOGIC;
    m_axi_AXI_OUT_RVALID : in STD_LOGIC;
    m_axi_AXI_OUT_RREADY : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_control_AWADDR[6:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[6:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_AXI_IN_AWID[0:0],m_axi_AXI_IN_AWADDR[63:0],m_axi_AXI_IN_AWLEN[7:0],m_axi_AXI_IN_AWSIZE[2:0],m_axi_AXI_IN_AWBURST[1:0],m_axi_AXI_IN_AWLOCK[1:0],m_axi_AXI_IN_AWREGION[3:0],m_axi_AXI_IN_AWCACHE[3:0],m_axi_AXI_IN_AWPROT[2:0],m_axi_AXI_IN_AWQOS[3:0],m_axi_AXI_IN_AWVALID,m_axi_AXI_IN_AWREADY,m_axi_AXI_IN_WID[0:0],m_axi_AXI_IN_WDATA[31:0],m_axi_AXI_IN_WSTRB[3:0],m_axi_AXI_IN_WLAST,m_axi_AXI_IN_WVALID,m_axi_AXI_IN_WREADY,m_axi_AXI_IN_BID[0:0],m_axi_AXI_IN_BRESP[1:0],m_axi_AXI_IN_BVALID,m_axi_AXI_IN_BREADY,m_axi_AXI_IN_ARID[0:0],m_axi_AXI_IN_ARADDR[63:0],m_axi_AXI_IN_ARLEN[7:0],m_axi_AXI_IN_ARSIZE[2:0],m_axi_AXI_IN_ARBURST[1:0],m_axi_AXI_IN_ARLOCK[1:0],m_axi_AXI_IN_ARREGION[3:0],m_axi_AXI_IN_ARCACHE[3:0],m_axi_AXI_IN_ARPROT[2:0],m_axi_AXI_IN_ARQOS[3:0],m_axi_AXI_IN_ARVALID,m_axi_AXI_IN_ARREADY,m_axi_AXI_IN_RID[0:0],m_axi_AXI_IN_RDATA[31:0],m_axi_AXI_IN_RRESP[1:0],m_axi_AXI_IN_RLAST,m_axi_AXI_IN_RVALID,m_axi_AXI_IN_RREADY,m_axi_AXI_OUT_AWID[0:0],m_axi_AXI_OUT_AWADDR[63:0],m_axi_AXI_OUT_AWLEN[7:0],m_axi_AXI_OUT_AWSIZE[2:0],m_axi_AXI_OUT_AWBURST[1:0],m_axi_AXI_OUT_AWLOCK[1:0],m_axi_AXI_OUT_AWREGION[3:0],m_axi_AXI_OUT_AWCACHE[3:0],m_axi_AXI_OUT_AWPROT[2:0],m_axi_AXI_OUT_AWQOS[3:0],m_axi_AXI_OUT_AWVALID,m_axi_AXI_OUT_AWREADY,m_axi_AXI_OUT_WID[0:0],m_axi_AXI_OUT_WDATA[31:0],m_axi_AXI_OUT_WSTRB[3:0],m_axi_AXI_OUT_WLAST,m_axi_AXI_OUT_WVALID,m_axi_AXI_OUT_WREADY,m_axi_AXI_OUT_BID[0:0],m_axi_AXI_OUT_BRESP[1:0],m_axi_AXI_OUT_BVALID,m_axi_AXI_OUT_BREADY,m_axi_AXI_OUT_ARID[0:0],m_axi_AXI_OUT_ARADDR[63:0],m_axi_AXI_OUT_ARLEN[7:0],m_axi_AXI_OUT_ARSIZE[2:0],m_axi_AXI_OUT_ARBURST[1:0],m_axi_AXI_OUT_ARLOCK[1:0],m_axi_AXI_OUT_ARREGION[3:0],m_axi_AXI_OUT_ARCACHE[3:0],m_axi_AXI_OUT_ARPROT[2:0],m_axi_AXI_OUT_ARQOS[3:0],m_axi_AXI_OUT_ARVALID,m_axi_AXI_OUT_ARREADY,m_axi_AXI_OUT_RID[0:0],m_axi_AXI_OUT_RDATA[31:0],m_axi_AXI_OUT_RRESP[1:0],m_axi_AXI_OUT_RLAST,m_axi_AXI_OUT_RVALID,m_axi_AXI_OUT_RREADY";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "fft_serial,Vivado 2023.2";
begin
end;
