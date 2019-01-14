###################################################################

# Created by write_sdc on Mon Jan 14 11:15:53 2019

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 10 [get_ports data_o]
create_clock [get_ports clk]  -period 1  -waveform {0 0.5}
create_generated_clock [get_pins genblk1_0__Clock_divider_clkB_reg/Q]  -name CLK_DIV2  -source [get_ports clk]  -divide_by 2
