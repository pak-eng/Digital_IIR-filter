// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\multb6_block.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: multb6_block
// Source Path: FP_sub/fp model/FIR_section_2/multb6
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module multb6_block
          (In2,
           In1,
           Out1);


  input   signed [11:0] In2;  // sfix12_En11
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [19:0] Out1;  // sfix20_En12


  wire signed [22:0] multb6_mul_temp;  // sfix23_En14
  wire signed [19:0] multb6_out1;  // sfix20_En12


  assign multb6_mul_temp = In1 * In2;
  assign multb6_out1 = (((multb6_mul_temp[22] == 1'b0) && (multb6_mul_temp[21] != 1'b0)) || ((multb6_mul_temp[22] == 1'b0) && (multb6_mul_temp[21:2] == 20'sb01111111111111111111)) ? 20'sb01111111111111111111 :
              ((multb6_mul_temp[22] == 1'b1) && (multb6_mul_temp[21] != 1'b1) ? 20'sb10000000000000000000 :
              multb6_mul_temp[21:2] + $signed({1'b0, multb6_mul_temp[1]})));



  assign Out1 = multb6_out1;

endmodule  // multb6_block

