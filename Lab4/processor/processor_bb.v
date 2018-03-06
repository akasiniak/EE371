
module processor (
	characterreceived_external_connection_export,
	charactersent_external_connection_export,
	clk_clk,
	load_external_connection_export,
	parallelinput_external_connection_export,
	paralleloutput_external_connection_export,
	reset_reset_n,
	transmitenable_external_connection_export);	

	input		characterreceived_external_connection_export;
	input		charactersent_external_connection_export;
	input		clk_clk;
	output		load_external_connection_export;
	input	[7:0]	parallelinput_external_connection_export;
	output	[7:0]	paralleloutput_external_connection_export;
	input		reset_reset_n;
	output		transmitenable_external_connection_export;
endmodule
