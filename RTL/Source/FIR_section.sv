`timescale 1 ns / 1 ns

module FIR_section(
  input clk,
  input reset,
  input signed [10:0]  In [0:2],
  output signed [21:0] Out
);

  wire signed [11:0] b [0:3];

  wire signed [21:0] sumb2_1_out1;  // sfix22_En14
  wire signed [21:0] sumb4_1_out1;  // sfix22_En14
  wire signed [21:0] sumb6_1_out1;  // sfix22_En14
  wire signed [21:0] sumb8_1_out1;  // sfix22_En14
  wire signed [21:0] sumb10_1_out1;  // sfix22_En14
  wire signed [21:0] sumb12_1_out1;  // sfix22_En14

  wire signed [21:0] multb0_1_out1;  // sfix22_En14
  wire signed [21:0] multb0_2_out1;  // sfix22_En14
  wire signed [20:0] multb2_1_out1;  // sfix21_En13
  wire signed [20:0] multb2_2_out1;  // sfix21_En13
  wire signed [20:0] multb4_1_out1;  // sfix21_En13
  wire signed [20:0] multb4_2_out1;  // sfix21_En13
  wire signed [19:0] multb6_out1;  // sfix20_En12

  reg signed [10:0] Delay01_out1;  // sfix11_En3
  reg signed [10:0] Delay21_out1;  // sfix11_En3
  reg signed [10:0] Delay11_out1;  // sfix11_En3
  reg signed [10:0] Delay12_out1;  // sfix11_En3
  reg signed [10:0] Delay02_out1;  // sfix11_En3
  reg signed [10:0] Delay03_out1;  // sfix11_En3
  reg signed [10:0] Delay22_out1;  // sfix11_En3
  reg signed [10:0] Delay13_out1;  // sfix11_En3
  reg signed [10:0] Delay04_out1;  // sfix11_En3
  reg signed [10:0] Delay23_out1;  // sfix11_En3
  reg signed [10:0] Delay14_out1;  // sfix11_En3
  reg signed [10:0] Delay05_out1;  // sfix11_En3


  always @(posedge clk or posedge reset) begin : del_proc
    if (reset == 1'b1) begin
      Delay01_out1 <= 11'sb00000000000;
      Delay02_out1 <= 11'sb00000000000;
      Delay03_out1 <= 11'sb00000000000;
      Delay04_out1 <= 11'sb00000000000;
      Delay05_out1 <= 11'sb00000000000;
      Delay11_out1 <= 11'sb00000000000;
      Delay12_out1 <= 11'sb00000000000;
      Delay13_out1 <= 11'sb00000000000;
      Delay14_out1 <= 11'sb00000000000;
      Delay21_out1 <= 11'sb00000000000;
      Delay22_out1 <= 11'sb00000000000;
      Delay23_out1 <= 11'sb00000000000;
    end
    else begin
      Delay01_out1 <= In[0];
      Delay02_out1 <= Delay01_out1;
      Delay03_out1 <= Delay02_out1;
      Delay04_out1 <= Delay03_out1;
      Delay05_out1 <= Delay04_out1;
      Delay11_out1 <= In[1];
      Delay12_out1 <= Delay11_out1;
      Delay13_out1 <= Delay12_out1;
      Delay14_out1 <= Delay13_out1;
      Delay21_out1 <= In[2];
      Delay22_out1 <= Delay21_out1;
      Delay23_out1 <= Delay22_out1;
    end
  end

  coeffs u_filter_coeffs (
    .a_c(),
    .b_c(b)
  );

  multb0 u_multb0_1 (.In2(b[0]),  // sfix12_En11
                       .In1(Delay01_out1),  // sfix11_En3
                       .Out1(multb0_1_out1)  // sfix22_En14
                       );

  multb2 u_multb2_1 (.In2(b[1]),  // sfix12_En11
                       .In1(Delay21_out1),  // sfix11_En3
                       .Out1(multb2_1_out1)  // sfix21_En13
                       );

  multb4 u_multb4_1 (.In2(b[2]),  // sfix12_En11
                       .In1(Delay12_out1),  // sfix11_En3
                       .Out1(multb4_1_out1)  // sfix21_En13
                       );

  multb6 u_multb6 (.In2(b[3]),  // sfix12_En11
                   .In1(Delay03_out1),  // sfix11_En3
                   .Out1(multb6_out1)  // sfix20_En12
                   );

  multb4 u_multb4_2 (.In2(b[2]),  // sfix12_En11
                       .In1(Delay23_out1),  // sfix11_En3
                       .Out1(multb4_2_out1)  // sfix21_En13
                       );

  multb2 u_multb2_2 (.In2(b[1]),  // sfix12_En11
                       .In1(Delay14_out1),  // sfix11_En3
                       .Out1(multb2_2_out1)  // sfix21_En13
                       );

  multb0 u_multb0_2 (.In2(b[0]),  // sfix12_En11
                       .In1(Delay05_out1),  // sfix11_En3
                       .Out1(multb0_2_out1)  // sfix22_En14
                       );

  sumb2 u_sumb2_1 (.In2(multb0_1_out1),  // sfix22_En14
                     .In1(multb2_1_out1),  // sfix21_En13
                     .Out1(sumb2_1_out1)  // sfix22_En14
                     );

  sumb4 u_sumb4_1 (.In2(sumb2_1_out1),  // sfix22_En14
                     .In1(multb4_1_out1),  // sfix21_En13
                     .Out1(sumb4_1_out1)  // sfix22_En14
                     );

  sumb6 u_sumb6_1 (.In2(sumb4_1_out1),  // sfix22_En14
                     .In1(multb6_out1),  // sfix20_En12
                     .Out1(sumb6_1_out1)  // sfix22_En14
                     );

  sumb8 u_sumb8_1 (.In2(sumb6_1_out1),  // sfix22_En14
                     .In1(multb4_2_out1),  // sfix21_En13
                     .Out1(sumb8_1_out1)  // sfix22_En14
                     );

  sumb10 u_sumb10_1 (.In2(sumb8_1_out1),  // sfix22_En14
                       .In1(multb2_2_out1),  // sfix21_En13
                       .Out1(sumb10_1_out1)  // sfix22_En14
                       );

  sumb12 u_sumb12_1 (.In2(sumb10_1_out1),  // sfix22_En14
                       .In1(multb0_2_out1),  // sfix22_En14
                       .Out1(sumb12_1_out1)  // sfix22_En14
                       );

  assign Out = sumb12_1_out1;

endmodule  // FIR_section
