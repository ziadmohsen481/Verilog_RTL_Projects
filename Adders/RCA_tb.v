`timescale 1ns / 1ps

module RCA_tb();
parameter N=4;
reg [N-1:0]A,B;
reg Cin;
wire [N-1:0]S;
wire Cout;
RCA #(N) uut (.A(A),.B(B),.Cin(Cin),.S(S),.Cout(Cout));
initial 
begin
    // small numbers with no input carry
    A=4'b0001;      B=4'b0010; Cin=1'b0;
    #10;
    $display("A = %b, B= %b Cin= %b => Sum=%b, Carry=%b",A,B,Cin,S,Cout);
    #100;
    // with input carry
    A=4'b0111;      B=4'b0110; Cin=1'b1;
    #10;
    $display("A = %b, B= %b Cin= %b => Sum=%b, Carry=%b",A,B,Cin,S,Cout);
    #100;
    // Overflow case
    A=4'b1111;      B=4'b1111; Cin=1'b0;
    #10;
    $display("A = %b, B= %b Cin= %b => Sum=%b, Carry=%b",A,B,Cin,S,Cout);
     #10;
 $finish;
end
endmodule
