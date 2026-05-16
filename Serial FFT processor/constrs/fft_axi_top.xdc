# ==============================================================================
# Serial 1024-pt BFP FFT — Timing Constraints
# Target: Any Artix-7 device (timing-only, no physical pin assignments)
#
# I/O delay constraints are intentionally omitted: all AXI-Stream ports
# connect to other on-chip IP blocks in a Vivado block design, so Vivado's
# timing engine constrains those paths automatically via the clock definition.
# Adding explicit input/output delays for on-chip ports creates artificial
# budget reductions that cause false timing violations.
# ==============================================================================

# ------------------------------------------------------------------------------
# Primary clock  —  100 MHz
# Adjust the period here if your board's oscillator differs.
# ------------------------------------------------------------------------------
create_clock -period 10.000 -name sys_clk [get_ports clk]

# ------------------------------------------------------------------------------
# BFP stage-boundary multicycle path
# new_stage_delay_pipe fires once per FFT stage (every 512 cycles).
# Relax setup/hold slightly to ease router pressure on this slow-moving path.
# ------------------------------------------------------------------------------
set_multicycle_path -setup -from [get_cells {u_fft/new_stage_delay_pipe_reg[*]}] 2
set_multicycle_path -hold -from [get_cells {u_fft/new_stage_delay_pipe_reg[*]}] 1

# ------------------------------------------------------------------------------
# Bitstream / configuration voltage  (safe defaults — edit if your board differs)
# ------------------------------------------------------------------------------
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

# Allow bitstream generation without physical pin assignments (no board target yet).
# Remove these once real pin assignments are added.
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {m_axis_tdata_OBUF[0]} {m_axis_tdata_OBUF[1]} {m_axis_tdata_OBUF[2]} {m_axis_tdata_OBUF[3]} {m_axis_tdata_OBUF[4]} {m_axis_tdata_OBUF[5]} {m_axis_tdata_OBUF[6]} {m_axis_tdata_OBUF[7]} {m_axis_tdata_OBUF[8]} {m_axis_tdata_OBUF[9]} {m_axis_tdata_OBUF[10]} {m_axis_tdata_OBUF[11]} {m_axis_tdata_OBUF[12]} {m_axis_tdata_OBUF[13]} {m_axis_tdata_OBUF[14]} {m_axis_tdata_OBUF[15]} {m_axis_tdata_OBUF[16]} {m_axis_tdata_OBUF[17]} {m_axis_tdata_OBUF[18]} {m_axis_tdata_OBUF[19]} {m_axis_tdata_OBUF[20]} {m_axis_tdata_OBUF[21]} {m_axis_tdata_OBUF[22]} {m_axis_tdata_OBUF[23]} {m_axis_tdata_OBUF[24]} {m_axis_tdata_OBUF[25]} {m_axis_tdata_OBUF[26]} {m_axis_tdata_OBUF[27]} {m_axis_tdata_OBUF[28]} {m_axis_tdata_OBUF[29]} {m_axis_tdata_OBUF[30]} {m_axis_tdata_OBUF[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {m_axis_tuser_OBUF[0]} {m_axis_tuser_OBUF[1]} {m_axis_tuser_OBUF[2]} {m_axis_tuser_OBUF[3]} {m_axis_tuser_OBUF[4]} {m_axis_tuser_OBUF[5]} {m_axis_tuser_OBUF[6]} {m_axis_tuser_OBUF[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 10 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {load_cnt[0]} {load_cnt[1]} {load_cnt[2]} {load_cnt[3]} {load_cnt[4]} {load_cnt[5]} {load_cnt[6]} {load_cnt[7]} {load_cnt[8]} {load_cnt[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {state[0]} {state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 10 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {unload_cnt[0]} {unload_cnt[1]} {unload_cnt[2]} {unload_cnt[3]} {unload_cnt[4]} {unload_cnt[5]} {unload_cnt[6]} {unload_cnt[7]} {unload_cnt[8]} {unload_cnt[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list fft_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list m_axis_tlast_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list m_axis_tvalid_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list p_0_in]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list p_1_in]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list p_1_in1_in]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list s_axis_tready_OBUF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
