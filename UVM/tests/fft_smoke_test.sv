//------------------------------------------------------------------------------
// fft_smoke_test.sv
//------------------------------------------------------------------------------
// Single-test smoke — runs one impulse_seq end-to-end and reports the SQNR.
// Expected: SQNR = 120.00 dB (impulse FFT is constant magnitude, so even
// imperfect bin alignment gives perfect SQNR).
//------------------------------------------------------------------------------
`ifndef FFT_SMOKE_TEST_SV
`define FFT_SMOKE_TEST_SV

class fft_smoke_test extends fft_base_test;

    `uvm_component_utils(fft_smoke_test)

    function new(string name = "fft_smoke_test", uvm_component parent = null);
        super.new(name, parent);
        active_test = SIG_IMPULSE;   // tell the scoreboard which ref to use
    endfunction

    task do_test(uvm_phase phase);
        fft_impulse_seq seq;
        seq = fft_impulse_seq::type_id::create("seq");
        seq.p_pack    = p_pack;
        seq.amplitude = 10000;
        `uvm_info("TEST", "starting fft_impulse_seq on S_AXIS", UVM_LOW)
        seq.start(env.s_axis_agent.sequencer);
        `uvm_info("TEST", "sequence done — waiting for last M_AXIS beat", UVM_LOW)
        // run_phase drain (#1us) gives the DUT time to push out the FFT block
    endtask

endclass

`endif // FFT_SMOKE_TEST_SV
