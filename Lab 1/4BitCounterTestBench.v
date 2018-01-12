// Generic test module for 4-bit decrementing counter.
module test_4_bit_counter;
  reg in, reset, clk;
  wire [0:4] out;

  parameter period = 100;

  test module_name (in, reset, clk, out); // Subject to change.

  initial clk = 1;
  always begin
    #(period/2);
    clk = ~clk;
  end

  initial begin
    reset <= 0; in <= 1;  @(posedge clk);   // Reset activated, should not decrement
                          @(posedge clk);
                          @(posedge clk);
    reset <= 1; in <= 0;  @(posedge clk);   // Reset deactivated; no input, should not decrement
                          @(posedge clk);
                          @(posedge clk);
    in <= 1;              @(posedge clk);   // Input; should decrement
                          @(posedge clk);
                          @(posedge clk);
                          @(posedge clk);
                          @(posedge clk);
                          @(posedge clk);
                          @(posedge clk);
                          @(posedge clk);
                          @(posedge clk);
    in <= 0;              @(posedge clk); // No input; should not decrement
                          @(posedge clk);
                          @(posedge clk);
    $stop();
  end

endmodule
