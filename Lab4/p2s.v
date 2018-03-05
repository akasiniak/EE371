module p2s(serialOut, parallelIn, load, clk, controlledClock, reset);
  output reg serialOut;
  input wire [7:0] parallelIn;
  input wire load, clk, reset, controlledClock;

  reg [9:0] loadBuffer;
  reg alreadyLoaded;

  always@(posedge clk) begin
    if(reset) begin
      loadBuffer <= 10'b1111111111;
      alreadyLoaded <= 1'b0;
    end else if (load && !alreadyLoaded) begin
		 loadBuffer[0] <= 1'b1;
		 loadBuffer[1] <= parallelIn[0];
       loadBuffer[2] <= parallelIn[1];
       loadBuffer[3] <= parallelIn[2];
       loadBuffer[4] <= parallelIn[3];
       loadBuffer[5] <= parallelIn[4];
       loadBuffer[6] <= parallelIn[5];
       loadBuffer[7] <= parallelIn[6];
       loadBuffer[8] <= parallelIn[7];
       loadBuffer[9] <= 1'b0;
    end
    else if(controlledClock)begin
      serialOut <= loadBuffer[9];
      loadBuffer[9] <= loadBuffer[8];
      loadBuffer[8] <= loadBuffer[7];
      loadBuffer[7] <= loadBuffer[6];
      loadBuffer[6] <= loadBuffer[5];
      loadBuffer[5] <= loadBuffer[4];
      loadBuffer[4] <= loadBuffer[3];
      loadBuffer[3] <= loadBuffer[2];
      loadBuffer[2] <= loadBuffer[1];
      loadBuffer[1] <= loadBuffer[0];
		loadBuffer[0] <= 1'b1;
    end
    alreadyLoaded <= load;
  end
endmodule

// module p2s_testbench;
//   wire serialOut;
//   reg [7:0] parallelIn;
//   reg load, clk, reset;

//   p2s dut(serialOut, parallelIn, load, clk, reset);

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
//     $dumpfile("p2s.vcd");
//     $dumpvars(1,dut);
//     reset <= 1'b1;
//     load <= 1'b0;
//     #ClockDelay;
//     reset <= 1'b0;
//     #ClockDelay;
//     parallelIn <= 8'b10110101;
//     load <= 1'b1;
//     #ClockDelay;
//     parallelIn <= 8'b10001101;
//     load <= 1'b0;
//     for(i = 0; i < 10; i++) begin
//       #ClockDelay;
//     end
//     $finish;
//   end
// endmodule
