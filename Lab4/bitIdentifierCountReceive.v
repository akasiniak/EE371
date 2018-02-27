module bitIdentifierCountReceive(characterReceived, enable, bitReceived, bitCount, clk, reset);
  output reg characterReceived;
  input wire enable, bitReceived, clk, reset;
  output reg [3:0] bitCount;
  reg characterReceivedState;
  always@(posedge clk) begin
    if(reset) begin
      characterReceived <= 1'b0;
      bitCount <= 4'b000;
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
        if(bitCount == 4'b1010 && enable) begin
          characterReceivedState = 1'b1;
        end
      end
      default: begin
        characterReceivedState = 1'b0;
      end
    endcase
  end
endmodule