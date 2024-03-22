// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\sumin.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: sumin
// Source Path: FP_sub/fp model/IIR_section_1/sumin
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module sumin
          (In1,
           In2,
           Out1);


  input   signed [21:0] In1;  // sfix22_En14
  input   signed [38:0] In2;  // sfix39_En28
  output  signed [35:0] Out1;  // sfix36_En27


  wire signed [35:0] sumin_add_cast;  // sfix36_En27
  wire signed [36:0] sumin_add_cast_1;  // sfix37_En27
  wire signed [35:0] sumin_add_cast_2;  // sfix36_En27
  wire signed [36:0] sumin_add_cast_3;  // sfix37_En27
  wire signed [36:0] sumin_add_temp;  // sfix37_En27
  wire signed [35:0] sumin_out1;  // sfix36_En27


  assign sumin_add_cast = {In1[21], {In1, 13'b0000000000000}};
  assign sumin_add_cast_1 = {sumin_add_cast[35], sumin_add_cast};
  assign sumin_add_cast_2 = (((In2[38] == 1'b0) && (In2[37:36] != 2'b00)) || ((In2[38] == 1'b0) && (In2[36:1] == 36'sh7FFFFFFFF)) ? 36'sh7FFFFFFFF :
              ((In2[38] == 1'b1) && (In2[37:36] != 2'b11) ? 36'sh800000000 :
              In2[36:1] + $signed({1'b0, In2[0]})));
  assign sumin_add_cast_3 = {sumin_add_cast_2[35], sumin_add_cast_2};
  assign sumin_add_temp = sumin_add_cast_1 + sumin_add_cast_3;
  assign sumin_out1 = ((sumin_add_temp[36] == 1'b0) && (sumin_add_temp[35] != 1'b0) ? 36'sh7FFFFFFFF :
              ((sumin_add_temp[36] == 1'b1) && (sumin_add_temp[35] != 1'b1) ? 36'sh800000000 :
              $signed(sumin_add_temp[35:0])));



  assign Out1 = sumin_out1;

endmodule  // sumin

