//------------------------------------------------------------------------------
// axi_stream_if.sv
//------------------------------------------------------------------------------
// AXI4-Stream interface used to drive S_AXIS and monitor M_AXIS of the FFT
// DUT. One interface instance per AXI-Stream port pair.
//
// Day 3 NOTE: this interface was originally parameterised (DATA_WIDTH, P,
// TUSER_W) but xsim 2023.2 has a known elaboration issue with parameterised
// interface defaults (`<name>_default` resolution fails). To unblock Day 3 we
// hard-code to the Serial DUT shape (P=1, 32-bit tdata, 8-bit tuser). Day 4
// will add a sibling interface `axi_stream_if_p4` for the Parallel DUT.
//
// Layout of tdata: {re[15:0], im[15:0]} — one complex sample per beat.
//------------------------------------------------------------------------------
`ifndef AXI_STREAM_IF_SV
`define AXI_STREAM_IF_SV

interface axi_stream_if(
    input  logic clk,
    input  logic rst
);

    // tdata is sized for the WIDEST DUT (Parallel MDF, P=4 → 128 bits).
    // Serial DUT only uses bits [31:0]; the testbench wraps the DUT so the
    // upper 96 bits stay 0. tuser is 8 bits to accommodate the Serial DUT's
    // 8-bit BFP exponent; Parallel only uses bits [3:0].
    localparam int unsigned DATA_WIDTH    = 16;
    localparam int unsigned P_MAX         = 4;
    localparam int unsigned TUSER_W       = 8;
    localparam int unsigned TDATA_W       = P_MAX * 2 * DATA_WIDTH;   // 128

    logic [TDATA_W-1:0] tdata;
    logic               tvalid;
    logic               tready;
    logic               tlast;
    logic [TUSER_W-1:0] tuser;

    //--------------------------------------------------------------------------
    // Modports
    //--------------------------------------------------------------------------
    modport master (
        output tdata, tvalid, tlast, tuser,
        input  tready,
        input  clk, rst
    );

    modport slave (
        input  tdata, tvalid, tlast, tuser,
        output tready,
        input  clk, rst
    );

    modport monitor (
        input  tdata, tvalid, tlast, tuser, tready,
        input  clk, rst
    );

    //--------------------------------------------------------------------------
    // Clocking blocks (kept for future use; current driver/monitor read the
    // raw signals to keep xsim's elaboration simple)
    //--------------------------------------------------------------------------
    clocking drv_cb @(posedge clk);
        default input #1step output #1ns;
        output tdata, tvalid, tlast;
        input  tready, tuser;
    endclocking

    clocking mon_cb @(posedge clk);
        default input #1step;
        input  tdata, tvalid, tlast, tuser, tready;
    endclocking

    //--------------------------------------------------------------------------
    wire handshake = tvalid & tready;

endinterface

`endif // AXI_STREAM_IF_SV
