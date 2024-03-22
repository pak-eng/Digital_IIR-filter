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

module sumq
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

endmodule  // sumq

module sumd
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

endmodule  // sumd

module suma2
          (In2,
           In1,
           Out1);

  input   signed [38:0] In2;  // sfix39_En29
  input   signed [35:0] In1;  // sfix36_En26
  output  signed [32:0] Out1;  // sfix33_En22

  wire signed [32:0] suma2_add_cast;  // sfix33_En22
  wire signed [32:0] suma2_add_cast_1;  // sfix33_En22
  wire signed [32:0] suma2_out1;  // sfix33_En22

  assign suma2_add_cast = ({In1[35], In1[35:4]}) + $signed({1'b0, In1[3]});
  assign suma2_add_cast_1 = ({In2[38], In2[38:7]}) + $signed({1'b0, In2[6]});
  assign suma2_out1 = suma2_add_cast + suma2_add_cast_1;

  assign Out1 = suma2_out1;

endmodule  // suma2

module suma4
          (In1,
           In2,
           Out1);

  input   signed [43:0] In1;  // sfix44_En33
  input   signed [25:0] In2;  // sfix26_En17
  output  signed [41:0] Out1;  // sfix42_En31

  wire signed [41:0] suma4_add_cast;  // sfix42_En31
  wire signed [42:0] suma4_add_cast_1;  // sfix43_En31
  wire signed [41:0] suma4_add_cast_2;  // sfix42_En31
  wire signed [42:0] suma4_add_cast_3;  // sfix43_En31
  wire signed [42:0] suma4_add_temp;  // sfix43_En31
  wire signed [41:0] suma4_out1;  // sfix42_En31

  assign suma4_add_cast = ((In1[43] == 1'b0) && (In1[42:2] == 41'h1FFFFFFFFFF) ? 42'sh1FFFFFFFFFF :
              In1[43:2] + $signed({1'b0, In1[1]}));
  assign suma4_add_cast_1 = {suma4_add_cast[41], suma4_add_cast};
  assign suma4_add_cast_2 = {{2{In2[25]}}, {In2, 14'b00000000000000}};
  assign suma4_add_cast_3 = {suma4_add_cast_2[41], suma4_add_cast_2};
  assign suma4_add_temp = suma4_add_cast_1 + suma4_add_cast_3;
  assign suma4_out1 = ((suma4_add_temp[42] == 1'b0) && (suma4_add_temp[41] != 1'b0) ? 42'sh1FFFFFFFFFF :
              ((suma4_add_temp[42] == 1'b1) && (suma4_add_temp[41] != 1'b1) ? 42'sh20000000000 :
              $signed(suma4_add_temp[41:0])));

  assign Out1 = suma4_out1;

endmodule  // suma4

module suma6
          (In1,
           In2,
           Out1);

  input   signed [28:0] In1;  // sfix29_En18
  input   signed [26:0] In2;  // sfix27_En19
  output  signed [27:0] Out1;  // sfix28_En17

  wire signed [31:0] suma6_add_cast;  // sfix32_En19
  wire signed [31:0] suma6_add_cast_1;  // sfix32_En19
  wire signed [31:0] suma6_add_temp;  // sfix32_En19
  wire signed [27:0] suma6_out1;  // sfix28_En17

  assign suma6_add_cast = {{2{In1[28]}}, {In1, 1'b0}};
  assign suma6_add_cast_1 = {{5{In2[26]}}, In2};
  assign suma6_add_temp = suma6_add_cast + suma6_add_cast_1;
  assign suma6_out1 = (((suma6_add_temp[31] == 1'b0) && (suma6_add_temp[30:29] != 2'b00)) || ((suma6_add_temp[31] == 1'b0) && (suma6_add_temp[29:2] == 28'sb0111111111111111111111111111)) ? 28'sb0111111111111111111111111111 :
              ((suma6_add_temp[31] == 1'b1) && (suma6_add_temp[30:29] != 2'b11) ? 28'sb1000000000000000000000000000 :
              suma6_add_temp[29:2] + $signed({1'b0, suma6_add_temp[1]})));

  assign Out1 = suma6_out1;

endmodule  // suma6

module sumb2
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [20:0] In1;  // sfix21_En13
  output  signed [21:0] Out1;  // sfix22_En14

  wire signed [31:0] sumb2_add_cast;  // sfix32_En14
  wire signed [31:0] sumb2_add_cast_1;  // sfix32_En14
  wire signed [31:0] sumb2_add_temp;  // sfix32_En14
  wire signed [21:0] sumb2_out1;  // sfix22_En14

  assign sumb2_add_cast = {{10{In1[20]}}, {In1, 1'b0}};
  assign sumb2_add_cast_1 = {{10{In2[21]}}, In2};
  assign sumb2_add_temp = sumb2_add_cast + sumb2_add_cast_1;
  assign sumb2_out1 = ((sumb2_add_temp[31] == 1'b0) && (sumb2_add_temp[30:21] != 10'b0000000000) ? 22'sb0111111111111111111111 :
              ((sumb2_add_temp[31] == 1'b1) && (sumb2_add_temp[30:21] != 10'b1111111111) ? 22'sb1000000000000000000000 :
              $signed(sumb2_add_temp[21:0])));

  assign Out1 = sumb2_out1;

endmodule  // sumb2_1

module sumb4
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [20:0] In1;  // sfix21_En13
  output  signed [21:0] Out1;  // sfix22_En14

  wire signed [31:0] sumb4_add_cast;  // sfix32_En14
  wire signed [31:0] sumb4_add_cast_1;  // sfix32_En14
  wire signed [31:0] sumb4_add_temp;  // sfix32_En14
  wire signed [21:0] sumb4_out1;  // sfix22_En14

  assign sumb4_add_cast = {{10{In1[20]}}, {In1, 1'b0}};
  assign sumb4_add_cast_1 = {{10{In2[21]}}, In2};
  assign sumb4_add_temp = sumb4_add_cast + sumb4_add_cast_1;
  assign sumb4_out1 = ((sumb4_add_temp[31] == 1'b0) && (sumb4_add_temp[30:21] != 10'b0000000000) ? 22'sb0111111111111111111111 :
              ((sumb4_add_temp[31] == 1'b1) && (sumb4_add_temp[30:21] != 10'b1111111111) ? 22'sb1000000000000000000000 :
              $signed(sumb4_add_temp[21:0])));

  assign Out1 = sumb4_out1;

endmodule  // sumb4_1

module sumb6
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [19:0] In1;  // sfix20_En12
  output  signed [21:0] Out1;  // sfix22_En14

  wire signed [31:0] sumb6_add_cast;  // sfix32_En14
  wire signed [31:0] sumb6_add_cast_1;  // sfix32_En14
  wire signed [31:0] sumb6_add_temp;  // sfix32_En14
  wire signed [21:0] sumb6_out1;  // sfix22_En14

  assign sumb6_add_cast = {{10{In1[19]}}, {In1, 2'b00}};
  assign sumb6_add_cast_1 = {{10{In2[21]}}, In2};
  assign sumb6_add_temp = sumb6_add_cast + sumb6_add_cast_1;
  assign sumb6_out1 = ((sumb6_add_temp[31] == 1'b0) && (sumb6_add_temp[30:21] != 10'b0000000000) ? 22'sb0111111111111111111111 :
              ((sumb6_add_temp[31] == 1'b1) && (sumb6_add_temp[30:21] != 10'b1111111111) ? 22'sb1000000000000000000000 :
              $signed(sumb6_add_temp[21:0])));

  assign Out1 = sumb6_out1;

endmodule  // sumb6_1

module sumb8
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [20:0] In1;  // sfix21_En13
  output  signed [21:0] Out1;  // sfix22_En14

  wire signed [31:0] sumb8_add_cast;  // sfix32_En14
  wire signed [31:0] sumb8_add_cast_1;  // sfix32_En14
  wire signed [31:0] sumb8_add_temp;  // sfix32_En14
  wire signed [21:0] sumb8_out1;  // sfix22_En14

  assign sumb8_add_cast = {{10{In1[20]}}, {In1, 1'b0}};
  assign sumb8_add_cast_1 = {{10{In2[21]}}, In2};
  assign sumb8_add_temp = sumb8_add_cast + sumb8_add_cast_1;
  assign sumb8_out1 = ((sumb8_add_temp[31] == 1'b0) && (sumb8_add_temp[30:21] != 10'b0000000000) ? 22'sb0111111111111111111111 :
              ((sumb8_add_temp[31] == 1'b1) && (sumb8_add_temp[30:21] != 10'b1111111111) ? 22'sb1000000000000000000000 :
              $signed(sumb8_add_temp[21:0])));

  assign Out1 = sumb8_out1;

endmodule  // sumb8_1

module sumb10
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [20:0] In1;  // sfix21_En13
  output  signed [21:0] Out1;  // sfix22_En14

  wire signed [31:0] sumb10_add_cast;  // sfix32_En14
  wire signed [31:0] sumb10_add_cast_1;  // sfix32_En14
  wire signed [31:0] sumb10_add_temp;  // sfix32_En14
  wire signed [21:0] sumb10_out1;  // sfix22_En14

  assign sumb10_add_cast = {{10{In1[20]}}, {In1, 1'b0}};
  assign sumb10_add_cast_1 = {{10{In2[21]}}, In2};
  assign sumb10_add_temp = sumb10_add_cast + sumb10_add_cast_1;
  assign sumb10_out1 = ((sumb10_add_temp[31] == 1'b0) && (sumb10_add_temp[30:21] != 10'b0000000000) ? 22'sb0111111111111111111111 :
              ((sumb10_add_temp[31] == 1'b1) && (sumb10_add_temp[30:21] != 10'b1111111111) ? 22'sb1000000000000000000000 :
              $signed(sumb10_add_temp[21:0])));

  assign Out1 = sumb10_out1;

endmodule  // sumb10_1

module sumb12
          (In2,
           In1,
           Out1);

  input   signed [21:0] In2;  // sfix22_En14
  input   signed [21:0] In1;  // sfix22_En14
  output  signed [21:0] Out1;  // sfix22_En14

  wire signed [31:0] sumb12_add_cast;  // sfix32_En14
  wire signed [31:0] sumb12_add_cast_1;  // sfix32_En14
  wire signed [31:0] sumb12_add_temp;  // sfix32_En14
  wire signed [21:0] sumb12_out1;  // sfix22_En14

  assign sumb12_add_cast = {{10{In1[21]}}, In1};
  assign sumb12_add_cast_1 = {{10{In2[21]}}, In2};
  assign sumb12_add_temp = sumb12_add_cast + sumb12_add_cast_1;
  assign sumb12_out1 = ((sumb12_add_temp[31] == 1'b0) && (sumb12_add_temp[30:21] != 10'b0000000000) ? 22'sb0111111111111111111111 :
              ((sumb12_add_temp[31] == 1'b1) && (sumb12_add_temp[30:21] != 10'b1111111111) ? 22'sb1000000000000000000000 :
              $signed(sumb12_add_temp[21:0])));

  assign Out1 = sumb12_out1;

endmodule  // sumb12_1