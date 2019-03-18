`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 09:20:05 AM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(input clk, rfwe, rst,
                    input [4:0] RFRA1, RFRA2, RFWA, 
                    input signed [31:0] RFWD,
                    output signed [31:0] RFRD1, RFRD2);
                            
    reg [31:0] Registers [0:31];
    initial Registers[0] = 0;
	always@(posedge clk) begin
	   if (rfwe) Registers[RFWA] = RFWD;
	end

    assign RFRD1 = Registers[RFRA1];
	assign RFRD2 = Registers[RFRA2];
	
endmodule

