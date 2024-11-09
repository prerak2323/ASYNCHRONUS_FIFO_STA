create_clock -name CLK -period 1000 [get_ports rclk]
set_input_delay 5 -clock CLK [get_ports g_wptr]
set_input_delay 5 -clock CLK [get_ports rrst_n]
set_input_delay 5 -clock CLK [get_ports r_en]

set_output_delay 5 -clock CLK [get_ports raddr]
set_output_delay 5 -clock CLK [get_ports rptr]
set_output_delay 5 -clock CLK [get_ports empty]
