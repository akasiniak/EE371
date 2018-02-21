module bitIdentifierCount(characterReceived, enable, bitReceived, clk, reset);
  output reg characterReceived;
  input wire enable, bitReceived, clk, reset;
  reg [3:0] bitCount;
  reg characterReceivedState;
  always@(posedge clk) begin
    if(reset || !enable) begin
      characterReceived <= 1'b0;
      bitCount <= 4'b0000;
    end else begin
      characterReceived <= characterReceivedState;
      if(enable && bitReceived) begin
        bitCount <= bitCount + 1'b1;
      end
    end
  end
  always@(*) begin
    case(characterReceivedState)
      1'b1: begin
        characterReceivedState = 1'b0;
      end
      1'b0: begin
        if(bitCount == 4'b0111 && enable) begin
          characterReceivedState = 1'b1;
        end
      end
      default: begin
        characterReceivedState = 1'b0;
      end
    endcase
  end
endmodule

module bitIdentifierCount_testbench;
  wire characterReceived;
  reg enable, bitReceived, clk, reset;

  bitIdentifierCount dut (characterReceived, enable, bitReceived, clk, reset);

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
    $dumpfile("bitIdentifierCount.vcd");
    $dumpvars(1,dut);
    reset <= 1'b1;
    bitReceived <= 1'b0;
    enable <= 1'b0;
    #ClockDelay;
    reset <= 1'b0;
    #ClockDelay;
    enable <= 1'b1;
    #ClockDelay;
    bitReceived = 1'b1;
    for(i = 0; i < 9; i++) begin
      #ClockDelay;
    end
    $finish;
  end
endmodule
