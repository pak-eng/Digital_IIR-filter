// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\multb4_2_block.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: multb4_2_block
// Source Path: FP_sub/fp model/FIR_section_2/multb4_2
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module multb4_2_block
          (In2,
           In1,
           Out1);


  input   signed [11:0] In2;  // sfix12_En11
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [20:0] Out1;  // sfix21_En13


  wire signed [22:0] multb4_mul_temp;  // sfix23_En14
  wire signed [20:0] multb4_out1;  // sfix21_En13


  assign multb4_mul_temp = In1 * In2;
  assign multb4_out1 = (((multb4_mul_temp[22] == 1'b0) && (multb4_mul_temp[21] != 1'b0)) || ((multb4_mul_temp[22] == 1'b0) && (multb4_mul_temp[21:1] == 21'sb011111111111111111111)) ? 21'sb011111111111111111111 :
              ((multb4_mul_temp[22] == 1'b1) && (multb4_mul_temp[21] != 1'b1) ? 21'sb100000000000000000000 :
              multb4_mul_temp[21:1] + $signed({1'b0, multb4_mul_temp[0]})));



  assign Out1 = multb4_out1;

endmodule  // multb4_2_block

