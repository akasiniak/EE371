// To test
module EE_371_Project_2(LEDR, SW, KEY, CLOCK_50);
	output [6:0] LEDR;
	input  [3:0] SW;
	input  [2:0] KEY;
	input  CLOCK_50;
	
	always@(*) begin
		LEDR[0] = SW[0];
		LEDR[1] = SW[1];
	end
	
	outerDoor outDoor(LEDR[2], SW[2], LEDR[3], LEDR[4], KEY[0], CLOCK_50);
	innerDoor inDoor(LEDR[3], SW[3], LEDR[2], LEDR[4], KEY[0], CLOCK_50);
	pressurizer p(LEDR[4], LEDR[2], LEDR[3], KEY[1], KEY[2], KEY[0], CLOCK_50);
	// Wrong order for LEDR?
	bathysphere sub(LEDR[5:6], LEDR[3], LEDR[2], LEDR[0], LEDR[1]);
endmodule 

module EE_371_Project_2_Testbench;
	wire [6:0] LEDR;
	wire [3:0] SW;
	wire [2:0] KEY;
	wire clk;
	
	EE_371_Project_2 test(LEDR, SW, KEY, clk);
	
	parameter ClockDelay = 2;
   initial begin
		clk <= 0;
		forever begin
			#(ClockDelay/2);
			clk <= ~clk;
		end
	end
	
	initial begin
		$dumpfile("EE_371_Project_2.vcd");
		$dumpvars(1, test);
		// Reset
		#ClockDelay;
		KEY <= 3'b011;
		SW <= 4'b0000;
		// 
		#ClockDelay;
		KEY <= 3'b111;
		SW <= 4'b1000;
		
		#ClockDelay;
		SW <= 4'b;
		
		#ClockDelay;
		KEY <= 3'b111;
		SW <= 2'b00;
		
		#ClockDelay;
		KEY <= 3'b111;
		SW <= 2'b00;
		
		#ClockDelay;
		KEY <= 3'b111;
		SW <= 2'b00;
		
		#ClockDelay;
		KEY <= 3'b111;
		SW <= 2'b00;
		
		#ClockDelay;
		KEY <= 3'b111;
		SW <= 2'b00;
		
		#ClockDelay;
		KEY <= 3'b111;
		SW <= 2'b00;
		
		
		

	$finish;
  end
	

endmodule 