onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /serializer_tb/dut/clk
add wave -noupdate /serializer_tb/dut/reset
add wave -noupdate /serializer_tb/dut/data1_i
add wave -noupdate /serializer_tb/dut/data2_i
add wave -noupdate /serializer_tb/dut/data_o
add wave -noupdate /serializer_tb/dut/clkB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {101 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {110 ns}
