read_liberty ../NangateOpenCellLibrary_typical.lib
read_verilog rptr_handler_netlist.v
link_design rptr_handler
read_sdc rptr.sdc
report_checks
