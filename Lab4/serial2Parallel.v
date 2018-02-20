module serial2Parallel(outputParallelData, inputSerialData, clk);
  output reg [7:0]  outputParallelData;
  input wire        inputSerialData, clk;

  reg [7:0] outputData;
  reg       inputData;
  integer   bitCount;

  always@(posedge clk) begin
    if (bitCount > 10) begin
      outputParallelData <= outputData;
      bitCount <= 0;
    end else /* if (bitCount > 1 || bitCount < 10) */ begin
      inputData <= inputSerialData;
      outputData[bitCount - 1] <= inputData;
    end
    bitCount <= (bitCount + 1);
  end
endmodule
