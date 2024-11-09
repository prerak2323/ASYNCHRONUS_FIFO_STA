read_liberty ../NangateOpenCellLibrary_typical.lib
read_verilog fifo_memory_netlist.v
link_design fifo_memory
read_sdc fifo_mem.sdc
report_checks
