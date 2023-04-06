`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2023 23:54:08
// Design Name: 
// Module Name: tb_MIPS_like_processor
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


module tb_MIPS_like_processor(
    );
    reg clk;
    reg reset;
    wire z;
datapath dut (.clk(clk),.reset(reset),.z(z));
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial begin 
        reset =0;
        #5 reset = 1;
        #175 $finish;
    end
endmodule
