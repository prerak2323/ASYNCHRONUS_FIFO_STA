
create_clock -name CLK1 -period 1000 [get_ports wclk]
create_clock -name CLK2 -period 2000 [get_ports rclk]

set_input_delay 5 -clock CLK1 [get_ports w_en]
set_input_delay 5 -clock CLK2 [get_ports r_en]
set_input_delay 5 -clock CLK2 [get_ports rrst_n]
set_input_delay 5 -clock CLK1 [get_ports wrst_n]

set_input_delay 5 -clock CLK1 [get_ports data_in]
set_output_delay 5 -clock CLK2 [get_ports data_out]
set_output_delay 5 -clock CLK1 [get_ports full]
set_output_delay 5 -clock CLK1 [get_ports empty]
