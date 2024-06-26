// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\suma6_block1.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: suma6_block1
// Source Path: FP_sub/fp model/IIR_section_3/suma6
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module suma6_block1
          (In1,
           In2,
           Out1);


  input   signed [28:0] In1;  // sfix29_En18
  input   signed [26:0] In2;  // sfix27_En19
  output  signed [27:0] Out1;  // sfix28_En17


  wire signed [31:0] suma6_add_cast;  // sfix32_En19
  wire signed [31:0] suma6_add_cast_1;  // sfix32_En19
  wire signed [31:0] suma6_add_temp;  // sfix32_En19
  wire signed [27:0] suma6_out1;  // sfix28_En17


  assign suma6_add_cast = {{2{In1[28]}}, {In1, 1'b0}};
  assign suma6_add_cast_1 = {{5{In2[26]}}, In2};
  assign suma6_add_temp = suma6_add_cast + suma6_add_cast_1;
  assign suma6_out1 = (((suma6_add_temp[31] == 1'b0) && (suma6_add_temp[30:29] != 2'b00)) || ((suma6_add_temp[31] == 1'b0) && (suma6_add_temp[29:2] == 28'sb0111111111111111111111111111)) ? 28'sb0111111111111111111111111111 :
              ((suma6_add_temp[31] == 1'b1) && (suma6_add_temp[30:29] != 2'b11) ? 28'sb1000000000000000000000000000 :
              suma6_add_temp[29:2] + $signed({1'b0, suma6_add_temp[1]})));



  assign Out1 = suma6_out1;

endmodule  // suma6_block1

