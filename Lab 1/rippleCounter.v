module rippleCounter(count, clk, reset);
  input clk, reset;
  output [3:0] count;
  wire [3:0] q, qBar;
  genvar i;
  DFlipFlop zerothFlipFlop(q[0], qBar[0], qBar[0], clk, reset);
  generate begin
    for(i = 1; i < 4; i++) begin : eachFlipFlop
      DFlipFop nthFlipFlop(q[i], qBar[i], qBar[i], q[i - 1], reset);
    end
  endgenerate
  assign count[0] = qBar[0];
  assign count[1] = qBar[1];
  assign count[2] = qBar[2];
  assign count[3] = qBar[3];
endmodule
