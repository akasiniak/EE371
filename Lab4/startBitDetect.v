//module that identifies the start bit of a sent character. allows the counting
//circuits to begin running.
module startBitDetect(startBitDetected, characterReceived, data, bitCount, clk, reset);
  output reg startBitDetected;
  input wire characterReceived, data, clk, reset;
  input wire [3:0] bitCount;

  reg readingData;

  always@(posedge clk) begin
    if(reset) begin
      startBitDetected = 1'b0;
      readingData = 1'b0;
    end else begin
      startBitDetected <= readingData;
    end
  end

  always@(*) begin //readingData is a state machine that keeps track of whether the start bit has been detected
    case(readingData)
      1'b1: begin
        if(bitCount == 0) begin //only stop reading when the entirety of the character has been received
          readingData = 1'b0;
        end
      end
      1'b0: begin
        if(!data) begin //begin reading when receiving the start bit
          readingData = 1'b1;
        end
      end
      default: begin
        readingData = 1'b0;
      end
    endcase
  end
endmodule

// module startBitDetect_testbench;
//   wire startBitDetected;
//   reg characterReceived, data, clk, reset;

//   startBitDetect dut(startBitDetected, characterReceived, data, clk, reset);

//   parameter ClockDelay = 2;
//   initial begin //setup the clock
//     clk <= 0;
//     forever begin
//       #(ClockDelay/2);
//       clk <= ~clk;
//     end
//   end

//   initial begin
//     $dumpfile("startBitDetect.vcd");
//     $dumpvars(1,dut);
//     reset <= 1'b1;
//     #ClockDelay;
//     reset <= 1'b0;
//     #ClockDelay;
//     data = 1'b1;
//     characterReceived = 1'b0;
//     #ClockDelay;
//     characterReceived = 1'b1;
//     #ClockDelay;
//     characterReceived = 1'b0;
//     data = 1'b0;
//     #ClockDelay;
//     #ClockDelay;
//     #ClockDelay;
//     characterReceived = 1'b1;
//     #ClockDelay;
//     $finish;
//   end
// endmodule
