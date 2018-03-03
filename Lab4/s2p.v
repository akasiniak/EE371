module s2p(parallelOut, serialIn, charReceived, reset, clk);
  output reg [7:0] parallelOut;
  input wire serialIn, charReceived, reset, clk;

  reg [9:0] allData;
  reg [3:0] count;

  always@(posedge clk) begin
    if(reset) begin
      parallelOut <= 8'd0;
    end else begin
      allData[0] <= serialIn;
      allData[1] <= allData[0];
      allData[2] <= allData[1];
      allData[3] <= allData[2];
      allData[4] <= allData[3];
      allData[5] <= allData[4];
      allData[6] <= allData[5];
      allData[7] <= allData[6];
      allData[8] <= allData[7];
      allData[9] <= allData[8];
    end
  end

  always@(posedge charReceived)begin
    parallelOut[0] <= allData[1];
    parallelOut[1] <= allData[2];
    parallelOut[2] <= allData[3];
    parallelOut[3] <= allData[4];
    parallelOut[4] <= allData[5];
    parallelOut[5] <= allData[6];
    parallelOut[6] <= allData[7];
    parallelOut[7] <= allData[8];
  end
endmodule

// module s2p_testbench;
//   wire [7:0] parallelOut;
//   reg serialIn, charReceived, reset, clk;

//   s2p dut(parallelOut, serialIn, charReceived, reset, clk);

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
//     $dumpfile("s2p.vcd");
//     $dumpvars(1,dut);
//     reset <= 1'b1;
//     charReceived <= 1'b0;
//     serialIn <= 1'b1;
//     #ClockDelay;
//     reset <= 1'b0;
//     #ClockDelay;
//     for(i = 0; i < 11; i++) begin
//       serialIn <= i % 2;
//       charReceived <= i == 10;
//       #ClockDelay;
//     end
//     $finish;
//   end
// endmodule
