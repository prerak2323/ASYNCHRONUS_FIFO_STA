create_clock -name CLK -period 1000 [get_ports clk]
set_input_delay 5 -clock CLK [get_ports in]
set_output_delay 5 -clock CLK [get_ports qb2]
set_input_transition 100 [get_ports in]
