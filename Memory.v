`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 04:04:23 PM
// Design Name: 
// Module Name: Memory
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


module Memory #(parameter WL = 1, WD = 1)
                (input clk, mwe, rst,
                input signed [WL-1:0] mra,
                input signed [WL-1:0] mwd,
                    output signed [WL-1:0] mrd);
                
    reg [WL-1:0] mem [WD-1:0];
    
    initial begin 
        $readmemb("memory.mem", mem);
    end
    
    always @(posedge clk) begin
        if (mwe) mem[mra] = mwd;
    end
    assign mrd = mem[mra];
endmodule
