### Project name: Filter
### Author: P. P. Kolbenkov
### Technology: X-FAB 180nm CMOS, XH018 1143
### Library: D_CELLS_5V, 3.3 V
### Tools: Cadence Encounter 14.28
###
### Stage: Place & Route
### File description: TCL script for performing Place & Route
###
### Work Directory: <Project root>/Encounter
### Run command: Encounter ../Scripts/filter_PaR.tcl

#@(#)CDS: Encounter v14.28-s033_1 (64bit) 03/21/2016 13:34 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute v14.28-s005 NR160313-1959/14_28-UB (database version 2.30, 267.6.1) {superthreading v1.25}
#@(#)CDS: CeltIC v14.28-s006_1 (64bit) 03/08/2016 00:08:23 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.28-s002 (64bit) 03/21/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.28-s007_1 (64bit) Mar  7 2016 23:11:05 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.28-s006
#@(#)CDS: IQRC/TQRC 14.2.2-s217 (64bit) Wed Apr 15 23:10:24 PDT 2015 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_gnd_net VSS
set init_lef_file {/Cadence/Libs/X_FAB/XKIT/xt018/cadence/v5_0/techLEF/v5_0_2/xt018_xx43_MET4_METMID_METTHK.lef /Cadence/Libs/X_FAB/XKIT/xt018/diglibs/D_CELLS_5V/v5_0/LEF/v5_0_1/xt018_D_CELLS_5V.lef}
#set init_lef_file {/Cadence/Libs/X_FAB/XKIT/xt018/cadence/v5_0/techLEF/v5_0_2/xt018_xx43_MET4_METMID_METTHK.lef /Cadence/Libs/X_FAB/XKIT/xt018/diglibs/D_CELLS_5V/v4_0/LEF/v4_0_0/xt018_D_CELLS_5V.lef}
set init_design_settop 0
set init_verilog ../Source/Log_Syn_Res/filter_log_netlist.v
set init_mmmc_file ../Scripts/MMMC.tcl
set init_io_file ../Scripts/IO_assignment
set init_pwr_net VDD
#save_global ../Scripts/Eeencounter_ImprotDesignSet.globals
init_design
fit
puts {========================Import done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Import done

#suspend
getIoFlowFlag
setIoFlowFlag 0
floorPlan -fplanOrigin center -site core_5v -r 0.7 0.5 25 25 25 25
uiSetTool select
getIoFlowFlag
#floorplan -||- -r (Ratio) (Core Utilization) (Core to...) 
#floorPlan -fplanOrigin center -site core_5v -r 0.7 0.5 25 25 25 25 - Slack -0.121
fit
puts {========================Floorplan done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Floorplan done

clearGlobalNets
globalNetConnect VDD -type pgpin -pin vdd5 -inst *
globalNetConnect VSS -type pgpin -pin gnd -inst *
globalNetConnect VSS -type tielo -inst *
globalNetConnect VDD -type tiehi -inst *
fit
puts {========================Nets connection done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Nets connection done

set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer METTPL -type core_rings -jog_distance 3.15 -threshold 3.15 -nets {VSS VDD} -follow core -stacked_via_bottom_layer MET1 -layer {bottom MET1 top MET1 right MET2 left MET2} -width 3 -spacing {bottom 0.23 top 0.23 right 0.28 left 0.28} -offset 3.15
fit 
puts {========================Ring done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Ring done

#suspend
set sprCreateIeStripeNets {}
set sprCreateIeStripeLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeSpacing 2.0
set sprCreateIeStripeThreshold 1.0
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit MET3 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit MET1 -set_to_set_distance 250 -skip_via_on_pin Standardcell -stacked_via_top_layer METTPL -padcore_ring_top_layer_limit MET3 -spacing 3 -merge_stripes_value 3.15 -layer MET2 -block_ring_bottom_layer_limit MET1 -width 5 -nets {VSS VDD} -stacked_via_bottom_layer MET1
#Main parameters -set_to_set_distance 250(100) -spacing 3(2.5) -width 5(3)
fit
puts {========================Stripes done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Stripes done

sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { MET1 METTPL } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { MET1 METTPL } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { MET1 METTPL }
fit
puts {========================Horizontal power lines done}
puts {}
puts {}
puts {}
puts {}
# Horizontal power lines done (Special route)

editPowerVia -skip_via_on_pin Standardcell -bottom_layer MET1 -add_vias 1 -top_layer METTPL
set sprEpvLayers {}
fit
puts {========================Vias done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Vias done

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -prePlace -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix prePlace -outDir ../Reports/1_Encounter/0_prePlace
fit
puts {========================prePlace timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# prePlace timing report done

setPlaceMode -fp false
placeDesign -inPlaceOpt
fit
puts {========================Placement done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Placement done

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix preCTS_setup -outDir ../Reports/1_Encounter/1S_preCTS
fit
puts {========================preCTS setup timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# preCTS setup timing report done

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix preCTS_hold -outDir ../Reports/1_Encounter/1H_preCTS
fit
puts {========================preCTS hold timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# preCTS hold timing report done

setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS
fit
puts {========================preCTS optimization done}
puts {}
puts {}
puts {}
puts {}
puts {}
# preCTS optimization done

createClockTreeSpec -bufferList {BU_5VX0 BU_5VX1 BU_5VX12 BU_5VX16 BU_5VX2 BU_5VX3 BU_5VX4 BU_5VX6 BU_5VX8 DLY1_5VX1 DLY2_5VX1 DLY4_5VX1 DLY8_5VX1 IN_5VX0 IN_5VX1 IN_5VX12 IN_5VX16 IN_5VX2 IN_5VX3 IN_5VX4 IN_5VX6 IN_5VX8 STE_5VX1 STE_5VX2 STE_5VX3 STE_5VX4 ST_5VX1 ST_5VX2 ST_5VX3 ST_5VX4} -file Clock.ctstch
setCTSMode -engine ck
clockDesign -specFile Clock.ctstch -outDir ../Reports/1_Encounter/2_CTS_results -fixedInstBeforeCTS
fit
puts {========================CTS done}
puts {}
puts {}
puts {}
puts {}
puts {}
# CTS done

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix postCTS_setup -outDir ../Reports/1_Encounter/2S_postCTS
fit
puts {========================postCTS setup timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# postCTS setup timing report done

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix postCTS_hold -outDir ../Reports/1_Encounter/2H_postCTS
fit
puts {========================postCTS hold timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# postCTS hold timing report done

#suspend
#setOptMode -fixCap false -fixTran false -fixFanoutLoad false
#optDesign -postCTS -incr
#optDesign -postCTS -hold -incr
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postCTS
optDesign -postCTS -hold
fit
puts {========================postCTS optimization done}
puts {}
puts {}
puts {}
puts {}
puts {}
# postCTS optimization done

setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
fit
puts {========================Routing done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Routing done

setAnalysisMode -analysisType onChipVariation -skew true -clockPropagation sdcControl

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix postRoute_setup -outDir ../Reports/1_Encounter/3S_postRoute
fit
puts {========================postRoute setup timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# postRoute setup timing report done

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix postRoute_hold -outDir ../Reports/1_Encounter/3H_postRoute
fit
puts {========================postRoute hold timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# postRoute hold timing report done

#suspend
#setOptMode -fixCap false -fixTran false -fixFanoutLoad false
#optDesign -postRoute -incr
#optDesign -postRoute -hold -incr
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postRoute
optDesign -postRoute -hold
fit
puts {========================postRoute optimization done}
puts {}
puts {}
puts {}
puts {}
puts {}
# postRoute optimization done

#suspend
set_analysis_view -setup {MAXviewOPT} -hold {MINviewOPT}
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix postRouteOpt_setup -outDir ../Reports/1_Encounter/4S_postRouteOpt
fit
puts {========================postRouteOpt setup timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# postRouteOpt setup timing report done

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix postRouteOpt_hold -outDir ../Reports/1_Encounter/4H_postRouteOpt
fit
puts {========================postRouteOpt hold timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# postRouteOpt hold timing report done

getFillerMode -quiet
addFiller -cell FEED25_5V FEED15_5V FEED10_5V FEED7_5V FEED5_5V FEED3_5V FEED2_5V FEED1_5V -prefix FILLER
fit
puts {========================Filler adding done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Filler adding done

setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna true -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000 -report ../Reports/1_Encounter/5_Verifications/Geometry.rpt
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
fit
puts {========================Geometry verification done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Geometry verification done

verify_drc -report ../Reports/1_Encounter/5_Verifications/DRC.rpt -limit 1000
fit
puts {========================DRC verification done}
puts {}
puts {}
puts {}
puts {}
puts {}
# DRC verification done

verifyConnectivity -type all -report ../Reports/1_Encounter/5_Verifications/Connectivity.rpt -error 1000 -warning 50
fit
puts {========================Connectivity verification done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Connectivity verification done

setExtractRCMode -engine postRoute -effortLevel signoff
extractRC
fit
puts {========================Extraction done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Extraction done

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -signoff -pathReports -slackReports -numPaths 50 -prefix signOff_setup -outDir ../Reports/1_Encounter/6S_signOff
fit
puts {========================Sign-Off setup timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Sign-Off setup timing report done

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -signoff -hold -pathReports -slackReports -numPaths 50 -prefix signOff_hold -outDir ../Reports/1_Encounter/6H_signOff
fit
puts {========================Sign-Off hold timing report done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Sign-Off hold timing report done

all_hold_analysis_views 
all_setup_analysis_views 
write_sdf -view MAXviewOPT /home/student6/Kolbenkov_PP/Digital_ASIC/Source/Phys_Syn_Res/filter_phys_delays.sdf
fit
puts {========================Writing SDF done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Writing SDF done

saveNetlist /home/student6/Kolbenkov_PP/Digital_ASIC/Source/Phys_Syn_Res/filter_phys_netlist_sim_.v
fit
puts {========================Saving netlist(for simulation) done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Saving netlist(for simulation) done

saveNetlist /home/student6/Kolbenkov_PP/Digital_ASIC/Source/Phys_Syn_Res/filter_phys_netlist.v -includePhysicalCell {FEED25_5V FEED15_5V FEED10_5V FEED7_5V FEED5_5V FEED3_5V FEED2_5V FEED1_5V}
fit
puts {========================Saving netlist done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Saving netlist done

global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.8
defOut -floorplan -netlist -routing /home/student6/Kolbenkov_PP/Digital_ASIC/Source/Phys_Syn_Res/filter.def
set dbgLefDefOutVersion 5.8
fit
puts {========================Writing DEF done}
puts {}
puts {}
puts {}
puts {}
puts {}
# Writing DEF done

saveDesign States/LAST_RUN.enc
# Saving result
