// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\a12_block1.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: a12_block1
// Source Path: FP_sub/fp model/IIR_section_3/a12
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module a12_block1
          (c);


  output  signed [14:0] c;  // sfix15_En11


  wire signed [14:0] a12_out1;  // sfix15_En11


  assign a12_out1 = 15'sb111111001100000;



  assign c = a12_out1;

endmodule  // a12_block1

