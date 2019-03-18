`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2019 10:38:19 AM
// Design Name: 
// Module Name: TopLevel
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


module TopLevel(input MCLK, MRST);

    wire mtorfsel, rfdsel, idsel, aluin1sel, irwe, dmwe, pcwe, branch, rfwe;
    wire [1:0] pcsel, aluin2sel;
    wire [2:0] alusel;
    wire [5:0] opcode, funct;
    
    Dataflow
        DF0 (.mCLK(MCLK), .RST(MRST), .MtoRFSel(mtorfsel), .RFDSel(rfdsel), .IDSel(idsel), .ALUIn1Sel(aluin1sel),
                .IRWE(irwe), .DMWE(dmwe), .PCWE(pcwe), .Branch(branch), .RFWE(rfwe), .PCSel(pcsel), .ALUIn2Sel(aluin2sel),
                .ALUSel(alusel), .op(opcode), .funct(funct));
        
    ControlUnit
        CU0 (.CLK(MCLK), .RST(MRST), .OPCODE(opcode), .FUNCT(funct),.MtoRFSel(mtorfsel), .RFDSel(rfdsel), .IDSel(idsel), 
                .ALUIn1Sel(aluin1sel), .IRWE(irwe), .DMWE(dmwe), .PCWE(pcwe), .Branch(branch), .RFWE(rfwe), 
                .PCSel(pcsel), .ALUIn2Sel(aluin2sel), .ALUSel(alusel));

endmodule
