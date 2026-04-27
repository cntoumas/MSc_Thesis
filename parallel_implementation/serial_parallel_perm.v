//! @brief Parameterized Serial-Parallel Permutation Block
//! @details Manages time-dimension reordering for P=2 paths.
module serial_parallel_perm #(
    parameter DATA_WIDTH = 34,
    parameter DEPTH = 512 //! Delay depth for this specific stage
)(
    input wire clk,
    input wire rst,
    input wire valid_in,
    input wire swap_ctrl,           //! Toggles exactly every DEPTH clock cycles
    input wire [DATA_WIDTH-1:0] in0, //! Input Lane 0
    input wire [DATA_WIDTH-1:0] in1, //! Input Lane 1
    output wire [DATA_WIDTH-1:0] out0,//! Output Lane 0
    output wire [DATA_WIDTH-1:0] out1 //! Output Lane 1
);

    wire [DATA_WIDTH-1:0] delay0_out;
    wire [DATA_WIDTH-1:0] comm_y0, comm_y1;

    //! 1. Delay Lane 0
    delay_line #(
        .DATA_WIDTH(DATA_WIDTH), 
        .DEPTH(DEPTH)
    ) u_delay0 (
        .clk(clk), .rst(rst), .we(valid_in),
        .data_in(in0), .data_out(delay0_out)
    );

    //! 2. 2x2 Commutator Swaps Lane 0 (Delayed) with Lane 1 (Real-time)
    commutator_2x2 #(
        .DATA_WIDTH(DATA_WIDTH)
    ) u_comm (
        .clk(clk), .rst(rst),
        .swap(swap_ctrl),
        .x0(delay0_out), .x1(in1),
        .y0(comm_y0), .y1(comm_y1)
    );

    //! 3. Delay Lane 1 after the swap
    delay_line #(
        .DATA_WIDTH(DATA_WIDTH), 
        .DEPTH(DEPTH)
    ) u_delay1 (
        .clk(clk), .rst(rst), .we(valid_in),
        .data_in(comm_y1), .data_out(out1)
    );

    assign out0 = comm_y0;

endmodule
//! @brief Parameterized Serial-Parallel Permutation Block
//! @details Manages time-dimension reordering for P=2 paths.
module serial_parallel_perm #(
    parameter DATA_WIDTH = 34,
    parameter DEPTH = 512 //! Delay depth for this specific stage
)(
    input wire clk,
    input wire rst,
    input wire valid_in,
    input wire swap_ctrl,           //! Toggles exactly every DEPTH clock cycles
    input wire [DATA_WIDTH-1:0] in0, //! Input Lane 0
    input wire [DATA_WIDTH-1:0] in1, //! Input Lane 1
    output wire [DATA_WIDTH-1:0] out0,//! Output Lane 0
    output wire [DATA_WIDTH-1:0] out1 //! Output Lane 1
);

    wire [DATA_WIDTH-1:0] delay0_out;
    wire [DATA_WIDTH-1:0] comm_y0, comm_y1;

    //! 1. Delay Lane 0
    delay_line #(
        .DATA_WIDTH(DATA_WIDTH), 
        .DEPTH(DEPTH)
    ) u_delay0 (
        .clk(clk), .rst(rst), .we(valid_in),
        .data_in(in0), .data_out(delay0_out)
    );

    //! 2. 2x2 Commutator Swaps Lane 0 (Delayed) with Lane 1 (Real-time)
    commutator_2x2 #(
        .DATA_WIDTH(DATA_WIDTH)
    ) u_comm (
        .clk(clk), .rst(rst),
        .swap(swap_ctrl),
        .x0(delay0_out), .x1(in1),
        .y0(comm_y0), .y1(comm_y1)
    );

    //! 3. Delay Lane 1 after the swap
    delay_line #(
        .DATA_WIDTH(DATA_WIDTH), 
        .DEPTH(DEPTH)
    ) u_delay1 (
        .clk(clk), .rst(rst), .we(valid_in),
        .data_in(comm_y1), .data_out(out1)
    );

    assign out0 = comm_y0;

endmodule