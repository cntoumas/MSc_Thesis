`ifndef FFT_REGRESSION_VSEQ_SV
`define FFT_REGRESSION_VSEQ_SV

class fft_regression_vseq extends uvm_sequence;

    `uvm_object_utils(fft_regression_vseq)
    `uvm_declare_p_sequencer(axi_stream_sequencer)

    int unsigned p_pack = 1;   // 1 for Serial, 4 for Parallel

    // Scoreboard handle used to gate each regression block.
    static fft_scoreboard sb_handle = null;

    function new(string name = "fft_regression_vseq");
        super.new(name);
    endfunction

    // Helper — kick off one stimulus seq, then wait until the scoreboard
    // has scored exactly `block_idx + 1` blocks. Updates active_test in
    // config_db so the scoreboard knows which reference to compare against.
    local task run_one(uvm_sequence#(axi_stream_seq_item) seq,
                       sig_kind_e kind, int block_idx);
        uvm_config_db#(sig_kind_e)::set(null, "*scoreboard*",
                                        "active_test", kind);
        seq.start(p_sequencer);
        if (sb_handle != null) begin
            `uvm_info("VSEQ",
                      $sformatf("waiting for scoreboard to score block #%0d",
                                block_idx + 1),
                      UVM_MEDIUM)
            wait (sb_handle.blocks_done >= block_idx + 1);
        end
    endtask

    task body();
        fft_impulse_seq    impulse_seq;
        fft_dc_seq         dc_seq;
        fft_sine_seq       sine_seq;
        fft_multitone_seq  multi_seq;
        fft_chirp_seq      chirp_seq;

        `uvm_info("VSEQ", "=== Starting regression (5 tests) ===", UVM_LOW)

        impulse_seq = fft_impulse_seq::type_id::create("impulse_seq");
        impulse_seq.p_pack = p_pack;
        run_one(impulse_seq, impulse_seq.signal_kind, 0);

        dc_seq = fft_dc_seq::type_id::create("dc_seq");
        dc_seq.p_pack = p_pack;
        run_one(dc_seq, dc_seq.signal_kind, 1);

        sine_seq = fft_sine_seq::type_id::create("sine_seq");
        sine_seq.p_pack = p_pack;
        run_one(sine_seq, sine_seq.signal_kind, 2);

        multi_seq = fft_multitone_seq::type_id::create("multi_seq");
        multi_seq.p_pack = p_pack;
        run_one(multi_seq, multi_seq.signal_kind, 3);

        chirp_seq = fft_chirp_seq::type_id::create("chirp_seq");
        chirp_seq.p_pack = p_pack;
        run_one(chirp_seq, chirp_seq.signal_kind, 4);

        `uvm_info("VSEQ", "=== Regression complete ===", UVM_LOW)
    endtask

endclass

`endif // FFT_REGRESSION_VSEQ_SV