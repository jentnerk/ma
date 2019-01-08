###################################################################

# Created by write_sdc on Tue Jan 8 14:38:34 2019

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports clk]  -period 0.06  -waveform {0 0.03}
