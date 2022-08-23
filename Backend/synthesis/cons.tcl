####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################
set REF_CLK_NAME CLK_REF
set REF_CLK_PER 20
set REF_CLK_SETUP_SKEW 0.2
set REF_CLK_HOLD_SKEW 0.1
set REF_CLK_LAT 0
set REF_CLK_RISE 0.05
set REF_CLK_FALL 0.05

create_clock -name $REF_CLK_NAME -period $REF_CLK_PER -waveform "0 [expr $REF_CLK_PER/2]" [get_ports REF_CLK]
set_clock_uncertainty -setup $REF_CLK_SETUP_SKEW [get_clocks $REF_CLK_NAME]
set_clock_uncertainty -hold $REF_CLK_HOLD_SKEW  [get_clocks $REF_CLK_NAME]
set_clock_transition -rise $REF_CLK_RISE  [get_clocks $REF_CLK_NAME]
set_clock_transition -fall $REF_CLK_FALL  [get_clocks $REF_CLK_NAME]

set UART_CLK_NAME CLK_UART
set UART_CLK_PER 1085.06944
set UART_CLK_SETUP_SKEW 0.2
set UART_CLK_HOLD_SKEW 0.1
set UART_CLK_LAT 0
set UART_CLK_RISE 0.05
set UART_CLK_FALL 0.05

create_clock -name $UART_CLK_NAME -period $UART_CLK_PER -waveform "0 [expr $UART_CLK_PER/2]" [get_ports UART_CLK]
set_clock_uncertainty -setup $UART_CLK_SETUP_SKEW [get_clocks $UART_CLK_NAME]
set_clock_uncertainty -hold $UART_CLK_HOLD_SKEW  [get_clocks $UART_CLK_NAME]
set_clock_transition -rise $UART_CLK_RISE  [get_clocks $UART_CLK_NAME]
set_clock_transition -fall $UART_CLK_FALL  [get_clocks $UART_CLK_NAME]

create_generated_clock -master_clock $UART_CLK_NAME -source [get_ports UART_CLK] \
                       -name "TX_CLK" [get_port U0_ClkDiv/o_div_clk] \
                       -divide_by 8

create_generated_clock -master_clock $REF_CLK_NAME -source [get_ports REF_CLK] \
                       -name "ALU_CLK" [get_port U0_CLK_GATE/GATED_CLK] \
                       -divide_by 1

set_dont_touch_network {REF_CLK UART_CLK RST}
####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "$UART_CLK_NAME TX_CLK"] -group [get_clocks "$REF_CLK_NAME ALU_CLK"]
####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

set in_delay_RX  [expr 0.2*$UART_CLK_PER]
set out_delay_TX [expr 0.2*$UART_CLK_PER]

set_input_delay  $in_delay_RX  -clock $UART_CLK_NAME [get_port RX_IN]
set_output_delay $out_delay_TX -clock TX_CLK         [get_port TX_OUT]
####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port RX_IN]


####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.5 [get_port TX_OUT]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################

