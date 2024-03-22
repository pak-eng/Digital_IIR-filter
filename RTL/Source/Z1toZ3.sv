// Project name: Filter
// Author: P. P. Kolbenkov
// File description: Input Downsampler

`timescale 1 ns / 1 ns

module Z1toZ3(
  input clk,
  input reset,
  input  signed [10:0] In,
  output signed [10:0] Out [0:2]
);
  logic signed [10:0] flop [0:1];
  logic signed [10:0] flop_div3 [0:2];

  logic  [1:0] cnt;

  always @(posedge clk) begin : del_proc
    if (reset) begin
      for (int i = 0; i < 2; i++) begin
        flop[i] <= 11'sb00000000000;
      end
      for (int i = 0; i < 3; i++) begin
        flop_div3[i] <= 11'sb00000000000;
      end
      cnt <= 2'b00;
    end
    else begin
      flop[0] <= In;
      flop[1] <= flop[0];
      flop_div3[0] <= (cnt == 2'b00) ? In : flop_div3[0];
      for (int i = 1; i < 3; i++) begin
        flop_div3[i] <= (cnt == 2'b00) ? flop[i-1] : flop_div3[i];
      end
      cnt <= (cnt == 2'b10) ? 2'b00 : (cnt + 2'b01);
    end
  end

  for (genvar i = 0; i < 3; i++) begin
    assign Out[i] = flop_div3[i];
  end

endmodule  // Z1toZ3
