//------------------------------------------------------------------------------
// fft_base_test.sv
//------------------------------------------------------------------------------
// Base test class. Builds the fft_env. The tb_top.sv module is responsible
// for placing the virtual interface handles in the uvm_config_db BEFORE
// run_test() is called — the test inherits whatever was placed there.
//
// Subclasses (fft_smoke_test, fft_regression_test, ...) override `run_phase`
// to choose which sequence(s) to start.
//------------------------------------------------------------------------------
`ifndef FFT_BASE_TEST_SV
`define FFT_BASE_TEST_SV

class fft_base_test extends uvm_test;

    `uvm_component_utils(fft_base_test)

    fft_env env;

    // Per-DUT configuration (the tb_top can override via uvm_config_db too)
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

        // Allow tb_top / plusargs to override defaults
        void'(uvm_config_db#(int unsigned)::get(this, "", "p_pack",      p_pack));
        void'(uvm_config_db#(bit)         ::get(this, "", "is_parallel", is_parallel));
        void'(uvm_config_db#(string)      ::get(this, "", "refs_dir",    refs_dir));
        // Parallel needs 1 priming input block (the bare-Verilog tb_fft_axi.v
        // drives 2 blocks back-to-back and reads the FIRST M_AXIS tlast,
        // which corresponds to the FIRST input block's FFT result).
        // The DUT only emits 1 M_AXIS tlast per pair, so we do NOT skip any
        // tlast in the scoreboard — we just drive an extra input block.
        warmup_blocks = is_parallel ? 1 : 0;
        `uvm_info("TEST",
                  $sformatf("fetched config: p_pack=%0d is_parallel=%0d refs_dir=%s warmup=%0d",
                            p_pack, is_parallel, refs_dir, warmup_blocks),
                  UVM_LOW)

        // Push DUT-flavour settings into the env's scope before it builds
        uvm_config_db#(int unsigned)::set(this, "env", "p_pack",        p_pack);
        uvm_config_db#(bit)         ::set(this, "env", "is_parallel",   is_parallel);
        uvm_config_db#(string)      ::set(this, "env", "refs_dir",      refs_dir);
        uvm_config_db#(int unsigned)::set(this, "env", "warmup_blocks", warmup_blocks);
        uvm_config_db#(sig_kind_e)  ::set(this, "env.scoreboard",
                                          "active_test", active_test);

        env = fft_env::type_id::create("env", this);
    endfunction

    //--------------------------------------------------------------------------
    // Print the UVM component tree once after build to aid debugging
    //--------------------------------------------------------------------------
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        if ($test$plusargs("UVM_TREE"))
            uvm_top.print_topology();
    endfunction

    //--------------------------------------------------------------------------
    // Run-phase template — subclasses override do_test() and set expected_blocks.
    // We wait for the scoreboard to score at least that many blocks (or a
    // sanity timeout) before dropping the objection.
    //--------------------------------------------------------------------------
    int expected_blocks = 1;

    task run_phase(uvm_phase phase);
        phase.raise_objection(this, "fft_base_test running");
        do_test(phase);
        wait_for_scoreboard();
        #1us;   // small post-block drain
        phase.drop_objection(this, "fft_base_test done");
    endtask

    // Poll the scoreboard until it has seen the expected number of completed
    // M_AXIS blocks. Belt-and-braces timeout in case the DUT hangs.
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

    //--------------------------------------------------------------------------
    // Subclasses override this with their sequence start logic
    //--------------------------------------------------------------------------
    virtual task do_test(uvm_phase phase);
        `uvm_warning("TEST", "fft_base_test.do_test is a no-op — subclass me")
    endtask

endclass

`endif // FFT_BASE_TEST_SV
