`timescale 1 ns / 1 ns

module OUT_MUX(
  input clk,
  input reset,
  input   signed [35:0] In [0:2],
  output  signed [10:0] Out
);

  reg   [1:0] cnt_nxt;
  wire  [1:0] cnt;
  wire  wrap_cond;

  wire signed [10:0] in_cast [0:2];

  assign wrap_cond = cnt_nxt <= 2'b01; // wrap condition
  assign cnt = (wrap_cond == 1'b0 ? cnt_nxt : 3'b100) - 2'b01; // increment + wrap

  // Count limited initial value = 3 decrement value = 1 count to value = 1
  always @(posedge clk or posedge reset) begin : cnt_proc
    if (reset == 1'b1) begin
      cnt_nxt <= 2'b10;
    end
    else begin
        cnt_nxt <= cnt;
    end
  end

  assign in_cast[0] = In[0][34:24] + $signed({1'b0, In[0][23]});
  assign in_cast[1] = In[1][34:24] + $signed({1'b0, In[1][23]});
  assign in_cast[2] = In[2][34:24] + $signed({1'b0, In[2][23]});

  assign Out = (cnt_nxt == 2'b01 ? in_cast[0] : (cnt_nxt == 2'b10 ? in_cast[1] : in_cast[2]));

endmodule  // OUT_MUX
