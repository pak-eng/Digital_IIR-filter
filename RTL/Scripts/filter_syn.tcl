### Project name: Filter
### Author: P. P. Kolbenkov
### Technology: X-FAB 180nm CMOS, XH018 1143
### Library: D_CELLS_5V, 3.3 V
### Tools: RTL-Compiler 9.1
###
### Stage: Place & Route
### File description: TCL script for performing Place & Route
###
### Work Directory: <Project root>/RTL_Compiler
### Run command: RTL_Compiler ../Scripts/filter_syn.tcl

## Setup technology files
###include ../Scripts/D_CELLS_5V_typ.tcl
include ../Scripts/D_CELLS_5V_slow.tcl
###include ../Scripts/D_CELLS_5V_fast.tcl

## Read Verilog HDL files
include ../Scripts/DUT_LOF.tcl

## Compile our code (create a technology-independent schematic)
elaborate

## Setup design constraints
read_sdc ../Scripts/filter.sdc

## Synthesize our schematic (create a technology-dependent schematic)
#synthesize -to_generic
synthesize -to_mapped
synthesize -incremental

## Write out synthesized Verilog netlist
write_hdl -mapped > ../Source/Log_Syn_Res/filter_log_netlist.v

## Write out the SDC file we will take into the place n route tool
write_sdc > ../Source/Log_Syn_Res/filter_constraints.sdc

## Write out area and timing reports
report timing > ../Reports/0_RTL_Compiler/timing_report
report area > ../Reports/0_RTL_Compiler/area_report
report_timing -summary -full_pin_names -num_paths 50 > ../Reports/0_RTL_Compiler/timing_report_summaries
report_timing -full_pin_names -num_paths 5 > ../Reports/0_RTL_Compiler/timing_report_detailed

write_db -to_file ../Reports/0_RTL_Compiler/database.db

#gui_show
exit

