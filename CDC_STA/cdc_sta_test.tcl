read_liberty ../NangateOpenCellLibrary_typical.lib
read_verilog cdc_netlist.v
link_design cdc
read_sdc syncA_cdc.sdc
