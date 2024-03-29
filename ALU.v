`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 09:11:01 AM
// Design Name: 
// Module Name: ALU
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


module ALU( input signed [31:0] SrcA, SrcB,
             input [2:0] ALUControl,
             input [4:0] SHAMT,
             output ZeroFlag,
             output signed [31:0] ALUResult);
             
	reg [31:0] result;
	reg flag;
	
	always @(*) begin
		case (ALUControl)
		3'b000: result = SrcA + SrcB; //  Addition
		3'b001: result = SrcA - SrcB; //  Subtraction 
		3'b010: result = SrcA & SrcB; //  AND 
		3'b011: result = SrcA | SrcB; //  OR 
		3'b100: result = SrcA - SrcB; // slt
		3'b101: result = SrcB << SHAMT; //sll
		3'b110: result = SrcA << SrcB; // sllv
		3'b111: result = SrcB >>> SrcA; //srav
    endcase 
		
	if (result == 0) flag = 1; 
		else flag = 0;
	end
	
	assign ALUResult = result; 
	assign ZeroFlag = flag; 
	
endmodule

