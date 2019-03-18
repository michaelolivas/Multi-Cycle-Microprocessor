`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 09:41:41 AM
// Design Name: 
// Module Name: Reg
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


module Reg #(parameter WL = 1)
            (input clk, rst,
                input signed [WL-1:0] in,
                output reg signed [WL-1:0] out);

    always @(posedge clk) begin
        out = in;
    end
endmodule
