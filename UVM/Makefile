#==============================================================================
# UVM verification Makefile — Vivado xsim 2023.2 + UVM 1.2
#==============================================================================
# Targets:
#   make refs        — run scripts/gen_refs.py to produce stimulus/expected .mem
#   make serial      — compile Serial FFT DUT + UVM env and run smoke/regression
#   make parallel    — compile Parallel MDF DUT + UVM env and run
#   make regression  — both DUTs + parse logs + PNG summary
#   make coverage    — emit code-coverage report
#   make clean       — wipe build outputs
#
# Override on the command line:
#   make serial UVM_TESTNAME=fft_smoke_test
#   make serial UVM_TESTNAME=fft_regression_test
#==============================================================================
#
# History: Day 1-2 used ModelSim SE 10.6d + mtiUvm (UVM 1.1d). Day 3 pivoted
# to Vivado 2023.2 xsim because ModelSim SE requires a license that's not
# available on this machine. xsim ships UVM 1.2 and is free with Vivado;
# the SystemVerilog source code did not need to change.
#==============================================================================

# Vivado install (must contain bin/xvlog.bat, xelab.bat, xsim.bat)
VIVADO_BIN := C:/Xilinx/Vivado/2023.2/bin

# Tools — invoked via cmd.exe so the .bat wrappers pick up Vivado's env
CMD := cmd.exe //c
XVLOG_RAW := $(VIVADO_BIN)/xvlog.bat
XELAB_RAW := $(VIVADO_BIN)/xelab.bat
XSIM_RAW  := $(VIVADO_BIN)/xsim.bat

# Default test
UVM_TESTNAME ?= fft_smoke_test

# Coverage database name — set per-invocation by run_regression.py so each
# test's results land in a separate sub-DB. The merge step (xcrg) combines
# them. Default kept simple so 'make serial' on its own still writes one.
COV_DB_NAME ?= $(UVM_TESTNAME)

# Common xvlog flags. -L uvm links the precompiled UVM library that ships with
# Vivado (UVM 1.2). +incdir+ tells the preprocessor where to find `include files.
XVLOG_FLAGS := -sv -L uvm \
               -i $(VIVADO_BIN)/../data/xsim/systemverilog/uvm \
               -i env -i seq -i tests

# Coverage flags (Day 5)
XELAB_COVER := -cc bcst
XSIM_COVER  := -cov_db cov_serial

# Test top
TB_SERIAL_TOP := tb_top_serial
TB_PARALL_TOP := tb_top_parallel

# RTL roots (paths contain spaces — quote in rule body)
RTL_SERIAL_DIR    := ../serial_fft/rtl
RTL_PARALLEL_DIR  := ../parallel_mdf_fft/rtl
ROM_SERIAL_DIR    := ../serial_fft/rom

# UVM env sources
ENV_SRCS := env/axi_stream_if.sv env/fft_pkg.sv

# DUT testbench tops
TB_SERIAL    := tb/tb_top_serial.sv
TB_PARALLEL  := tb/tb_top_parallel.sv

#==============================================================================
.PHONY: refs env-check serial parallel regression coverage clean \
        bp-serial bp-parallel equiv

# Backpressure tuning — pulse tready low BP_LOW cycles every BP_LOW+BP_HIGH.
# Override on the command line: make bp-serial BP_LOW=3 BP_HIGH=15
BP_LOW  ?= 2
BP_HIGH ?= 10

#------------------------------------------------------------------------------
# refs — pre-compute NumPy reference vectors as .mem files
#------------------------------------------------------------------------------
refs:
	python scripts/gen_refs.py

#------------------------------------------------------------------------------
# env-check — compile just the env package (no DUT, no run)
#------------------------------------------------------------------------------
env-check:
	$(CMD) "$(XVLOG_RAW) $(XVLOG_FLAGS) $(ENV_SRCS)"
	@echo "[env-check] OK"

#------------------------------------------------------------------------------
# serial — compile + run on Serial FFT DUT
#------------------------------------------------------------------------------
serial: refs
	@mkdir -p actuals
	@cp "$(ROM_SERIAL_DIR)"/cos.mem cos.mem
	@cp "$(ROM_SERIAL_DIR)"/sin.mem sin.mem
	$(CMD) "$(XVLOG_RAW) -L uvm -f scripts/serial.f"
	$(CMD) "$(XELAB_RAW) -L uvm -L work -timescale 1ns/1ps --relax --debug typical work.$(TB_SERIAL_TOP) -s $(TB_SERIAL_TOP)_snap"
	$(CMD) "$(XSIM_RAW) $(TB_SERIAL_TOP)_snap -runall -testplusarg \"UVM_TESTNAME=$(UVM_TESTNAME)\" --cov_db_dir cov_db --cov_db_name serial_$(COV_DB_NAME)"

#------------------------------------------------------------------------------
# parallel — compile + run on Parallel MDF DUT (Day 4)
#------------------------------------------------------------------------------
parallel: refs
	@mkdir -p actuals
	@mkdir -p parallel_rom
	@cp "../parallel_mdf_fft/rom"/*.hex parallel_rom/
	@cp "../parallel_mdf_fft/rom"/*.mem parallel_rom/ 2>/dev/null || true
	@# twiddle_rom.v in the Parallel design also $readmemh's the legacy
	@# 1/8-cycle .mem files (twiddle_cos_eighth.mem / twiddle_sin_eighth.mem)
	@# which live at the project root, not under rom/. Copy them to the
	@# xsim cwd (= UVM/) since the $readmemh path is unqualified.
	@cp "../parallel_mdf_fft"/twiddle_*.mem . 2>/dev/null || true
	$(CMD) "$(XVLOG_RAW) -L uvm -f scripts/parallel.f"
	$(CMD) "$(XELAB_RAW) -L uvm -L work -timescale 1ns/1ps --relax --debug typical work.$(TB_PARALL_TOP) -s $(TB_PARALL_TOP)_snap"
	$(CMD) "$(XSIM_RAW) $(TB_PARALL_TOP)_snap -runall -testplusarg \"UVM_TESTNAME=$(UVM_TESTNAME)\" --cov_db_dir cov_db --cov_db_name parallel_$(COV_DB_NAME)"

#------------------------------------------------------------------------------
# bp-serial / bp-parallel — backpressure-stress runs.
# Pulses tready low for BP_LOW cycles every BP_LOW+BP_HIGH (default 2/10).
# Used to exercise the AXI4-Stream stable-on-stall properties bound in
# tb/axi_stream_sva.sv (`tdata_stable`, `tlast_stable`).
#------------------------------------------------------------------------------
bp-serial: refs
	@mkdir -p actuals
	@cp "$(ROM_SERIAL_DIR)"/cos.mem cos.mem
	@cp "$(ROM_SERIAL_DIR)"/sin.mem sin.mem
	$(CMD) "$(XVLOG_RAW) -L uvm -f scripts/serial.f"
	$(CMD) "$(XELAB_RAW) -L uvm -L work -timescale 1ns/1ps --relax --debug typical work.$(TB_SERIAL_TOP) -s $(TB_SERIAL_TOP)_snap"
	$(CMD) "$(XSIM_RAW) $(TB_SERIAL_TOP)_snap -runall -testplusarg \"UVM_TESTNAME=$(UVM_TESTNAME)\" -testplusarg \"BP_LOW=$(BP_LOW)\" -testplusarg \"BP_HIGH=$(BP_HIGH)\""

bp-parallel: refs
	@mkdir -p actuals
	@mkdir -p parallel_rom
	@cp "../parallel_mdf_fft/rom"/*.hex parallel_rom/
	@cp "../parallel_mdf_fft/rom"/*.mem parallel_rom/ 2>/dev/null || true
	@cp "../parallel_mdf_fft"/twiddle_*.mem . 2>/dev/null || true
	$(CMD) "$(XVLOG_RAW) -L uvm -f scripts/parallel.f"
	$(CMD) "$(XELAB_RAW) -L uvm -L work -timescale 1ns/1ps --relax --debug typical work.$(TB_PARALL_TOP) -s $(TB_PARALL_TOP)_snap"
	$(CMD) "$(XSIM_RAW) $(TB_PARALL_TOP)_snap -runall -testplusarg \"UVM_TESTNAME=$(UVM_TESTNAME)\" -testplusarg \"BP_LOW=$(BP_LOW)\" -testplusarg \"BP_HIGH=$(BP_HIGH)\""

#------------------------------------------------------------------------------
# equiv — Serial vs Parallel direct equivalence check.
# Loops both DUTs across all 5 tests, dumps actuals/<dut>_<test>.txt,
# runs the Python equivalence checker, and emits equivalence_summary.png.
#------------------------------------------------------------------------------
equiv:
	python scripts/equivalence_check.py

serial-regression:
	python scripts/run_regression.py serial

parallel-regression:
	python scripts/run_regression.py parallel

regression:
	python scripts/run_regression.py both

#------------------------------------------------------------------------------
# coverage — merge per-test cov_db sub-databases into one HTML report.
# Each `make serial UVM_TESTNAME=fft_X_test` and `make parallel ...` writes
# to cov_db/xsim.covdb/<dut>_<testname>/. xcrg merges them.
#------------------------------------------------------------------------------
XCRG_RAW := $(VIVADO_BIN)/xcrg.bat
coverage:
	$(CMD) "$(XCRG_RAW) -dir cov_db -report_format html -report_dir cov_html"
	@echo "Coverage report -> cov_html/"

#------------------------------------------------------------------------------
clean:
	rm -rf xsim.dir *.jou *.log *.pb *.wdb xelab.* xvlog.* webtalk.* \
	       work transcript *.ucdb cov_html actuals

clean-refs:
	rm -f refs/serial/*.mem refs/parallel/*.mem

clean-all: clean clean-refs
