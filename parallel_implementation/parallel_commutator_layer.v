//! @brief Parameterized Parallel-Parallel Permutation Layer
//! @details Handles the spatial routing of P parallel lanes. 
//! Instantiates P/2 commutators. The STRIDE parameter determines 
//! the logical distance between the two lanes entering a commutator.
//! For P=8 and STRIDE=4: Swaps (0,4), (1,5), (2,6), (3,7).
//! For P=8 and STRIDE=1: Swaps (0,1), (2,3), (4,5), (6,7).
module parallel_commutator_layer #(
    parameter P = 8,              //! Number of parallel lanes (e.g., 8 or 16)
    parameter DATA_WIDTH = 34,    //! Bit-width of a single lane (Real + Imag)
    parameter STRIDE = 4          //! The index distance between swapped lanes
)(
    input wire clk,
    input wire rst,
    input wire swap_ctrl,         //! Global control for this layer: 0 = Straight, 1 = Cross
    
    //! Flattened 1D array representing P parallel input lanes
    input wire [(P * DATA_WIDTH)-1:0] data_in_flat,
    
    //! Flattened 1D array representing P parallel output lanes
    output wire [(P * DATA_WIDTH)-1:0] data_out_flat
);

    //! Internal 2D arrays to make routing assignments readable
    wire [DATA_WIDTH-1:0] lane_in  [0:P-1];
    wire [DATA_WIDTH-1:0] lane_out [0:P-1];

    //! Unpack the flattened input vector into a 2D array
    genvar i;
    generate
        for (i = 0; i < P; i = i + 1) begin : UNPACK
            assign lane_in[i] = data_in_flat[(i * DATA_WIDTH) +: DATA_WIDTH];
        end
    endgenerate

    //! Build the Commutator Network
    //! We iterate through the lanes, skipping by 2*STRIDE to group 
    //! the correct upper and lower lane pairs.
    genvar group, offset;
    generate
        for (group = 0; group < P; group = group + (2 * STRIDE)) begin : COMM_GROUP
            for (offset = 0; offset < STRIDE; offset = offset + 1) begin : COMM_PAIR
                
                localparam IDX_A = group + offset;           //! Upper lane
                localparam IDX_B = group + offset + STRIDE;  //! Lower lane
                
                //! Instantiate the 2x2 Swap Box
                commutator_2x2 #(
                    .DATA_WIDTH(DATA_WIDTH)
                ) u_swap_box (
                    .clk(clk),
                    .rst(rst),
                    .swap(swap_ctrl),
                    .x0(lane_in[IDX_A]),
                    .x1(lane_in[IDX_B]),
                    .y0(lane_out[IDX_A]),
                    .y1(lane_out[IDX_B])
                );
            end
        end
    endgenerate

    //! Pack the 2D array back into the flattened output vector
    genvar j;
    generate
        for (j = 0; j < P; j = j + 1) begin : PACK
            assign data_out_flat[(j * DATA_WIDTH) +: DATA_WIDTH] = lane_out[j];
        end
    endgenerate

endmodule