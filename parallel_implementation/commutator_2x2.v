//! @brief Parameterized 2x2 Commutator (Swap/Exchange Node)
//! @details The fundamental routing primitive for Parallel SDF FFT Permutation Networks.
//! Based on the 'swap' control signal, it either passes two parallel 
//! data streams straight through, or crosses them over. 
//! It includes a pipeline register to maintain Fmax during complex routing.
module commutator_2x2 #(
    parameter DATA_WIDTH = 34 //! Combined bit-width (Real + Imag)
)(
    input wire clk,
    input wire rst,
    input wire swap,                //! Control: 0 = Straight, 1 = Cross/Swap
    input wire [DATA_WIDTH-1:0] x0, //! Input from Lane A
    input wire [DATA_WIDTH-1:0] x1, //! Input from Lane B
    output reg [DATA_WIDTH-1:0] y0, //! Output to Lane A
    output reg [DATA_WIDTH-1:0] y1  //! Output to Lane B
);

    always @(posedge clk) begin
        if (rst) begin
            y0 <= {DATA_WIDTH{1'b0}};
            y1 <= {DATA_WIDTH{1'b0}};
        end else begin
            if (swap) begin
                y0 <= x1; //! Cross
                y1 <= x0; //! Cross
            end else begin
                y0 <= x0; //! Straight
                y1 <= x1; //! Straight
            end
        end
    end

endmodule