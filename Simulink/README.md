# This directory contains two subdirectories:
* **_/SL_to_SV_(HDL_CODER)_**,
* **_/TestData_Generation_**.

## _/SL_to_SV_(HDL_CODER)_
First one is used to convert Simulink model to Verilog with HDL Coder utility.
To do that:
&nbsp;&nbsp;&nbsp;&nbsp;1) run **_Init.m_**
&nbsp;&nbsp;&nbsp;&nbsp;2) in opened Simulink model of testbench (**_FP_sub_**):
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;right click subsystem **_fp_model_**
&nbsp;&nbsp;&nbsp;&nbsp;3) in a context menu:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**HDL Code** -> **Generate HDL for Subsystem**.

## _/TestData_Generation_
Second subdirectory is used to generate reference data for RTL simulation.
To do that run **_TestDataGen.m_**.
		
# <ins>All files for Simulink are for 2023 version of the program, but files for older version (2017) are included as well.</ins>