`timescale 1 ns / 1 ns

module multa2
          (In2,
           In1,
           Out1);

  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [38:0] Out1;  // sfix39_En29

  wire signed [50:0] multa2_mul_temp;  // sfix51_En38
  wire signed [38:0] multa2_out1;  // sfix39_En29

  assign multa2_mul_temp = In1 * In2;
  assign multa2_out1 = (((multa2_mul_temp[50] == 1'b0) && (multa2_mul_temp[49:47] != 3'b000)) || ((multa2_mul_temp[50] == 1'b0) && (multa2_mul_temp[47:9] == 39'sh3FFFFFFFFF)) ? 39'sh3FFFFFFFFF :
              ((multa2_mul_temp[50] == 1'b1) && (multa2_mul_temp[49:47] != 3'b111) ? 39'sh4000000000 :
              multa2_mul_temp[47:9] + $signed({1'b0, multa2_mul_temp[8]})));

  assign Out1 = multa2_out1;

endmodule  // multa2

module multa4
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

endmodule  // multa4

module multa6
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

endmodule  // multa6

module multa8
          (In2,
           In1,
           Out1);

  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [35:0] Out1;  // sfix36_En26

  wire signed [50:0] multa8_mul_temp;  // sfix51_En38
  wire signed [35:0] multa8_out1;  // sfix36_En26

  assign multa8_mul_temp = In1 * In2;
  assign multa8_out1 = (((multa8_mul_temp[50] == 1'b0) && (multa8_mul_temp[49:47] != 3'b000)) || ((multa8_mul_temp[50] == 1'b0) && (multa8_mul_temp[47:12] == 36'sh7FFFFFFFF)) ? 36'sh7FFFFFFFF :
              ((multa8_mul_temp[50] == 1'b1) && (multa8_mul_temp[49:47] != 3'b111) ? 36'sh800000000 :
              multa8_mul_temp[47:12] + $signed({1'b0, multa8_mul_temp[11]})));

  assign Out1 = multa8_out1;

endmodule  // multa8

module multa10
          (In2,
           In1,
           Out1);

  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [25:0] Out1;  // sfix26_En17

  wire signed [50:0] multa10_mul_temp;  // sfix51_En38
  wire signed [25:0] multa10_out1;  // sfix26_En17

  assign multa10_mul_temp = In1 * In2;
  assign multa10_out1 = (((multa10_mul_temp[50] == 1'b0) && (multa10_mul_temp[49:46] != 4'b0000)) || ((multa10_mul_temp[50] == 1'b0) && (multa10_mul_temp[46:21] == 26'sb01111111111111111111111111)) ? 26'sb01111111111111111111111111 :
              ((multa10_mul_temp[50] == 1'b1) && (multa10_mul_temp[49:46] != 4'b1111) ? 26'sb10000000000000000000000000 :
              multa10_mul_temp[46:21] + $signed({1'b0, multa10_mul_temp[20]})));

  assign Out1 = multa10_out1;

endmodule  // multa10

module multa12
          (In2,
           In1,
           Out1);

  input   signed [14:0] In2;  // sfix15_En11
  input   signed [35:0] In1;  // sfix36_En27
  output  signed [26:0] Out1;  // sfix27_En19

  wire signed [50:0] multa12_mul_temp;  // sfix51_En38
  wire signed [26:0] multa12_out1;  // sfix27_En19

  assign multa12_mul_temp = In1 * In2;
  assign multa12_out1 = (((multa12_mul_temp[50] == 1'b0) && (multa12_mul_temp[49:45] != 5'b00000)) || ((multa12_mul_temp[50] == 1'b0) && (multa12_mul_temp[45:19] == 27'sb011111111111111111111111111)) ? 27'sb011111111111111111111111111 :
              ((multa12_mul_temp[50] == 1'b1) && (multa12_mul_temp[49:45] != 5'b11111) ? 27'sb100000000000000000000000000 :
              multa12_mul_temp[45:19] + $signed({1'b0, multa12_mul_temp[18]})));

  assign Out1 = multa12_out1;

endmodule  // multa12

module multb0
          (In2,
           In1,
           Out1);

  input   signed [11:0] In2;  // sfix12_En11
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [21:0] Out1;  // sfix22_En14

  wire signed [22:0] multb0_mul_temp;  // sfix23_En14
  wire signed [21:0] multb0_out1;  // sfix22_En14

  assign multb0_mul_temp = In1 * In2;
  assign multb0_out1 = ((multb0_mul_temp[22] == 1'b0) && (multb0_mul_temp[21] != 1'b0) ? 22'sb0111111111111111111111 :
              ((multb0_mul_temp[22] == 1'b1) && (multb0_mul_temp[21] != 1'b1) ? 22'sb1000000000000000000000 :
              $signed(multb0_mul_temp[21:0])));

  assign Out1 = multb0_out1;

endmodule  // multb0_1

module multb2
          (In2,
           In1,
           Out1);

  input   signed [11:0] In2;  // sfix12_En11
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [20:0] Out1;  // sfix21_En13

  wire signed [22:0] multb2_mul_temp;  // sfix23_En14
  wire signed [20:0] multb2_out1;  // sfix21_En13

  assign multb2_mul_temp = In1 * In2;
  assign multb2_out1 = (((multb2_mul_temp[22] == 1'b0) && (multb2_mul_temp[21] != 1'b0)) || ((multb2_mul_temp[22] == 1'b0) && (multb2_mul_temp[21:1] == 21'sb011111111111111111111)) ? 21'sb011111111111111111111 :
              ((multb2_mul_temp[22] == 1'b1) && (multb2_mul_temp[21] != 1'b1) ? 21'sb100000000000000000000 :
              multb2_mul_temp[21:1] + $signed({1'b0, multb2_mul_temp[0]})));

  assign Out1 = multb2_out1;

endmodule  // multb2_1

module multb4
          (In2,
           In1,
           Out1);

  input   signed [11:0] In2;  // sfix12_En11
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [20:0] Out1;  // sfix21_En13

  wire signed [22:0] multb4_mul_temp;  // sfix23_En14
  wire signed [20:0] multb4_out1;  // sfix21_En13

  assign multb4_mul_temp = In1 * In2;
  assign multb4_out1 = (((multb4_mul_temp[22] == 1'b0) && (multb4_mul_temp[21] != 1'b0)) || ((multb4_mul_temp[22] == 1'b0) && (multb4_mul_temp[21:1] == 21'sb011111111111111111111)) ? 21'sb011111111111111111111 :
              ((multb4_mul_temp[22] == 1'b1) && (multb4_mul_temp[21] != 1'b1) ? 21'sb100000000000000000000 :
              multb4_mul_temp[21:1] + $signed({1'b0, multb4_mul_temp[0]})));

  assign Out1 = multb4_out1;

endmodule  // multb4_1

module multb6
          (In2,
           In1,
           Out1);

  input   signed [11:0] In2;  // sfix12_En11
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [19:0] Out1;  // sfix20_En12

  wire signed [22:0] multb6_mul_temp;  // sfix23_En14
  wire signed [19:0] multb6_out1;  // sfix20_En12

  assign multb6_mul_temp = In1 * In2;
  assign multb6_out1 = (((multb6_mul_temp[22] == 1'b0) && (multb6_mul_temp[21] != 1'b0)) || ((multb6_mul_temp[22] == 1'b0) && (multb6_mul_temp[21:2] == 20'sb01111111111111111111)) ? 20'sb01111111111111111111 :
              ((multb6_mul_temp[22] == 1'b1) && (multb6_mul_temp[21] != 1'b1) ? 20'sb10000000000000000000 :
              multb6_mul_temp[21:2] + $signed({1'b0, multb6_mul_temp[1]})));

  assign Out1 = multb6_out1;

endmodule  // multb6