onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /serializer_tb/dut/clks
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {215 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 129
configure wave -valuecolwidth 182
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
WaveRestoreZoom {0 ns} {939 ns}
