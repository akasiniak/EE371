	processor u0 (
		.characterreceived_external_connection_export (<connected-to-characterreceived_external_connection_export>), // characterreceived_external_connection.export
		.charactersent_external_connection_export     (<connected-to-charactersent_external_connection_export>),     //     charactersent_external_connection.export
		.clk_clk                                      (<connected-to-clk_clk>),                                      //                                   clk.clk
		.load_external_connection_export              (<connected-to-load_external_connection_export>),              //              load_external_connection.export
		.parallelinput_external_connection_export     (<connected-to-parallelinput_external_connection_export>),     //     parallelinput_external_connection.export
		.paralleloutput_external_connection_export    (<connected-to-paralleloutput_external_connection_export>),    //    paralleloutput_external_connection.export
		.reset_reset_n                                (<connected-to-reset_reset_n>),                                //                                 reset.reset_n
		.transmitenable_external_connection_export    (<connected-to-transmitenable_external_connection_export>)     //    transmitenable_external_connection.export
	);

