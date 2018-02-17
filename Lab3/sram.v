/*  This module implements SRAM based CY7C128A architecture
    that can hold approximately 16k bits (2k X 8) and has
    active low chip enable, active low write, and
    active low enable. */

module sram(data_out, data_in, addr, chipEnable, writeEnable, outputEnable);
  output reg  [7:0]   data_out;
  input wire  [7:0]   data_in;
  input wire  [10:0]  addr;
  input wire  chipEnable, writeEnable, outputEnable;

  /* 2048 X 8 RAM architecture */
  reg [7:0] mem [2047:0];

  always@(*) begin
    if (!chipEnable) begin
      if (!writeEnable) begin
        mem[addr] = data_in;
      end else if (!outputEnable) begin
        data_out = mem[addr];
      end
    end
  end

endmodule

/* Test writing to and reading from SRAM. */

module sram_testbench;
  wire  [7:0] data_out;
  reg   [7:0] data_in;
  reg   [10:0] addr;
  reg   chipEnable, writeEnable, outputEnable;

  sram sram_test(data_out, data_in, addr, chipEnable, writeEnable, outputEnable);
integer i;
  initial begin
    $dumpfile("sram.vcd");
    $dumpvars(1, sram_test);
    // Test 1: Should output all X's.
    chipEnable = 1'b0;
    writeEnable = 1'b0;
    outputEnable = 1'b1;
    for(i = 0; i < 2047; i++) begin
      addr = i;
      data_in = i % 255;
      #1;
    end
    writeEnable = 1'b1;
    outputEnable = 1'b0;
    for(i = 0; i < 2047; i++) begin
      addr = i;
      #1;
    end
  end

endmodule
