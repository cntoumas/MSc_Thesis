//! @brief Block Floating Point Barrel Shifter and Exponent Tracker.
//! @details This module applies dynamic scaling to the FFT data based on the
//! Count Leading Zeros (CLZ) calculated by the BFP Scanner in the previous stage.
//! It utilizes a multiplexer-based barrel shifter (inferred via a case statement)
//! to align the 17-bit input data into a maximized 16-bit output word, ensuring
//! maximum Signal-to-Quantization-Noise Ratio (SQNR) while preventing overflow.
//! It simultaneously updates the global sideband exponent.
module bfp_shifter #(
    //! Bit-width of the incoming data from the RAM/previous stage (typically 17).
    parameter INPUT_WIDTH = 17,

    //! Bit-width of the scaled output data (typically 16).
    parameter OUTPUT_WIDTH = 16
  )(
    //! System clock.
    input wire clk,

    //! Synchronous active-high reset.
    input wire rst,

    //! Real part of the input data (A).
    input wire signed [INPUT_WIDTH-1:0] a_in_re,

    //! Imaginary part of the input data (A).
    input wire signed [INPUT_WIDTH-1:0] a_in_im,

    //! Real part of the input data (B).
    input wire signed [INPUT_WIDTH-1:0] b_in_re,

    //! Imaginary part of the input data (B).
    input wire signed [INPUT_WIDTH-1:0] b_in_im,

    //! The minimum CLZ calculated by the BFP scanner for this data block.
    input wire [3:0] block_clz,

    //! The global exponent of the data prior to this scaling stage.
    input wire signed [7:0] exp_in,

    //! Scaled 16-bit real output (A).
    output reg signed [OUTPUT_WIDTH-1:0] a_out_re,

    //! Scaled 16-bit imaginary output (A).
    output reg signed [OUTPUT_WIDTH-1:0] a_out_im,

    //! Scaled 16-bit real output (B).
    output reg signed [OUTPUT_WIDTH-1:0] b_out_re,

    //! Scaled 16-bit imaginary output (B).
    output reg signed [OUTPUT_WIDTH-1:0] b_out_im,

    //! The updated global exponent reflecting the shift applied in this stage.
    output reg signed [7:0] exp_out
  );

  //! @brief Dynamic Barrel Shifter and Exponent Update.
  //! @details Slices the data bus dynamically based on the CLZ value. By explicitly
  //! slicing the buses rather than using arithmetic shift operators (<<<), synthesis
  //! tools map this directly to a highly efficient, single-cycle multiplexer tree.
  always @(posedge clk)
  begin : STAGE_BARREL_SHIFTER
    if (rst)
    begin
      a_out_re <= 0;
      a_out_im <= 0;
      b_out_re <= 0;
      b_out_im <= 0;
      exp_out  <= 0;
    end
    else
    begin
      case (block_clz)
        4'd0:
        begin
          //! Max bit growth occurred. Arithmetic Right-Shift by 1 (Divide by 2).
          //! We extract [16:1], dropping the LSB. Exponent increases by 1.
          a_out_re <= a_in_re[INPUT_WIDTH-1 : 1];
          a_out_im <= a_in_im[INPUT_WIDTH-1 : 1];
          b_out_re <= b_in_re[INPUT_WIDTH-1 : 1];
          b_out_im <= b_in_im[INPUT_WIDTH-1 : 1];
          exp_out  <= exp_in + 8'sd1;
        end
        4'd1:
        begin
          //! Perfect fit. No shift. Drop the redundant 17th sign bit.
          //! We extract [15:0]. Exponent remains unchanged.
          a_out_re <= a_in_re[OUTPUT_WIDTH-1 : 0];
          a_out_im <= a_in_im[OUTPUT_WIDTH-1 : 0];
          b_out_re <= b_in_re[OUTPUT_WIDTH-1 : 0];
          b_out_im <= b_in_im[OUTPUT_WIDTH-1 : 0];
          exp_out  <= exp_in;
        end
        4'd2:
        begin
          //! 1 bit of headroom. Left-Shift by 1 (Multiply by 2).
          //! We extract [14:0] and append 1 zero. Exponent decreases by 1.
          a_out_re <= {a_in_re[OUTPUT_WIDTH-2 : 0], 1'b0};
          a_out_im <= {a_in_im[OUTPUT_WIDTH-2 : 0], 1'b0};
          b_out_re <= {b_in_re[OUTPUT_WIDTH-2 : 0], 1'b0};
          b_out_im <= {b_in_im[OUTPUT_WIDTH-2 : 0], 1'b0};
          exp_out  <= exp_in - 8'sd1;
        end
        4'd3:
        begin
          //! 2 bits of headroom. Left-Shift by 2.
          a_out_re <= {a_in_re[OUTPUT_WIDTH-3 : 0], 2'b00};
          a_out_im <= {a_in_im[OUTPUT_WIDTH-3 : 0], 2'b00};
          b_out_re <= {b_in_re[OUTPUT_WIDTH-3 : 0], 2'b00};
          b_out_im <= {b_in_im[OUTPUT_WIDTH-3 : 0], 2'b00};
          exp_out  <= exp_in - 8'sd2;
        end
        4'd4:
        begin
          //! 3 bits of headroom. Left-Shift by 3.
          a_out_re <= {a_in_re[OUTPUT_WIDTH-4 : 0], 3'b000};
          a_out_im <= {a_in_im[OUTPUT_WIDTH-4 : 0], 3'b000};
          b_out_re <= {b_in_re[OUTPUT_WIDTH-4 : 0], 3'b000};
          b_out_im <= {b_in_im[OUTPUT_WIDTH-4 : 0], 3'b000};
          exp_out  <= exp_in - 8'sd3;
        end
        4'd5:
        begin
          //! 4 bits of headroom. Left-Shift by 4.
          a_out_re <= {a_in_re[OUTPUT_WIDTH-5 : 0], 4'b0000};
          a_out_im <= {a_in_im[OUTPUT_WIDTH-5 : 0], 4'b0000};
          b_out_re <= {b_in_re[OUTPUT_WIDTH-5 : 0], 4'b0000};
          b_out_im <= {b_in_im[OUTPUT_WIDTH-5 : 0], 4'b0000};
          exp_out  <= exp_in - 8'sd4;
        end
        4'd6:
        begin
          //! 5 bits of headroom. Left-Shift by 5.
          a_out_re <= {a_in_re[OUTPUT_WIDTH-6 : 0], 5'b00000};
          a_out_im <= {a_in_im[OUTPUT_WIDTH-6 : 0], 5'b00000};
          b_out_re <= {b_in_re[OUTPUT_WIDTH-6 : 0], 5'b00000};
          b_out_im <= {b_in_im[OUTPUT_WIDTH-6 : 0], 5'b00000};
          exp_out  <= exp_in - 8'sd5;
        end
        4'd7:
        begin
          //! 6 bits of headroom. Left-Shift by 6.
          a_out_re <= {a_in_re[OUTPUT_WIDTH-7 : 0], 6'b000000};
          a_out_im <= {a_in_im[OUTPUT_WIDTH-7 : 0], 6'b000000};
          b_out_re <= {b_in_re[OUTPUT_WIDTH-7 : 0], 6'b000000};
          b_out_im <= {b_in_im[OUTPUT_WIDTH-7 : 0], 6'b000000};
          exp_out  <= exp_in - 8'sd6;
        end
        default:
        begin
          //! CLZ >= 8. Signal is extremely small. Max left shift by 7.
          a_out_re <= {a_in_re[OUTPUT_WIDTH-8 : 0], 7'b0000000};
          a_out_im <= {a_in_im[OUTPUT_WIDTH-8 : 0], 7'b0000000};
          b_out_re <= {b_in_re[OUTPUT_WIDTH-8 : 0], 7'b0000000};
          b_out_im <= {b_in_im[OUTPUT_WIDTH-8 : 0], 7'b0000000};
          exp_out  <= exp_in - 8'sd7;
        end
      endcase
    end
  end

endmodule
