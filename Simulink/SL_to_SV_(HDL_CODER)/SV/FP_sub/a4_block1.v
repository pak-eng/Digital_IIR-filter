// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\a4_block1.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: a4_block1
// Source Path: FP_sub/fp model/IIR_section_3/a4
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module a4_block1
          (c);


  output  signed [14:0] c;  // sfix15_En11


  wire signed [14:0] a4_out1;  // sfix15_En11


  assign a4_out1 = 15'sb101010001011010;



  assign c = a4_out1;

endmodule  // a4_block1

