`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2025 05:08:19 PM
// Design Name: 
// Module Name: CLA
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


module CLA #(parameter N=16)(
    input [N-1:0] A,
    input [N-1:0] B,
    input Cin,
    output [N-1:0]S,
    output Cout
    );
    wire C1,C2,C3;
    cla4 U1(.a(A[3:0]),.b(B[3:0]),.cin(Cin),.sum(S[3:0]),.cout(C1));
    cla4 U2(.a(A[7:4]),.b(B[7:4]),.cin(C1),.sum(S[7:4]),.cout(C2));
    cla4 U3(.a(A[11:8]),.b(B[11:8]),.cin(C2),.sum(S[11:8]),.cout(C3));
    cla4 U4(.a(A[15:12]),.b(B[15:12]),.cin(C3),.sum(S[15:12]),.cout(Cout));
endmodule
/////////////////////////
module cla4(
input [3:0]a,
input [3:0]b,
input cin,
output [3:0]sum,
output cout
);
wire [3:0]P,G,C;
assign P=a^b; // Propagate Signal
assign G=a&b; // Generate Signal
assign sum=P^C;
assign C[0]=cin;
assign C[1]=G[0]|P[0]&C[0];
assign C[2]=G[1]|G[0]&P[0]|P[0]&P[1]&C[0];
assign C[3]=G[2]|P[2]&G[1]|G[0]&P[1]&P[2]|P[0]&P[1]&P[2]&C[0];
assign cout=G[3] | P[3]&G[2] | P[3]&P[2]&G[1] | G[0]&P[1]&P[2]&P[3] | P[0]&P[1]&P[2]&P[3]&C[0];

endmodule
