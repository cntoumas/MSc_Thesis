`ifndef AXI_STREAM_AGENT_SV
`define AXI_STREAM_AGENT_SV

// Type alias for the sequencer — a plain uvm_sequencer specialised to our item
typedef uvm_sequencer#(axi_stream_seq_item) axi_stream_sequencer;

class axi_stream_agent extends uvm_agent;

    `uvm_component_utils(axi_stream_agent)

    axi_stream_sequencer sequencer;   // only built when ACTIVE
    axi_stream_driver    driver;      // only built when ACTIVE
    axi_stream_monitor   monitor;     // always built

    function new(string name = "axi_stream_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        monitor = axi_stream_monitor::type_id::create("monitor", this);
        if (get_is_active() == UVM_ACTIVE) begin
            sequencer = axi_stream_sequencer::type_id::create("sequencer", this);
            driver    = axi_stream_driver   ::type_id::create("driver",    this);
        end
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        if (get_is_active() == UVM_ACTIVE)
            driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction

endclass

`endif // AXI_STREAM_AGENT_SV