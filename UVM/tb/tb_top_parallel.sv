//------------------------------------------------------------------------------
// tb_top_parallel.sv
//------------------------------------------------------------------------------
// Top-level testbench module for the Parallel MDF FFT (P=4).
//
// Differences vs tb_top_serial:
//   - DUT uses aclk/aresetn (active-LOW) instead of clk/rst
//   - tdata is 128-bit (P=4 packed)
//   - tuser is 4-bit (we pad to 8 in the interface)
//   - HEX_DIR parameter points the DUT's twiddle ROMs at parallel_rom/
//   - p_pack=4, is_parallel=1 config_db values
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tb_top_parallel;

    import uvm_pkg::*;
    import fft_pkg::*;
    `include "uvm_macros.svh"

    //--------------------------------------------------------------------------
    // Clock and reset (note: DUT uses ACTIVE-LOW reset)
    //--------------------------------------------------------------------------
    logic clk = 1'b0;
    logic rst = 1'b1;             // active-high (interface convention)
    wire  aresetn = ~rst;         // active-low to the DUT

    always #5 clk = ~clk;         // 10 ns period → 100 MHz

    initial begin
        rst = 1'b1;
        repeat (20) @(posedge clk);
        rst = 1'b0;
        `uvm_info("TB", "reset released", UVM_LOW)
    end

    //--------------------------------------------------------------------------
    // Interface instances — full 128-bit width is used here
    //--------------------------------------------------------------------------
    axi_stream_if s_if (.clk(clk), .rst(rst));
    axi_stream_if m_if (.clk(clk), .rst(rst));

    //--------------------------------------------------------------------------
    // DUT — Parallel MDF fft_axi_top. tuser is 4-bit on the DUT side; we
    // zero-extend into the 8-bit interface field.
    //--------------------------------------------------------------------------
    wire [3:0] dut_m_axis_tuser;
    assign m_if.tuser = {4'h0, dut_m_axis_tuser};

    fft_axi_top #(
        .DATA_W(16), .TWIDDLE_W(16), .N(1024), .P(4),
        .HEX_DIR("parallel_rom")
    ) dut (
        .aclk           (clk),
        .aresetn        (aresetn),

        // S_AXIS — full 128 bits straight from the interface
        .s_axis_tdata   (s_if.tdata),
        .s_axis_tvalid  (s_if.tvalid),
        .s_axis_tready  (s_if.tready),
        .s_axis_tlast   (s_if.tlast),

        // M_AXIS — full 128 bits into the interface
        .m_axis_tdata   (m_if.tdata),
        .m_axis_tvalid  (m_if.tvalid),
        .m_axis_tready  (m_if.tready),
        .m_axis_tlast   (m_if.tlast),
        .m_axis_tuser   (dut_m_axis_tuser)
    );

    // M_AXIS monitor is PASSIVE — drive tready high externally.
    // s_if.tuser is unused on the slave side — tie low to avoid X.
    // Pass +BP_LOW=N +BP_HIGH=M to pulse tready low for N cycles every M+N
    // cycles (AXI4-Stream backpressure stress).
    int  bp_low_cycles  = 0;
    int  bp_high_cycles = 0;
    int  bp_counter     = 0;
    bit  bp_low_active  = 1'b0;

    initial begin
        s_if.tuser  = 8'h00;
        m_if.tready = 1'b1;
        if ($value$plusargs("BP_LOW=%d",  bp_low_cycles) &&
            $value$plusargs("BP_HIGH=%d", bp_high_cycles)) begin
            `uvm_info("TB",
                $sformatf("backpressure ON: tready low %0d cycles every %0d cycles",
                          bp_low_cycles, bp_low_cycles + bp_high_cycles), UVM_LOW)
        end
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            m_if.tready    <= 1'b1;
            bp_counter     <= 0;
            bp_low_active  <= 1'b0;
        end else if (bp_low_cycles > 0 && bp_high_cycles > 0) begin
            bp_counter <= bp_counter + 1;
            if (bp_low_active) begin
                if (bp_counter + 1 >= bp_low_cycles) begin
                    m_if.tready   <= 1'b1;
                    bp_low_active <= 1'b0;
                    bp_counter    <= 0;
                end
            end else begin
                if (bp_counter + 1 >= bp_high_cycles) begin
                    m_if.tready   <= 1'b0;
                    bp_low_active <= 1'b1;
                    bp_counter    <= 0;
                end
            end
        end
    end

    //--------------------------------------------------------------------------
    // UVM run
    //--------------------------------------------------------------------------
    initial begin
        uvm_config_db#(virtual axi_stream_if.master)::set(
            null, "uvm_test_top.env.s_axis_agent.driver",  "vif", s_if);
        uvm_config_db#(virtual axi_stream_if.monitor)::set(
            null, "uvm_test_top.env.s_axis_agent.monitor", "vif", s_if);
        uvm_config_db#(virtual axi_stream_if.monitor)::set(
            null, "uvm_test_top.env.m_axis_agent.monitor", "vif", m_if);

        // DUT-specific config (Parallel → P=4, is_parallel=1, refs in refs/serial)
        // The reference vectors are SHARED across both DUTs (same NumPy FFT).
        uvm_config_db#(int unsigned)::set(null, "uvm_test_top", "p_pack",      4);
        uvm_config_db#(bit)         ::set(null, "uvm_test_top", "is_parallel", 1'b1);
        uvm_config_db#(string)      ::set(null, "uvm_test_top", "refs_dir",    "refs/serial");

        if ($test$plusargs("DUMP")) begin
            $dumpfile("tb_top_parallel.vcd");
            $dumpvars(0, tb_top_parallel);
        end

        run_test();
    end

    //--------------------------------------------------------------------------
    initial begin
        #5_000_000;
        `uvm_fatal("TB", "5 ms wall-clock timeout — sim hung")
    end

    //--------------------------------------------------------------------------
    // AXI4-Stream protocol assertions on both ports.
    //--------------------------------------------------------------------------
    axi_stream_sva #(.LABEL("S_AXIS_parallel")) sva_s (
        .clk(clk), .rst(rst),
        .tdata(s_if.tdata), .tvalid(s_if.tvalid),
        .tready(s_if.tready), .tlast(s_if.tlast), .tuser(s_if.tuser)
    );
    axi_stream_sva #(.LABEL("M_AXIS_parallel")) sva_m (
        .clk(clk), .rst(rst),
        .tdata(m_if.tdata), .tvalid(m_if.tvalid),
        .tready(m_if.tready), .tlast(m_if.tlast), .tuser(m_if.tuser)
    );

endmodule
