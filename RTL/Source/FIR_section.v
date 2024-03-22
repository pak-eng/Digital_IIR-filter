//`include "filter_coeffs.v"

`timescale 1 ns / 1 ns

module FIR_section
          (clk,
           reset,
           enb_1_3_0,
           In1,
           In2,
           In3,
           Out1);

  input   clk;
  input   reset;
  input   enb_1_3_0;
  input   signed [10:0] In1;  // sfix11_En3
  input   signed [10:0] In2;  // sfix11_En3
  input   signed [10:0] In3;  // sfix11_En3
  output  signed [21:0] Out1;  // sfix22_En14

  wire signed [11:0] b0_1_out1;  // sfix12_En11
  wire signed [11:0] b0_2_out1;  // sfix12_En11
  wire signed [11:0] b2_1_out1;  // sfix12_En11
  wire signed [11:0] b2_2_out1;  // sfix12_En11
  wire signed [11:0] b4_1_out1;  // sfix12_En11
  wire signed [11:0] b4_2_out1;  // sfix12_En11
  wire signed [11:0] b6_out1;  // sfix12_En11

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

  b0_1 u_b0_1 (.c(b0_1_out1)  // sfix12_En11
               );

  b2_1 u_b2_1 (.c(b2_1_out1)  // sfix12_En11
               );

  b4_1 u_b4_1 (.c(b4_1_out1)  // sfix12_En11
               );

  b6 u_b6 (.c(b6_out1)  // sfix12_En11
           );

  b4_2 u_b4_2 (.c(b4_2_out1)  // sfix12_En11
               );

  b2_2 u_b2_2 (.c(b2_2_out1)  // sfix12_En11
               );

  b0_2 u_b0_2 (.c(b0_2_out1)  // sfix12_En11
               );

  always @(posedge clk or posedge reset)
    begin : Delay01_process
      if (reset == 1'b1) begin
        Delay01_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay01_out1 <= In1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay02_process
      if (reset == 1'b1) begin
        Delay02_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay02_out1 <= Delay01_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay03_process
      if (reset == 1'b1) begin
        Delay03_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay03_out1 <= Delay02_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay04_process
      if (reset == 1'b1) begin
        Delay04_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay04_out1 <= Delay03_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay05_process
      if (reset == 1'b1) begin
        Delay05_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay05_out1 <= Delay04_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay11_process
      if (reset == 1'b1) begin
        Delay11_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay11_out1 <= In2;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay12_process
      if (reset == 1'b1) begin
        Delay12_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay12_out1 <= Delay11_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay13_process
      if (reset == 1'b1) begin
        Delay13_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay13_out1 <= Delay12_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay14_process
      if (reset == 1'b1) begin
        Delay14_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay14_out1 <= Delay13_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay21_process
      if (reset == 1'b1) begin
        Delay21_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay21_out1 <= In3;
        end
      end
    end


  always @(posedge clk or posedge reset)
    begin : Delay22_process
      if (reset == 1'b1) begin
        Delay22_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay22_out1 <= Delay21_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay23_process
      if (reset == 1'b1) begin
        Delay23_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay23_out1 <= Delay22_out1;
        end
      end
    end

  multb0_1 u_multb0_1 (.In2(b0_1_out1),  // sfix12_En11
                       .In1(Delay01_out1),  // sfix11_En3
                       .Out1(multb0_1_out1)  // sfix22_En14
                       );

  multb2_1 u_multb2_1 (.In2(b2_1_out1),  // sfix12_En11
                       .In1(Delay21_out1),  // sfix11_En3
                       .Out1(multb2_1_out1)  // sfix21_En13
                       );

  sumb2_1 u_sumb2_1 (.In2(multb0_1_out1),  // sfix22_En14
                     .In1(multb2_1_out1),  // sfix21_En13
                     .Out1(sumb2_1_out1)  // sfix22_En14
                     );

  multb4_1 u_multb4_1 (.In2(b4_1_out1),  // sfix12_En11
                       .In1(Delay12_out1),  // sfix11_En3
                       .Out1(multb4_1_out1)  // sfix21_En13
                       );

  sumb4_1 u_sumb4_1 (.In2(sumb2_1_out1),  // sfix22_En14
                     .In1(multb4_1_out1),  // sfix21_En13
                     .Out1(sumb4_1_out1)  // sfix22_En14
                     );

  multb6 u_multb6 (.In2(b6_out1),  // sfix12_En11
                   .In1(Delay03_out1),  // sfix11_En3
                   .Out1(multb6_out1)  // sfix20_En12
                   );

  sumb6_1 u_sumb6_1 (.In2(sumb4_1_out1),  // sfix22_En14
                     .In1(multb6_out1),  // sfix20_En12
                     .Out1(sumb6_1_out1)  // sfix22_En14
                     );

  multb4_2 u_multb4_2 (.In2(b4_2_out1),  // sfix12_En11
                       .In1(Delay23_out1),  // sfix11_En3
                       .Out1(multb4_2_out1)  // sfix21_En13
                       );

  sumb8_1 u_sumb8_1 (.In2(sumb6_1_out1),  // sfix22_En14
                     .In1(multb4_2_out1),  // sfix21_En13
                     .Out1(sumb8_1_out1)  // sfix22_En14
                     );

  multb2_2 u_multb2_2 (.In2(b2_2_out1),  // sfix12_En11
                       .In1(Delay14_out1),  // sfix11_En3
                       .Out1(multb2_2_out1)  // sfix21_En13
                       );

  sumb10_1 u_sumb10_1 (.In2(sumb8_1_out1),  // sfix22_En14
                       .In1(multb2_2_out1),  // sfix21_En13
                       .Out1(sumb10_1_out1)  // sfix22_En14
                       );

  multb0_2 u_multb0_2 (.In2(b0_2_out1),  // sfix12_En11
                       .In1(Delay05_out1),  // sfix11_En3
                       .Out1(multb0_2_out1)  // sfix22_En14
                       );

  sumb12_1 u_sumb12_1 (.In2(sumb10_1_out1),  // sfix22_En14
                       .In1(multb0_2_out1),  // sfix22_En14
                       .Out1(sumb12_1_out1)  // sfix22_En14
                       );

  assign Out1 = sumb12_1_out1;

endmodule  // FIR_section
