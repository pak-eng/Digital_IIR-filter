`timescale 1 ns / 1 ns

module filter_top
          (clk,
           reset,
           clk_enable,
           in,
           ce_out,
           Out1);

  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [10:0] in;  // sfix11_En3
  output  ce_out;
  output  signed [10:0] Out1;  // sfix11_En3

  wire enb;
  wire enb_1_1_1;
  wire enb_1_3_0;
  wire enb_1_3_1;

  reg signed [41:0] Delay1_2_out1;  // sfix42_En31
  reg signed [41:0] Delay2_2_out1;  // sfix42_En31
  reg signed [32:0] Delay2_3_out1;  // sfix33_En22
  reg signed [41:0] Delay2_2_1_out1;  // sfix42_En31
  reg signed [41:0] Delay2_2_2_out1;  // sfix42_En31
  reg signed [32:0] Delay3_3_out1;  // sfix33_En22

  wire signed [10:0] Z1toZ3_1_out1;  // sfix11_En3
  wire signed [10:0] Z1toZ3_1_out2;  // sfix11_En3
  wire signed [10:0] Z1toZ3_1_out3;  // sfix11_En3
  wire signed [10:0] Z1toZ3_1_out4;  // sfix11_En3
  wire signed [10:0] Z1toZ3_2_out1;  // sfix11_En3
  wire signed [10:0] Z1toZ3_2_out2;  // sfix11_En3
  wire signed [10:0] Z1toZ3_2_out3;  // sfix11_En3
  wire signed [10:0] Z1toZ3_2_out4;  // sfix11_En3
  wire signed [10:0] Z1toZ3_3_out1;  // sfix11_En3
  wire signed [10:0] Z1toZ3_3_out2;  // sfix11_En3
  wire signed [10:0] Z1toZ3_3_out3;  // sfix11_En3

  wire signed [21:0] FIR_section_1_out1;  // sfix22_En14
  wire signed [21:0] FIR_section_2_out1;  // sfix22_En14
  wire signed [21:0] FIR_section_3_out1;  // sfix22_En14

  wire signed [35:0] IIR_section_1_out1;  // sfix36_En27
  wire signed [41:0] IIR_section_1_out2;  // sfix42_En31
  wire signed [32:0] IIR_section_1_out3;  // sfix33_En22
  wire signed [35:0] IIR_section_2_out1;  // sfix36_En27
  wire signed [41:0] IIR_section_2_out2;  // sfix42_En31
  wire signed [32:0] IIR_section_2_out3;  // sfix33_En22
  wire signed [35:0] IIR_section_3_out1;  // sfix36_En27
  wire signed [41:0] IIR_section_3_out2;  // sfix42_En31
  wire signed [32:0] IIR_section_3_out3;  // sfix33_En22

  wire signed [10:0] OUT_MUX_out1;  // sfix11_En3

  always @(posedge clk or posedge reset)
    begin : Delay2_3_process
      if (reset == 1'b1) begin
        Delay2_3_out1 <= 33'sh000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay2_3_out1 <= IIR_section_1_out3;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay3_3_process
      if (reset == 1'b1) begin
        Delay3_3_out1 <= 33'sh000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay3_3_out1 <= IIR_section_2_out3;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay2_2_1_process
      if (reset == 1'b1) begin
        Delay2_2_1_out1 <= 42'sh00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay2_2_1_out1 <= IIR_section_1_out2;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay2_2_2_process
      if (reset == 1'b1) begin
        Delay2_2_2_out1 <= 42'sh00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay2_2_2_out1 <= Delay2_2_1_out1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay2_2_process
      if (reset == 1'b1) begin
        Delay2_2_out1 <= 42'sh00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay2_2_out1 <= IIR_section_3_out2;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay1_2_process
      if (reset == 1'b1) begin
        Delay1_2_out1 <= 42'sh00000000000;
      end
      else begin
        if (enb_1_3_0) begin
          Delay1_2_out1 <= IIR_section_2_out2;
        end
      end
    end

  clock_enb u_fp_model_tc (.clk(clk),
                             .reset(reset),
                             .clk_enable(clk_enable),
                             .enb(enb),
                             .enb_1_1_1(enb_1_1_1),
                             .enb_1_3_0(enb_1_3_0),
                             .enb_1_3_1(enb_1_3_1)
                             );

  Z1toZ3 u_Z1toZ3_1 (.clk(clk),
                       .reset(reset),
                       .enb(enb),
                       .enb_1_3_1(enb_1_3_1),
                       .In1(in),  // sfix11_En3
                       .Out1(Z1toZ3_1_out1),  // sfix11_En3
                       .Out2(Z1toZ3_1_out2),  // sfix11_En3
                       .Out3(Z1toZ3_1_out3),  // sfix11_En3
                       .Out4(Z1toZ3_1_out4)  // sfix11_En3
                       );

  Z1toZ3 u_Z1toZ3_2 (.clk(clk),
                       .reset(reset),
                       .enb(enb),
                       .enb_1_3_1(enb_1_3_1),
                       .In1(Z1toZ3_1_out4),  // sfix11_En3
                       .Out1(Z1toZ3_2_out1),  // sfix11_En3
                       .Out2(Z1toZ3_2_out2),  // sfix11_En3
                       .Out3(Z1toZ3_2_out3),  // sfix11_En3
                       .Out4(Z1toZ3_2_out4)  // sfix11_En3
                       );

  Z1toZ3 u_Z1toZ3_3 (.clk(clk),
                       .reset(reset),
                       .enb(enb),
                       .enb_1_3_1(enb_1_3_1),
                       .In1(Z1toZ3_2_out4),  // sfix11_En3
                       .Out1(Z1toZ3_3_out1),  // sfix11_En3
                       .Out2(Z1toZ3_3_out2),  // sfix11_En3
                       .Out3(Z1toZ3_3_out3)  // sfix11_En3
                       );

  FIR_section u_FIR_section_1 (.clk(clk),
                                 .reset(reset),
                                 .enb_1_3_0(enb_1_3_0),
                                 .In1(Z1toZ3_1_out1),  // sfix11_En3
                                 .In2(Z1toZ3_1_out2),  // sfix11_En3
                                 .In3(Z1toZ3_1_out3),  // sfix11_En3
                                 .Out1(FIR_section_1_out1)  // sfix22_En14
                                 );

  FIR_section u_FIR_section_2 (.clk(clk),
                                 .reset(reset),
                                 .enb_1_3_0(enb_1_3_0),
                                 .In1(Z1toZ3_2_out1),  // sfix11_En3
                                 .In2(Z1toZ3_2_out2),  // sfix11_En3
                                 .In3(Z1toZ3_2_out3),  // sfix11_En3
                                 .Out1(FIR_section_2_out1)  // sfix22_En14
                                 );

  FIR_section u_FIR_section_3 (.clk(clk),
                                 .reset(reset),
                                 .enb_1_3_0(enb_1_3_0),
                                 .In1(Z1toZ3_3_out1),  // sfix11_En3
                                 .In2(Z1toZ3_3_out2),  // sfix11_En3
                                 .In3(Z1toZ3_3_out3),  // sfix11_En3
                                 .Out1(FIR_section_3_out1)  // sfix22_En14
                                 );

  IIR_section u_IIR_section_1 (.clk(clk),
                                 .reset(reset),
                                 .enb_1_3_0(enb_1_3_0),
                                 .In1(FIR_section_1_out1),  // sfix22_En14
                                 .In2(Delay1_2_out1),  // sfix42_En31
                                 .In3(IIR_section_3_out3),  // sfix33_En22
                                 .Out1(IIR_section_1_out1),  // sfix36_En27
                                 .Out2(IIR_section_1_out2),  // sfix42_En31
                                 .Out3(IIR_section_1_out3)  // sfix33_En22
                                 );

  IIR_section u_IIR_section_2 (.clk(clk),
                                 .reset(reset),
                                 .enb_1_3_0(enb_1_3_0),
                                 .In1(FIR_section_2_out1),  // sfix22_En14
                                 .In2(Delay2_2_out1),  // sfix42_En31
                                 .In3(Delay2_3_out1),  // sfix33_En22
                                 .Out1(IIR_section_2_out1),  // sfix36_En27
                                 .Out2(IIR_section_2_out2),  // sfix42_En31
                                 .Out3(IIR_section_2_out3)  // sfix33_En22
                                 );

  IIR_section u_IIR_section_3 (.clk(clk),
                                 .reset(reset),
                                 .enb_1_3_0(enb_1_3_0),
                                 .In1(FIR_section_3_out1),  // sfix22_En14
                                 .In2(Delay2_2_2_out1),  // sfix42_En31
                                 .In3(Delay3_3_out1),  // sfix33_En22
                                 .Out1(IIR_section_3_out1),  // sfix36_En27
                                 .Out2(IIR_section_3_out2),  // sfix42_En31
                                 .Out3(IIR_section_3_out3)  // sfix33_En22
                                 );

  OUT_MUX u_OUT_MUX (.clk(clk),
                     .reset(reset),
                     .enb_1_3_0(enb_1_3_0),
                     .enb(enb),
                     .In1(IIR_section_1_out1),  // sfix36_En27
                     .In2(IIR_section_2_out1),  // sfix36_En27
                     .In3(IIR_section_3_out1),  // sfix36_En27
                     .Out1(OUT_MUX_out1)  // sfix11_En3
                     );

  assign ce_out = enb_1_1_1;
  assign Out1 = OUT_MUX_out1;

endmodule  // filter_top

