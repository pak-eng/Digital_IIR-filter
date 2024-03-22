# This directory contains four subdirectories:
* **_/Logs_**,
* **_/Reports_**,
* **_/Scripts_**,
* **_/Source_**.

## _/Logs_ 
This directory contains logs of final synthesis tools (RTL-Compiler amd Encounter) runs. 

## _/Reports_ 
This directory contains all reports from every stage of synthesis: 
* **_/0_RTL_Compiler_** - directory has area and timing reports after logical synthesis;
* **_/1_Encounter_** - directory has area and timing reports after each stage of physical synthesis;
* **_/2_Virtuoso_** - directory has DRC and LVS analyses reports done at sign-off stage.

## _/Scripts_ 
This directory contains all scripts used during synthesis including:
* **_DUT_LOF.tcl_** - a list of files with all files of design under test to compile; 
* **_filter.sdc_** - design constraint file used in RTL-Compiler;
* **_filter_syn.tcl_** - script for automatic logical synthesis in RTL-Compiler; 
* **_filter_PaR.tcl_** - script for automatic physical synthesis in Encounter;
* **_MMMC.tcl_** - Multi-Mode-Multi-Corner file refered in Place and Route script (_filter_PaR_)
* **_IO_assignment_** - file with ASIC IO-pads position assignment.

## _/Source_ 
This directory contains all rtl-source files, testbench file, netlists after logical and physical synthesizes as well as back annotation in sdf-file and design in def-file.

# How to synthesize ASIC layout from RTL-design:
Firstly make directories for logs and temporary files in project root (this directory) <br />
**_mkdir Encounter RTL_Compiler_**

## Logical Synthesis
Secondly do a logical synthesis in RTL-Compiler
- Go to new directory <br />
**_cd /RTL_Compiler_**
- Run script <br />
**_RTL_Compiler ../Scripts/filter_syn.tcl_**

## Physical Synthesis
Finally do a physical synthesis in Encounter
- Go to new directory <br />
**_cd ../Encounter_** 
- Run script <br />
**_Encounter ../Scripts/filter_PaR.tcl_**
