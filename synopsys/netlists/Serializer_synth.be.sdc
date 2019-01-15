###################################################################

# Created by write_sdc on Tue Jan 15 10:58:41 2019

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 0.01 [get_ports data_o]
create_generated_clock [get_pins clk__1__clock_divider/clk_div_reg/Q]  -name CLK_DIV_2  -source [get_ports clk_i]  -divide_by 2
