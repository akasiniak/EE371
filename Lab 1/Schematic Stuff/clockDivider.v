module clockDivider(clkOut, clkIn);
	input clkIn;
	output clkOut;
	
	initial
	 counter <= 0;
	
	reg [31:0] counter;
	always@(posedge clkIn) begin
		counter <= counter + 1'b1;
	end
	assign clkOut = counter[25];
endmodule
