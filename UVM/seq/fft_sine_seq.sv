//------------------------------------------------------------------------------
// fft_sine_seq.sv — drives x[n] = A*sin(2π·k·n/N) for a single tone bin k.
// Expected FFT response: peaks at bins K and N-K (real input → mirror).
//------------------------------------------------------------------------------
`ifndef FFT_SINE_SEQ_SV
`define FFT_SINE_SEQ_SV

class fft_sine_seq extends fft_base_seq;

    `uvm_object_utils(fft_sine_seq)

    int unsigned tone_bin = 50;   // configurable per test
    localparam real PI = 3.14159265358979;

    function new(string name = "fft_sine_seq");
        super.new(name);
        signal_kind = SIG_SINE;
    endfunction

    virtual task pre_body();
        real angle, sample;
        super.pre_body();
        foreach (re_data[n]) begin
            angle      = 2.0 * PI * tone_bin * n / FFT_N;
            sample     = amplitude * $sin(angle);
            re_data[n] = $rtoi(sample);
            // im_data stays 0 from super.pre_body()
        end
    endtask

endclass

`endif // FFT_SINE_SEQ_SV
