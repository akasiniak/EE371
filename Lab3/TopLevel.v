module TopLevel(LEDR, SW, KEY, CLOCK_50);
	output reg [9:0] LEDR;
	input wire [9:0] SW;
	input wire [2:0] KEY;
	input wire CLOCK_50;
	
	processor projectProcessor(CLOCK_50, LEDR[9:0], KEY[0], SW[9:0]); 
endmodule
