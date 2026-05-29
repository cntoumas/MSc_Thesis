//------------------------------------------------------------------------------
// fft_ref_model.sv
//------------------------------------------------------------------------------
// Reference model — loads NumPy-computed expected FFT outputs from .mem
// files into RAM-backed arrays. The scoreboard queries it for the expected
// value at any (test, bin) coordinate.
//
// File layout per test (in refs/serial/):
//   <test>_re.mem      stimulus real part (we don't load this — sequence already drives it)
//   <test>_im.mem      stimulus imag part
//   <test>_ref_re.mem  expected FFT output, real part (32-bit signed hex)
//   <test>_ref_im.mem  expected FFT output, imag part
//
// All 5 test references are loaded at start_of_simulation_phase so the
// scoreboard never has to wait on file I/O during the run.
//------------------------------------------------------------------------------
`ifndef FFT_REF_MODEL_SV
`define FFT_REF_MODEL_SV

class fft_ref_model extends uvm_component;

    `uvm_component_utils(fft_ref_model)

    // [signal][bin] indexed reference vectors
    // 5 signals × 1024 bins × 32-bit signed real and imag
    bit signed [31:0] ref_re [5][FFT_N];
    bit signed [31:0] ref_im [5][FFT_N];

    // Where to find the .mem files (configurable per DUT — "serial" or "parallel")
    string refs_dir = "refs/serial";

    function new(string name = "fft_ref_model", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        void'(uvm_config_db#(string)::get(this, "", "refs_dir", refs_dir));
        `uvm_info("FFTREF", $sformatf("loading reference vectors from %s/", refs_dir), UVM_LOW)
    endfunction

    //--------------------------------------------------------------------------
    // Load all 5 reference vectors once, before the run phase starts.
    //--------------------------------------------------------------------------
    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        load_one(SIG_IMPULSE,   "impulse");
        load_one(SIG_DC,        "dc");
        load_one(SIG_SINE,      "sine");
        load_one(SIG_MULTITONE, "multitone");
        load_one(SIG_CHIRP,     "chirp");
        `uvm_info("FFTREF", "all 5 reference vectors loaded", UVM_LOW)
    endfunction

    //--------------------------------------------------------------------------
    // Read one (re, im) pair into the indexed slots.
    //--------------------------------------------------------------------------
    local function void load_one(sig_kind_e k, string base);
        // xsim has trouble with $readmemh into a slice of a 2D unpacked array
        // (treats `ref_re[k]` as scalar → "Too many words" warning). Load
        // into a 1D temp buffer and copy element-by-element.
        string path_re = {refs_dir, "/", base, "_ref_re.mem"};
        string path_im = {refs_dir, "/", base, "_ref_im.mem"};
        bit signed [31:0] tmp_re [FFT_N];
        bit signed [31:0] tmp_im [FFT_N];

        $readmemh(path_re, tmp_re);
        $readmemh(path_im, tmp_im);

        foreach (tmp_re[i]) begin
            ref_re[k][i] = tmp_re[i];
            ref_im[k][i] = tmp_im[i];
        end

        `uvm_info("FFTREF",
                  $sformatf("loaded %s: ref[0]=%0d+j%0d",
                            base, ref_re[k][0], ref_im[k][0]),
                  UVM_MEDIUM)
    endfunction

    //--------------------------------------------------------------------------
    // Lookup helpers for the scoreboard
    //--------------------------------------------------------------------------
    function bit signed [31:0] get_re(sig_kind_e k, int bin);
        return ref_re[k][bin];
    endfunction

    function bit signed [31:0] get_im(sig_kind_e k, int bin);
        return ref_im[k][bin];
    endfunction

endclass

`endif // FFT_REF_MODEL_SV
