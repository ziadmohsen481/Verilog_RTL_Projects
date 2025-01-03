`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2025 08:39:30 AM
// Design Name: 
// Module Name: CLA_tb
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


module CLA_tb();
parameter N=16;
reg [N-1:0]A,B;
reg Cin;
wire [N-1:0]S;
wire Cout;
CLA #(N) uut (.A(A),.B(B),.Cin(Cin),.S(S),.Cout(Cout));
initial 
begin
    // small numbers with no input carry
    A=16'd1;      B=16'd2; Cin=1'b0;
    #10;
    $display("A = %d, B= %d Cin= %d => Sum=%d, Carry=%d",A,B,Cin,S,Cout);
    #100;
    // with input carry
    A=16'd5;      B=16'd4; Cin=1'b1;;
    #10;
    $display("A = %d, B= %d Cin= %d => Sum=%d, Carry=%d",A,B,Cin,S,Cout);
    #100;
    // Overflow case
    A=16'hffff;      B=16'hffff; Cin=1'b0;
    #10;
    $display("A = %d, B= %d Cin= %d => Sum=%d, Carry=%d",A,B,Cin,S,Cout);
     #10;
     $stop;
end
endmodule
