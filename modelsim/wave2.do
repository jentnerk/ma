onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /serializer_tb/dut/clks
add wave -noupdate /serializer_tb/dut/data_i
add wave -noupdate -expand /serializer_tb/dut/Serializer_FROM/io_dataIn
add wave -noupdate -expand /serializer_tb/dut/Serializer_FROM/genblk1/Serializer_FROM/io_dataIn
add wave -noupdate -expand /serializer_tb/dut/Serializer_FROM/genblk1/Serializer_FROM/reg_SP
add wave -noupdate -expand /serializer_tb/dut/Serializer_FROM/genblk1/Serializer_FROM/reg_SN
add wave -noupdate -expand /serializer_tb/dut/Serializer_FROM/genblk1/Serializer_FROM/genblk1/Serializer_FROM/io_dataIn
add wave -noupdate -expand /serializer_tb/dut/Serializer_FROM/genblk1/Serializer_FROM/genblk1/Serializer_FROM/genblk1/Serializer_FROM/io_dataIn
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
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
WaveRestoreZoom {1933 ns} {2872 ns}
