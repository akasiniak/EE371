`include "DFlipFlop.v"

// Standard synchronous counter that counts from 0 to 15.
//inputs: clock and a reset signal
//outputs: the current count value

module synchronousCounter(count, clk, reset);
  input clk, reset;
  output [3:0] count;
  wire [3:0] FFInput, qBar;

  assign FFInput[0] = ~count[0];
  assign FFInput[1] = ~(count[1] ^ count[0]);
  assign FFInput[2] = ~count[2] ^ (count[1] || count[0]);
  assign FFInput[3] = ~count[3] ^ (count[2] || count[1] || count[0]);
  genvar i;
  generate
    for(i = 0; i < 4; i = i + 1) begin
      DFlipFlop nthFlipFlop(count[i], qBar[i], FFInput[i], clk, reset);
    end
  endgenerate
endmodule

module synchronousCounter_testbench;
  reg clk, rst;
  wire [3:0] count;
  synchronousCounter mySynchronousCounter(count, clk, rst);
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
    $dumpfile("synchronousCounter.vcd");
    $dumpvars(1, mySynchronousCounter);
    rst = 1'b0; #ClockDelay;
    #ClockDelay;
    #ClockDelay;
    rst = 1'b1; #ClockDelay;
    for(i = 0; i < 32; i++) begin
      #ClockDelay; //run 32 clock cycles
    end
    $finish;
  end
endmodule
