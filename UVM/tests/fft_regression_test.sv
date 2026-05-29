//------------------------------------------------------------------------------
// fft_regression_test.sv
//------------------------------------------------------------------------------
// Full regression — runs the virtual sequence fft_regression_vseq which
// drives all 5 stimulus sequences (Impulse, DC, Sine, MultiTone, Chirp)
// back-to-back. Expects 5/5 PASS, with thresholds per `sqnr_threshold()`
// in fft_pkg.
//------------------------------------------------------------------------------
`ifndef FFT_REGRESSION_TEST_SV
`define FFT_REGRESSION_TEST_SV

class fft_regression_test extends fft_base_test;

    `uvm_component_utils(fft_regression_test)

    function new(string name = "fft_regression_test", uvm_component parent = null);
        super.new(name, parent);
        active_test     = SIG_IMPULSE;   // first block; vseq advances it
        expected_blocks = 5;             // 5 sequences → 5 scored blocks
    endfunction

    task do_test(uvm_phase phase);
        fft_regression_vseq vseq;
        // Hand the scoreboard handle to the vseq so it can synchronise
        // between blocks (set active_test → run seq → wait for score).
        fft_regression_vseq::sb_handle = env.scoreboard;

        vseq = fft_regression_vseq::type_id::create("vseq");
        vseq.p_pack = p_pack;
        `uvm_info("TEST", "starting fft_regression_vseq on S_AXIS", UVM_LOW)
        vseq.start(env.s_axis_agent.sequencer);
        `uvm_info("TEST", "regression vseq finished — all 5 blocks scored", UVM_LOW)
    endtask

endclass

`endif // FFT_REGRESSION_TEST_SV
