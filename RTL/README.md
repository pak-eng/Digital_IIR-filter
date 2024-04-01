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
This directory contains all rtl-source files, testbench file, netlists after logical and physical synthesizes as well as back annotation in .sdf-file (Standard Delay Format) and design layout in .def-file (Design Exchange File).

The short description of ASIC source files:
* **_filter_top.sv_** - top level of filter; 
* **_<span>Z1toZ3</span>.sv_** - input downsampling module; 
* **_FIR_section.sv_** - structural-level description of Finite Impulse Response part of filter; 
* **_IIR_section.sv_** - structural-level description of Infinite Impulse Response part of filter; 
* **_OUT_MUX.sv_** - output upsamling module; 
* **_filter_coeffs.sv_** - module contatining all filter constants (**_a_**'s and **_b_**'s in equation below); 
* **_op_sum.sv_** - file contatining all accumulator module descriptions; 
* **_op_mult.sv_** - file contatining all multiplication module descriptions. 

Top-level architecture is presented below.
![RTL_Architecture](../README_Images/RTL_Architecture.png)
(_fs_ and _fs/3_ denotes sample rates at different stages of a design.)

To illustrate **_FIR_section.sv_** and **_IIR_section.sv_** structure, imagine we have a filter with transform function in z-domain, that looks like this:
<img src="..\README_Images\Filter_H.png" alt="Filter" height="50"/> <br>
We can rewrite the equation like this, splitting it in two parts:
<img src="..\README_Images\Filter_H_factorized.png" alt="FIR" height="50"/> <br>

<table>
    <tr>
        <td>Basic sctructure of FIR-filter is presented below for <i><b>M</b>=2</i></td>
        <td>Basic sctructure of IIR-filter is presented below for <i><b>N</b>=2</i></td>
    </tr>
    <tr>
        <td> <img src="..\README_Images\Basic_FIR.png" alt="FIR"/> </td>
        <td> <img src="..\README_Images\Basic_IIR.png" alt="IIR"/> </td>
    </tr>
</table>

To better suit parallel-filter architecture, slight alterations have been made to the basic structures. 

# How to synthesize ASIC layout from RTL-design:
Firstly make directories for logs and temporary files in project root (this directoy)
**_mkdir Encounter RTL_Compiler_**
## Logical Synthesis
Secondly do a logical synthesis in RTL-Compiler
Go to new directiry 
**_cd /RTL_Compiler_**
Run script
**_RTL_Compiler ../Scripts/filter_syn.tcl_**
## Physical Synthesis
Finally do a physical synthesis in Encounter
Go to new directory 
**_cd ../Encounter_**
Run script
**_Encounter ../Scripts/filter_PaR.tcl_**