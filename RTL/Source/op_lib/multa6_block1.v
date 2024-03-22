// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\multa6_block1.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: multa6_block1
// Source Path: FP_sub/fp model/IIR_section_3/multa6
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module multa6_block1
          (In2,
           In1,
           Out1);


  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [28:0] Out1;  // sfix29_En18


  wire signed [50:0] multa6_mul_temp;  // sfix51_En38
  wire signed [28:0] multa6_out1;  // sfix29_En18


  assign multa6_mul_temp = In1 * In2;
  assign multa6_out1 = (((multa6_mul_temp[50] == 1'b0) && (multa6_mul_temp[49:48] != 2'b00)) || ((multa6_mul_temp[50] == 1'b0) && (multa6_mul_temp[48:20] == 29'sb01111111111111111111111111111)) ? 29'sb01111111111111111111111111111 :
              ((multa6_mul_temp[50] == 1'b1) && (multa6_mul_temp[49:48] != 2'b11) ? 29'sb10000000000000000000000000000 :
              multa6_mul_temp[48:20] + $signed({1'b0, multa6_mul_temp[19]})));



  assign Out1 = multa6_out1;

endmodule  // multa6_block1

