`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2023 19:51:20
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [5:0] opcode,
    input [5:0] func,
    output reg Inst_Type,
    output reg ALU_Src,
    output reg [3:0]ALU_cntl,
    output reg RegWrite =1
    );
        always@(*) begin
        if(opcode[0]==0) begin
            Inst_Type = 1;  //
            ALU_Src = 0; //reg data RD2 is taken in 
            
            case (func)
            6'b100000: ALU_cntl = 2;
            6'b100010: ALU_cntl = 4;
            6'b100100: ALU_cntl = 0;
            6'b100101: ALU_cntl = 1;
            6'b000000:begin ALU_cntl = 3;ALU_Src = 1;end
            6'b000010:begin ALU_cntl = 5;ALU_Src = 1;end
            
            endcase 
            
        end
        else if(opcode[0] ==1)begin
            Inst_Type = 0;
//            ALU_Src = 1;
            ALU_cntl =7;  
        end    
    end
endmodule
