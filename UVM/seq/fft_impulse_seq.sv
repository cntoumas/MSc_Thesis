//------------------------------------------------------------------------------
// fft_impulse_seq.sv — drives a Kronecker delta x[0]=A, rest=0.
// Expected FFT response: |X[k]| = A for all k.
//------------------------------------------------------------------------------
`ifndef FFT_IMPULSE_SEQ_SV
`define FFT_IMPULSE_SEQ_SV

class fft_impulse_seq extends fft_base_seq;

    `uvm_object_utils(fft_impulse_seq)

    function new(string name = "fft_impulse_seq");
        super.new(name);
        signal_kind = SIG_IMPULSE;
    endfunction

    virtual task pre_body();
        super.pre_body();
        re_data[0] = amplitude;   // impulse at n=0
        // re_data[1..N-1] and im_data[*] stay 0 from super.pre_body()
    endtask

endclass

`endif // FFT_IMPULSE_SEQ_SV
