
############################  Search PATH ################################

lappend search_path /home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys
lappend search_path /home/IC/Projects/System/RTL/ALU
lappend search_path /home/IC/Projects/System/RTL/Clock_Divider
lappend search_path /home/IC/Projects/System/RTL/Clock_Gating
lappend search_path /home/IC/Projects/System/RTL/DATA_SYNC
lappend search_path /home/IC/Projects/System/RTL/BIT_SYNC
lappend search_path /home/IC/Projects/System/RTL/RegFile
lappend search_path /home/IC/Projects/System/RTL/RST_SYNC
lappend search_path /home/IC/Projects/System/RTL/SYS_CTRL
lappend search_path /home/IC/Projects/System/RTL/UART/UART_RX
lappend search_path /home/IC/Projects/System/RTL/UART/UART_TX
lappend search_path /home/IC/Projects/System/RTL/UART/UART_TOP
lappend search_path /home/IC/Projects/System/RTL/Top

########################### Define Top Module ############################
                                                   
set top_module SYSTEM_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "../../Synthesis/$top_module.svf"

####################### Read Reference tech libs ########################
 

set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

###################  Read Reference Design Files ######################## 
read_verilog -container Ref "ALU.v"
read_verilog -container Ref "ClkDiv.v"
read_verilog -container Ref "Clock_Gating.v"
read_verilog -container Ref "BIT_SYNC.v"
read_verilog -container Ref "DATA_SYNC.v"
read_verilog -container Ref "Register_FIle.v"
read_verilog -container Ref "RST_SYNC.v"
read_verilog -container Ref "RX_Controller.v"
read_verilog -container Ref "TX_Controller.v"
read_verilog -container Ref "SYS_Controller.v"
read_verilog -container Ref "Data_Sampler.v"
read_verilog -container Ref "Deseralizer.v"
read_verilog -container Ref "edge_bit_counter.v"
read_verilog -container Ref "Parity_Check.v"
read_verilog -container Ref "Stop_Check.v"
read_verilog -container Ref "Strt_Check.v"
read_verilog -container Ref "UART_RX.v"
read_verilog -container Ref "RXFSM.v"
read_verilog -container Ref "MUX.v"
read_verilog -container Ref "Parity_Calc.v"
read_verilog -container Ref "Seralizer.v"
read_verilog -container Ref "Uart_TX_Top.v"
read_verilog -container Ref "FSM.v"
read_verilog -container Ref "InputBuffer.v"
read_verilog -container Ref "counter.v"
read_verilog -container Ref "Parallel_To_Serial.v"
read_verilog -container Ref "UART.v"
read_verilog -container Ref "SYSTEM_TOP.v"

######################## set the top Reference Design ######################## 

set_reference_design SYSTEM_TOP
set_top SYSTEM_TOP

####################### Read Implementation tech libs ######################## 

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

#################### Read Implementation Design Files ######################## 

read_verilog -container Imp -netlist "/home/IC/Projects/System/Backend/Synthesis/netlists/SYSTEM_TOP.v"

####################  set the top Implementation Design ######################

set_implementation_design SYSTEM_TOP
set_top SYSTEM_TOP


## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
