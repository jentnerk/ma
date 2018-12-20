###################################################################

# Created by write_sdc on Wed Dec 19 08:28:45 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports clk]  -period 0.65  -waveform {0 0.325}
