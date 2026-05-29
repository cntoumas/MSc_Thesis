//------------------------------------------------------------------------------
// fft_dc_seq.sv — drives x[n] = A for all n (constant input).
// Expected FFT response: X[0] = N*A, X[k≠0] = 0.
//------------------------------------------------------------------------------
`ifndef FFT_DC_SEQ_SV
`define FFT_DC_SEQ_SV

class fft_dc_seq extends fft_base_seq;

    `uvm_object_utils(fft_dc_seq)

    function new(string name = "fft_dc_seq");
        super.new(name);
        signal_kind = SIG_DC;
    endfunction

    virtual task pre_body();
        super.pre_body();
        foreach (re_data[i]) re_data[i] = amplitude;
    endtask

endclass

`endif // FFT_DC_SEQ_SV
