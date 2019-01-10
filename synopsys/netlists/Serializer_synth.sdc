###################################################################

# Created by write_sdc on Thu Jan 10 14:14:46 2019

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 10 [get_ports data_o]
create_clock [get_ports clk]  -period 1  -waveform {0 0.5}
create_generated_clock [get_pins {Serializer/io_clk[1]}]  -name DClkDiv2_clk  -source [get_ports clk]  -divide_by 2
