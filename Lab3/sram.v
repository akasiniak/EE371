/*  This module implements SRAM based CY7C128A architecture
    that can hold approximately 16k bits (2k X 8) and has
    active low chip enable, active low write neable, and
    active low output enable. */

module sram(data_out, data_in, addr, chipEnable, writeEnable, outputEnable, clk)
  output reg  [7:0] data_out;
  input wire  [7:0] data_in;
  input wire  [10:0] addr;
  input wire  chipEnable, writeEnable, outputEnable, clk;

  /* 2048 X 8 RAM architecture */
  reg [7:0] mem [2047:0];

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
