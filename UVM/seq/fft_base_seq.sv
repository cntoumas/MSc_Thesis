`ifndef FFT_BASE_SEQ_SV
`define FFT_BASE_SEQ_SV

class fft_base_seq extends uvm_sequence #(axi_stream_seq_item);

    `uvm_object_utils(fft_base_seq)

    rand int re_data [FFT_N];
    rand int im_data [FFT_N];

    sig_kind_e   signal_kind = SIG_IMPULSE;
    int unsigned amplitude   = 10000;
    int unsigned p_pack      = 1;        // 1 for Serial, 4 for Parallel
    int unsigned warmup_blocks = 0;

    function new(string name = "fft_base_seq");
        super.new(name);
    endfunction

    // Base sequence produces a zero-filled block.
    virtual task pre_body();
        foreach (re_data[i]) re_data[i] = 0;
        foreach (im_data[i]) im_data[i] = 0;
    endtask

    // body() — drive the FFT block, beat by beat
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

            // Pack multiple samples into one beat.
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

            // tlast marks the end of the burst.
            req.tlast      = (b == beats_total - 1);
            req.beat_index = b;
            finish_item(req);
        end

        `uvm_info("FFTSEQ", "block complete (tlast fired)", UVM_LOW)
    endtask

endclass

`endif // FFT_BASE_SEQ_SV