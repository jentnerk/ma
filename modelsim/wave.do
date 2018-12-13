onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group dut -color Gold /serializer_tb/dut/clk
add wave -noupdate -expand -group dut -color Gold /serializer_tb/dut/clkB
add wave -noupdate -expand -group dut /serializer_tb/dut/reset
add wave -noupdate -expand -group dut -color Plum /serializer_tb/dut/data1_i
add wave -noupdate -expand -group dut -color Plum /serializer_tb/dut/data2_i
add wave -noupdate -expand -group dut -color {Blue Violet} /serializer_tb/dut/data_o
add wave -noupdate -expand -group clock_divider /serializer_tb/dut/Clock_divider/io_clkB
add wave -noupdate -expand -group clock_divider /serializer_tb/dut/Clock_divider/clk
add wave -noupdate -expand -group clock_divider /serializer_tb/dut/Clock_divider/reset
add wave -noupdate -expand -group clock_divider /serializer_tb/dut/Clock_divider/clkB
add wave -noupdate /serializer_tb/dut/Serializer/io_dataOut
add wave -noupdate -expand -group serializer -color Gold /serializer_tb/dut/Serializer/io_clkA
add wave -noupdate -expand -group serializer /serializer_tb/dut/Serializer/io_rstA
add wave -noupdate -expand -group serializer -color Gold /serializer_tb/dut/Serializer/io_clkB
add wave -noupdate -expand -group serializer /serializer_tb/dut/Serializer/io_rstB
add wave -noupdate -expand -group serializer -color Orchid /serializer_tb/dut/Serializer/io_dataIn1
add wave -noupdate -expand -group serializer -color Orchid /serializer_tb/dut/Serializer/io_dataIn2
add wave -noupdate -expand -group serializer /serializer_tb/dut/Serializer/area_clkA_reg1
add wave -noupdate -expand -group serializer /serializer_tb/dut/Serializer/area_clkA_reg2
add wave -noupdate -expand -group serializer /serializer_tb/dut/Serializer/area_clkA_output_clkA
add wave -noupdate -expand -group serializer /serializer_tb/dut/Serializer/area_clkB_reg_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {886 ns} 0} {{Cursor 2} {94 ns} 0} {{Cursor 3} {260 ns} 0 default {Orange Red}} {{Cursor 4} {192 ns} 0}
quietly wave cursor active 2
configure wave -namecolwidth 247
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {456 ns}
