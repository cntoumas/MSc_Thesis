//------------------------------------------------------------------------------
// fft_coverage.sv
//------------------------------------------------------------------------------
// Functional coverage collector — subscribes to the M_AXIS monitor's analysis
// port and samples four covergroups per scored block:
//
//   cg_signal    — which signal kind was driven (5 bins)
//   cg_amplitude — which amplitude bucket
//   cg_bfp_exp   — what BFP exponent the DUT reported (5 buckets)
//   cg_peak      — which spectrum quadrant carried the peak  ×  signal kind cross
//
// The coverage is sampled ONCE per FFT block on the tlast beat. State is
// reset on every tlast so each block's stats are independent.
//
// Hooked into fft_env in connect_phase via the standard analysis_imp
// macro pattern (same as the scoreboard).
//------------------------------------------------------------------------------
`ifndef FFT_COVERAGE_SV
`define FFT_COVERAGE_SV

`uvm_analysis_imp_decl(_cov_m_axis)

class fft_coverage extends uvm_component;

    `uvm_component_utils(fft_coverage)

    uvm_analysis_imp_cov_m_axis #(axi_stream_seq_item, fft_coverage) m_axis_export;

    // Per-block state — sampled on tlast
    int beat_idx_local = 0;
    int unsigned p_pack = 1;

    // Latest scored test (read from config_db by scoreboard and by us)
    sig_kind_e active_test = SIG_IMPULSE;

    // Sampled values for the covergroups (assigned in write_, then sampled)
    sig_kind_e   cov_signal;
    int unsigned cov_amplitude;    // input amplitude (set by env via config_db)
    int          cov_bfp_exp;      // signed exponent from M_AXIS tuser
    int          cov_peak_bin;     // bin index with largest |X[k]|

    // Per-block running peak tracker
    longint unsigned local_peak_mag2 = 0;
    int              local_peak_bin  = 0;

    //--------------------------------------------------------------------------
    // Covergroup 1 — signal type. One bin per stimulus kind.
    //--------------------------------------------------------------------------
    covergroup cg_signal_type;
        cp_signal: coverpoint cov_signal {
            bins impulse   = {SIG_IMPULSE};
            bins dc        = {SIG_DC};
            bins sine      = {SIG_SINE};
            bins multitone = {SIG_MULTITONE};
            bins chirp     = {SIG_CHIRP};
        }
    endgroup

    //--------------------------------------------------------------------------
    // Covergroup 2 — input amplitude buckets. Maps to the SQNR-vs-amplitude
    // sweep we'd run for thesis figures.
    //--------------------------------------------------------------------------
    covergroup cg_amplitude;
        cp_amp: coverpoint cov_amplitude {
            bins very_low = {[1:1000]};
            bins low      = {[1001:4000]};
            bins mid      = {[4001:9000]};
            bins high     = {[9001:14000]};
            bins peak     = {[14001:16383]};
        }
    endgroup

    //--------------------------------------------------------------------------
    // Covergroup 3 — BFP exponent observed. Parallel locks to 10; Serial
    // adapts (typically -3..+10 across the 5 tests).
    //--------------------------------------------------------------------------
    covergroup cg_bfp_exp;
        cp_bfp: coverpoint cov_bfp_exp {
            bins neg_large = {[-16:-9]};
            bins neg_small = {[-8:-1]};
            bins zero      = {0};
            bins pos_small = {[1:8]};
            bins pos_large = {[9:16]};
        }
    endgroup

    //--------------------------------------------------------------------------
    // Covergroup 4 — peak bin location, crossed with signal kind. Verifies
    // the FFT places its peak in the expected quadrant for each test.
    //
    // ignore_bins documents the physically-unreachable cross combinations so
    // the reported coverage % reflects only *reachable* bins. The peak bin
    // is determined by the stimulus, not by DUT behaviour, so e.g. Impulse
    // can never land outside bin 0-255 unless the FFT is broken.
    //--------------------------------------------------------------------------
    covergroup cg_peak_bin;
        cp_peak: coverpoint cov_peak_bin {
            bins low_quarter = {[0:255]};
            bins low_mid     = {[256:511]};
            bins high_mid    = {[512:767]};
            bins high_quarter= {[768:1023]};
        }
        cp_signal: coverpoint cov_signal {
            bins impulse   = {SIG_IMPULSE};
            bins dc        = {SIG_DC};
            bins sine      = {SIG_SINE};
            bins multitone = {SIG_MULTITONE};
            bins chirp     = {SIG_CHIRP};
        }
        cx_peak_x_signal: cross cp_peak, cp_signal {
            // Impulse → flat spectrum, argmax tie-break picks bin 0
            ignore_bins imp_unreach = binsof(cp_signal.impulse) &&
                (binsof(cp_peak.low_mid) || binsof(cp_peak.high_mid)
                                         || binsof(cp_peak.high_quarter));
            // DC → only bin 0 has energy
            ignore_bins dc_unreach  = binsof(cp_signal.dc) &&
                (binsof(cp_peak.low_mid) || binsof(cp_peak.high_mid)
                                         || binsof(cp_peak.high_quarter));
            // Sine at bin 50 (mirror at 974, but strict-greater argmax
            // selects the first-visited bin → low_quarter wins)
            ignore_bins sin_unreach = binsof(cp_signal.sine) &&
                (binsof(cp_peak.low_mid) || binsof(cp_peak.high_mid)
                                         || binsof(cp_peak.high_quarter));
            // MultiTone at bins 50, 200, 450 → either low_quarter or low_mid;
            // upper halves only reachable via mirror (loses on tie-break)
            ignore_bins mtn_unreach = binsof(cp_signal.multitone) &&
                (binsof(cp_peak.high_mid) || binsof(cp_peak.high_quarter));
            // Chirp (0 → 511 Hz sweep): all 4 quadrants reachable via mirror.
        }
    endgroup

    //--------------------------------------------------------------------------
    // Constructor — instantiate the covergroups
    //--------------------------------------------------------------------------
    function new(string name = "fft_coverage", uvm_component parent = null);
        super.new(name, parent);
        m_axis_export = new("m_axis_export", this);
        cg_signal_type = new();
        cg_amplitude   = new();
        cg_bfp_exp     = new();
        cg_peak_bin    = new();
    endfunction

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        void'(uvm_config_db#(int unsigned)::get(this, "", "p_pack",    p_pack));
        void'(uvm_config_db#(sig_kind_e)::get(this, "", "active_test", active_test));
        // Default amplitudes per test — overridden by config_db if set
        cov_amplitude = 10000;
    endfunction

    //--------------------------------------------------------------------------
    // Called by the analysis port — for every M_AXIS beat we accumulate the
    // peak magnitude. On tlast we sample all covergroups.
    //--------------------------------------------------------------------------
    function void write_cov_m_axis(axi_stream_seq_item t);
        int unsigned stride = FFT_N / p_pack;
        int          p, bin_idx;
        bit signed [15:0] re_s, im_s;
        longint mag2;

        // Unpack each path's sample, track the running peak
        for (p = 0; p < p_pack; p++) begin
            if (p_pack == 1) begin
                re_s = t.get_re(p);
                im_s = t.get_im(p);
            end else begin
                // Parallel layout swap (same as scoreboard)
                re_s = t.get_im(p);
                im_s = t.get_re(p);
            end
            bin_idx = (p_pack == 1) ? beat_idx_local
                                    : (beat_idx_local + p * stride);

            // Magnitude-squared (no $sqrt needed for compare)
            mag2 = longint'(re_s) * longint'(re_s)
                 + longint'(im_s) * longint'(im_s);
            if (mag2 > local_peak_mag2) begin
                local_peak_mag2 = mag2;
                local_peak_bin  = bin_idx;
            end
        end
        beat_idx_local++;

        if (t.tlast) begin
            // Re-fetch active_test (may have changed between tests)
            void'(uvm_config_db#(sig_kind_e)::get(this, "", "active_test", active_test));
            void'(uvm_config_db#(int unsigned)::get(this, "", "cov_amplitude", cov_amplitude));

            cov_signal   = active_test;
            cov_bfp_exp  = $signed(t.tuser);
            cov_peak_bin = local_peak_bin;

            cg_signal_type.sample();
            cg_amplitude  .sample();
            cg_bfp_exp    .sample();
            cg_peak_bin   .sample();

            `uvm_info("COV",
                      $sformatf("sampled: signal=%s amp=%0d bfp_exp=%0d peak_bin=%0d",
                                sig_name(cov_signal), cov_amplitude,
                                cov_bfp_exp, cov_peak_bin),
                      UVM_MEDIUM)

            // Reset per-block state for the next block
            beat_idx_local  = 0;
            local_peak_mag2 = 0;
            local_peak_bin  = 0;
        end
    endfunction

    //--------------------------------------------------------------------------
    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("COV",
                  $sformatf("=== FUNCTIONAL COVERAGE ===\n  cg_signal_type:  %.2f %%\n  cg_amplitude:    %.2f %%\n  cg_bfp_exp:      %.2f %%\n  cg_peak_bin:     %.2f %%",
                            cg_signal_type.get_inst_coverage(),
                            cg_amplitude  .get_inst_coverage(),
                            cg_bfp_exp    .get_inst_coverage(),
                            cg_peak_bin   .get_inst_coverage()),
                  UVM_NONE)
    endfunction

endclass

`endif // FFT_COVERAGE_SV
