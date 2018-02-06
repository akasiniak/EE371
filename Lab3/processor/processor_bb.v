
module processor (
	clk_clk,
	reset_reset_n,
	switches_pio_external_connection_export,
	led_pio_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	input	[9:0]	switches_pio_external_connection_export;
	output	[9:0]	led_pio_external_connection_export;
endmodule
