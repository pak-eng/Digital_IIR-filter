`timescale 1 ns / 1 ns

module OUT_MUX
          (clk,
           reset,
           enb_1_3_0,
           enb,
           In1,
           In2,
           In3,
           Out1);

  input   clk;
  input   reset;
  input   enb_1_3_0;
  input   enb;
  input   signed [35:0] In1;  // sfix36_En27
  input   signed [35:0] In2;  // sfix36_En27
  input   signed [35:0] In3;  // sfix36_En27
  output  signed [10:0] Out1;  // sfix11_En3

  wire const_1_out1;  // ufix1
  wire [2:0] const_4_out1;  // ufix3
  wire [7:0] count_step;  // uint8

  wire [7:0] count_from_1;  // uint8
  reg [7:0] counter_0_2_out1;  // uint8
  wire [7:0] count;  // uint8
  wire needToWrap;
  wire [7:0] count_value;  // uint8
  wire [31:0] add_add_temp;  // ufix32
  wire [31:0] add_1;  // ufix32
  wire [31:0] add_2;  // ufix32
  wire [1:0] add_out1;  // ufix2
  wire [1:0] sub_out1;  // ufix2
  wire signed [31:0] sub_1;  // sfix32
  wire signed [31:0] sub_2;  // sfix32
  wire signed [31:0] sub_sub_temp;  // sfix32
  reg signed [35:0] RT1_out1;  // sfix36_En27
  reg signed [35:0] RT2_out1;  // sfix36_En27
  reg signed [35:0] RT3_out1;  // sfix36_En27
  wire signed [10:0] RT1_out1_dtc;  // sfix11_En3
  wire signed [10:0] RT2_out1_dtc;  // sfix11_En3
  wire signed [10:0] RT3_out1_dtc;  // sfix11_En3
  wire signed [10:0] mux_3_1_out1;  // sfix11_En3

  assign const_4_out1 = 3'b100;
  assign count_step = 8'b00000001;
  assign count_from_1 = 8'b00000000;
  assign const_1_out1 = 1'b1;
  assign needToWrap = counter_0_2_out1 >= 8'b00000010;
  assign count = counter_0_2_out1 + count_step;
  assign count_value = (needToWrap == 1'b0 ? count : count_from_1);

  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 2
  always @(posedge clk or posedge reset)
    begin : counter_0_2_process
      if (reset == 1'b1) begin
        counter_0_2_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          counter_0_2_out1 <= count_value;
        end
      end
    end

  assign add_1 = {24'b0, counter_0_2_out1};
  assign add_2 = {31'b0, const_1_out1};
  assign add_add_temp = add_1 + add_2;
  assign add_out1 = add_add_temp[1:0];

  assign sub_1 = {29'b0, const_4_out1};
  assign sub_2 = {30'b0, add_out1};
  assign sub_sub_temp = sub_1 - sub_2;
  assign sub_out1 = sub_sub_temp[1:0];

  assign RT1_out1_dtc = RT1_out1[34:24] + $signed({1'b0, RT1_out1[23]});
  assign RT2_out1_dtc = RT2_out1[34:24] + $signed({1'b0, RT2_out1[23]});
  assign RT3_out1_dtc = RT3_out1[34:24] + $signed({1'b0, RT3_out1[23]});

  always @(posedge clk or posedge reset)
    begin : RT1_process
      if (reset == 1'b1) begin
        RT1_out1 <= 36'sh000000000;
      end
      else begin
        if (enb_1_3_0) begin
          RT1_out1 <= In1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : RT2_process
      if (reset == 1'b1) begin
        RT2_out1 <= 36'sh000000000;
      end
      else begin
        if (enb_1_3_0) begin
          RT2_out1 <= In2;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : RT3_process
      if (reset == 1'b1) begin
        RT3_out1 <= 36'sh000000000;
      end
      else begin
        if (enb_1_3_0) begin
          RT3_out1 <= In3;
        end
      end
    end

  assign mux_3_1_out1 = (sub_out1 == 2'b01 ? RT1_out1_dtc :
              (sub_out1 == 2'b10 ? RT2_out1_dtc :
              RT3_out1_dtc));

  assign Out1 = mux_3_1_out1;

endmodule  // OUT_MUX
