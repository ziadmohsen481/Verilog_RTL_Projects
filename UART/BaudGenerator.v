`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2025 12:23:22 PM
// Design Name: 
// Module Name: BaudGenerator
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


module BaudGenerator #(parameter DVSOR=28)(
    input clk,
    input rst,
    output baud
    );
    localparam nbits=$clog2(DVSOR);
    reg [nbits-1:0]counter_reg;
    wire [nbits-1:0] counter_next;
    // state reg
    always@(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            counter_reg<=0;
        end
        else
            counter_reg <= counter_next;
    end
    //next state logic
    assign counter_next= (counter_reg==DVSOR)?  1'b0: counter_reg+1;
  assign baud=(counter_reg == DVSOR);
endmodule
