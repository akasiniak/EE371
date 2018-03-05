module bitSampleCount(clockControl, enable, clk, reset);
  output reg clockControl;
  input wire enable, clk, reset;
  reg [3:0] count;
  always@(posedge clk) begin
    if(reset) begin
      clockControl <= 1'b0;
      count <= 4'b0000;
    end else if(enable) begin
//        clockControl <= (count == 4'b0111 || count[3]) && count != 4'b1111
			 count <= count + 1'b1;
			 if(count == 4'b1000) clockControl <= 1'b1;
			 else clockControl <= 1'b0;
   end else begin
        clockControl <= 1'b0;
        count <= 4'b0000;
   end
  end
endmodule

// module bitSampleCount_testbench;
//   wire clockControl, bitIncrementControl;
//   reg enable, clk, reset;

//   bitSampleCount dut(clockControl, bitIncrementControl, enable, clk, reset);

//   parameter ClockDelay = 2;
//   initial begin //setup the clock
//     clk <= 0;
//     forever begin
//       #(ClockDelay/2);
//       clk <= ~clk;
//     end
//   end
//   integer i;
//   initial begin
//     $dumpfile("bitSampleCount.vcd");
//     $dumpvars(1,dut);
//     reset = 1'b1;
//     enable = 1'b0;
//     #ClockDelay;
//     reset = 1'b0;
//     enable = 1'b1;
//     for(i = 0; i < 24; i++) begin
//       #ClockDelay;
//     end
//     $finish;
//   end
// endmodule
