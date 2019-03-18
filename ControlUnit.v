`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2019 10:22:43 AM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(input CLK, RST,
                   input [5:0] OPCODE, FUNCT,
                    output MtoRFSel, RFDSel, IDSel, ALUIn1Sel, IRWE, DMWE, PCWE, Branch, RFWE,
                    output [1:0] PCSel, ALUIn2Sel,
                    output [2:0] ALUSel);
                    
    wire [1:0] ALUOp;
    
    Controller 
        C0 (.opcode(OPCODE), .clk(CLK), .rst(RST), .MtoRFSel(MtoRFSel), .RFDSel(RFDSel), .IDSel(IDSel), 
                .ALUIn1Sel(ALUIn1Sel), .IRWE(IRWE), .DMWE(DMWE), .PCWE(PCWE), .Branch(Branch), .RFWE(RFWE), 
                .PCSel(PCSel), .ALUIn2Sel(ALUIn2Sel), .ALUOp(ALUOp));
                
    ALUDecoder
        AD0 (.ALUOp(ALUOp), .Funct(FUNCT), .ALUSel(ALUSel));
     
endmodule
