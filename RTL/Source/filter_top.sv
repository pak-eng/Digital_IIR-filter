// Project name: Filter
// Author: P. P. Kolbenkov
// File description: Filter top-level

`timescale 1 ns / 1 ns

module filter_top(
  input clk,
  input clk_div_3,
  input reset,
  input   signed [10:0] in,
  output  signed [10:0] out
);

  logic signed [41:0] Delay1_2_out1;  // sfix42_En31
  logic signed [41:0] Delay2_2_out1;  // sfix42_En31
  logic signed [32:0] Delay2_3_out1;  // sfix33_En22
  logic signed [41:0] Delay2_2_1_out1;  // sfix42_En31
  logic signed [41:0] Delay2_2_2_out1;  // sfix42_En31
  logic signed [32:0] Delay3_3_out1;  // sfix33_En22

  wire signed [10:0] Z1toZ3_out [0:2][0:2];
  wire signed [21:0] FIR_out [0:2];
  wire signed [35:0] IIR_out1[0:2];
  wire signed [41:0] IIR_out2[0:2];
  wire signed [32:0] IIR_out3[0:2];

  
  logic signed [10:0] Del_Input [0:2];

  // Delays for separation input dataflow to 3 parallel filter copies
  always @(posedge clk) begin : input_del_proc
    if (reset) begin
      for (int i = 0; i < 3; i++) begin
        Del_Input[i] <= 11'sb00000000000;
      end
    end
    else begin
      Del_Input[0] <= in;
      for (int i = 1; i < 3; i++) begin
        Del_Input[i] <= Del_Input[i-1];
      end
    end
  end

  // Instantiating FIR-parts and downsampling blocks (Z1Z3)
  for (genvar i = 0; i < 3; i++) begin : u_Z1Z3_FIR
    Z1toZ3 u_Z1toZ3(
        .clk       (clk),
        .reset     (reset),
        .In        (Del_Input[i]),
        .Out       (Z1toZ3_out[i])
    );
    
    FIR_section u_FIR (
      .clk(clk_div_3), 
      .reset(reset),
      .In(Z1toZ3_out[i]),
      .Out(FIR_out[i])
    );
  end

  // Delays for IIR-parts interconnection 
  always @(posedge clk_div_3) begin : del_proc
    if (reset) begin
      Delay2_3_out1 <= '0;
      Delay3_3_out1 <= '0;
      Delay2_2_1_out1 <= '0;
      Delay2_2_2_out1 <= '0;
      Delay2_2_out1 <= '0;
      Delay1_2_out1 <= '0;
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

  // Instantiating IIR-parts
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

  // Instantiating output mux part with counter (upsampling block)
  out_mux u_out_mux(
    .clk       (clk),
    .clk_div_3 (clk_div_3),
    .reset     (reset),
    .In        (IIR_out1),
    .Out       (out)
  );

endmodule  // filter_top

