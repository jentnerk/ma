onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /toplevel_tb/clk
add wave -noupdate -expand /toplevel_tb/dut/clks
add wave -noupdate /toplevel_tb/dut/shift_serializer/clk
add wave -noupdate /toplevel_tb/dut/shift_serializer/valid_i
add wave -noupdate /toplevel_tb/dut/shift_serializer/valid_o
add wave -noupdate /toplevel_tb/dut/shift_serializer/ready_o
add wave -noupdate /toplevel_tb/dut/shift_serializer/LoadEn_S
add wave -noupdate -expand /toplevel_tb/dut/shift_serializer/data_i
add wave -noupdate -expand /toplevel_tb/dut/shift_o
add wave -noupdate /toplevel_tb/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {90 ns} 0} {{Cursor 2} {245 ns} 0} {{Cursor 3} {390 ns} 0} {{Cursor 4} {324 ns} 0}
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
WaveRestoreZoom {0 ns} {901 ns}
