`timescale 1 ns / 1 ns

module IIR_section
          (clk,
           reset,
           enb_1_3_0,
           In1,
           In2,
           In3,
           Out1,
           Out2,
           Out3);

  input   clk;
  input   reset;
  input   enb_1_3_0;
  input   signed [21:0] In1;  // sfix22_En14
  input   signed [41:0] In2;  // sfix42_En31
  input   signed [32:0] In3;  // sfix33_En22
  output  signed [35:0] Out1;  // sfix36_En27
  output  signed [41:0] Out2;  // sfix42_En31
  output  signed [32:0] Out3;  // sfix33_En22

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

  wire signed [14:0] a2_out1;  // sfix15_En11
  wire signed [14:0] a4_out1;  // sfix15_En11
  wire signed [14:0] a6_out1;  // sfix15_En11
  wire signed [14:0] a8_out1;  // sfix15_En11
  wire signed [14:0] a10_out1;  // sfix15_En11
  wire signed [14:0] a12_out1;  // sfix15_En11

  wire signed [35:0] sumin_out1;  // sfix36_En27
  wire signed [38:0] sumq_out1;  // sfix39_En28
  wire signed [33:0] sumd_out1;  // sfix34_En23
  wire signed [32:0] suma2_out1;  // sfix33_En22
  wire signed [41:0] suma4_out1;  // sfix42_En31
  wire signed [27:0] suma6_out1;  // sfix28_En17

  always @(posedge clk or posedge reset)
    begin : Delay0_process
      if (reset == 1'b1) begin
        Delay0_out1 <= 22'sb0000000000000000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay0_out1 <= In1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay11_process
      if (reset == 1'b1) begin
        Delay11_out1 <= 26'sb00000000000000000000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay11_out1 <= Delay12_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay12_process
      if (reset == 1'b1) begin
        Delay12_out1 <= 26'sb00000000000000000000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay12_out1 <= multa10_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay21_process
      if (reset == 1'b1) begin
        Delay21_out1 <= 36'sh000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay21_out1 <= Delay22_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay22_process
      if (reset == 1'b1) begin
        Delay22_out1 <= 36'sh000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay22_out1 <= multa8_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay31_process
      if (reset == 1'b1) begin
        Delay31_out1 <= 28'sb0000000000000000000000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay31_out1 <= Delay32_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay32_process
      if (reset == 1'b1) begin
        Delay32_out1 <= 28'sb0000000000000000000000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay32_out1 <= suma6_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay33_process
      if (reset == 1'b1) begin
        Delay33_out1 <= 27'sb000000000000000000000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay33_out1 <= Delay34_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay34_process
      if (reset == 1'b1) begin
        Delay34_out1 <= 27'sb000000000000000000000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay34_out1 <= multa12_out1;
        end
      end
    end

  a2 u_a2 (.c(a2_out1)  // sfix15_En11
           );
  a4 u_a4 (.c(a4_out1)  // sfix15_En11
           );
  a6 u_a6 (.c(a6_out1)  // sfix15_En11
           );
  a8 u_a8 (.c(a8_out1)  // sfix15_En11
           );
  a10 u_a10 (.c(a10_out1)  // sfix15_En11
             );
  a12 u_a12 (.c(a12_out1)  // sfix15_En11
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

  multa2 u_multa2 (.In2(a2_out1),  // sfix15_En11
                   .In1(sumin_out1),  // sfix36_En27
                   .Out1(multa2_out1)  // sfix39_En29
                   );

  multa4 u_multa4 (.In2(a4_out1),  // sfix15_En11
                   .In1(sumin_out1),  // sfix36_En27
                   .Out1(multa4_out1)  // sfix44_En33
                   );

  multa6 u_multa6 (.In2(a6_out1),  // sfix15_En11
                   .In1(sumin_out1),  // sfix36_En27
                   .Out1(multa6_out1)  // sfix29_En18
                   );

  multa8 u_multa8 (.In2(a8_out1),  // sfix15_En11
                   .In1(sumin_out1),  // sfix36_En27
                   .Out1(multa8_out1)  // sfix36_En26
                   );

  multa10 u_multa10 (.In2(a10_out1),  // sfix15_En11
                     .In1(sumin_out1),  // sfix36_En27
                     .Out1(multa10_out1)  // sfix26_En17
                     );

  multa12 u_multa12 (.In2(a12_out1),  // sfix15_En11
                     .In1(sumin_out1),  // sfix36_En27
                     .Out1(multa12_out1)  // sfix27_En19
                     );

  assign Out1 = sumin_out1;
  assign Out2 = suma4_out1;
  assign Out3 = suma2_out1;

endmodule  // IIR_section
