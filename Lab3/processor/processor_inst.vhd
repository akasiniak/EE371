	component processor is
		port (
			clk_clk                                 : in  std_logic                    := 'X';             -- clk
			reset_reset_n                           : in  std_logic                    := 'X';             -- reset_n
			switches_pio_external_connection_export : in  std_logic_vector(9 downto 0) := (others => 'X'); -- export
			led_pio_external_connection_export      : out std_logic_vector(9 downto 0)                     -- export
		);
	end component processor;

	u0 : component processor
		port map (
			clk_clk                                 => CONNECTED_TO_clk_clk,                                 --                              clk.clk
			reset_reset_n                           => CONNECTED_TO_reset_reset_n,                           --                            reset.reset_n
			switches_pio_external_connection_export => CONNECTED_TO_switches_pio_external_connection_export, -- switches_pio_external_connection.export
			led_pio_external_connection_export      => CONNECTED_TO_led_pio_external_connection_export       --      led_pio_external_connection.export
		);

