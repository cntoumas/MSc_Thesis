create_clock -period 10.000 -name sys_clk [get_ports aclk]  ; # 100 MHz

set_property CONFIG_VOLTAGE  3.3  [current_design]
set_property CFGBVS          VCCO [current_design]

# Allow bitstream generation without physical pin assignments.
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]