`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 09:33:13 AM
// Design Name: 
// Module Name: Reg_En
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


module Reg_En #(parameter WL = 1)
                (input clk, en, rst,
                    input signed [WL-1:0] in,
                    output reg signed [WL-1:0] out);
    initial out = 0;
    always @(posedge clk) 
        if(en) out = in;
endmodule
