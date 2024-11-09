create_clock -name CLK -period 1000 [get_ports wclk]
set_input_delay 5 -clock CLK [get_ports g_rptr]
set_input_delay 5 -clock CLK [get_ports wrst_n]
set_input_delay 5 -clock CLK [get_ports w_en]

set_output_delay 5 -clock CLK [get_ports waddr]
set_output_delay 5 -clock CLK [get_ports wptr]
set_output_delay 5 -clock CLK [get_ports full]


