//------------------------------------------------------------------------------
// fft_pkg.sv
//------------------------------------------------------------------------------
// Single UVM package containing all environment classes used by both DUTs
// (Serial FFT processor, Parallel MDF FFT). Files are `included so the
// compile order is fixed in one place; users only need to compile this one
// file along with axi_stream_if.sv and uvm_pkg.
//------------------------------------------------------------------------------
`ifndef FFT_PKG_SV
`define FFT_PKG_SV

package fft_pkg;

    // Required UVM imports
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    //--------------------------------------------------------------------------
    // Compile-time configuration shared across the env
    //--------------------------------------------------------------------------
    localparam int unsigned FFT_N           = 1024;
    localparam int unsigned FFT_DATA_WIDTH  = 16;
    localparam int unsigned FFT_TUSER_W     = 8;

    // Enumerations used by sequences, coverage and the scoreboard
    typedef enum int {
        SIG_IMPULSE   = 0,
        SIG_DC        = 1,
        SIG_SINE      = 2,
        SIG_MULTITONE = 3,
        SIG_CHIRP     = 4
    } sig_kind_e;

    // Per-test SQNR threshold (dB) — env reports PASS when measured >= this.
    // Set per the existing thesis_report_xc7 numbers, with ~2 dB headroom.
    function automatic real sqnr_threshold(sig_kind_e k, bit is_parallel);
        case (k)
            SIG_IMPULSE  : sqnr_threshold = 100.0;
            SIG_DC       : sqnr_threshold = is_parallel ? 100.0 : 60.0;
            SIG_SINE     : sqnr_threshold = 60.0;
            SIG_MULTITONE: sqnr_threshold = is_parallel ? 55.0 : 50.0;
            SIG_CHIRP    : sqnr_threshold = is_parallel ? 25.0 : 50.0;
            default      : sqnr_threshold = 0.0;
        endcase
    endfunction

    function automatic string sig_name(sig_kind_e k);
        case (k)
            SIG_IMPULSE  : sig_name = "Impulse";
            SIG_DC       : sig_name = "DC";
            SIG_SINE     : sig_name = "Sine";
            SIG_MULTITONE: sig_name = "MultiTone";
            SIG_CHIRP    : sig_name = "Chirp";
            default      : sig_name = "?";
        endcase
    endfunction

    //--------------------------------------------------------------------------
    // Component / class includes  (order matters: dependencies first)
    //--------------------------------------------------------------------------
    `include "axi_stream_seq_item.sv"
    `include "axi_stream_driver.sv"
    `include "axi_stream_monitor.sv"
    `include "axi_stream_agent.sv"

    // Sequences (live under seq/ — +incdir+seq lets the preprocessor find them)
    `include "fft_base_seq.sv"
    `include "fft_impulse_seq.sv"
    `include "fft_dc_seq.sv"
    `include "fft_sine_seq.sv"
    `include "fft_multitone_seq.sv"
    `include "fft_chirp_seq.sv"
    `include "fft_regression_vseq.sv"

    // Day 3 — reference model, scoreboard
    `include "fft_ref_model.sv"
    `include "fft_scoreboard.sv"

    // Day 5 — coverage collector (must precede fft_env so the env can
    // instantiate it; comes after scoreboard so the analysis_imp_decl
    // macros don't collide)
    `include "fft_coverage.sv"

    // Day 3 — env + tests
    `include "fft_env.sv"
    `include "fft_base_test.sv"
    `include "fft_smoke_test.sv"
    `include "fft_regression_test.sv"
    `include "fft_single_tests.sv"

endpackage : fft_pkg

`endif // FFT_PKG_SV
