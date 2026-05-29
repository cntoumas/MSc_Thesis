//------------------------------------------------------------------------------
// axi_stream_seq_item.sv
//------------------------------------------------------------------------------
// UVM transaction class for a single AXI4-Stream beat (one or P packed
// complex samples). Used both as stimulus (driver) and observation (monitor).
//
// For Serial FFT (P=1):  tdata = {re[15:0], im[15:0]}
// For Parallel MDF (P=4): tdata = {s3.re,s3.im, s2.re,s2.im, s1.re,s1.im, s0.re,s0.im}
//------------------------------------------------------------------------------
`ifndef AXI_STREAM_SEQ_ITEM_SV
`define AXI_STREAM_SEQ_ITEM_SV

class axi_stream_seq_item extends uvm_sequence_item;

    // We size tdata wide enough for the largest case (P=4 × 16-bit × 2 = 128).
    // For P=1, only the low 32 bits are used; upper bits are 0.
    rand bit [127:0] tdata;
    rand bit         tlast;
    bit [7:0]        tuser;       // BFP exponent (only meaningful on M_AXIS)
    int              beat_index;  // 0 .. N-1, set by driver/monitor for trace

    // Backpressure model: number of cycles to hold tready low after this beat
    // (relevant only when the env is configured to back-pressure the slave).
    rand int unsigned ready_delay;
    constraint c_ready_delay { ready_delay inside {[0:3]}; ready_delay dist {0:=80, [1:3]:=20}; }

    `uvm_object_utils_begin(axi_stream_seq_item)
        `uvm_field_int(tdata,       UVM_DEFAULT | UVM_HEX)
        `uvm_field_int(tlast,       UVM_DEFAULT)
        `uvm_field_int(tuser,       UVM_DEFAULT)
        `uvm_field_int(beat_index,  UVM_DEFAULT | UVM_DEC | UVM_NOCOMPARE)
        `uvm_field_int(ready_delay, UVM_DEFAULT | UVM_DEC | UVM_NOCOMPARE)
    `uvm_object_utils_end

    function new(string name = "axi_stream_seq_item");
        super.new(name);
    endfunction

    //--------------------------------------------------------------------------
    // Helper accessors — extract Nth sample's real/imag part from packed tdata.
    // P=1: index must be 0. P=4: index 0..3 (0 = low half, 3 = high half).
    //--------------------------------------------------------------------------
    function automatic bit signed [15:0] get_re(int idx = 0);
        get_re = tdata[idx*32 + 31 -: 16];
    endfunction

    function automatic bit signed [15:0] get_im(int idx = 0);
        get_im = tdata[idx*32 + 15 -: 16];
    endfunction

    function automatic void set_sample(int idx, bit signed [15:0] re_val,
                                                bit signed [15:0] im_val);
        tdata[idx*32 + 31 -: 16] = re_val;
        tdata[idx*32 + 15 -: 16] = im_val;
    endfunction

    //--------------------------------------------------------------------------
    // Pretty-print for logs
    //--------------------------------------------------------------------------
    function string convert2string();
        return $sformatf("beat[%0d] tdata=0x%0h tlast=%0b tuser=%0d",
                         beat_index, tdata, tlast, tuser);
    endfunction

endclass

`endif // AXI_STREAM_SEQ_ITEM_SV
