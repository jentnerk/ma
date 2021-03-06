###################################################################

# Created by write_sdc on Sat Jan 19 13:09:31 2019

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 0.01 [get_ports {data_o[0]}]
create_clock [get_ports clk]  -period 0.05  -waveform {0 0.025}
