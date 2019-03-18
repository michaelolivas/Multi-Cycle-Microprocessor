`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2019 10:47:12 AM
// Design Name: 
// Module Name: tb_multi
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


module tb_multi;

   reg CLK, RST;

   TopLevel T1(.MCLK(CLK),.MRST(RST));
   
   initial CLK = 0;
   initial RST = 0;
   
   always begin
        #5 CLK = 1;
        #5 CLK = 0;
   end
   initial begin
       RST = 1;
       #5 RST = 0;
   end
   initial begin
       repeat(200)
       @(posedge CLK);

       $finish;
   end
endmodule

