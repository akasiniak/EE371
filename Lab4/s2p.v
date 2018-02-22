module s2p(parallelOut, serialIn, charReceived, reset, clk);
  output reg [7:0] parallelOut;
  input wire serialIn, charReceived, reset, clk;

  reg allData [9:0]

  always@(posedge clk) begin
    if(reset) begin
      parallelOut <= 8'd0;
    end else begin
      allData = allData << 1; // allData = allData >> 1 ? Right bit-shift?
      allData[0] = serialIn;  // Use <= non-blocking assignments?
    end
  end

  always@(posedge charReceived)begin
    parallelOut[7:0] = allData[8:1];
  end
endmodule

module s2p_testbench;
  wire [7:0] parallelOut;
  reg serialIn, charReceived, reset, clk;

  s2p dut(parallelOut, serialIn, charReceived, reset, clk);

  parameter ClockDelay = 2;
  initial begin //setup the clock
    clk <= 0;
    forever begin
      #(ClockDelay/2);
      clk <= ~clk;
    end
  end
  integer i;
  initial begin
    $dumpfile("s2p.vcd");
    $dumpvars(1,dut);
    $finish;
  end
endmodule
