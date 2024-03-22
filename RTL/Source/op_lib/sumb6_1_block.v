// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\sumb6_1_block.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: sumb6_1_block
// Source Path: FP_sub/fp model/FIR_section_2/sumb6_1
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module sumb6_1_block
          (In2,
           In1,
           Out1);


  input   signed [21:0] In2;  // sfix22_En14
  input   signed [19:0] In1;  // sfix20_En12
  output  signed [21:0] Out1;  // sfix22_En14


  wire signed [31:0] sumb6_add_cast;  // sfix32_En14
  wire signed [31:0] sumb6_add_cast_1;  // sfix32_En14
  wire signed [31:0] sumb6_add_temp;  // sfix32_En14
  wire signed [21:0] sumb6_out1;  // sfix22_En14


  assign sumb6_add_cast = {{10{In1[19]}}, {In1, 2'b00}};
  assign sumb6_add_cast_1 = {{10{In2[21]}}, In2};
  assign sumb6_add_temp = sumb6_add_cast + sumb6_add_cast_1;
  assign sumb6_out1 = ((sumb6_add_temp[31] == 1'b0) && (sumb6_add_temp[30:21] != 10'b0000000000) ? 22'sb0111111111111111111111 :
              ((sumb6_add_temp[31] == 1'b1) && (sumb6_add_temp[30:21] != 10'b1111111111) ? 22'sb1000000000000000000000 :
              $signed(sumb6_add_temp[21:0])));



  assign Out1 = sumb6_out1;

endmodule  // sumb6_1_block

