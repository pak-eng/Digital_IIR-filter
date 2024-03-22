// Project name: Filter
// Author: P. P. Kolbenkov
// File description: Decription of combinational logic for fixed-point accumulator blocks

`timescale 1 ns / 1 ns

module sumin
          (In1,
           In2,
           Out1);

  input   signed [21:0] In1;  // sfix22_En14
  input   signed [38:0] In2;  // sfix39_En28
  output  signed [35:0] Out1;  // sfix36_En27

  wire signed [35:0] sumin_add_cast1;  // sfix36_En27
  wire signed [35:0] sumin_add_cast2;  // sfix36_En27

  assign sumin_add_cast1 = {In1[21], In1, 13'b0};
  assign sumin_add_cast2 = In2[36:1] + In2[0];

  assign Out1 = sumin_add_cast1 + sumin_add_cast2;

endmodule  // sumin

module sumq
          (In2,
           In1,
           Out1);

  input   signed [33:0] In2;  // sfix34_En23
  input   signed [41:0] In1;  // sfix42_En31
  output  signed [38:0] Out1;  // sfix39_En28

  wire signed [38:0] sumq_1_add_cast1;  // sfix39_En28
  wire signed [38:0] sumq_1_add_cast2;  // sfix39_En28

  assign sumq_1_add_cast1 = In1[41:3] + In1[2];
  assign sumq_1_add_cast2 = {In2, 5'b00000};
  assign Out1 = sumq_1_add_cast1 + sumq_1_add_cast2;

endmodule  // sumq

module sumd
          (In1,
           In2,
           Out1);

  input   signed [32:0] In1;  // sfix33_En22
  input   signed [27:0] In2;  // sfix28_En17
  output  signed [33:0] Out1;  // sfix34_En23

  assign Out1 = {In1 + {In2, 5'b00000}, 1'b0};

endmodule  // sumd

module suma2
          (In2,
           In1,
           Out1);

  input   signed [38:0] In2;  // sfix39_En29
  input   signed [35:0] In1;  // sfix36_En26
  output  signed [32:0] Out1;  // sfix33_En22

  wire signed [32:0] suma2_add_cast1;  // sfix33_En22
  wire signed [32:0] suma2_add_cast2;  // sfix33_En22

  assign suma2_add_cast1 = {In1[35], In1[35:4]} + In1[3];
  assign suma2_add_cast2 = {In2[38], In2[38:7]} + In2[6];
  assign Out1 = suma2_add_cast1 + suma2_add_cast2;

endmodule  // suma2

module suma4
          (In1,
           In2,
           Out1);

  input   signed [43:0] In1;  // sfix44_En33
  input   signed [25:0] In2;  // sfix26_En17
  output  signed [41:0] Out1;  // sfix42_En31

  wire signed [41:0] suma4_add_cast1;  // sfix42_En31
  wire signed [41:0] suma4_add_cast2;  // sfix42_En31

  assign suma4_add_cast1 = In1[43:2] + In1[1];
  assign suma4_add_cast2 = {{2{In2[25]}}, {In2, 14'b00000000000000}};

  assign Out1 = suma4_add_cast1 + suma4_add_cast2;

endmodule  // suma4

module suma6
          (In1,
           In2,
           Out1);

  input   signed [28:0] In1;  // sfix29_En18
  input   signed [26:0] In2;  // sfix27_En19
  output  signed [27:0] Out1;  // sfix28_En17

  wire signed [29:0] suma6_add_cast1;  // sfix30_En19
  wire signed [29:0] suma6_add_cast2;  // sfix30_En19
  wire signed [29:0] suma6_add_temp;  // sfix30_En19

  assign suma6_add_cast1 = {In1, 1'b0};
  assign suma6_add_cast2 = {{3{In2[26]}}, In2};
  assign suma6_add_temp = suma6_add_cast1 + suma6_add_cast2;

  assign Out1 = suma6_add_temp[29:2] + suma6_add_temp[1];

endmodule  // suma6

module sumb2
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [20:0] In1;  // sfix21_En13
  output  signed [21:0] Out1;  // sfix22_En14

  assign Out1 = {In1, 1'b0} + In2;

endmodule  // sumb2_1

module sumb4
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [20:0] In1;  // sfix21_En13
  output  signed [21:0] Out1;  // sfix22_En14

  assign Out1 = {In1, 1'b0} + In2;

endmodule  // sumb4_1

module sumb6
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [19:0] In1;  // sfix20_En12
  output  signed [21:0] Out1;  // sfix22_En14

  assign Out1 = {In1, 2'b00} + In2;

endmodule  // sumb6_1

module sumb8
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [20:0] In1;  // sfix21_En13
  output  signed [21:0] Out1;  // sfix22_En14

  assign Out1 = {In1, 1'b0} + In2;

endmodule  // sumb8_1

module sumb10
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [20:0] In1;  // sfix21_En13
  output  signed [21:0] Out1;  // sfix22_En14

  assign Out1 = {In1, 1'b0} + In2;

endmodule  // sumb10_1

module sumb12
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [21:0] In1;  // sfix22_En14
  output  signed [21:0] Out1;  // sfix22_En14
  
  assign Out1 = In1 + In2;

endmodule  // sumb12_1