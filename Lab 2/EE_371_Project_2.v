// To test
`include "moveBathysphere.v"
`include "pressurizer.v"
`include "outerDoor.v"
`include "innerDoor.v"

module EE_371_Project_2(LEDR, SW, KEY, CLOCK_50);
	output reg [6:0] LEDR;
	input wire [3:0] SW;
	input wire [2:0] KEY;
	input wire CLOCK_50;
	wire [6:0] LEDRWires;


	always@(*) begin
		LEDR[0] = SW[0];
		LEDR[1] = SW[1];
		LEDR[6:2] = LEDRWires[6:2];
	end

	outerDoor outDoor(LEDRWires[2], SW[2], LEDRWires[3], LEDRWires[4], KEY[0], CLOCK_50);
	innerDoor inDoor(LEDRWires[3], SW[3], LEDRWires[2], LEDR[4], KEY[0], CLOCK_50);
	pressurizer p(LEDRWires[4], LEDRWires[2], LEDRWires[3], KEY[1], KEY[2], KEY[0], CLOCK_50);
	// Wrong order for LEDR?
	moveBathysphere sub(LEDRWires[6:5], LEDRWires[3], LEDRWires[2], LEDRWires[0], LEDRWires[1], CLOCK_50, KEY[0]);
endmodule

module EE_371_Project_2_Testbench;
	wire [6:0] LEDR;
	reg [3:0] SW;
	reg [2:0] KEY;
	reg clk;

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
		KEY[2:0] <= 3'b110;
		SW[3:0] <= 4'b0000;
		#ClockDelay;
		#ClockDelay;
		KEY[0] = 1'b1;
		SW[0] = 1'b1; //arriving
		#ClockDelay;
		#ClockDelay;
		#ClockDelay;
		SW[2] = 1'b1;
		#ClockDelay;
		#ClockDelay;
		KEY[1] = 1'b0;
		#ClockDelay;
		#ClockDelay;
		KEY[1] = 1'b1;
		#ClockDelay;
		#ClockDelay;
		#ClockDelay;
		#ClockDelay;
		#ClockDelay;
		#ClockDelay;
		#ClockDelay;
		#ClockDelay;
		$finish;
  end


endmodule
