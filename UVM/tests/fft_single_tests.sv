//------------------------------------------------------------------------------
// fft_single_tests.sv
//------------------------------------------------------------------------------
// Five single-test classes — each runs ONE stimulus sequence end-to-end.
// Used by the regression Makefile target which invokes xsim five separate
// times (one per test) so each test gets a fresh DUT state. This sidesteps
// a latent issue in fft_top.v where the AGU doesn't fully reset between
// back-to-back FFTs (the original fft_axi_tb.v only ever drove one FFT,
// so this never came up in the pre-UVM verification flow).
//
// The all-in-one fft_regression_test still exists for documentation, but
// for a clean 5/5 PASS use:
//
//   make serial-regression   → loops these five tests via separate xsim runs
//------------------------------------------------------------------------------
`ifndef FFT_SINGLE_TESTS_SV
`define FFT_SINGLE_TESTS_SV

class fft_impulse_test extends fft_base_test;
    `uvm_component_utils(fft_impulse_test)
    function new(string name = "fft_impulse_test", uvm_component parent = null);
        super.new(name, parent); active_test = SIG_IMPULSE; expected_blocks = 1;
    endfunction
    task do_test(uvm_phase phase);
        fft_impulse_seq seq = fft_impulse_seq::type_id::create("seq");
        // Parallel uses 2048 to match the canonical tb_fft_axi.v stimulus
        // (avoids intermediate-stage overflow in the pipelined butterflies).
        seq.p_pack = p_pack;
        seq.amplitude = is_parallel ? 2048 : 10000;
        seq.warmup_blocks = warmup_blocks;
        seq.start(env.s_axis_agent.sequencer);
    endtask
endclass

class fft_dc_test extends fft_base_test;
    `uvm_component_utils(fft_dc_test)
    function new(string name = "fft_dc_test", uvm_component parent = null);
        super.new(name, parent); active_test = SIG_DC; expected_blocks = 1;
    endfunction
    task do_test(uvm_phase phase);
        fft_dc_seq seq = fft_dc_seq::type_id::create("seq");
        seq.p_pack = p_pack; seq.amplitude = 10000;
        seq.warmup_blocks = warmup_blocks;
        seq.start(env.s_axis_agent.sequencer);
    endtask
endclass

class fft_sine_test extends fft_base_test;
    `uvm_component_utils(fft_sine_test)
    function new(string name = "fft_sine_test", uvm_component parent = null);
        super.new(name, parent); active_test = SIG_SINE; expected_blocks = 1;
    endfunction
    task do_test(uvm_phase phase);
        fft_sine_seq seq = fft_sine_seq::type_id::create("seq");
        // Parallel needs lower amp to stay within its BFP=10 internal range
        // (bare-Verilog tb_fft_top uses 2048 for the same reason).
        seq.p_pack = p_pack;
        seq.amplitude = is_parallel ? 2048 : 10000;
        seq.warmup_blocks = warmup_blocks;
        seq.start(env.s_axis_agent.sequencer);
    endtask
endclass

class fft_multitone_test extends fft_base_test;
    `uvm_component_utils(fft_multitone_test)
    function new(string name = "fft_multitone_test", uvm_component parent = null);
        super.new(name, parent); active_test = SIG_MULTITONE; expected_blocks = 1;
    endfunction
    task do_test(uvm_phase phase);
        fft_multitone_seq seq = fft_multitone_seq::type_id::create("seq");
        seq.p_pack = p_pack; seq.amplitude = 9000;
        seq.warmup_blocks = warmup_blocks;
        seq.start(env.s_axis_agent.sequencer);
    endtask
endclass

class fft_chirp_test extends fft_base_test;
    `uvm_component_utils(fft_chirp_test)
    function new(string name = "fft_chirp_test", uvm_component parent = null);
        super.new(name, parent); active_test = SIG_CHIRP; expected_blocks = 1;
    endfunction
    task do_test(uvm_phase phase);
        fft_chirp_seq seq = fft_chirp_seq::type_id::create("seq");
        seq.p_pack = p_pack; seq.amplitude = 10000;
        seq.warmup_blocks = warmup_blocks;
        seq.start(env.s_axis_agent.sequencer);
    endtask
endclass

`endif // FFT_SINGLE_TESTS_SV
