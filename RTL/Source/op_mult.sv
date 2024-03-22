// Project name: Filter
// Author: P. P. Kolbenkov
// File description: Decription of combinational logic for fixed-point multiplication blocks

`timescale 1 ns / 1 ns

module multa2
          (In2,
           In1,
           Out1);

  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [38:0] Out1;  // sfix39_En29

  wire signed [47:0] multa2_mul_temp;  // sfix48_En38

  assign multa2_mul_temp = In1 * In2;

  assign Out1 = multa2_mul_temp[47:9] + multa2_mul_temp[8];

endmodule  // multa2

module multa4
          (In2,
           In1,
           Out1);

  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [43:0] Out1;  // sfix44_En33

  wire signed [48:0] multa4_mul_temp;  // sfix49_En38

  assign multa4_mul_temp = In1 * In2;

  assign Out1 = multa4_mul_temp[48:5] + multa4_mul_temp[4];

endmodule  // multa4

module multa6
          (In2,
           In1,
           Out1);

  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [28:0] Out1;  // sfix29_En18

  wire signed [48:0] multa6_mul_temp;  // sfix49_En38

  assign multa6_mul_temp = In1 * In2;

  assign Out1 = multa6_mul_temp[48:20] + multa6_mul_temp[19];

endmodule  // multa6

module multa8
          (In2,
           In1,
           Out1);

  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [35:0] Out1;  // sfix36_En26

  wire signed [47:0] multa8_mul_temp;  // sfix48_En38

  assign multa8_mul_temp = In1 * In2;

  assign Out1 = multa8_mul_temp[47:12] + multa8_mul_temp[11];

endmodule  // multa8

module multa10
          (In2,
           In1,
           Out1);

  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [25:0] Out1;  // sfix26_En17

  wire signed [46:0] multa10_mul_temp;  // sfix47_En38

  assign multa10_mul_temp = In1 * In2;

  assign Out1 = multa10_mul_temp[46:21] + multa10_mul_temp[20];

endmodule  // multa10

module multa12
          (In2,
           In1,
           Out1);

  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [26:0] Out1;  // sfix27_En19

  wire signed [45:0] multa12_mul_temp;  // sfix46_En38

  assign multa12_mul_temp = In1 * In2;

  assign Out1 = multa12_mul_temp[45:19] + multa12_mul_temp[18];

endmodule  // multa12

module multb0
          (In2,
           In1,
           Out1);

  input   signed [11:0] In2;  // sfix12_En11
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [21:0] Out1;  // sfix22_En14

  wire signed [22:0] multb0_mul_temp;  // sfix23_En14

  assign multb0_mul_temp = In1 * In2;

  assign Out1 = multb0_mul_temp[21:0];

endmodule  // multb0_1

module multb2
          (In2,
           In1,
           Out1);

  input   signed [11:0] In2;  // sfix12_En11
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [20:0] Out1;  // sfix21_En13

  wire signed [22:0] multb2_mul_temp;  // sfix23_En14

  assign multb2_mul_temp = In1 * In2;

  assign Out1 = multb2_mul_temp[21:1] + multb2_mul_temp[0];

endmodule  // multb2_1

module multb4
          (In2,
           In1,
           Out1);

  input   signed [11:0] In2;  // sfix12_En11
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [20:0] Out1;  // sfix21_En13

  wire signed [22:0] multb4_mul_temp;  // sfix23_En14

  assign multb4_mul_temp = In1 * In2;

  assign Out1 = multb4_mul_temp[21:1] + multb4_mul_temp[0];

endmodule  // multb4_1

module multb6
          (In2,
           In1,
           Out1);

  input   signed [11:0] In2;  // sfix12_En11
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [19:0] Out1;  // sfix20_En12

  wire signed [22:0] multb6_mul_temp;  // sfix23_En14

  assign multb6_mul_temp = In1 * In2;

  assign Out1 = multb6_mul_temp[21:2] + multb6_mul_temp[1];

endmodule  // multb6