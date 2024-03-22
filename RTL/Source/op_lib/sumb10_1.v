// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\sumb10_1.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: sumb10_1
// Source Path: FP_sub/fp model/FIR_section_1/sumb10_1
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module sumb10_1
          (In2,
           In1,
           Out1);


  input   signed [21:0] In2;  // sfix22_En14
  input   signed [20:0] In1;  // sfix21_En13
  output  signed [21:0] Out1;  // sfix22_En14


  wire signed [31:0] sumb10_add_cast;  // sfix32_En14
  wire signed [31:0] sumb10_add_cast_1;  // sfix32_En14
  wire signed [31:0] sumb10_add_temp;  // sfix32_En14
  wire signed [21:0] sumb10_out1;  // sfix22_En14


  assign sumb10_add_cast = {{10{In1[20]}}, {In1, 1'b0}};
  assign sumb10_add_cast_1 = {{10{In2[21]}}, In2};
  assign sumb10_add_temp = sumb10_add_cast + sumb10_add_cast_1;
  assign sumb10_out1 = ((sumb10_add_temp[31] == 1'b0) && (sumb10_add_temp[30:21] != 10'b0000000000) ? 22'sb0111111111111111111111 :
              ((sumb10_add_temp[31] == 1'b1) && (sumb10_add_temp[30:21] != 10'b1111111111) ? 22'sb1000000000000000000000 :
              $signed(sumb10_add_temp[21:0])));



  assign Out1 = sumb10_out1;

endmodule  // sumb10_1

