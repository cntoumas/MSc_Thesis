# ==============================================================================
# Parallel 1024-pt MDF Radix-2 DIF FFT (P=4) — Timing Constraints
# Target: Any Artix-7 device (timing-only, no physical pin assignments)
#
# Key differences from Serial FFT:
#   * Clock port is "aclk" (not "clk")
#   * Reset is active-LOW "aresetn"
#   * TDATA is 128-bit (4 parallel paths x 2 x 16-bit)
# ==============================================================================

# ------------------------------------------------------------------------------
# Primary clock  —  100 MHz
# ------------------------------------------------------------------------------
create_clock -period 10.000 -name sys_clk [get_ports aclk]  ; # 100 MHz

# ------------------------------------------------------------------------------
# Bitstream / configuration voltage
# ------------------------------------------------------------------------------
set_property CONFIG_VOLTAGE  3.3  [current_design]
set_property CFGBVS          VCCO [current_design]

# Allow bitstream generation without physical pin assignments.
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
