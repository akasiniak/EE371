module bitSampleCount(clockControl, enable, clk, reset);
  output reg clockControl;
  input wire enable, clk, reset;
  reg [3:0] count;
  always@(posedge clk) begin
    if(reset) begin
      clockControl <= 1'b0;
      count <= 4'b0000;
    end else begin
      if(enable) begin
        if(count == 4'b0111) begin
          clockControl <= 1'b1;
        end else begin
          clockControl <= 1'b0;
        end
        count <= count + 1'b1;
      end else begin
        clockControl <= 1'b0;
        count <= 4'b0000;
      end
    end
  end
endmodule

module bitSampleCount_testbench;
  input reg enable, clk, reset;
  output wire clockControl;
  
endmodule
