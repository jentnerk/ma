onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /shift_serializer_tb/shift_serializer/clk
add wave -noupdate /shift_serializer_tb/shift_serializer/data_i
add wave -noupdate /shift_serializer_tb/shift_serializer/data_o
add wave -noupdate /shift_serializer_tb/shift_serializer/Reg_SP
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
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
