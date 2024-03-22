`timescale 1 ns / 1 ns

module Z1toZ3
          (clk,
           reset,
           enb,
           enb_1_3_1,
           In1,
           Out1,
           Out2,
           Out3,
           Out4);

  input   clk;
  input   reset;
  input   enb;
  input   enb_1_3_1;
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [10:0] Out1;  // sfix11_En3
  output  signed [10:0] Out2;  // sfix11_En3
  output  signed [10:0] Out3;  // sfix11_En3
  output  signed [10:0] Out4;  // sfix11_En3

  wire signed [10:0] RT1_out1;  // sfix11_En3
  wire signed [10:0] RT2_out1;  // sfix11_En3
  wire signed [10:0] RT3_out1;  // sfix11_En3
  reg signed [10:0] RT1_bypass_reg;  // sfix11
  reg signed [10:0] RT2_bypass_reg;  // sfix11
  reg signed [10:0] RT3_bypass_reg;  // sfix11
  reg signed [10:0] Delay1_out1;  // sfix11_En3
  reg signed [10:0] Delay2_out1;  // sfix11_En3

  always @(posedge clk or posedge reset)
    begin : RT1_bypass_process
      if (reset == 1'b1) begin
        RT1_bypass_reg <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_1) begin
          RT1_bypass_reg <= In1;
        end
      end
    end

  assign RT1_out1 = (enb_1_3_1 == 1'b1 ? In1 :
              RT1_bypass_reg);

  always @(posedge clk or posedge reset)
    begin : RT2_bypass_process
      if (reset == 1'b1) begin
        RT2_bypass_reg <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_1) begin
          RT2_bypass_reg <= Delay1_out1;
        end
      end
    end

  assign RT2_out1 = (enb_1_3_1 == 1'b1 ? Delay1_out1 :
              RT2_bypass_reg);

  always @(posedge clk or posedge reset)
    begin : RT3_bypass_process
      if (reset == 1'b1) begin
        RT3_bypass_reg <= 11'sb00000000000;
      end
      else begin
        if (enb_1_3_1) begin
          RT3_bypass_reg <= Delay2_out1;
        end
      end
    end

  assign RT3_out1 = (enb_1_3_1 == 1'b1 ? Delay2_out1 :
              RT3_bypass_reg);

  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= In1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 11'sb00000000000;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= Delay1_out1;
        end
      end
    end

  assign Out1 = RT1_out1;

  assign Out2 = RT2_out1;

  assign Out3 = RT3_out1;

  assign Out4 = Delay1_out1;

endmodule  // Z1toZ3
