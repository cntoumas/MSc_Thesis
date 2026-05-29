//------------------------------------------------------------------------------
// fft_base_seq.sv
//------------------------------------------------------------------------------
// Base UVM sequence — generates N=1024 AXI4-Stream beats from two arrays of
// real/imaginary integer samples, with the final beat carrying tlast=1.
//
// Day 2: child sequences populate `re_data[]` / `im_data[]` in pre_body()
// using internal generators ($sin, hand-computed impulses, etc.). Day 3
// will switch to a $readmemh-driven flow when the Python ref generator
// is in place.
//
// Packing: for P=1 (Serial), each beat carries one sample.
//          For P=4 (Parallel), each beat carries 4 samples; the body()
//          walks the arrays in strides of P and packs accordingly.
//------------------------------------------------------------------------------
`ifndef FFT_BASE_SEQ_SV
`define FFT_BASE_SEQ_SV

class fft_base_seq extends uvm_sequence #(axi_stream_seq_item);

    `uvm_object_utils(fft_base_seq)

    // Per-sample stimulus arrays — sized for the full FFT block
    rand int re_data [FFT_N];
    rand int im_data [FFT_N];

    // Test bookkeeping — for log lines and coverage
    sig_kind_e   signal_kind = SIG_IMPULSE;
    int unsigned amplitude   = 10000;
    int unsigned p_pack      = 1;        // 1 for Serial, 4 for Parallel

    // Number of warm-up blocks to drive BEFORE the real block. The Parallel
    // MDF bit_reverse buffer is double-banked (ping-pong); the very first
    // block emerging on M_AXIS is from an uninitialised bank, so we drive
    // an extra block to prime the pipeline. Serial doesn't need this.
    int unsigned warmup_blocks = 0;

    function new(string name = "fft_base_seq");
        super.new(name);
    endfunction

    //--------------------------------------------------------------------------
    // Default pre_body — child sequences override this to fill re_data[]/
    // im_data[] with their signal. The base impl makes all zeros so that
    // running fft_base_seq directly drives a clean DC=0 stream (harmless
    // smoke test).
    //--------------------------------------------------------------------------
    virtual task pre_body();
        foreach (re_data[i]) re_data[i] = 0;
        foreach (im_data[i]) im_data[i] = 0;
    endtask

    //--------------------------------------------------------------------------
    // body() — drive the FFT block, beat by beat
    //--------------------------------------------------------------------------
    virtual task body();
        axi_stream_seq_item req;
        int beats_per_block = FFT_N / p_pack;   // 1024 for Serial, 256 for Parallel
        int total_blocks    = warmup_blocks + 1;
        int beats_total     = beats_per_block * total_blocks;

        `uvm_info("FFTSEQ",
                  $sformatf("driving %0d blocks × %0d beats = %0d total (signal=%s amp=%0d P=%0d)",
                            total_blocks, beats_per_block, beats_total,
                            sig_name(signal_kind), amplitude, p_pack),
                  UVM_LOW)

        for (int b = 0; b < beats_total; b++) begin
            req = axi_stream_seq_item::type_id::create($sformatf("req_%0d", b));
            start_item(req);

            // Pack p_pack samples into this beat.
            //
            // PACKING LAYOUTS:
            //   Serial   (P=1): tdata = {re[15:0], im[15:0]}     (re in upper)
            //   Parallel (P=4): tdata = {im[15:0], re[15:0]}     per sample
            //                                                    (re in LOWER)
            //
            // The seq_item helpers set_sample(s, hi, lo) write `hi` to the
            // upper 16 bits and `lo` to the lower 16 bits of sample s. So
            // for Parallel we swap the order of the two args.
            req.tdata = '0;
            for (int s = 0; s < p_pack; s++) begin
                // Modulo into the per-block sample arrays — warm-up blocks
                // re-drive the same content so the FFT result is the same.
                int idx = (b * p_pack + s) % FFT_N;
                if (p_pack == 1) begin
                    // Serial: {re, im}
                    req.set_sample(s,
                        16'($signed(re_data[idx])),
                        16'($signed(im_data[idx])));
                end else begin
                    // Parallel: {im, re}
                    req.set_sample(s,
                        16'($signed(im_data[idx])),
                        16'($signed(re_data[idx])));
                end
            end

            // tlast fires only on the very last beat of the last block.
            // Within a block (and between blocks of a multi-block burst),
            // the driver keeps tvalid asserted — required by the Parallel
            // DUT's block-start edge detector.
            req.tlast      = (b == beats_total - 1);
            req.beat_index = b;
            finish_item(req);
        end

        `uvm_info("FFTSEQ", "block complete (tlast fired)", UVM_LOW)
    endtask

endclass

`endif // FFT_BASE_SEQ_SV
