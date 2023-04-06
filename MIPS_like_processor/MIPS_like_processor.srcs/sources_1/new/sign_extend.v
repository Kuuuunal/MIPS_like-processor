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
module sign_extend(
    input [4:0]in,
    output reg [31:0]out);
    
    always@(*) begin
        out[4:0] = in[4:0];
        out[31:5] = {27{in[4]}};
    end
endmodule    