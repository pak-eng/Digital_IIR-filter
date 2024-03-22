##############################################################################################################
#####  
#####                                         PVS LVS COMPARISON
#####  
#####  Version                       :   15.22-s262
#####  NVN Run Start                 :   Sat Mar  5 18:20:19 2022
#####  ERC Summary File              :   filter_top.sum
#####  Extraction Report File        :   filter_top_lvs.sum
#####  Comparison Report File        :   filter_top_lvs.sum.cls
#####  Top Cell                      :   filter_top  <vs>  filter_top
#####  
#####  Run Result                    :   MATCH
#####  
#####  Run Summary                   :   [INFO]  ERC Results: Empty
#####                                :   [INFO]  Extraction Clean
#####  
#####  Layout Design                 :   filter_verif filter_top layout
#####  Schematic File                :   /home/student6/Kolbenkov_PP/Digital_ASIC/Virtuoso/PvsLVS/filter_top/filter_top.cdl (cdl)
#####  Rules File                    :   .config.rul .technology.rul
#####  Pin Swap File                 :   filter_top_lvs.sum.cps
#####  
#####  Extraction CPU Time           :   0h 0m 13s - (13s)
#####  Extraction Exec Time          :   0h 0m 13s - (13s)
#####  Extraction Peak Memory Usage  :   121.00MB
#####  NVN CPU Time                  :   0h 0m 8s - (8s)                 
#####  NVN Exec Time                 :   0h 0m 9s - (9s)                 
#####  NVN Peak Memory Usage         :   259.81MB
#####  LVS Total CPU Time            :   0h 0m 21s - (21s)               
#####  LVS Total Exec Time           :   0h 0m 22s - (22s)               
#####  LVS Total Peak Memory Usage   :   259.81MB
#####  
##############################################################################################################


##############################################################################################################
#
#                                            CELL MATCH STATISTICS                                            
#
##############################################################################################################

Cell Statistic Descriptions                  | Count
---------------------------------------------+----------
Cells matched                                |         1
Cells expanded                               |         0
Cells not run                                |         0
Cells which mismatch                         |         0
---------------------------------------------+----------
Total                                        |         1


Cell Statistic Detail                        | Count
---------------------------------------------+----------
Cells with parameter mismatches              |         0
Cells with mismatched instance subtypes      |         0
Cells that have been blackboxed              |         0


##############################################################################################################
#
#                                             CELL MATCH SUMMARY                                              
#
##############################################################################################################

               |     Initial Pins     |     Compare Pins     |            | 
Cell           |   lay    :    sch    |   lay    :    sch    | Status     | Detail
---------------+----------+-----------+----------+-----------+------------+-----------
filter_top     |      *27 :        25 |       27 :        27 | match      | 


##############################################################################################################
#
#                                                  LVS RULES                                                  
#
##############################################################################################################

Command Line LVS Rule Values
----------------------------

    layout_primary                          filter_top {-top_cell filter_top}
    schematic_primary                       filter_top {-source_top_cell filter_top}

LVS Rules Given in the Rules File
---------------------------------

    lvs_abort                               -softchk      no  
    lvs_abort                               -supply_error no  
    layout_path                             /home/student6/Kolbenkov_PP/Digital_ASIC/Virtuoso/PvsLVS/filter_top/filter_top.gds
    layout_format                           gdsii
    schematic_path                          /home/student6/Kolbenkov_PP/Digital_ASIC/Virtuoso/PvsLVS/filter_top/filter_top.cdl
    schematic_format                        cdl
    lvs_write_netlist                       -layout netlistLAYOUT
    lvs_write_netlist                       -schematic netlistSOURCE
    lvs_spice                               yes -replicate_devices
    lvs_spice_multiplier_name               M 
                                             
    lvs_power_name                          VDD? DVDD VCC VDDA VDDB ADVDD VDDM 
    lvs_ground_name                         GND? DVSS VSS GROUND AGND DGND VSSM 
    lvs_device_type                         PMOS PE_5
    lvs_device_type                         PMOS PEL_5
    lvs_device_type                         PMOS PE5_5
    lvs_device_type                         LDDNMOS NHSJ1_7
    lvs_device_type                         LDDNMOS NHSJ1_10
    lvs_device_type                         LDDNMOS NHSJ1_16C
    lvs_device_type                         LDDNMOS NHVTA
    lvs_device_type                         LDDNMOS NHVTB
    lvs_device_type                         LDDNMOS NHVU
    lvs_device_type                         LDDNMOS NDHVT
    lvs_device_type                         LDDNMOS NDHVTA
    lvs_device_type                         LDDPMOS PHSJ1_7
    lvs_device_type                         LDDPMOS PHSJ1_10
    lvs_device_type                         LDDPMOS PHSJ1_16C
    lvs_device_type                         LDDPMOS PHVTA
    lvs_device_type                         LDDPMOS PHVTB
    lvs_device_type                         LDDPMOS PHVU
                                             
    lvs_all_cap_pins_swappable              no  
    lvs_ignore_ports                        no  
    lvs_compare_port_names                  yes 
    lvs_find_shorts                         no  
    lvs_break_ambig_max                     32
                                             
    lvs_filter                              no  -bipolar
    lvs_filter                              no  -mos
    lvs_filter                              no  -resistors
    lvs_filter                              no  -diodes
    lvs_filter                              no  -capacitors
    lvs_filter_device                       D ( p_dn ) -open
    lvs_filter_device                       D ( p_dnn ) -open
    lvs_filter_device                       D ( p_dp ) -open
    lvs_filter_device                       D ( p_dn5 ) -open
    lvs_filter_device                       D ( p_dnn5 ) -open
    lvs_filter_device                       D ( p_dp5 ) -open
    lvs_filter_device                       D ( p_dnw ) -open
    lvs_filter_device                       D ( p_dnw5 ) -open
    lvs_filter_device                       D ( p_dnw5mva ) -open
                                             
    lvs_reduce_split_gates                  no  
    lvs_recognize_gates                     -all
    lvs_recognize_gates                     -none
    lvs_reduce                              no  -parallel_bipolar
    lvs_reduce                              no  -parallel_caps
    lvs_reduce                              yes -parallel_diodes ...
    lvs_reduce                              yes -parallel_mos ...
    lvs_reduce                              no  -series_mos
    lvs_reduce                              no  -parallel_resistors
    lvs_reduce                              no  -series_caps
    lvs_reduce                              no  -series_resistors
    lvs_reduce_device                       D ( dhw2 ) -parallel no 
    lvs_reduce_device                       D ( dhw2a ) -parallel no 
    lvs_reduce_device                       D ( dhw3 ) -parallel no 
    lvs_reduce_device                       D ( dfwnsj1_7 ) -parallel yes ...
    lvs_reduce_device                       D ( dfwnsj1_10 ) -parallel yes ...
    lvs_reduce_device                       D ( dfwnsj1_16c ) -parallel yes ...
    lvs_reduce_device                       D ( dfwdpa ) -parallel yes ...
    lvs_reduce_device                       D ( dfwdnt ) -parallel yes ...
    lvs_reduce_device                       D ( dfwdnu ) -parallel yes ...
    lvs_reduce_device                       D ( dzbti ) -parallel yes ...
    lvs_reduce_device                       tag_200v -parallel yes 
    lvs_reduce_device                       tag_100v -parallel yes 
    lvs_reduce_device                       tag_60v -parallel yes 
    lvs_reduce_device                       tag_25v -parallel yes 
    lvs_reduce_device                       tag_m200v -parallel yes 
    lvs_reduce_device                       tag_m100v -parallel yes 
    lvs_reduce_device                       tag_m60v -parallel yes 
    lvs_reduce_device                       tag_m25v -parallel yes 
                                             
    lvs_expand_cell_on_error                no  
                                             
    lvs_check_property                      MN W W -tolerance 1
    lvs_check_property                      MN L L -tolerance 1
    lvs_check_property                      MP W W -tolerance 1
    lvs_check_property                      MP L L -tolerance 1
    lvs_check_property                      LDDN W W -tolerance 1
    lvs_check_property                      LDDN L L -tolerance 1
    lvs_check_property                      LDDP W W -tolerance 1
    lvs_check_property                      LDDP L L -tolerance 1
    lvs_check_property                      R W W -tolerance 1
    lvs_check_property                      R L L -tolerance 1
    lvs_check_property                      C AREA AREA -tolerance 1
    lvs_check_property                      C PERIMETER PERIMETER -tolerance 1
    lvs_check_property                      D A A -tolerance 5
    lvs_check_property                      D P P -tolerance 5
    lvs_check_property                      D ( dfwnsj1_7 ) A A -tolerance 1
    lvs_check_property                      D ( dfwnsj1_7 ) P P -tolerance 1
    lvs_check_property                      D ( dfwnsj1_7 ) m m -tolerance 0
    lvs_check_property                      D ( dfwnsj1_10 ) A A -tolerance 1
    lvs_check_property                      D ( dfwnsj1_10 ) P P -tolerance 1
    lvs_check_property                      D ( dfwnsj1_10 ) m m -tolerance 0
    lvs_check_property                      D ( dfwnsj1_16c ) A A -tolerance 1
    lvs_check_property                      D ( dfwnsj1_16c ) P P -tolerance 1
    lvs_check_property                      D ( dfwnsj1_16c ) m m -tolerance 0
    lvs_check_property                      D ( dfwdpa ) A A -tolerance 1
    lvs_check_property                      D ( dfwdpa ) P P -tolerance 1
    lvs_check_property                      D ( dfwdpa ) m m -tolerance 0
    lvs_check_property                      D ( dfwdnt ) A A -tolerance 1
    lvs_check_property                      D ( dfwdnt ) P P -tolerance 1
    lvs_check_property                      D ( dfwdnt ) m m -tolerance 0
    lvs_check_property                      D ( dfwdnu ) A A -tolerance 1
    lvs_check_property                      D ( dfwdnu ) P P -tolerance 1
    lvs_check_property                      D ( dfwdnu ) m m -tolerance 0
    lvs_check_property                      D ( dzbti ) A A -tolerance 1
    lvs_check_property                      D ( dzbti ) P P -tolerance 1
    lvs_check_property                      D ( dzbti ) m m -tolerance 0
    lvs_check_property                      Q ( qnv5 ) LE LE -tolerance 0
    lvs_check_property                      Q ( qpv5 ) LE LE -tolerance 0
    lvs_check_property                      NHSJ1_7 L L -tolerance 1
    lvs_check_property                      NHSJ1_7 W W -tolerance 1
    lvs_check_property                      NHSJ1_10 L L -tolerance 1
    lvs_check_property                      NHSJ1_10 W W -tolerance 1
    lvs_check_property                      NHSJ1_16C L L -tolerance 1
    lvs_check_property                      NHSJ1_16C W W -tolerance 1
    lvs_check_property                      PHSJ1_7 L L -tolerance 1
    lvs_check_property                      PHSJ1_7 W W -tolerance 1
    lvs_check_property                      PHSJ1_10 L L -tolerance 1
    lvs_check_property                      PHSJ1_10 W W -tolerance 1
    lvs_check_property                      PHSJ1_16C L L -tolerance 1
    lvs_check_property                      PHSJ1_16C W W -tolerance 1
    lvs_check_property                      PE_5 L L -tolerance 1
    lvs_check_property                      PE_5 W W -tolerance 1
    lvs_check_property                      PEL_5 L L -tolerance 1
    lvs_check_property                      PEL_5 W W -tolerance 1
    lvs_check_property                      PE5_5 L L -tolerance 1
    lvs_check_property                      PE5_5 W W -tolerance 1
    lvs_check_property                      NHVTA L L -tolerance 1
    lvs_check_property                      NHVTA W W -tolerance 1
    lvs_check_property                      NHVTB L L -tolerance 1
    lvs_check_property                      NHVTB W W -tolerance 1
    lvs_check_property                      NHVU L L -tolerance 1
    lvs_check_property                      NHVU W W -tolerance 1
    lvs_check_property                      NDHVT L L -tolerance 1
    lvs_check_property                      NDHVT W W -tolerance 1
    lvs_check_property                      NDHVTA L L -tolerance 1
    lvs_check_property                      NDHVTA W W -tolerance 1
    lvs_check_property                      PHVTA L L -tolerance 1
    lvs_check_property                      PHVTA W W -tolerance 1
    lvs_check_property                      PHVTB L L -tolerance 1
    lvs_check_property                      PHVTB W W -tolerance 1
    lvs_check_property                      PHVU L L -tolerance 1
    lvs_check_property                      PHVU W W -tolerance 1
    lvs_check_property                      NISJ1_16 L L -tolerance 1
    lvs_check_property                      NISJ1_16 W W -tolerance 1
    lvs_check_property                      MOSVC L L -tolerance 1
    lvs_check_property                      MOSVC W W -tolerance 1
    lvs_check_property                      MOSVCTI L L -tolerance 1
    lvs_check_property                      MOSVCTI W W -tolerance 1
    lvs_check_property                      MOSVC5 L L -tolerance 1
    lvs_check_property                      MOSVC5 W W -tolerance 1
    lvs_check_property                      MOSVC5TI L L -tolerance 1
    lvs_check_property                      MOSVC5TI W W -tolerance 1
    lvs_report_file                         filter_top_lvs.sum
    lvs_report_max                          1000 -mismatched_net_limit 100 
    unit                                    -length u
    unit                                    -capacitance ff
    unit                                    -resistance ohm
    input_scale                             1000
    virtual_connect                         no  -colon
    virtual_connect                         yes -semicolon_as_colon
    virtual_connect                         no  -report
    virtual_connect                         -depth primary
                                             

Default LVS Rule Values
-----------------------

    layout_case_sensitive                   no
    // layout_cpf_file                       
    // schematic_cpf_file                    
    schematic_case_sensitive                no
    // hcell_file                            
    // hcell                                 
    // lvs_exclude_hcell                     
    lvs_push_devices                        yes
    lvs_push_devices_properties             no
    lvs_netlist                             yes -substrate_comment
    lvs_netlist                             yes -box_contents
    lvs_netlist                             yes -unnamed_box_pins
    lvs_netlist                             no -allow_inconsistent_model
    // lvs_write_netlist_reduced             
    // lvs_delete_cell_pin                   
    // lvs_black_box                         
    lvs_spice                               yes -allow_floating_pins
    lvs_spice                               yes -allow_duplicate_subcircuit_names
    lvs_spice                               no  -conditional_ldd
    lvs_spice                               no  -prefer_pins
    lvs_spice                               no  -override_globals
    lvs_spice                               no  -redefine_param
    lvs_spice                               yes -replicate_devices_during_merging
    lvs_spice                               yes -slash_is_space
    lvs_spice                               yes -keep_back_slash
    lvs_spice                               no  -allow_unquoted_strings
    lvs_spice                               no  -allow_inline_parameters
    lvs_spice                               no  -calculate_mos_area
    lvs_spice                               no  -strict_wl
    lvs_spice                               no  -cull_primitive_subcircuits
    lvs_spice                               no  -ignore_option_scale
    lvs_spice                               no  -show_neg_param_warning
    lvs_spice                               no  -scale_x_parameters
    // lvs_spice_option                      
    lvs_reverse_wl                          no
                                             
    lvs_compare_case                        no
    lvs_cname                               no  -cell
    lvs_cname                               yes -pin
    lvs_cname                               yes -net
    lvs_cname                               no  -instance
    lvs_non_user_name                       -port "^[0-9]+$"
    lvs_non_user_name                       -net  "^[0-9]+$"
    // lvs_non_user_name                    -instance 
    lvs_out_of_range_exclude_zero           no
    // lvs_group_models                      
    lvs_strict_subtypes                     no
    // lvs_cpoint                            
    // lvs_cell_list                         
                                             
    lvs_auto_pin_swap                       yes -swap_threshold 4000000
    lvs_swap_non_cpoint_pins                yes
    // lvs_swap_pins                         
    lvs_builtin_device_pin_swap             yes
    // lvs_join_nets                         
    lvs_global_sigs_are_ports               yes
    lvs_discard_pins                        no
                                             
    // lvs_filter_option                     
                                             
    lvs_reduction_priority                  -parallel
    lvs_derive_logic                        yes -sram
    lvs_derive_logic                        no  -dram
    lvs_derive_logic                        no  -rom
    // lvs_recognize_gates_tolerance         
    lvs_reduce                              no  -series_diodes
    // lvs_reduce_do_not_merge               
                                             
    lvs_expand_on_device_climbing           no
    lvs_expand_unbalanced_cells             yes
                                             
    // lvs_property_map                      
    // lvs_report_opt                        
    lvs_report_units                        yes
    lvs_keep_data                           no
    lvs_keep_source_cells                   no
    lvs_create_match_db                     no
    // lvs_map_device                        
    lvs_verilog_bus_map_by_position         no
    lvs_verilog_keep_backslash              no
    lvs_do_not_normalize                    no
    // lvs_generic_device                    
    virtual_connect                         no  -colon
    virtual_connect                         yes -semicolon_as_colon
    // virtual_connect                      -name 
    virtual_connect                         no -report
    virtual_connect                         no -incremental
    lvs_preserve_parameterized_cells        no
    lvs_check_color                         no
    // lvs_schematic_color_path              
    // lvs_assign_conflict_layer             
    // lvs_conflict_layer_check             
    lvs_check_color_label                   no
                                             

Effective LVS Rule Values
-------------------------

    lvs_swap_non_cpoint_pins                yes -unbound_pin_threshold 10000
    lvs_derive_logic                        no   -sram
    lvs_recognize_gates                     -all
    virtual_connect                         no  -report


##############################################################################################################
#
#                                               CELL COMPARISON                                               
#
##############################################################################################################

                              +------------------------------------------------+
                              |                                                |
                              |        ------->>>   MATCH   <<<-------         |
                              |                                                |
                              |          filter_top  <vs>  filter_top          |
                              |                                                |
                              |                                                |
                              +------------------------------------------------+

+===[filter_top]==============================================================================================
|                                                 STATISTICS                                                  
+=============================================================================================================


                    |          Original          |          Filtered          |         Reduced          
Cell                |     lay      :     sch     |     lay      :     sch     |     lay     :    sch
--------------------+--------------+-------------+--------------+-------------+-------------+------------
MP [4 pins]         |              :             |              :             |             :            
 MP(PE5)            |     *124,649 :     118,162 |     *124,649 :     118,162 |           0 :           0
 MP:ParMos2#1       |            - :           - |            - :           - |       3,607 :       3,607
 MP:ParMos3#1   .  .|.  .  .  .  - :.  .  .  . - |.  .  .  .  - :.  .  .  . - |.  .   2,524 :.  .   2,524
 MP:SerMos2#1       |            - :           - |            - :           - |      15,681 :      15,681
 MP:SerMos3#1   .  .|.  .  .  .  - :.  .  .  . - |.  .  .  .  - :.  .  .  . - |.  .   9,185 :.  .   9,185
MN [4 pins]         |              :             |              :             |             :            
 MN(NE5)  .  .  .  .|.  . *122,858 :.  . 118,162 |.  . *122,858 :.  . 118,162 |.  .  .  . 7 :.  .  .  . 7
 MN:ParMos2#1       |            - :           - |            - :           - |       3,605 :       3,605
 MN:ParMos3#1   .  .|.  .  .  .  - :.  .  .  . - |.  .  .  .  - :.  .  .  . - |.  .   2,524 :.  .   2,524
 MN:SerMos2#1       |            - :           - |            - :           - |      15,677 :      15,677
 MN:SerMos3#1   .  .|.  .  .  .  - :.  .  .  . - |.  .  .  .  - :.  .  .  . - |.  .   9,183 :.  .   9,183
(D [2 pins], -)     |              :             |              :             |             :            
 (D(P_DNW5), -) .  .|.  .  .   *96 :.  .  .  . 0 |.  .  .  .  0 :.  .  .  . 0 |.  .  .  . - :.  .  .  . -
INV##               |            - :           - |            - :           - |      28,715 :      28,715
NAND##2   .  .  .  .|.  .  .  .  - :.  .  .  . - |.  .  .  .  - :.  .  .  . - |.  .   2,660 :.  .   2,660
NAND##3             |            - :           - |            - :           - |           4 :           4
NAND##4   .  .  .  .|.  .  .  .  - :.  .  .  . - |.  .  .  .  - :.  .  .  . - |.  .  .  . 9 :.  .  .  . 9
NOR##2              |            - :           - |            - :           - |       4,476 :       4,476
NOR##3 .  .  .  .  .|.  .  .  .  - :.  .  .  . - |.  .  .  .  - :.  .  .  . - |.  .  .  . 7 :.  .  .  . 7
OR##2               |            - :           - |            - :           - |       2,376 :       2,376
AND##2 .  .  .  .  .|.  .  .  .  - :.  .  .  . - |.  .  .  .  - :.  .  .  . - |.  .   2,248 :.  .   2,248
OAI##2              |            - :           - |            - :           - |       2,359 :       2,359
OAI##3 .  .  .  .  .|.  .  .  .  - :.  .  .  . - |.  .  .  .  - :.  .  .  . - |.  .  .   13 :.  .  .   13
AOI##2              |            - :           - |            - :           - |       2,128 :       2,128
AOI##3              |            - :           - |            - :           - |           7 :           7
--------------------+--------------+-------------+--------------+-------------+-------------+------------
Total               |      247,603 :     236,324 |      247,507 :     236,324 |     106,995 :     106,995
====================+==============+=============+==============+=============+=============+============
Pins                |              :             |              :             |          27 :          27
Nets                |              :             |              :             |      55,837 :      55,837
====================+==============+=============+==============+=============+=============+============

+===[filter_top]==============================================================================================
|                                      DEVICES REMOVED DURING REDUCTION                                       
+=============================================================================================================


                |      Parallel       |      Series       |     Deleted Nets     
Cell            |    lay    :   sch   |   lay   :   sch   |    lay    :   sch
----------------+-----------+---------+---------+---------+-----------+----------
MP [4 pins]     |           :         |         :         |           :          
 MP(PE5)        |     6,494 :       7 |       - :       - |         0 :         0
MN [4 pins]     |           :         |         :         |           :          
 MN(NE5)        |     4,710 :      14 |       - :       - |         0 :         0
----------------+-----------+---------+---------+---------+-----------+----------

+===[filter_top]==============================================================================================
|                                           INITIAL CORRESPONDENCES                                           
+=============================================================================================================

Type | Name
-----+--------------------------------------------------------------------------------------------------------
Pin  | clk clk_div_3 gnd! in<0> in<10> in<1> in<2> in<3> in<4> in<5> in<6> in<7> in<8> in<9> out<0> out<10>
     | out<1> out<2> out<3> out<4> out<5> out<6> out<7> out<8> out<9> reset vdd5!


##############################################################################################################
#
#                                                END OF REPORT                                                
#
##############################################################################################################

