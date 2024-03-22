// Project name: Filter
// Author: P. P. Kolbenkov
// File description: Output Multiplexer Counter (Upsampler)

`timescale 1 ns / 1 ns

module out_mux(
  input clk,
  input clk_div_3,
  input reset,
  input   signed [35:0] In [0:2],
  output  signed [10:0] Out
);

  logic signed [35:0] flop_div3_1 [0:2];
  logic signed [35:0] flop_div3_2 [0:2];

  always @(posedge clk_div_3) begin : flop_div3_proc
    if (reset) begin
      for (int i = 0; i < 3; i++) begin
        flop_div3_1[i] <= 36'sh000000000;
        flop_div3_2[i] <= 36'sh000000000;
      end
    end
    else begin
      flop_div3_1<= In;
      flop_div3_2<= flop_div3_1;
    end
  end

  logic signed [10:0] in_cast [0:2];
  for (genvar i = 0; i < 3; i++) begin : out_strip
    assign in_cast[i] = flop_div3_2[i][34:24] + $signed({1'b0, flop_div3_2[i][23]});
  end

  // Counter for multiplexer input switching
  logic  [1:0] cnt;
  always @(posedge clk) begin : cnt_proc
    if (reset) begin
      cnt <= 2'b00; // for sim in xrun and modelsim 2'b00; for syn 2'b10
    end
    else begin
      cnt <= (cnt == 2'b00) ? 2'b10 : (cnt - 2'b01);
    end
  end
  logic signed [10:0] mux_out;
  assign mux_out = in_cast[cnt];

  logic signed [10:0] flop;
  always @(posedge clk) begin : flop_proc
    if (reset) begin
      flop <= 11'sb00000000000;
    end
    else begin
      flop <= mux_out;
    end
  end
  assign Out = flop;

endmodule  // OUT_MUX
