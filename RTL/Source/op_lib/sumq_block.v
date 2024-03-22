// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\sumq_block.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: sumq_block
// Source Path: FP_sub/fp model/IIR_section_2/sumq
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module sumq_block
          (In2,
           In1,
           Out1);


  input   signed [33:0] In2;  // sfix34_En23
  input   signed [41:0] In1;  // sfix42_En31
  output  signed [38:0] Out1;  // sfix39_En28


  wire signed [38:0] sumq_1_add_cast;  // sfix39_En28
  wire signed [39:0] sumq_1_add_cast_1;  // sfix40_En28
  wire signed [39:0] sumq_1_add_cast_2;  // sfix40_En28
  wire signed [39:0] sumq_1_add_temp;  // sfix40_En28
  wire signed [38:0] sumq_1_out1;  // sfix39_En28


  assign sumq_1_add_cast = ((In1[41] == 1'b0) && (In1[40:3] == 38'h3FFFFFFFFF) ? 39'sh3FFFFFFFFF :
              In1[41:3] + $signed({1'b0, In1[2]}));
  assign sumq_1_add_cast_1 = {sumq_1_add_cast[38], sumq_1_add_cast};
  assign sumq_1_add_cast_2 = {In2[33], {In2, 5'b00000}};
  assign sumq_1_add_temp = sumq_1_add_cast_1 + sumq_1_add_cast_2;
  assign sumq_1_out1 = ((sumq_1_add_temp[39] == 1'b0) && (sumq_1_add_temp[38] != 1'b0) ? 39'sh3FFFFFFFFF :
              ((sumq_1_add_temp[39] == 1'b1) && (sumq_1_add_temp[38] != 1'b1) ? 39'sh4000000000 :
              $signed(sumq_1_add_temp[38:0])));



  assign Out1 = sumq_1_out1;

endmodule  // sumq_block

