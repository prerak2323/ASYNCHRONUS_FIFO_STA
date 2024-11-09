read_liberty ../NangateOpenCellLibrary_typical.lib
read_verilog wptr_handler_netlist.v 
link_design wptr_handler
read_sdc wptr.sdc
report_checks
