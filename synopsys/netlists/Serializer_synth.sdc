###################################################################

# Created by write_sdc on Tue Jan 8 14:48:47 2019

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports clk]  -period 1  -waveform {0 0.5}
