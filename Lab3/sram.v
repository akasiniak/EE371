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

  initial begin
    $dumpfile("sram.vcd");
    $dumpvars(1, sram_test);
    // Test 1: Should output all X's.
    #10;
    data_in = 8'b11111111;
    addr = 11'b00000000000;
    chipEnable = 1'b0;
    writeEnable = 1'b1;
    outputEnable = 1'b1;
    #10;
    addr = 11'b00000000000;
    chipEnable = 1'b1;
    writeEnable = 1'b1;
    outputEnable = 1'b0; // Should output all X's.
    #10;
    outputEnable = 1'b1;
    // Test 2: Should output all X's.
    #10;
    data_in = 8'b11111111;
    addr = 11'b00000000000;
    chipEnable = 1'b1;
    writeEnable = 1'b0;
    outputEnable = 1'b1;
    #10;
    addr = 11'b00000000000;
    chipEnable = 1'b1;
    writeEnable = 1'b1;
    outputEnable = 1'b0; // Should output all X's.
    #10;
    outputEnable = 1'b1;
    #10;
    // Test 3: Should output all X's or 1's depending on memory address.
    data_in = 8'b11111111;
    addr = 11'b00000000000;
    chipEnable = 1'b0;
    writeEnable = 1'b0;
    outputEnable = 1'b1;
    #10;
    addr = 11'b11111111111;
    chipEnable = 1'b0;
    writeEnable = 1'b1;
    outputEnable = 1'b0; // Should output all X's.
    #10;
    addr = 11'b00000000000; // Should output all 1's.
    #10;
    outputEnable = 1'b1;
    #10;
  end

endmodule
