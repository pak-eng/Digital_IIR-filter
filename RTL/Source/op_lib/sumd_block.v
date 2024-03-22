// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\sumd_block.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: sumd_block
// Source Path: FP_sub/fp model/IIR_section_2/sumd
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module sumd_block
          (In1,
           In2,
           Out1);


  input   signed [32:0] In1;  // sfix33_En22
  input   signed [27:0] In2;  // sfix28_En17
  output  signed [33:0] Out1;  // sfix34_En23


  wire signed [33:0] sumd_2_add_cast;  // sfix34_En22
  wire signed [33:0] sumd_2_add_cast_1;  // sfix34_En22
  wire signed [33:0] sumd_2_add_temp;  // sfix34_En22
  wire signed [33:0] sumd_2_out1;  // sfix34_En23


  assign sumd_2_add_cast = {In1[32], In1};
  assign sumd_2_add_cast_1 = {In2[27], {In2, 5'b00000}};
  assign sumd_2_add_temp = sumd_2_add_cast + sumd_2_add_cast_1;
  assign sumd_2_out1 = {sumd_2_add_temp[32:0], 1'b0};



  assign Out1 = sumd_2_out1;

endmodule  // sumd_block

