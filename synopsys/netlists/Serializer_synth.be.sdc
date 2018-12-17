###################################################################

# Created by write_sdc on Mon Dec 17 16:40:33 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_max_delay 10  -from [list [get_ports {data_i[15]}] [get_ports {data_i[14]}] [get_ports {data_i[13]}] [get_ports {data_i[12]}] [get_ports {data_i[11]}] [get_ports {data_i[10]}] [get_ports {data_i[9]}] [get_ports {data_i[8]}] [get_ports {data_i[7]}] [get_ports {data_i[6]}] [get_ports {data_i[5]}] [get_ports {data_i[4]}] [get_ports {data_i[3]}] [get_ports {data_i[2]}] [get_ports {data_i[1]}] [get_ports {data_i[0]}] [get_ports clk] [get_ports reset]]  -to [get_ports data_o]
