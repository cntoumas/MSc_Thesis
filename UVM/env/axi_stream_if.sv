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

    // Clocking blocks (kept for future use; current driver/monitor read the
    // raw signals to keep xsim's elaboration simple)
    clocking drv_cb @(posedge clk);
        default input #1step output #1ns;
        output tdata, tvalid, tlast;
        input  tready, tuser;
    endclocking

    clocking mon_cb @(posedge clk);
        default input #1step;
        input  tdata, tvalid, tlast, tuser, tready;
    endclocking

    wire handshake = tvalid & tready;

endinterface

`endif // AXI_STREAM_IF_SV