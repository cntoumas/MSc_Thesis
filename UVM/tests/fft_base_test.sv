`ifndef FFT_BASE_TEST_SV
`define FFT_BASE_TEST_SV

class fft_base_test extends uvm_test;

    `uvm_component_utils(fft_base_test)

    fft_env env;

    // DUT configuration.
    int unsigned p_pack        = 1;
    bit          is_parallel   = 0;
    string       refs_dir      = "refs/serial";
    sig_kind_e   active_test   = SIG_IMPULSE;
    int unsigned warmup_blocks = 0;   // 1 for Parallel, 0 for Serial

    function new(string name = "fft_base_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        // Allow plusargs to override defaults.
        void'(uvm_config_db#(int unsigned)::get(this, "", "p_pack",      p_pack));
        void'(uvm_config_db#(bit)         ::get(this, "", "is_parallel", is_parallel));
        void'(uvm_config_db#(string)      ::get(this, "", "refs_dir",    refs_dir));
        warmup_blocks = is_parallel ? 1 : 0;
        `uvm_info("TEST",
                  $sformatf("fetched config: p_pack=%0d is_parallel=%0d refs_dir=%s warmup=%0d",
                            p_pack, is_parallel, refs_dir, warmup_blocks),
                  UVM_LOW)

        // Push DUT settings into the env before creation.
        uvm_config_db#(int unsigned)::set(this, "env", "p_pack",        p_pack);
        uvm_config_db#(bit)         ::set(this, "env", "is_parallel",   is_parallel);
        uvm_config_db#(string)      ::set(this, "env", "refs_dir",      refs_dir);
        uvm_config_db#(int unsigned)::set(this, "env", "warmup_blocks", warmup_blocks);
        uvm_config_db#(sig_kind_e)  ::set(this, "env.scoreboard",
                                          "active_test", active_test);

        env = fft_env::type_id::create("env", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        if ($test$plusargs("UVM_TREE"))
            uvm_top.print_topology();
    endfunction

    // Subclasses override do_test() and set expected_blocks.
    int expected_blocks = 1;

    task run_phase(uvm_phase phase);
        phase.raise_objection(this, "fft_base_test running");
        do_test(phase);
        wait_for_scoreboard();
        #1us;   // small post-block drain
        phase.drop_objection(this, "fft_base_test done");
    endtask

    // Wait for the expected number of M_AXIS blocks or timeout.
    task wait_for_scoreboard();
        const int TIMEOUT_NS = 1_000_000;   // 1 ms simulated
        fork
            begin
                wait (env.scoreboard.blocks_done >= expected_blocks);
                `uvm_info("TEST",
                          $sformatf("scoreboard saw %0d/%0d block(s)",
                                    env.scoreboard.blocks_done, expected_blocks),
                          UVM_LOW)
            end
            begin
                #(TIMEOUT_NS * 1ns);
                `uvm_error("TEST",
                           $sformatf("timeout waiting for scoreboard: saw %0d/%0d block(s)",
                                     env.scoreboard.blocks_done, expected_blocks))
            end
        join_any
        disable fork;
    endtask

    virtual task do_test(uvm_phase phase);
        `uvm_warning("TEST", "fft_base_test.do_test is a no-op — subclass me")
    endtask

endclass

`endif // FFT_BASE_TEST_SV