`timescale 1ns / 1ps
module RCA #(parameter N=4)(
    input [N-1:0] A,
    input [N-1:0] B,
    input Cin,
    output [N-1:0]S,
    output Cout
    );
    wire [N-1:0]carry;
    genvar i;
    generate 
        for(i=0; i<N; i=i+1)
        begin
            if(i==0)
                PG_UNIT U ( .a(A[0]),
                            .b(B[0]),
                            .cin(Cin),
                            .sum(S[0]),
                            .carry(carry[0])
                           ); 
            else
                PG_UNIT U ( .a(A[i]),
                            .b(B[i]),
                            .cin(carry[i-1]),
                            .sum(S[i]),
                            .carry(carry[i])
                           ); 
        end
        
    endgenerate
    /////////////Carry out Logic///////////////////
    assign Cout=carry[N-1];
endmodule
/////////////////////////
module PG_UNIT(
input a,
input b,
input cin,
output sum,
output carry
);
wire P,G;
assign P=a^b; // Propagate Signal
assign G=a&b; // Generate Signal
assign sum=P^cin;
assign carry=G|(P&cin);
endmodule
