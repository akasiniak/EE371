module startBitDetect(startBitDetected, characterReceived, data, clk, reset);
  output reg startBitDetected;
  input wire characterReceived, data, clk, reset;

  reg readingData;


  always@(posedge clk) begin
    if(reset) begin
      startBitDetected = 1'b0;
      readingData = 1'b0;
    end else begin
      startBitDetected <= readingData;
    end
  end

  always@(*) begin
    case(readingData)
      1'b1: begin
        if(characterReceived) begin
          readingData = 1'b0;
        end
      end
      1'b0: begin
        if(!data) begin
          readingData = 1'b1;
        end
      end
      default: begin
        readingData = 1'b0;
      end
    endcase
  end
endmodule
