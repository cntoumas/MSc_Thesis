//------------------------------------------------------------------------------
// fft_scoreboard.sv
//------------------------------------------------------------------------------
// Subscribes to the M_AXIS monitor's analysis port. Buffers FFT_N actual
// output beats per FFT block; on tlast, scores the block against the
// reference vector and prints PASS/FAIL.
//
// SQNR computation matches the optimal-α fit used in the existing
// thesis_report.py / thesis_report_xc7.py — i.e., we find the complex
// scalar α that minimises ||actual − α·ref||² and report
//      SQNR = 10·log10( |α·ref|² / |actual − α·ref|² ).
// The hardware FFT uses the +j twiddle convention vs NumPy's -j, so we
// try both ref and conj(ref) and report the better of the two.
//------------------------------------------------------------------------------
`ifndef FFT_SCOREBOARD_SV
`define FFT_SCOREBOARD_SV

// Standard one-line macro: declares an analysis_imp class so the scoreboard
// can subscribe to a uvm_analysis_port without inheriting from uvm_subscriber.
`uvm_analysis_imp_decl(_m_axis)

class fft_scoreboard extends uvm_component;

    `uvm_component_utils(fft_scoreboard)

    // Subscription port for M_AXIS beats
    uvm_analysis_imp_m_axis #(axi_stream_seq_item, fft_scoreboard) m_axis_export;

    // Handle to the loaded reference model (set by the env in connect_phase)
    fft_ref_model ref_model;

    // Which test we're scoring against (set per-test via uvm_config_db)
    sig_kind_e active_test = SIG_IMPULSE;

    // Indicates whether this DUT is the Parallel MDF (affects SQNR thresholds)
    bit is_parallel = 0;

    // Samples packed per AXI-Stream beat. Serial = 1, Parallel = 4.
    int unsigned p_pack = 1;

    // Number of warm-up blocks to ignore before scoring. For Parallel MDF
    // the first emitted M_AXIS block is garbage from the bit_reverse buffer
    // priming — see comment in fft_base_seq.sv. Serial = 0, Parallel = 1.
    int unsigned warmup_blocks   = 0;
    int unsigned warmup_seen     = 0;

    // Per-block actual-output buffer — packed real and imag, signed
    real act_re [FFT_N];
    real act_im [FFT_N];
    int  beats_captured = 0;
    int  blocks_done    = 0;

    // Test result tally
    int  pass_count = 0;
    int  fail_count = 0;

    // Optional actuals dump (used by equivalence_check.py)
    // Written to actuals/<dut_tag>_<test>.txt one bin per line: "bin re im"
    bit    dump_actuals = 1'b1;
    string dut_tag      = "unknown";

    //--------------------------------------------------------------------------
    function new(string name = "fft_scoreboard", uvm_component parent = null);
        super.new(name, parent);
        m_axis_export = new("m_axis_export", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        void'(uvm_config_db#(sig_kind_e)::get(this, "", "active_test", active_test));
        void'(uvm_config_db#(bit)::get(this, "", "is_parallel", is_parallel));
        void'(uvm_config_db#(int unsigned)::get(this, "", "p_pack", p_pack));
        void'(uvm_config_db#(int unsigned)::get(this, "", "warmup_blocks", warmup_blocks));
        void'(uvm_config_db#(bit)         ::get(this, "", "dump_actuals", dump_actuals));
        void'(uvm_config_db#(string)      ::get(this, "", "dut_tag",      dut_tag));
        if (dut_tag == "unknown")
            dut_tag = is_parallel ? "parallel" : "serial";
        `uvm_info("SB",
                  $sformatf("scoreboard built (active_test=%s, is_parallel=%0d, p_pack=%0d, warmup=%0d, dump=%0d, tag=%s)",
                            sig_name(active_test), is_parallel, p_pack, warmup_blocks,
                            dump_actuals, dut_tag),
                  UVM_LOW)
    endfunction

    //--------------------------------------------------------------------------
    // Analysis port write — called by the monitor for every M_AXIS beat
    //--------------------------------------------------------------------------
    function void write_m_axis(axi_stream_seq_item t);
        int unsigned      stride;
        int               bin_idx;
        int               p;
        bit signed [15:0] re_s, im_s;
        stride = FFT_N / p_pack;

        // Unpack p_pack samples from this beat into the actuals buffer.
        //   Serial   (P=1): beat k → bin k (contiguous)
        //   Parallel (P=4): beat k → bins (k + p·N/P) for p=0..3 (strided)
        //
        // PACKING (matches base_seq's input packing):
        //   Serial   tdata = {re[15:0], im[15:0]}  → get_re→upper, get_im→lower
        //   Parallel tdata = {im[15:0], re[15:0]}  → real and imag are SWAPPED
        for (p = 0; p < p_pack; p = p + 1) begin
            if (p_pack == 1) begin
                re_s = t.get_re(p);
                im_s = t.get_im(p);
            end else begin
                // Parallel: upper 16 bits of each sample is IMAG, lower is REAL
                re_s = t.get_im(p);
                im_s = t.get_re(p);
            end
            bin_idx = (p_pack == 1) ? beats_captured
                                    : (beats_captured + p * stride);
            if (bin_idx < FFT_N) begin
                act_re[bin_idx] = re_s;
                act_im[bin_idx] = im_s;
            end
        end

        // Per-beat trace for key beats — helps figure out where the FFT
        // is actually placing the sine peak in the M_AXIS stream.
        if (beats_captured == 0 || beats_captured == 50 || beats_captured == 63 ||
            beats_captured == 76 || beats_captured == 100)
            `uvm_info("SB",
                      $sformatf("beat %0d: tdata=0x%032h tuser=%0d",
                                beats_captured, t.tdata, t.tuser),
                      UVM_LOW)

        beats_captured = beats_captured + 1;

        if (t.tlast) begin
            // The Parallel DUT requires 2 input blocks per emitted M_AXIS
            // block (per the canonical tb_fft_axi.v stimulus pattern), but
            // it only emits ONE M_AXIS tlast — the FIRST tlast IS the valid
            // output. So we DON'T skip any M_AXIS blocks; we just need the
            // sequence to drive an extra input block for priming.
            // (warmup_blocks/warmup_seen kept for future flexibility but
            //  are 0 in current usage.)
            if (warmup_seen < warmup_blocks) begin
                warmup_seen++;
                `uvm_info("SB",
                          $sformatf("warm-up block %0d/%0d consumed (not scored)",
                                    warmup_seen, warmup_blocks),
                          UVM_LOW)
                beats_captured = 0;
                return;
            end

            // Re-read active_test from config_db before scoring — this lets
            // the regression vseq advance the test type between blocks by
            // setting the config_db key from its body() task.
            void'(uvm_config_db#(sig_kind_e)::get(this, "", "active_test", active_test));

            // tuser is captured on the last beat (stable across the burst)
            score_block($signed(t.tuser));
            beats_captured = 0;
            blocks_done++;
        end
    endfunction

    //--------------------------------------------------------------------------
    // Allow the regression vseq (or any caller) to set the active test
    // explicitly between blocks. Both this method and the config_db lookup
    // above are honoured — the most recent wins.
    //--------------------------------------------------------------------------
    function void set_active_test(sig_kind_e k);
        active_test = k;
        `uvm_info("SB",
                  $sformatf("active_test -> %s (next block will score against this)",
                            sig_name(k)),
                  UVM_MEDIUM)
    endfunction

    //--------------------------------------------------------------------------
    // Score one FFT block — apply BFP scaling, compute SQNR vs reference,
    // print result. Tries both ref and conj(ref) (twiddle sign convention).
    //--------------------------------------------------------------------------
    local function void score_block(int bfp_exp);
        real scale = 2.0 ** bfp_exp;
        real act_scaled_re [FFT_N];
        real act_scaled_im [FFT_N];
        real ref_re_arr    [FFT_N];
        real ref_im_arr    [FFT_N];
        real sqnr_a, sqnr_b, sqnr_best;
        string verdict;
        real threshold;

        // Apply BFP scaling once
        foreach (act_re[i]) begin
            act_scaled_re[i] = act_re[i] * scale;
            act_scaled_im[i] = act_im[i] * scale;
        end

        // Debug: count non-zero actuals so we can spot empty buffers and
        // also report the top-3 peak bins (to verify the real-input mirror)
        begin
            int nz = 0;
            real top3_mag[3] = '{0.0, 0.0, 0.0};
            int  top3_bin[3] = '{0, 0, 0};
            foreach (act_scaled_re[i]) begin
                real mag = $sqrt(act_scaled_re[i]*act_scaled_re[i]
                              + act_scaled_im[i]*act_scaled_im[i]);
                if (mag > 0.5) nz++;
                // Insertion sort into top-3
                if (mag > top3_mag[0]) begin
                    top3_mag[2] = top3_mag[1]; top3_bin[2] = top3_bin[1];
                    top3_mag[1] = top3_mag[0]; top3_bin[1] = top3_bin[0];
                    top3_mag[0] = mag;         top3_bin[0] = i;
                end else if (mag > top3_mag[1]) begin
                    top3_mag[2] = top3_mag[1]; top3_bin[2] = top3_bin[1];
                    top3_mag[1] = mag;         top3_bin[1] = i;
                end else if (mag > top3_mag[2]) begin
                    top3_mag[2] = mag;         top3_bin[2] = i;
                end
            end
            `uvm_info("SB",
                      $sformatf("act top3: |X[%0d]|=%0.1f  |X[%0d]|=%0.1f  |X[%0d]|=%0.1f  (%0d non-zero bins total)",
                                top3_bin[0], top3_mag[0],
                                top3_bin[1], top3_mag[1],
                                top3_bin[2], top3_mag[2], nz),
                      UVM_LOW)
        end

        // Look up the reference for the active test
        if (ref_model == null) begin
            `uvm_error("SB", "ref_model handle is null — env did not wire it")
            return;
        end
        foreach (ref_re_arr[i]) begin
            ref_re_arr[i] = ref_model.get_re(active_test, i);
            ref_im_arr[i] = ref_model.get_im(active_test, i);
        end

        // Try both conventions: ref and conj(ref)
        sqnr_a = compute_sqnr(act_scaled_re, act_scaled_im, ref_re_arr, ref_im_arr,        0);
        sqnr_b = compute_sqnr(act_scaled_re, act_scaled_im, ref_re_arr, ref_im_arr,        1);
        sqnr_best = (sqnr_a > sqnr_b) ? sqnr_a : sqnr_b;

        threshold = sqnr_threshold(active_test, is_parallel);
        if (sqnr_best >= threshold) begin
            verdict = "PASS";
            pass_count++;
        end else begin
            verdict = "FAIL";
            fail_count++;
        end

        `uvm_info("SB",
                  $sformatf("[%s] %s : SQNR = %0.2f dB (threshold %.2f, BFP exp=%0d)",
                            sig_name(active_test), verdict, sqnr_best, threshold, bfp_exp),
                  UVM_NONE)

        // Dump the scaled actuals so the Python equivalence checker can
        // cross-compare the two DUTs. Both conventions are emitted; the
        // checker picks whichever lines up between Serial and Parallel.
        if (dump_actuals) begin
            string  path;
            int     fh;
            path = $sformatf("actuals/%s_%s.txt", dut_tag, sig_name(active_test));
            fh   = $fopen(path, "w");
            if (fh == 0) begin
                `uvm_warning("SB",
                    $sformatf("could not open %s for actuals dump (does actuals/ exist?)", path))
            end else begin
                $fwrite(fh, "# dut=%s test=%s bfp_exp=%0d sqnr=%0.2f verdict=%s\n",
                            dut_tag, sig_name(active_test), bfp_exp, sqnr_best, verdict);
                foreach (act_scaled_re[i])
                    $fwrite(fh, "%0d %0d %0d\n", i,
                            int'(act_scaled_re[i]), int'(act_scaled_im[i]));
                $fclose(fh);
                `uvm_info("SB", $sformatf("actuals dumped to %s", path), UVM_MEDIUM)
            end
        end
    endfunction

    //--------------------------------------------------------------------------
    // Optimal-α SQNR: find α that minimises ||act − α·ref||²
    //                 α = <act, ref> / <ref, ref>  (complex)
    //                 SQNR = 10·log10( |α·ref|² / |residual|² )
    //
    // `conj_ref` = 1 → use conjugate of reference (flip imag sign)
    //--------------------------------------------------------------------------
    local function real compute_sqnr(
        const ref real a_re[FFT_N],
        const ref real a_im[FFT_N],
        const ref real r_re[FFT_N],
        const ref real r_im[FFT_N],
        input bit       conj_ref);

        real num_re = 0.0, num_im = 0.0;     // <act, ref*>
        real den    = 0.0;                   // <ref, ref>
        real alpha_re, alpha_im;
        real sig_pow = 0.0, noise_pow = 0.0;
        real rr, ri;

        foreach (a_re[i]) begin
            rr = r_re[i];
            ri = conj_ref ? -r_im[i] : r_im[i];

            // <act, ref> = sum( a · conj(r) )  (for fitting α)
            // Actually we want: alpha = sum(a · conj(r)) / sum(|r|²)
            // a · conj(r) = (a_re + j·a_im) · (rr − j·ri)
            //             = (a_re·rr + a_im·ri) + j·(a_im·rr − a_re·ri)
            num_re += a_re[i]*rr + a_im[i]*ri;
            num_im += a_im[i]*rr - a_re[i]*ri;
            den    += rr*rr + ri*ri;
        end

        if (den <= 0.0) return 0.0;
        alpha_re = num_re / den;
        alpha_im = num_im / den;

        foreach (a_re[i]) begin
            real sr, si, er, ei;
            rr = r_re[i];
            ri = conj_ref ? -r_im[i] : r_im[i];

            // s = α · r
            sr = alpha_re*rr - alpha_im*ri;
            si = alpha_re*ri + alpha_im*rr;

            // e = a - s
            er = a_re[i] - sr;
            ei = a_im[i] - si;

            sig_pow   += sr*sr + si*si;
            noise_pow += er*er + ei*ei;
        end

        if (noise_pow <= 0.0) return 120.0;
        return 10.0 * $log10(sig_pow / noise_pow);
    endfunction

    //--------------------------------------------------------------------------
    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("SB",
                  $sformatf("=== SCOREBOARD SUMMARY: %0d PASS / %0d FAIL / %0d blocks total ===",
                            pass_count, fail_count, blocks_done),
                  UVM_NONE)
        if (fail_count > 0)
            `uvm_error("SB", $sformatf("%0d block(s) failed SQNR threshold", fail_count))
    endfunction

endclass

`endif // FFT_SCOREBOARD_SV
