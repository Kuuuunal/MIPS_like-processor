`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2023 16:13:02
// Design Name: 
// Module Name: ALU_6op
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

module alu_6op(
output reg [31:0]out,z=0,
input [31:0]in1, [31:0]in2, [3:0]cntl

    );
parameter s0 = 4'b0000, s1 = 4'b0001, s2 = 4'b0010, s3 = 4'b0100,s4 =4'b1000
,s5= 4'b0011, s6= 4'b0101, s7 = 4'b0111;
always@(*)
begin 
//if(out ==0) assign z =1;
//assign z=0;
case (cntl)
s0: out = in1 & in2;   
s1: out = in1 |in2;
s2: out = in1 +in2;
s3: out = in1 -in2;
s4: out =(in1<in2)? 1:0;
s5: out =(in1<<in2);
s6: out =(in1>>in2);
s7: out = in1;
default:;
endcase
 z =(out)? 0:1;


end
endmodule
