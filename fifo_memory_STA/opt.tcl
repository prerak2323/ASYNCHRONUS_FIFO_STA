# Read the necessary Verilog files
#read_verilog async_fifo.v
#read_verilog cdc.v
read_verilog fifo_memory.v
read_verilog register_bank.v
#read_verilog b2g.v
#read_verilog rptr_handler.v
#read_verilog wptr_handler.v

# Set the top module (replace async_fifo with the actual top module name)
#hierarchy -top async_fifo
hierarchy -top fifo_memory
# Perform generic optimizations
proc
clean

opt

share -aggressive

# Apply technology mapping
techmap
dfflibmap -liberty ../NangateOpenCellLibrary_typical.lib
#dfflibmap -liberty toy.lib
# Use ABC tool for logic optimization with Liberty file
abc -liberty ../NangateOpenCellLibrary_typical.lib
#abc -liberty toy.lib
# Clean up the design
clean

# Print statistics about the current design state
stat -liberty ../NangateOpenCellLibrary_typical.lib
#stat -liberty toy.lib

# Generate SVG visualization for the specified top module
show -format svg -prefix fifo_mem fifo_memory  # Specify top module here

# Write the final Verilog netlist without attributes, expressions, hexadecimal, or decimal
write_verilog -noattr -noexpr -nohex -nodec fifo_memory_netlist.v
