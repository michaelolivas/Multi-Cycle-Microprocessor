`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 08:43:55 AM
// Design Name: 
// Module Name: mux_31
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_31 #(parameter WL = 1)
                (input [1:0] Sel, input signed [WL-1: 0] A, B, C,
                    output reg signed [WL-1:0] Out);

    always @ (A or B or C or Sel) begin
        case (Sel)
            2'b00: Out = A;
            2'b01: Out = B;
            2'b10: Out = C;
            default: Out = WL-1'bx;
        endcase
    end
endmodule
