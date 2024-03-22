// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\multa4_block.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: multa4_block
// Source Path: FP_sub/fp model/IIR_section_2/multa4
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module multa4_block
          (In2,
           In1,
           Out1);


  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [43:0] Out1;  // sfix44_En33


  wire signed [50:0] multa4_mul_temp;  // sfix51_En38
  wire signed [43:0] multa4_out1;  // sfix44_En33


  assign multa4_mul_temp = In1 * In2;
  assign multa4_out1 = (((multa4_mul_temp[50] == 1'b0) && (multa4_mul_temp[49:48] != 2'b00)) || ((multa4_mul_temp[50] == 1'b0) && (multa4_mul_temp[48:5] == 44'sh7FFFFFFFFFF)) ? 44'sh7FFFFFFFFFF :
              ((multa4_mul_temp[50] == 1'b1) && (multa4_mul_temp[49:48] != 2'b11) ? 44'sh80000000000 :
              multa4_mul_temp[48:5] + $signed({1'b0, multa4_mul_temp[4]})));



  assign Out1 = multa4_out1;

endmodule  // multa4_block

