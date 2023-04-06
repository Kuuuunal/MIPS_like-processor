`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2023 14:12:26
// Design Name: 
// Module Name: sign_extend_21bit
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


module sign_extend_21bit(
     input [20:0]in,
    output reg [31:0]out
    );
    always@(*) begin
        out[20:0] = in[20:0];
        out[31:21] = {11{in[20]}};
    end
endmodule
