onerror {resume}
quietly WaveActivateNextPane {} 0
WaveRestoreCursors {{apply data start} {30 ns} 0} {{apply data end} {85 ns} 0} {{first appearance of output} {115 ns} 0} {{read output} {125 ns} 0} {{Cursor 5} {165 ns} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ns} {456 ns}
