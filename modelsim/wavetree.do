onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /tree_serializer_tb/toplevel_tree_serializer/data_i
add wave -noupdate /tree_serializer_tb/toplevel_tree_serializer/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 220
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
WaveRestoreZoom {0 ns} {626 ns}
