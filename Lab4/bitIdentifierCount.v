module bitIdentifierCount(characterReceived, enable, bitReceived, bitCount, clk, reset);
  output reg characterReceived;
  input wire enable, bitReceived, clk, reset;
  output reg [3:0] bitCount;
  reg characterReceivedState;
  always@(posedge clk) begin
    if(reset || !enable) begin
      bitCount <= 4'b0000;
      characterReceived <= 1'b0;
    end
  end
  always@(posedge bitReceived) begin
    if(reset || !enable) begin
      characterReceived <= 1'b0;
      bitCount <= 4'b0000;
    end else if (enable) begin
      bitCount <= bitCount + 1'b1;
      if(bitCount == 4'b1001) begin
        characterReceived <= 1'b1;
        bitCount <= 4'b0000;
      end
    end
  end
endmodule

// module bitIdentifierCount_testbench;
//   wire characterReceived;
//   reg enable, bitReceived, clk, reset;

//   bitIdentifierCount dut (characterReceived, enable, bitReceived, clk, reset);

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
//     $dumpfile("bitIdentifierCount.vcd");
//     $dumpvars(1,dut);
//     reset <= 1'b1;
//     bitReceived <= 1'b0;
//     enable <= 1'b0;
//     #ClockDelay;
//     reset <= 1'b0;
//     #ClockDelay;
//     enable <= 1'b1;
//     #ClockDelay;
//     bitReceived = 1'b1;
//     for(i = 0; i < 9; i++) begin
//       #ClockDelay;
//     end
//     $finish;
//   end
// endmodule
