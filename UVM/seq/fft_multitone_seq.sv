//------------------------------------------------------------------------------
// fft_multitone_seq.sv — sum of 3 real sinusoids at distinct bins.
// Each tone has amplitude `amp_per_tone = amplitude / num_tones` so the
// summed waveform stays within range.
//------------------------------------------------------------------------------
`ifndef FFT_MULTITONE_SEQ_SV
`define FFT_MULTITONE_SEQ_SV

class fft_multitone_seq extends fft_base_seq;

    `uvm_object_utils(fft_multitone_seq)

    // Three tone bins (matches the existing thesis_report_xc7.py defaults)
    int unsigned bin0 = 50;
    int unsigned bin1 = 200;
    int unsigned bin2 = 450;
    localparam real PI = 3.14159265358979;

    function new(string name = "fft_multitone_seq");
        super.new(name);
        signal_kind = SIG_MULTITONE;
        amplitude   = 9000;     // 3000 per tone × 3 tones = 9000 peak headroom
    endfunction

    virtual task pre_body();
        real a, sum, amp_per;
        super.pre_body();
        amp_per = amplitude / 3.0;
        foreach (re_data[n]) begin
            sum = amp_per * ($sin(2.0*PI*bin0*n/FFT_N)
                           + $sin(2.0*PI*bin1*n/FFT_N)
                           + $sin(2.0*PI*bin2*n/FFT_N));
            re_data[n] = $rtoi(sum);
        end
    endtask

endclass

`endif // FFT_MULTITONE_SEQ_SV
