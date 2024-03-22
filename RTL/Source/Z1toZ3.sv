`timescale 1 ns / 1 ns

module Z1toZ3(
  input clk,
  input clk_div_3,
  input reset,
  input  signed [10:0] In,
  output signed [10:0] Out [0:3]
);
  logic signed [10:0] flop [0:1];
  logic signed [10:0] flop_div3 [0:2];

  always @(posedge clk or posedge reset) begin : del_proc
    if (reset == 1'b1) begin
      for (int i = 0; i < 2; i++) begin
        flop[i] <= 11'sb00000000000;
      end
    end
    else begin
      flop[0] <= In;
      flop[1] <= flop[0];
    end
  end

  always @(posedge clk_div_3 or posedge reset) begin : flop_sync
    if (reset == 1'b1) begin
      for (int i = 0; i < 3; i++) begin
        flop_div3[i] <= 11'sb00000000000;
      end
    end
    else begin
      flop_div3[0] <= In;
      for (int i = 1; i < 3; i++) begin
        flop_div3[i] <= flop[i-1];
      end
    end
  end

  for (genvar i = 0; i < 3; i++) begin
    assign Out[i] = flop_div3[i];
  end
  assign Out[3] = flop[0];

endmodule  // Z1toZ3
