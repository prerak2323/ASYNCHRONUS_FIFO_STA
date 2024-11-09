create_clock -name CLK -period 1000 [get_ports wclk]
set_input_delay 5 -clock CLK [get_ports full]
set_input_delay 5 -clock CLK [get_ports data_in]
set_input_delay 5 -clock CLK [get_ports raddr]
set_input_delay 5 -clock CLK [get_ports waddr]

set_output_delay 5 -clock CLK [get_ports data_out]





