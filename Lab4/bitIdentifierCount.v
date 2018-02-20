module bitIdentifierCount(characterReceived, enable, bitReceived, clk, reset);
  output reg characterReceived;
  input wire enable, bitReceived, clk, reset;
  reg [3:0] bitCount;
  reg characterReceivedState;
  always@(posedge clk) begin
    if(reset) begin
      characterReceived <= 1'b0;
    end else begin
      characterReceived <= characterReceivedState;
    end
  end
  always@(*) begin
    case(characterReceivedState)
      1'b1: begin
        characterReceivedState = 1'b0;
      end
      1'b0: begin
        if(bitReceived) begin
          bitCount <= bitCount + 1'b1;
        end
        if(bitCount == 4'b1000) begin
          characterReceivedState <= 1'b1;
          bitCount <= 4'b0000;
        end
      end
      default: begin
        bitCount <= 4'b0000;
        characterReceivedState <= 1'b0;
      end
    endcase
  end
endmodule
