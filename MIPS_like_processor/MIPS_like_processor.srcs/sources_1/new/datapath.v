`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2023 10:04:49
// Design Name: 
// Module Name: partial_datapath
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


module datapath(
    /*input [4:0] Read_Reg_Num_1,
    input [4:0] Read_Reg_Num_2,
    input [4:0] Write_Reg,
    input [3:0] ALU_CNTL,*/
    input clk,
    input reset,
    output z
    );
    
   // wire [31:0] Write_Data;
    wire [31:0] Read_Data_1;
    wire [31:0] Read_Data_2;
    wire Reg_Write;
   // reg [31:0]in1;reg[31:0]in2;
    wire [31:0]alu_out;
    
        wire ALU_Src;
    wire [3:0]ALU_cntl;
    wire Inst_Type;
    wire [31:0]IC;
    
//    wire shamt;
    wire [31:0]shamt_s_ex; 
    wire [31:0]mux_inst;
    wire [31:0]mux_shift;  
    wire [31:0]li_data;
    reg_file r1 (.clk(clk)
                 ,.Read_Reg_Num_1(IC[15:11])
                 ,.Read_Reg_Num_2(IC[20:16])
                 ,.Write_Reg_Num(IC[25:21])
                 ,.Read_Data_1(Read_Data_1)
                 ,.Read_Data_2(Read_Data_2)
                 ,.reset(reset)
                 ,.RegWrite(Reg_Write)
                 ,.Write_Data(mux_inst)
                 );
    alu_6op alu (.out(alu_out)
                 ,.z(z)
                 ,.in1(Read_Data_1)
                 ,.in2(mux_shift)
                 ,.cntl(ALU_cntl));

    control_unit c1 (.Inst_Type(Inst_Type)
                     ,.ALU_Src(ALU_Src)
                     ,.ALU_cntl(ALU_cntl)
                     ,.opcode(IC[31:26])
                     ,.func(IC[5:0])
                     ,.RegWrite(Reg_Write)
                     ); 
    Inst_fetch i_fetch(.clk(clk)
                       ,.reset(reset)
                       ,.Instruction_Code(IC));
                 
    sign_extend se1 (.in(IC[10:6])
                ,.out(shamt_s_ex));
    sign_extend_21bit se2 (.in(IC[20:0])
                    ,.out(li_data));

//    initial begin   
    assign    mux_inst = (Inst_Type)?alu_out: li_data;
    assign    mux_shift = (ALU_Src)?shamt_s_ex: Read_Data_2; 
//    end                                 
                 
endmodule
