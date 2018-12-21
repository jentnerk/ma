###################################################################

# Created by write_sdc on Fri Dec 21 14:45:53 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports clk]  -period 0.65  -waveform {0 0.325}
