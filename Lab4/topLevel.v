module topLevel(LEDR, GPIOin, GPIOout, SW, KEY, CLOCK_50);
	output wire [9:0] LEDR;
	input wire [8:0] SW;
	input wire GPIOin;
	output wire GPIOout;
	input wire [2:0] KEY;
	input wire CLOCK_50;
	
	reg [31:0] counter;
	reg controlledClock;
	wire [1:0] heldKey;
	
	always@(posedge CLOCK_50) begin
		if(~KEY[2]) begin
			counter <= 32'd0;
			controlledClock <= 1'b0;
		end else begin
			counter <= counter + 1'b1;
			if(counter == 325) begin
				controlledClock <= 1'b1;
			end else if(counter == 650) begin
				controlledClock <= 1'b0;
				counter <= 32'd0;
			end
		end
	end
	
	keyHolder resetKey(heldKey[0], KEY[0], CLOCK_50, controlledClock, ~KEY[2]);
	keyHolder loadKey(heldKey[1], KEY[1], CLOCK_50, controlledClock, ~KEY[2]);
	networkHardware UART(~heldKey[0], controlledClock, SW[8], SW[7:0], ~heldKey[1], LEDR[7:0], LEDR[8], LEDR[9], GPIOin, GPIOout);
endmodule

module topLevel_testbench;
	wire [9:0] LEDR;
	reg [8:0] SW;
	wire GPIOin;
	wire GPIOout;
	reg [2:0] KEY;
	reg CLOCK_50;
	
	topLevel dut(LEDR, GPIOin, GPIOout, SW, KEY, CLOCK_50);
	
	assign GPIOin = GPIOout;
	parameter ClockDelay = 2;
	initial begin
		CLOCK_50 <= 0;
		forever begin
			#(ClockDelay/2);
			CLOCK_50 <=  ~CLOCK_50;
		end
	end
	integer i;
	initial begin
		KEY[2] <= 1'b0;
		#ClockDelay;
		KEY[2] <= 1'b1;
		#ClockDelay;
		KEY[0] <= 1'b0;
		SW[8] <= 1'b1;
		SW[7:0] <= 8'b01010101;
		#ClockDelay;
		KEY[0] <= 1'b1;
		#(ClockDelay * 700);
		KEY[1] <= 1'b0;
		#ClockDelay;
		KEY[1] <= 1'b1;
		#(ClockDelay * 1000000);
		SW[8] <= 1'b1;
		KEY[1] <= 1'b0;
		#ClockDelay;
		KEY[1] <= 1'b1;
		#(ClockDelay * 1000000);
		$stop;
	end
endmodule
