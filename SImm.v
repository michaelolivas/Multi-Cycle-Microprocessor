`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 05:39:20 PM
// Design Name: 
// Module Name: SImm
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


module SImm(input [15:0] a, 
			 output [31:0] signImm );
						
	assign signImm = { {16{a[15]}}, a };

endmodule

