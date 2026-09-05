`ifndef AXI_STREAM_DRIVER_SV
`define AXI_STREAM_DRIVER_SV

class axi_stream_driver extends uvm_driver #(axi_stream_seq_item);

    `uvm_component_utils(axi_stream_driver)

    // Virtual interface handle (driver modport — we drive tdata/tvalid/tlast)
    virtual axi_stream_if.master vif;

    // Number of samples packed per AXI beat (1 for Serial, 4 for Parallel)
    int unsigned p_pack = 1;

    function new(string name = "axi_stream_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Fetch the virtual interface placed by the test via uvm_config_db
        if (!uvm_config_db#(virtual axi_stream_if.master)::get(this, "", "vif", vif))
            `uvm_fatal("AXIDRV", "vif handle not set in uvm_config_db")
        // Pick up the P (packing factor) — defaults to 1
        void'(uvm_config_db#(int unsigned)::get(this, "", "p_pack", p_pack));
        `uvm_info("AXIDRV", $sformatf("driver built with P=%0d", p_pack), UVM_LOW)
    endfunction

    task run_phase(uvm_phase phase);
        // Initial inactive state
        vif.tdata  <= '0;
        vif.tvalid <= 1'b0;
        vif.tlast  <= 1'b0;
        vif.tuser  <= '0;

        // Wait for reset to release
        @(negedge vif.rst);
        @(posedge vif.clk);

        // Keep block streams gapless for the DUT timing model.
        forever begin
            seq_item_port.get_next_item(req);
            drive_one_beat(req);
            seq_item_port.item_done();
        end
    endtask

    // Keeps tvalid asserted from the first beat onward; the BURST end
    // (tvalid drop) is handled by the sequence-end watchdog below.
    task drive_one_beat(axi_stream_seq_item item);
        @(negedge vif.clk);
        vif.tdata  = item.tdata;
        vif.tvalid = 1'b1;
        vif.tlast  = item.tlast;

        @(posedge vif.clk);
        while (vif.tready !== 1'b1) @(posedge vif.clk);

        // Drop valid once the block has ended.
        if (item.tlast) begin
            @(negedge vif.clk);
            vif.tvalid = 1'b0;
            vif.tlast  = 1'b0;
            vif.tdata  = '0;
        end
    endtask

endclass

`endif // AXI_STREAM_DRIVER_SV