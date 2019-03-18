`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2019 12:24:23 AM
// Design Name: 
// Module Name: Controller
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


module Controller(input [5:0] opcode,
                    input clk, rst,
                    output MtoRFSel, RFDSel, IDSel, ALUIn1Sel, IRWE, DMWE, PCWE, Branch, RFWE,
                    output [1:0] PCSel, ALUIn2Sel, ALUOp);
    parameter s0 = 4'b0000;
    parameter s1 = 4'b0001;
    parameter s2 = 4'b0010;
    parameter s3 = 4'b0011;
    parameter s4 = 4'b0100;
    parameter s5 = 4'b0101;
    parameter s6 = 4'b0110;
    parameter s7 = 4'b0111;
    parameter s8 = 4'b1000;
    parameter s9 = 4'b1001;
    parameter s10 = 4'b1010;
    parameter s11 = 4'b1011;
    
    reg [3:0] current, next;
    reg [14:0] cw;
    
    initial current = s0;
    always @(posedge clk)
        current = next;
        
    always @(current or opcode) begin
            case (current)
                s0: begin
                    cw = 15'b0_0_0_00_0_01_1_0_1_0_0_00;
                    next = s1;
                end
                s1: begin
                    cw = 15'b0_0_0_00_0_10_0_0_0_0_0_00;
                    if (opcode == 6'b100011 || opcode == 6'b101011) //lw or sw
                        next = s2;
                    if (opcode == 6'b000000) //r-type
                        next = s6;
                    if (opcode == 6'b000100)//beq 
                        next = s8;
                    if (opcode == 6'b001000) //addi
                        next = s9;
                    if (opcode == 6'b000010) //j
                        next = s10;
                end
                s2: begin
                    cw = 15'b0_0_0_00_1_10_0_0_0_0_0_00;
                    if (opcode == 6'b100011) //lw
                        next = s3;
                    if (opcode == 6'b101011) //sw
                        next = s5;
                end
                s3: begin
                    cw = 15'b0_0_1_00_0_00_0_0_0_0_0_00;
                    next = s4;
                end
                s4: begin
                    cw = 15'b1_0_0_00_0_00_0_0_0_0_1_00;
                    next = s0;
                end
                s5: begin
                    cw = 15'b0_0_1_00_0_00_0_1_0_0_0_00;
                    next = s0;
                end
                s6: begin
                    cw = 15'b0_0_0_00_1_00_0_0_0_0_0_10;
                    if (opcode == 6'b000000)
                        next = s7;
                end
                s7: begin
                    cw = 15'b0_1_0_00_0_00_0_0_0_0_1_00;
                    next = s0;
                end
                s8: begin
                    cw = 15'b0_0_0_01_1_00_0_0_0_1_0_01;
                    next = s0;
                end
                s9: begin
                    cw = 15'b0_0_0_00_1_10_0_0_0_0_0_00;
                    next = s11;
                end
                s10: begin
                    cw = 15'b0_0_0_10_0_00_0_0_1_0_0_00;
                    next = s0;
                end
                s11: begin
                    cw = 15'b0_0_0_00_0_00_0_0_0_0_1_00;
                    next = s0;
                end
            endcase
        end
    assign {MtoRFSel, RFDSel, IDSel, PCSel[1:0], ALUIn1Sel, ALUIn2Sel[1:0], IRWE, DMWE, 
             PCWE, Branch, RFWE, ALUOp[1:0]} = cw[14:0];
endmodule
