module meomry2kx8 (data_out, data_in, addr, chipEnable, writeEnable, outputEnable, clk)

  output reg  [8:0] data_out;
  input wire  [7:0] data_in;
  input wire  [10:0] addr;
  input wire chipEnable, writeEnable, outputEnable, clk;

  reg [7:0] mem [10:0];

  always@(posedge clk) begin
    if (!chipEnable) begin
      if (!writeEnable) begin
        mem[addr] <= data_in;
      end else if (!outputEnable) begin
        data_out <= mem[addr];
      end
    end
  end
  
endmodule
