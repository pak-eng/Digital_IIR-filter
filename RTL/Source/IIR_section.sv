`timescale 1 ns / 1 ns

module IIR_section(
  input clk,
  input reset,
  input signed [21:0]  In1,
  input signed [41:0]  In2,
  input signed [32:0]  In3,
  output signed [35:0] Out1,
  output signed [41:0] Out2,
  output signed [32:0] Out3
);

  wire signed [14:0] a [0:5];

  reg signed [21:0] Delay0_out1;  // sfix22_En14
  reg signed [25:0] Delay11_out1;  // sfix26_En17
  reg signed [25:0] Delay12_out1;  // sfix26_En17
  reg signed [35:0] Delay21_out1;  // sfix36_En26
  reg signed [35:0] Delay22_out1;  // sfix36_En26
  reg signed [27:0] Delay31_out1;  // sfix28_En17
  reg signed [27:0] Delay32_out1;  // sfix28_En17
  reg signed [26:0] Delay33_out1;  // sfix27_En19
  reg signed [26:0] Delay34_out1;  // sfix27_En19

  wire signed [38:0] multa2_out1;  // sfix39_En29
  wire signed [43:0] multa4_out1;  // sfix44_En33
  wire signed [28:0] multa6_out1;  // sfix29_En18
  wire signed [35:0] multa8_out1;  // sfix36_En26
  wire signed [25:0] multa10_out1;  // sfix26_En17
  wire signed [26:0] multa12_out1;  // sfix27_En19

  wire signed [35:0] sumin_out1;  // sfix36_En27
  wire signed [38:0] sumq_out1;  // sfix39_En28
  wire signed [33:0] sumd_out1;  // sfix34_En23
  wire signed [32:0] suma2_out1;  // sfix33_En22
  wire signed [41:0] suma4_out1;  // sfix42_En31
  wire signed [27:0] suma6_out1;  // sfix28_En17

  always @(posedge clk or posedge reset) begin : del_proc
    if (reset == 1'b1) begin
      Delay0_out1 <= 22'sb0000000000000000000000;
      Delay11_out1 <= 26'sb00000000000000000000000000;
      Delay12_out1 <= 26'sb00000000000000000000000000;
      Delay21_out1 <= 36'sh000000000;
      Delay22_out1 <= 36'sh000000000;
      Delay31_out1 <= 28'sb0000000000000000000000000000;
      Delay32_out1 <= 28'sb0000000000000000000000000000;
      Delay33_out1 <= 27'sb000000000000000000000000000;
      Delay34_out1 <= 27'sb000000000000000000000000000;
    end
    else begin
      Delay0_out1 <= In1;
      Delay11_out1 <= Delay12_out1;
      Delay12_out1 <= multa10_out1;
      Delay21_out1 <= Delay22_out1;
      Delay22_out1 <= multa8_out1;
      Delay31_out1 <= Delay32_out1;
      Delay32_out1 <= suma6_out1;
      Delay33_out1 <= Delay34_out1;
      Delay34_out1 <= multa12_out1;
    end
  end

  coeffs u_filter_coeffs (
    .a_c(a),
    .b_c()
  );

  multa2 u_multa2 (.In2(a[0]),  // sfix15_En11
                   .In1(sumin_out1),  // sfix36_En27
                   .Out1(multa2_out1)  // sfix39_En29
                   );

  multa4 u_multa4 (.In2(a[1]),  // sfix15_En11
                   .In1(sumin_out1),  // sfix36_En27
                   .Out1(multa4_out1)  // sfix44_En33
                   );

  multa6 u_multa6 (.In2(a[2]),  // sfix15_En11
                   .In1(sumin_out1),  // sfix36_En27
                   .Out1(multa6_out1)  // sfix29_En18
                   );

  multa8 u_multa8 (.In2(a[3]),  // sfix15_En11
                   .In1(sumin_out1),  // sfix36_En27
                   .Out1(multa8_out1)  // sfix36_En26
                   );

  multa10 u_multa10 (.In2(a[4]),  // sfix15_En11
                     .In1(sumin_out1),  // sfix36_En27
                     .Out1(multa10_out1)  // sfix26_En17
                     );

  multa12 u_multa12 (.In2(a[5]),  // sfix15_En11
                     .In1(sumin_out1),  // sfix36_En27
                     .Out1(multa12_out1)  // sfix27_En19
                     );

  sumin u_sumin (.In1(Delay0_out1),  // sfix22_En14
                 .In2(sumq_out1),  // sfix39_En28
                 .Out1(sumin_out1)  // sfix36_En27
                 );

  sumq u_sumq (.In2(sumd_out1),  // sfix34_En23
               .In1(In2),  // sfix42_En31
               .Out1(sumq_out1)  // sfix39_En28
               );

  sumd u_sumd (.In1(In3),  // sfix33_En22
               .In2(Delay31_out1),  // sfix28_En17
               .Out1(sumd_out1)  // sfix34_En23
               );

  suma2 u_suma2 (.In2(multa2_out1),  // sfix39_En29
                 .In1(Delay21_out1),  // sfix36_En26
                 .Out1(suma2_out1)  // sfix33_En22
                 );

  suma4 u_suma4 (.In1(multa4_out1),  // sfix44_En33
                 .In2(Delay11_out1),  // sfix26_En17
                 .Out1(suma4_out1)  // sfix42_En31
                 );

  suma6 u_suma6 (.In1(multa6_out1),  // sfix29_En18
                 .In2(Delay33_out1),  // sfix27_En19
                 .Out1(suma6_out1)  // sfix28_En17
                 );

  assign Out1 = sumin_out1;
  assign Out2 = suma4_out1;
  assign Out3 = suma2_out1;

endmodule  // IIR_section
