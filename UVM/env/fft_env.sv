//------------------------------------------------------------------------------
// fft_env.sv
//------------------------------------------------------------------------------
// Top-level UVM environment for the FFT DUTs. Same env is reused for both
// Serial (P=1) and Parallel (P=4) DUTs — the test class sets `p_pack` and
// `is_parallel` via uvm_config_db before build_phase.
//
// Holds:
//   - s_axis_agent  (ACTIVE)  — drives stimulus into the DUT's S_AXIS
//   - m_axis_agent  (PASSIVE) — observes the DUT's M_AXIS output
//   - ref_model              — loads NumPy reference vectors
//   - scoreboard             — compares actual vs reference, computes SQNR
//
// Day 5 will add fft_coverage as a fourth child component subscribing to
// both monitors' analysis ports.
//------------------------------------------------------------------------------
`ifndef FFT_ENV_SV
`define FFT_ENV_SV

class fft_env extends uvm_env;

    `uvm_component_utils(fft_env)

    // Child components
    axi_stream_agent  s_axis_agent;
    axi_stream_agent  m_axis_agent;
    fft_ref_model     ref_model;
    fft_scoreboard    scoreboard;
    fft_coverage      coverage;

    // Per-DUT configuration knobs
    int unsigned p_pack        = 1;
    bit          is_parallel   = 0;
    string       refs_dir      = "refs/serial";
    int unsigned warmup_blocks = 0;

    function new(string name = "fft_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        // Pick up env-level config (defaults are Serial)
        void'(uvm_config_db#(int unsigned)::get(this, "", "p_pack",        p_pack));
        void'(uvm_config_db#(bit)         ::get(this, "", "is_parallel",   is_parallel));
        void'(uvm_config_db#(string)      ::get(this, "", "refs_dir",      refs_dir));
        void'(uvm_config_db#(int unsigned)::get(this, "", "warmup_blocks", warmup_blocks));

        // Propagate config down to children BEFORE they're built
        // (uvm_config_db::set must happen before the child's build_phase runs;
        //  child build_phases run during this build_phase's recursion, so
        //  we set first then create.)

        // S_AXIS agent — ACTIVE
        uvm_config_db#(uvm_active_passive_enum)::set(
            this, "s_axis_agent", "is_active", UVM_ACTIVE);
        uvm_config_db#(int unsigned)::set(this, "s_axis_agent.*", "p_pack",      p_pack);
        uvm_config_db#(string)      ::set(this, "s_axis_agent.monitor", "label", "S_AXIS");
        uvm_config_db#(bit)         ::set(this, "s_axis_agent.monitor", "m_axis_dedup", 1'b0);

        // M_AXIS agent — PASSIVE
        uvm_config_db#(uvm_active_passive_enum)::set(
            this, "m_axis_agent", "is_active", UVM_PASSIVE);
        uvm_config_db#(int unsigned)::set(this, "m_axis_agent.*", "p_pack",      p_pack);
        uvm_config_db#(string)      ::set(this, "m_axis_agent.monitor", "label", "M_AXIS");
        // Serial DUT's M_AXIS holds tdata for 2 cycles per beat → dedup on
        uvm_config_db#(bit)         ::set(this, "m_axis_agent.monitor",
                                          "m_axis_dedup", !is_parallel);

        // Reference model — tell it where to find the .mem files
        uvm_config_db#(string)::set(this, "ref_model", "refs_dir", refs_dir);

        // Scoreboard — tell it which DUT family for thresholds and packing.
        // The DUT only emits ONE M_AXIS block per stimulus burst (even with
        // a priming input block) so the scoreboard's warmup_blocks stays 0.
        // The sequence handles the priming on the input side.
        uvm_config_db#(bit)         ::set(this, "scoreboard", "is_parallel",   is_parallel);
        uvm_config_db#(int unsigned)::set(this, "scoreboard", "p_pack",        p_pack);
        uvm_config_db#(int unsigned)::set(this, "scoreboard", "warmup_blocks", 0);

        // Coverage — pass p_pack so it can unpack samples correctly
        uvm_config_db#(int unsigned)::set(this, "coverage", "p_pack", p_pack);

        // Create children
        s_axis_agent = axi_stream_agent::type_id::create("s_axis_agent", this);
        m_axis_agent = axi_stream_agent::type_id::create("m_axis_agent", this);
        ref_model    = fft_ref_model   ::type_id::create("ref_model",    this);
        scoreboard   = fft_scoreboard  ::type_id::create("scoreboard",   this);
        coverage     = fft_coverage    ::type_id::create("coverage",     this);
    endfunction

    //--------------------------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        // Wire the M_AXIS monitor's analysis port to BOTH the scoreboard
        // and the coverage collector (one-to-many broadcast — the standard
        // UVM analysis pattern).
        m_axis_agent.monitor.ap.connect(scoreboard.m_axis_export);
        m_axis_agent.monitor.ap.connect(coverage.m_axis_export);

        // Give the scoreboard a handle to the reference model
        scoreboard.ref_model = ref_model;
    endfunction

endclass

`endif // FFT_ENV_SV
