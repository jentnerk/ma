onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /mixed_serializer_tb/toplevel_mixed_serializer/clks
add wave -noupdate -expand /mixed_serializer_tb/toplevel_mixed_serializer/data_i
add wave -noupdate /mixed_serializer_tb/toplevel_mixed_serializer/data_o
add wave -noupdate -color Plum /mixed_serializer_tb/toplevel_mixed_serializer/valid_o
add wave -noupdate -color Plum /mixed_serializer_tb/toplevel_mixed_serializer/ready_o
add wave -noupdate -expand -group shifter -expand /mixed_serializer_tb/toplevel_mixed_serializer/shift_o
add wave -noupdate -expand -group shifter -radix decimal /mixed_serializer_tb/toplevel_mixed_serializer/shift_serializer_wo_FSM/Counter_SP
add wave -noupdate -expand -group shifter /mixed_serializer_tb/toplevel_mixed_serializer/shift_serializer_wo_FSM/Reg_SP
add wave -noupdate -expand -group shifter /mixed_serializer_tb/toplevel_mixed_serializer/shift_serializer_wo_FSM/Reg_SN
add wave -noupdate /mixed_serializer_tb/toplevel_mixed_serializer/reset_ni
add wave -noupdate /mixed_serializer_tb/toplevel_mixed_serializer/valid_out_temp
add wave -noupdate /mixed_serializer_tb/toplevel_mixed_serializer/valid1_out_SP
add wave -noupdate /mixed_serializer_tb/toplevel_mixed_serializer/valid1_out_SN
add wave -noupdate /mixed_serializer_tb/toplevel_mixed_serializer/valid2_out_SP
add wave -noupdate /mixed_serializer_tb/toplevel_mixed_serializer/valid2_out_SN
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {90 ns} 0} {{Cursor 2} {197 ns} 0} {{Cursor 3} {485 ns} 0} {{Cursor 4} {285 ns} 0}
quietly wave cursor active 2
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
WaveRestoreZoom {111 ns} {599 ns}
