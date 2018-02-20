module bitSampleCount(clockControl, bitIncrementControl, enable, clk, reset);
  output reg clockControl, bitIncrementControl;
  input wire enable, clk, reset;
  reg [3:0] count;
  always@(posedge clk) begin
    if(reset) begin
      clockControl <= 1'b0;
      count <= 4'b0000;
      bitIncrementControl <= 1'b0;
    end else begin
      if(enable) begin
        clockControl <= count[3];
        if(count == 4'b1111)begin
          count <= 4'b0000;
          bitIncrementControl = 1'b1;
        end else begin
          count <= count + 1'b1;
          bitIncrementControl <= 4'b0000;
        end
      end else begin
        clockControl <= 1'b0;
        count <= 4'b0000;
        bitIncrementControl = 1'b0;
      end
    end
  end
endmodule
