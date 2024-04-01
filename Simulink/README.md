# This directory contains two subdirectories:
* **_/SL_to_SV_(HDL_CODER)_**,
* **_/TestData_Generation_**.

## _/SL_to_SV_(HDL_CODER)_
First one is used to convert Simulink model to Verilog with HDL Coder utility.
To do that:
1. run **_Init.m_**
2. in opened Simulink model of testbench (**_FP_sub_**):
   * right click subsystem **_fp_model_**
3. in a context menu:
   * **HDL Code** -> **Generate HDL for Subsystem**.

## _/TestData_Generation_
Second subdirectory is used to generate reference data for RTL simulation.
To do that run **_TestDataGen.m_**.
		
## <ins>All files for Simulink are for 2023 version of the program, but files for older version (2017) are included as well.</ins>

### Simulink model synthesis based on filter parameters requirements is covered in **_Simulink_model_Development.pdf_**