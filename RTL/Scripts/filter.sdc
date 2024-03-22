### Project name: Filter
### Author: P. P. Kolbenkov
### Technology: X-FAB 180nm CMOS, XH018 1143
### Library: D_CELLS_5V, 3.3 V
### Tools: RTL-Compiler 9.1
###
### Stage: Logical Synthesis
### File description: Design constraints
###
### Work Directory: <Project root>/RTL_Compiler
### Run command: RTL_Compiler ../Scripts/filter_syn.tcl

set_units -time ns -capacitance fF 

set CLK_PER 50.0
set DEL [expr $CLK_PER * 50.0 / 100.0]
set UNC [expr $CLK_PER * 6.0 / 100.0]

create_clock -name clk_obj -period $CLK_PER [get_ports clk]
create_clock -name clk_div_3_obj -period [expr $CLK_PER * 3.0] [get_ports clk_div_3]

set_input_delay $DEL -clock [get_clocks clk_obj] [get_ports reset]
set_input_delay $DEL -clock [get_clocks clk_obj] [get_ports in]
set_output_delay $DEL -clock [get_clocks clk_obj] [get_ports out]

set_clock_uncertainty $UNC [get_clocks clk_obj]
set_clock_uncertainty [expr $UNC * 3.0] [get_clocks clk_div_3_obj]

set_clock_groups -group [get_clocks clk_obj] -group [get_clocks clk_div_3_obj] -asynchronous 

set_load -pin_load 500 [get_ports out]
