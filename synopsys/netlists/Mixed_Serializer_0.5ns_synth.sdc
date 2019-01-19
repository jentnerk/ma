###################################################################

# Created by write_sdc on Sat Jan 19 13:28:11 2019

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 0.01 [get_ports data_o]
create_clock [get_ports clk_i]  -period 0.5  -waveform {0 0.25}
create_generated_clock [get_pins clk__1__clock_divider/clk_div_reg/Q]  -name CLK_DIV_2  -source [get_ports clk_i]  -divide_by 2
create_generated_clock [get_pins clk__2__clock_divider/clk_div_reg/Q]  -name CLK_DIV_4  -source [get_ports clk_i]  -divide_by 4
create_generated_clock [get_pins clk__3__clock_divider/clk_div_reg/Q]  -name CLK_DIV_8  -source [get_ports clk_i]  -divide_by 8
create_generated_clock [get_pins clk__4__clock_divider/clk_div_reg/Q]  -name CLK_DIV_16  -source [get_ports clk_i]  -divide_by 16
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[31]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[30]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[29]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[28]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[27]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[26]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[25]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[24]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[23]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[22]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[21]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[20]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[19]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[18]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[17]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[16]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[15]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[14]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[13]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[12]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[11]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[10]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[9]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[8]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[7]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[6]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[5]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[4]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[3]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[2]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[1]}]
set_input_delay -clock CLK_DIV_2  -max 0.01  [get_ports {data_i[0]}]
set_output_delay -clock clk_i  -max 0.01  [get_ports data_o]
