// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\b6_block.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: b6_block
// Source Path: FP_sub/fp model/FIR_section_2/b6
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module b6_block
          (c);


  output  signed [11:0] c;  // sfix12_En11


  wire signed [11:0] b6_out1;  // sfix12_En11


  assign b6_out1 = 12'sb111111010100;



  assign c = b6_out1;

endmodule  // b6_block

