// Master clock enable input: clk_enable
// 
// enb         : identical to clk_enable
// enb_1_1_1   : identical to clk_enable
// enb_1_3_0   : 3x slower than clk with last phase
// enb_1_3_1   : 3x slower than clk with phase 1

`timescale 1 ns / 1 ns

module clock_enb
          (clk,
           reset,
           clk_enable,
           enb,
           enb_1_1_1,
           enb_1_3_0,
           enb_1_3_1);

  input   clk;
  input   reset;
  input   clk_enable;
  output  enb;
  output  enb_1_1_1;
  output  enb_1_3_0;
  output  enb_1_3_1;

  reg [1:0] count3;  // ufix2
  wire comp_0_tmp;
  wire comp_1_tmp;
  reg  phase_0;
  reg  phase_1;
  wire phase_0_tmp;
  wire phase_1_tmp;
  wire enb_1_3_0_1;
  wire enb_1_3_1_1;

  // Count limited, Unsigned Counter
  //  initial value   = 1
  //  step value      = 1
  //  count to value  = 2
  always @(posedge clk or posedge reset)
    begin : counter_3_process
      if (reset == 1'b1) begin
        count3 <= 2'b01;
      end
      else begin
        if (clk_enable) begin
          if (count3 >= 2'b10) begin
            count3 <= 2'b00;
          end
          else begin
            count3 <= count3 + 2'b01;
          end
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : phase_delay_process
      if (reset == 1'b1) begin
        phase_0 <= 1'b0;
      end
      else begin
        if (clk_enable) begin
          phase_0 <= phase_0_tmp;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : phase_delay_1_process
      if (reset == 1'b1) begin
        phase_1 <= 1'b1;
      end
      else begin
        if (clk_enable) begin
          phase_1 <= phase_1_tmp;
        end
      end
    end

  assign comp_0_tmp = count3 == 2'b10;
  assign comp_1_tmp = count3 == 2'b00;

  assign phase_0_tmp = comp_0_tmp & clk_enable;
  assign phase_1_tmp = comp_1_tmp & clk_enable;

  assign enb = clk_enable;
  assign enb_1_1_1 = clk_enable;
  assign enb_1_3_0 = enb_1_3_0_1;
  assign enb_1_3_1 = enb_1_3_1_1;
  assign enb_1_3_0_1 = phase_0 & clk_enable;
  assign enb_1_3_1_1 = phase_1 & clk_enable;

endmodule
