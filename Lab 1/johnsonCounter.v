/* Johnson counter with active low reset. Does a right shift with 1 fill at each clock edge until the counter
reaches 15, and then does a right shift with 0 fill.
*/
module johnsonCounter(count, clk, reset);
  input clk, reset;
  output reg [3:0] count;

  always @ (posedge clk) begin
    if(!reset) begin
      count[3:0] <= 4'd0;
    end else begin
      count[0] <= ~count[3];
      count[1] <= count[0];
      count[2] <= count[1];
      count[3] <= count[2];
    end
  end
endmodule

module johnsonCounter_testbench;
  reg clk, rst;
  wire [3:0] count;
  johnsonCounter myJohnsonCounter(count, clk, rst);
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
    $dumpfile("johnsonCounter.vcd");
    $dumpvars(1, myJohnsonCounter);
    rst = 1'b0; #ClockDelay;
    #ClockDelay;
    rst = 1'b1; #ClockDelay;
    for(i = 0; i < 32; i++) begin
      #ClockDelay; //run 32 clock cycles
    end
    $finish;
  end
endmodule
