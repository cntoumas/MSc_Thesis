`ifndef FFT_CHIRP_SEQ_SV
`define FFT_CHIRP_SEQ_SV

class fft_chirp_seq extends fft_base_seq;

    `uvm_object_utils(fft_chirp_seq)

    real f_start = 0.0;
    real f_end   = 511.0;        // sweep across the positive-frequency half
    localparam real PI = 3.14159265358979;

    function new(string name = "fft_chirp_seq");
        super.new(name);
        signal_kind = SIG_CHIRP;
    endfunction

    virtual task pre_body();
        real phi, sample;
        super.pre_body();
        foreach (re_data[n]) begin
            phi        = 2.0 * PI * (f_start + (f_end - f_start) * n / (2.0 * FFT_N)) * n / FFT_N;
            sample     = amplitude * $sin(phi);
            re_data[n] = $rtoi(sample);
        end
    endtask

endclass

`endif // FFT_CHIRP_SEQ_SV