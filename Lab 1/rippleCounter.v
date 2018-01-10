`include "DFlipFlop.v"

module rippleCounter(count, clk, reset);
  input clk, reset;
  output [3:0] count;
  wire [3:0] q, qBar;
  genvar i;
  DFlipFlop zerothFlipFlop(q[0], count[0], count[0], clk, reset); //set up the flip flops
  generate
    for(i = 1; i < 4; i = i + 1) begin : eachFlipFlop
      DFlipFlop nthFlipFlop(q[i], count[i], count[i], q[i - 1], reset);
    end
  endgenerate
endmodule
