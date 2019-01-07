###################################################################

# Created by write_sdc on Mon Jan 7 15:49:42 2019

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports clk]  -period 0.65  -waveform {0 0.325}
