###################################################################

# Created by write_sdc on Sat Jan 19 12:12:01 2019

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 10 [get_ports {data_o[0]}]
