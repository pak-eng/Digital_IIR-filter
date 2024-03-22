`timescale 1 ns / 1 ns

module filter_top(
  input clk,
  input clk_div_3,
  input reset,
  input   signed [10:0] in,
  output  signed [10:0] out
);

  reg signed [41:0] Delay1_2_out1;  // sfix42_En31
  reg signed [41:0] Delay2_2_out1;  // sfix42_En31
  reg signed [32:0] Delay2_3_out1;  // sfix33_En22
  reg signed [41:0] Delay2_2_1_out1;  // sfix42_En31
  reg signed [41:0] Delay2_2_2_out1;  // sfix42_En31
  reg signed [32:0] Delay3_3_out1;  // sfix33_En22

  wire signed [10:0] Z1toZ3_out [0:11];
  wire signed [21:0] FIR_out [0:2];
  wire signed [35:0] IIR_out1[0:2];
  wire signed [41:0] IIR_out2[0:2];
  wire signed [32:0] IIR_out3[0:2];

  for (genvar i = 0; i < 3; i++) begin
    Z1toZ3 u_Z1toZ3_0(
      .clk       (clk),
      .clk_div_3 (clk_div_3),
      .reset     (reset),
      .In        (in),
      .Out       (Z1toZ3_out[0:3])
    );
    
    if (i != 0) begin
      Z1toZ3 u_Z1toZ3(
        .clk       (clk),
        .clk_div_3 (clk_div_3),
        .reset     (reset),
        .In        (Z1toZ3_out[i*4-1]),
        .Out       (Z1toZ3_out[i*4:i*4+3])
      );
    end

    FIR_section u_FIR (
      .clk(clk_div_3), 
      .reset(reset),
      .In(Z1toZ3_out[i*4:i*4+2]),
      .Out(FIR_out[i])
    );
  end

  always @(posedge clk_div_3 or posedge reset) begin : del_proc
    if (reset == 1'b1) begin
      Delay2_3_out1 <= 33'sh000000000;
      Delay3_3_out1 <= 33'sh000000000;
      Delay2_2_1_out1 <= 42'sh00000000000;
      Delay2_2_2_out1 <= 42'sh00000000000;
      Delay2_2_out1 <= 42'sh00000000000;
      Delay1_2_out1 <= 42'sh00000000000;
    end
    else begin
      Delay2_3_out1 <= IIR_out3[0];
      Delay3_3_out1 <= IIR_out3[1];
      Delay2_2_1_out1 <= IIR_out2[0];
      Delay2_2_2_out1 <= Delay2_2_1_out1;
      Delay2_2_out1 <= IIR_out2[2];
      Delay1_2_out1 <= IIR_out2[1];
    end
  end

  IIR_section u_IIR_section_1(
    .clk   (clk_div_3),
    .reset (reset),
    .In1   (FIR_out[0]),
    .In2   (Delay1_2_out1),
    .In3   (IIR_out3[2]),
    .Out1  (IIR_out1[0]),
    .Out2  (IIR_out2[0]),
    .Out3  (IIR_out3[0])
  );

  IIR_section u_IIR_section_2(
    .clk   (clk_div_3),
    .reset (reset),
    .In1   (FIR_out[1]),
    .In2   (Delay2_2_out1),
    .In3   (Delay2_3_out1),
    .Out1  (IIR_out1[1]),
    .Out2  (IIR_out2[1]),
    .Out3  (IIR_out3[1])
  );

  IIR_section u_IIR_section_3(
    .clk   (clk_div_3),
    .reset (reset),
    .In1   (FIR_out[2]),
    .In2   (Delay2_2_2_out1),
    .In3   (Delay3_3_out1),
    .Out1  (IIR_out1[2]),
    .Out2  (IIR_out2[2]),
    .Out3  (IIR_out3[2])
  );

  OUT_MUX u_OUT_MUX(
    .clk       (clk),
    .reset     (reset),
    .In       (IIR_out1),
    .Out      (out)
  );

endmodule  // filter_top

