//------------------------------------------------------------------------------
// axi_stream_sva.sv
//------------------------------------------------------------------------------
// SVA properties that monitor an AXI4-Stream port and flag protocol
// violations. Designed to be `bind`-mounted onto any axi_stream_if instance
// so the same property set checks both S_AXIS and M_AXIS, on both Serial and
// Parallel DUTs.
//
// Bound from tb/tb_top_serial.sv and tb/tb_top_parallel.sv. Properties fire
// `uvm_error` so they show up in the regression log alongside scoreboard
// failures.
//------------------------------------------------------------------------------
`ifndef AXI_STREAM_SVA_SV
`define AXI_STREAM_SVA_SV
`timescale 1ns/1ps

module axi_stream_sva #(
    parameter int unsigned TDATA_W = 128,
    parameter int unsigned TUSER_W = 8,
    parameter string       LABEL   = "AXIS"
)(
    input  logic               clk,
    input  logic               rst,         // active-high (our axi_stream_if convention)
    input  logic [TDATA_W-1:0] tdata,
    input  logic               tvalid,
    input  logic               tready,
    input  logic               tlast,
    input  logic [TUSER_W-1:0] tuser
);

    //--------------------------------------------------------------------------
    // P1 — tvalid hold: once tvalid is asserted, it must stay high until
    //      tready is observed. (AXI4-Stream §2.2.1)
    //--------------------------------------------------------------------------
    property p_tvalid_hold;
        @(posedge clk) disable iff (rst)
        $rose(tvalid) |-> tvalid throughout tready[->1];
    endproperty
    a_tvalid_hold: assert property(p_tvalid_hold)
        else $error("[%s][SVA p_tvalid_hold] tvalid deasserted before tready was sampled", LABEL);

    //--------------------------------------------------------------------------
    // P2 — tdata stable while back-pressured: if tvalid is held high but
    //      tready is low, tdata must not change.
    //--------------------------------------------------------------------------
    property p_tdata_stable;
        @(posedge clk) disable iff (rst)
        (tvalid && !tready) |=> $stable(tdata);
    endproperty
    a_tdata_stable: assert property(p_tdata_stable)
        else $error("[%s][SVA p_tdata_stable] tdata changed while back-pressured (tvalid=1, tready=0)",
                    LABEL);

    //--------------------------------------------------------------------------
    // P3 — tlast stable while back-pressured: same property for tlast.
    //--------------------------------------------------------------------------
    property p_tlast_stable;
        @(posedge clk) disable iff (rst)
        (tvalid && !tready) |=> $stable(tlast);
    endproperty
    a_tlast_stable: assert property(p_tlast_stable)
        else $error("[%s][SVA p_tlast_stable] tlast changed while back-pressured", LABEL);

    //--------------------------------------------------------------------------
    // P4 — tuser stable while back-pressured.
    //--------------------------------------------------------------------------
    property p_tuser_stable;
        @(posedge clk) disable iff (rst)
        (tvalid && !tready) |=> $stable(tuser);
    endproperty
    a_tuser_stable: assert property(p_tuser_stable)
        else $error("[%s][SVA p_tuser_stable] tuser changed while back-pressured", LABEL);

    //--------------------------------------------------------------------------
    // P5 — no X on tvalid (excluding reset). X-propagation here usually means
    //      an upstream driver lost its initialiser.
    //--------------------------------------------------------------------------
    property p_no_x_tvalid;
        @(posedge clk) disable iff (rst)
        !$isunknown(tvalid);
    endproperty
    a_no_x_tvalid: assert property(p_no_x_tvalid)
        else $error("[%s][SVA p_no_x_tvalid] tvalid is X", LABEL);

    //--------------------------------------------------------------------------
    // Cover properties — populate the coverage report with "interesting"
    // protocol events.
    //--------------------------------------------------------------------------
    cp_handshake     : cover property(@(posedge clk) disable iff (rst)
                                       tvalid && tready);
    cp_back_pressure : cover property(@(posedge clk) disable iff (rst)
                                       tvalid && !tready);
    cp_tlast         : cover property(@(posedge clk) disable iff (rst)
                                       tvalid && tready && tlast);

endmodule

`endif // AXI_STREAM_SVA_SV
