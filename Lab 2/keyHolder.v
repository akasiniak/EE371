module keyHolder(outputKey, inputKey, clk);
  input wire clk, inputKey;
  output reg outputKey;
  always @ (posedge clk) begin
    case(outputKey)
      1'b0: begin
        if(inputKey) begin
          outputKey = 1'b1;
        end
      end
      default: begin
        outputKey = 1'b0;
      end
    endcase
  end
endmodule

module keyHolder_testbench;
  reg clk, inputKey;
  wire outputKey;
  keyHolder dut (outputKey, inputKey, clk);
  parameter ClockDelay = 2;
  initial begin //setup the clock
    clk <= 0;
    forever begin
      #(ClockDelay/2);
      clk <= ~clk;
    end
  end
  initial begin
    $dumpfile("keyHolder.vcd");
    $dumpvars(1,dut);
    inputKey = 1'b0; #ClockDelay;
    inputKey = 1'b1; #ClockDelay;
    #ClockDelay;
    #ClockDelay;
    inputKey = 1'b0; #ClockDelay;
    #ClockDelay;
    $finish;
  end
endmodule
