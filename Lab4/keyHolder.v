module keyHolder(out, in, clk, controlledClock, reset);
	input wire in, clk, controlledClock, reset;
	output reg out;
	
	always@(posedge clk) begin
		if(reset) begin
			out <= 1'b1;
		end else begin 
			if(controlledClock && !out) begin
				out <= 1'b1;
			end else if(out && !in) begin
				out <= 1'b0;
			end else begin
				out <= out;
			end
		end
	end
endmodule

module keyHolder_testbench;
	reg in, clk, controlledClock, reset;
	wire out;
	
	keyHolder dut(out, in, clk, controlledClock, reset);
	parameter ClockDelay = 2;
	initial begin
		clk <= 0;
		forever begin
			#(ClockDelay/2);
			clk <=  ~clk;
		end
	end
	integer i;
	initial begin
		reset <= 1'b1;
		#ClockDelay;
		reset <= 1'b0;
		#ClockDelay;
		in <= 1'b0;
		#ClockDelay;
		in <= 1'b1;
		#ClockDelay;
		#ClockDelay;
		controlledClock <= 1'b1;
		#ClockDelay;
		#ClockDelay;
		controlledClock <= 1'b0;
		#ClockDelay;
		in <= 1'b0;
		#ClockDelay;
		controlledClock <= 1'b1;
		#ClockDelay;
		in <= 1'b1;
		#ClockDelay;
		#ClockDelay;
		$stop;
	end
endmodule
