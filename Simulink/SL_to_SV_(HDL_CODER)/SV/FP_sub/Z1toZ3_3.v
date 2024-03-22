// -------------------------------------------------------------
// 
// File Name: D:\WorkSpace\LabWorks\DSP_SIMULINK\SL_to_SV\Filter\SV\FP_sub\Z1toZ3_3.v
// Created: 2023-10-12 14:13:41
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Z1toZ3_3
// Source Path: FP_sub/fp model/Z1toZ3_3
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Z1toZ3_3
          (clk,
           reset,
           enb,
           enb_1_3_1,
           In1,
           Out1,
           Out2,
           Out3);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1_3_1;
  input   signed [10:0] In1;  // sfix11_En3
  output  signed [10:0] Out1;  // sfix11_En3
  output  signed [10:0] Out2;  // sfix11_En3
  output  signed [10:0] Out3;  // sfix11_En3


  reg signed [10:0] RT1_bypass_reg;  // sfix11
  wire signed [10:0] RT1_out1;  // sfix11_En3
  reg signed [10:0] Delay1_out1;  // sfix11_En3
  reg signed [10:0] RT2_bypass_reg;  // sfix11
  wire signed [10:0] RT2_out1;  // sfix11_En3
  reg signed [10:0] Delay2_out1;  // sfix11_En3
  reg signed [10:0] RT3_bypass_reg;  // sfix11
  wire signed [10:0] RT3_out1;  // sfix11_En3


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



  assign Out1 = RT1_out1;

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



  assign Out2 = RT2_out1;

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



  assign Out3 = RT3_out1;

endmodule  // Z1toZ3_3

