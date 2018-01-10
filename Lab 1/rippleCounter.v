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

module rippleCounter_testbench;
  reg clk, rst;
  wire [3:0] count;
  rippleCounter myRippleCounter(count, clk, rst);
  parameter ClockDelay = 1;
  initial begin //setup the clock
    clk <= 0;
    forever begin
      #(ClockDelay);
      clk <= ~clk;
    end
  end
  integer i;
  initial begin
    $dumpfile("rippleCounter.vcd");
    $dumpvars(1, myRippleCounter);
    rst = 1'b0; #ClockDelay;
    rst = 1'b1; #ClockDelay;
    for(i = 0; i < 32; i++) begin
      #ClockDelay; //run 32 clock cycles
    end
    $finish;
  end
endmodule
