`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2025 12:43:14 PM
// Design Name: 
// Module Name: Baud_tb
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


module Baud_tb(

    );
    reg clk,rst;
    wire baud;
    BaudGenerator #(28) uut  (.clk(clk),.rst(rst),.baud(baud));
    initial 
begin
clk=1'b0;
// 10 clock cycles of 10ns
repeat(60)
    #5 clk=~clk;
$stop;
end
// stimulus
initial 
begin
rst=1;
#10;
rst=1'b0;
end
endmodule
