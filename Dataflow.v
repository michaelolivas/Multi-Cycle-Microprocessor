`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 09:40:48 PM
// Design Name: 
// Module Name: Dataflow
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


module Dataflow(input mCLK, RST,
                input MtoRFSel, RFDSel, IDSel, ALUIn1Sel, IRWE, DMWE, PCWE, Branch, RFWE,
                input [1:0] PCSel, ALUIn2Sel,
                input [2:0] ALUSel,
                    output [5:0] op, funct);
                    
    wire PCRST, zero, OR, PCEn;
    wire [4:0] RFRA1, RFRA2, RFWA, RS, RT, RD, SHAMT;
    wire signed [31:0] PCP, PCOUT, ADR, RFWD, RFRD1, RFRD2, ALUIn1, ALUIn2, ALUOUT, SImm, A, B, MRD;
    wire [31:0] IR, DR, ALUOUTR, JADDR;
    wire [15:0] Imm;
    wire [25:0] JAddr;
    
    assign RS = IR[25:21];
    assign RT = IR[20:16];
    assign RD = IR[15:11];
    assign Imm = IR[15:0];
    assign SHAMT = IR[10:6];
    assign JAddr = IR[25:0];
    assign op = IR[31:26];
    assign funct = IR[5:0];
    assign JADDR = {PCP[31:26],JAddr};
    
    Reg_En #(.WL(32))
            RE0 (.clk(mCLK), .en(PCEn), .rst(RST), .in(PCP), .out(PCOUT));
    mux_21 #(.WL(32))
            IDSelO (.Sel(IDSel), .A(PCOUT), .B(ALUOUTR), .Out(ADR));
    Memory #(.WL(32), .WD(128))
            MEM0 (.clk(mCLK), .mwe(DMWE), .rst(RST), .mra(ADR), .mwd(B), .mrd(MRD));
    Reg_En #(.WL(32))
            RE1 (.clk(mCLK), .en(IRWE), .rst(RST), .in(MRD), .out(IR));
    Reg    #(.WL(32))
            R1 (.clk(mCLK), .rst(RST), .in(MRD), .out(DR));
    mux_21 #(.WL(32))
            M0 (.Sel(RFDSel), .A(RT), .B(RD), .Out(RFWA));
    mux_21 #(.WL(32))
            M1 (.Sel(MtoRFSel), .A(ALUOUTR), .B(DR), .Out(RFWD));
    RegisterFile 
            RF0 (.clk(mCLK), .rst(RST), .rfwe(RFWE), .RFRA1(RS), .RFRA2(RT), .RFWA(RFWA), 
                    .RFWD(RFWD), .RFRD1(RFRD1), .RFRD2(RFRD2));
    Reg    #(.WL(32))
            R2 (.clk(mCLK), .rst(RST), .in(RFRD1), .out(A));
    Reg    #(.WL(32))
            R3 (.clk(mCLK), .rst(RST), .in(RFRD2), .out(B));
    mux_21 #(.WL(32))
            M2 (.Sel(ALUIn1Sel), .A(PCOUT), .B(A), .Out(ALUIn1));
    SImm 
            SI0 (.a(Imm), .signImm(SImm));
    mux_31 #(.WL(32))
            ALUM1 (.Sel(ALUIn2Sel), .A(B), .B(1), .C(SImm), .Out(ALUIn2));
    ALU 
            ALU0 (.SrcA(ALUIn1), .SrcB(ALUIn2), .ALUControl(ALUSel), .ZeroFlag(zero), 
                    .ALUResult(ALUOUT));
    And
            AND0 (.Branch(Branch), .Zero(zero), .Or(OR));
    Or
            OR0 (.pcwe(PCWE), .And(OR), .pcen(PCEn));
    Reg    #(.WL(32))
            R4 (.clk(mCLK), .rst(RST), .in(ALUOUT), .out(ALUOUTR));
    mux_31 #(.WL(32))
            PCS0 (.Sel(PCSel), .A(ALUOUT), .B(ALUOUTR), .C(JADDR), .Out(PCP));
endmodule
