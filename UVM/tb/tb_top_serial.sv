//------------------------------------------------------------------------------
// tb_top_serial.sv
//------------------------------------------------------------------------------
// Top-level testbench module for the Serial FFT processor (P=1).
//
// Responsibilities:
//   - Generate clk (100 MHz) and rst
//   - Instantiate the S_AXIS and M_AXIS interfaces (P=1)
//   - Instantiate the DUT (Serial fft_axi_top)
//   - Connect the DUT's pin-level ports to the interface signals
//   - Place the virtual interfaces in the uvm_config_db so the UVM env
//     can fetch them in build_phase
//   - Call run_test()
//
// Run from the UVM/ directory so that cos.mem / sin.mem are findable by
// the twiddle ROM's $readmemh calls (see Makefile rom-copy step).
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tb_top_serial;

    import uvm_pkg::*;
    import fft_pkg::*;
    `include "uvm_macros.svh"

    //--------------------------------------------------------------------------
    // Clock and reset
    //--------------------------------------------------------------------------
    logic clk = 1'b0;
    logic rst = 1'b1;

    always #5 clk = ~clk;        // 10 ns period → 100 MHz

    initial begin
        rst = 1'b1;
        repeat (20) @(posedge clk);
        rst = 1'b0;
        `uvm_info("TB", "reset released", UVM_LOW)
    end

    //--------------------------------------------------------------------------
    // Interface instances (P=1 for Serial — uses the interface's defaults)
    // NOTE: we instantiate without explicit parameter overrides so xsim
    // unifies the `virtual axi_stream_if` handle type in the UVM driver/monitor
    // with the testbench's instance. Defaults match: DATA_WIDTH=16, P=1, TUSER_W=8.
    //--------------------------------------------------------------------------
    axi_stream_if s_if (.clk(clk), .rst(rst));
    axi_stream_if m_if (.clk(clk), .rst(rst));

    //--------------------------------------------------------------------------
    // DUT — Serial fft_axi_top. The interface tdata is 128-bit (to fit the
    // Parallel DUT) so we slice to 32-bit when connecting to Serial. M_AXIS
    // upper bits stay 0 from the interface init; only the low 32 carry data.
    //--------------------------------------------------------------------------
    wire [31:0] dut_m_axis_tdata;
    assign m_if.tdata = {96'h0, dut_m_axis_tdata};

    fft_axi_top #(
        .N(1024), .DATA_WIDTH(16), .LOG2_N(10)
    ) dut (
        .clk            (clk),
        .rst            (rst),
        // S_AXIS — driven by UVM driver via s_if (slice lower 32 bits)
        .s_axis_tdata   (s_if.tdata[31:0]),
        .s_axis_tvalid  (s_if.tvalid),
        .s_axis_tlast   (s_if.tlast),
        .s_axis_tready  (s_if.tready),
        // M_AXIS — observed by UVM monitor via m_if (32-bit out → 128-bit if)
        .m_axis_tdata   (dut_m_axis_tdata),
        .m_axis_tvalid  (m_if.tvalid),
        .m_axis_tready  (m_if.tready),
        .m_axis_tlast   (m_if.tlast),
        .m_axis_tuser   (m_if.tuser)
    );

    // The M_AXIS monitor is PASSIVE — it does NOT drive tready. By default
    // we hold tready high; pass +BP_LOW=N +BP_HIGH=M to pulse tready low
    // for N cycles every M+N cycles (AXI4-Stream backpressure stress).
    int  bp_low_cycles  = 0;
    int  bp_high_cycles = 0;
    int  bp_counter     = 0;
    bit  bp_low_active  = 1'b0;

    initial begin
        s_if.tuser = 8'h00;     // unused on slave side, tie low to avoid X
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
        // Place virtual interfaces in the config_db BEFORE run_test fires
        uvm_config_db#(virtual axi_stream_if.master)::set(
            null, "uvm_test_top.env.s_axis_agent.driver",  "vif", s_if);
        uvm_config_db#(virtual axi_stream_if.monitor)::set(
            null, "uvm_test_top.env.s_axis_agent.monitor", "vif", s_if);
        uvm_config_db#(virtual axi_stream_if.monitor)::set(
            null, "uvm_test_top.env.m_axis_agent.monitor", "vif", m_if);

        // DUT-specific config (Serial → P=1, is_parallel=0, refs in refs/serial)
        uvm_config_db#(int unsigned)::set(null, "uvm_test_top", "p_pack",      1);
        uvm_config_db#(bit)         ::set(null, "uvm_test_top", "is_parallel", 1'b0);
        uvm_config_db#(string)      ::set(null, "uvm_test_top", "refs_dir",    "refs/serial");

        // Optional waveform dump
        if ($test$plusargs("DUMP")) begin
            $dumpfile("tb_top_serial.vcd");
            $dumpvars(0, tb_top_serial);
        end

        run_test();
    end

    //--------------------------------------------------------------------------
    // Hard timeout — abort after 5 ms simulated to catch hangs
    //--------------------------------------------------------------------------
    initial begin
        #5_000_000;
        `uvm_fatal("TB", "5 ms wall-clock timeout — sim hung")
    end

    //--------------------------------------------------------------------------
    // AXI4-Stream protocol assertions on both ports.
    //--------------------------------------------------------------------------
    axi_stream_sva #(.LABEL("S_AXIS_serial")) sva_s (
        .clk(clk), .rst(rst),
        .tdata(s_if.tdata), .tvalid(s_if.tvalid),
        .tready(s_if.tready), .tlast(s_if.tlast), .tuser(s_if.tuser)
    );
    axi_stream_sva #(.LABEL("M_AXIS_serial")) sva_m (
        .clk(clk), .rst(rst),
        .tdata(m_if.tdata), .tvalid(m_if.tvalid),
        .tready(m_if.tready), .tlast(m_if.tlast), .tuser(m_if.tuser)
    );

endmodule
