module parallel2Serial(outputSerialData, inputParallelData, clk);
  output reg outputSerialData;
  input wire [9:0] inputParallelData, clk;

  reg       outputData;
  reg [9:0] inputData;
  integer   bitCount;

  always@(posedge clk) begin
    if (bitCount == 1) begin
      outputData <= 1'b1; // Start bit. To change?
    end else if (bitCount == 10) begin
      outputData <= 1'b1; // End bit. To change?
      bitCount <= 0;
    end else begin
      outputData <= inputParallelData[bitCount - 1];
    end
    outputSerialData <= outputData;
    bitCount <= (bitCount + 1);
  end
endmodule
