module DFlipFlop(q, qBar, D, clk, rst);
  input D, clk, rst;
  output q, qBar;
  reg q;
  not n1 (qBar, q);
  always@ (negedge rst or posedge clk) begin
    if(!rst)
      q = 0;
    else
      q = D;
  end
endmodule

/*module DFlipFlop_testbench;
  reg clk, D, rst;
  wire q, qBar;
  DFlipFlop myFlipFlop(q, qBar, D, clk, rst);
  parameter ClockDelay = 1;
  initial begin //setup the clock
    clk <= 0;
    forever begin
      #(ClockDelay);
      clk <= ~clk;
    end
  end

  initial begin
    $dumpfile("DFlipFlop.vcd");
    $dumpvars(1,myFlipFlop);
    rst = 1'b0; #10;
    rst = 1'b1; #10;
    D = 1'b1;  #10;
    D = 1'b0; #10;
    $finish;
  end
endmodule*/
