//------------------------------------------------------------------------------
// axi_stream_monitor.sv
//------------------------------------------------------------------------------
// Passive UVM monitor — snoops an AXI4-Stream interface and broadcasts every
// captured beat to subscribers (scoreboard, coverage collector) via an
// analysis port.
//
// Configurable for either side:
//   - S_AXIS monitor (snoops the stimulus we drive — for coverage)
//   - M_AXIS monitor (snoops the DUT response — for scoreboarding)
//
// Special handling for the Serial FFT's M_AXIS quirk: fft_axi_top holds
// tdata stable for ~2 cycles per beat (BRAM read bubble), so every other
// (tvalid && tready) handshake on M_AXIS is a duplicate of the previous
// beat. The same `sample_phase` toggle from fft_axi_tb_xc7.v deduplicates.
// Set `m_axis_dedup = 1` for the M_AXIS monitor; leave 0 for S_AXIS.
//------------------------------------------------------------------------------
`ifndef AXI_STREAM_MONITOR_SV
`define AXI_STREAM_MONITOR_SV

class axi_stream_monitor extends uvm_monitor;

    `uvm_component_utils(axi_stream_monitor)

    // Virtual interface (monitor modport — read-only)
    virtual axi_stream_if.monitor vif;

    // Configuration
    bit          m_axis_dedup = 0;  // 1 → skip every other handshake (Serial M_AXIS)
    int unsigned p_pack       = 1;
    string       label        = "?";

    // Analysis port — broadcasts captured items to any subscriber
    uvm_analysis_port #(axi_stream_seq_item) ap;

    //--------------------------------------------------------------------------
    function new(string name = "axi_stream_monitor", uvm_component parent = null);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual axi_stream_if.monitor)::get(this, "", "vif", vif))
            `uvm_fatal("AXIMON", $sformatf("%s: vif handle not set in uvm_config_db", get_full_name()))
        void'(uvm_config_db#(bit)::get(this, "", "m_axis_dedup", m_axis_dedup));
        void'(uvm_config_db#(int unsigned)::get(this, "", "p_pack", p_pack));
        void'(uvm_config_db#(string)::get(this, "", "label", label));
        `uvm_info("AXIMON",
                  $sformatf("monitor '%s' built (dedup=%0d P=%0d)", label, m_axis_dedup, p_pack),
                  UVM_LOW)
    endfunction

    //--------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        axi_stream_seq_item item;
        int  beat_idx     = 0;
        bit  sample_phase = 1'b0;  // toggles on every handshake (dedup helper)

        // Wait for reset to release
        @(negedge vif.rst);

        forever begin
            @(posedge vif.clk);

            // Handshake detection (sample by reading both signals at the edge)
            if (vif.tvalid === 1'b1 && vif.tready === 1'b1) begin

                // Dedup: M_AXIS holds beat for 2 cycles → take only the first
                if (m_axis_dedup && sample_phase) begin
                    sample_phase = ~sample_phase;
                    continue;   // skip this duplicate
                end

                item = axi_stream_seq_item::type_id::create("item");
                item.tdata      = vif.tdata;
                item.tlast      = vif.tlast;
                item.tuser      = vif.tuser;
                item.beat_index = beat_idx;

                ap.write(item);

                `uvm_info("AXIMON",
                          $sformatf("%s captured %s", label, item.convert2string()),
                          UVM_HIGH)

                beat_idx++;
                if (vif.tlast) begin
                    `uvm_info("AXIMON",
                              $sformatf("%s saw tlast — %0d beats total in this block",
                                        label, beat_idx),
                              UVM_LOW)
                    beat_idx = 0;
                end
                sample_phase = ~sample_phase;
            end
        end
    endtask

endclass

`endif // AXI_STREAM_MONITOR_SV
