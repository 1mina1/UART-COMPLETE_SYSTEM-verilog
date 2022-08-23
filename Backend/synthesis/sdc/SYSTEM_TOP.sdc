###################################################################

# Created by write_sdc on Tue Aug 23 04:02:19 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RX_IN]
set_load -pin_load 0.5 [get_ports TX_OUT]
create_clock [get_ports REF_CLK]  -name CLK_REF  -period 20  -waveform {0 10}
set_clock_uncertainty -setup 0.2  [get_clocks CLK_REF]
set_clock_uncertainty -hold 0.1  [get_clocks CLK_REF]
set_clock_transition -max -rise 0.05 [get_clocks CLK_REF]
set_clock_transition -min -rise 0.05 [get_clocks CLK_REF]
set_clock_transition -max -fall 0.05 [get_clocks CLK_REF]
set_clock_transition -min -fall 0.05 [get_clocks CLK_REF]
create_clock [get_ports UART_CLK]  -name CLK_UART  -period 1085.07  -waveform {0 542.535}
set_clock_uncertainty -setup 0.2  [get_clocks CLK_UART]
set_clock_uncertainty -hold 0.1  [get_clocks CLK_UART]
set_clock_transition -max -rise 0.05 [get_clocks CLK_UART]
set_clock_transition -min -rise 0.05 [get_clocks CLK_UART]
set_clock_transition -max -fall 0.05 [get_clocks CLK_UART]
set_clock_transition -min -fall 0.05 [get_clocks CLK_UART]
create_generated_clock [get_pins U0_ClkDiv/o_div_clk]  -name TX_CLK  -source [get_ports UART_CLK]  -master_clock CLK_UART  -divide_by 8  -add
create_generated_clock [get_pins U0_CLK_GATE/GATED_CLK]  -name ALU_CLK  -source [get_ports REF_CLK]  -master_clock CLK_REF  -divide_by 1  -add
set_input_delay -clock CLK_UART  217.014  [get_ports RX_IN]
set_output_delay -clock TX_CLK  217.014  [get_ports TX_OUT]
set_clock_groups -asynchronous -name CLK_UART_1 -group [list [get_clocks CLK_UART] [get_clocks TX_CLK]] -group [list [get_clocks CLK_REF] [get_clocks ALU_CLK]]
