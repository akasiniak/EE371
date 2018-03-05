onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Yellow -radix binary /topLevel_testbench/dut/LEDR
add wave -noupdate -color Yellow -radix binary /topLevel_testbench/dut/SW
add wave -noupdate -color Yellow -radix binary /topLevel_testbench/dut/GPIOin
add wave -noupdate -color Yellow -radix binary /topLevel_testbench/dut/GPIOout
add wave -noupdate -color Yellow -radix binary /topLevel_testbench/dut/KEY
add wave -noupdate -color Yellow -radix binary /topLevel_testbench/dut/CLOCK_50
add wave -noupdate -color Yellow -radix binary /topLevel_testbench/dut/counter
add wave -noupdate -color Yellow -radix binary /topLevel_testbench/dut/controlledClock
add wave -noupdate -color Yellow -radix binary /topLevel_testbench/dut/heldKey
add wave -noupdate -color Cyan -radix binary /topLevel_testbench/dut/resetKey/in
add wave -noupdate -color Cyan -radix binary /topLevel_testbench/dut/resetKey/clk
add wave -noupdate -color Cyan -radix binary /topLevel_testbench/dut/resetKey/controlledClock
add wave -noupdate -color Cyan -radix binary /topLevel_testbench/dut/resetKey/out
add wave -noupdate -color Red -radix binary /topLevel_testbench/dut/loadKey/in
add wave -noupdate -color Red -radix binary /topLevel_testbench/dut/loadKey/clk
add wave -noupdate -color Red -radix binary /topLevel_testbench/dut/loadKey/controlledClock
add wave -noupdate -color Red -radix binary /topLevel_testbench/dut/loadKey/out
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/reset
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/clk
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/serialDataIn
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/serialDataOut
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/parallelDataOut
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/transmitEnable
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/load
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/characterReceived
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/characterSent
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/parallelDataIn
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/BSCClockOut
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/BSCClockIn
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/startBitDetected
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/bitCountIn
add wave -noupdate -color Magenta -radix binary /topLevel_testbench/dut/UART/bitCountOut
add wave -noupdate /topLevel_testbench/dut/UART/outDataBIC/load
add wave -noupdate -color Cyan -radix binary /topLevel_testbench/dut/UART/outDataBIC/characterReceived
add wave -noupdate -color Cyan -radix binary /topLevel_testbench/dut/UART/outDataBIC/enable
add wave -noupdate -color Cyan -radix binary /topLevel_testbench/dut/UART/outDataBIC/clk
add wave -noupdate -color Cyan -radix binary /topLevel_testbench/dut/UART/outDataBIC/reset
add wave -noupdate -color Cyan -radix binary /topLevel_testbench/dut/UART/outDataBIC/bitCount
add wave -noupdate -color White -radix binary /topLevel_testbench/dut/UART/outDataBSC/clockControl
add wave -noupdate -color White -radix binary /topLevel_testbench/dut/UART/outDataBSC/enable
add wave -noupdate -color White -radix binary /topLevel_testbench/dut/UART/outDataBSC/clk
add wave -noupdate -color White -radix binary /topLevel_testbench/dut/UART/outDataBSC/reset
add wave -noupdate -color White -radix binary /topLevel_testbench/dut/UART/outDataBSC/count
add wave -noupdate -color Orange -radix binary /topLevel_testbench/dut/UART/dataOut/serialOut
add wave -noupdate -color Orange -radix binary /topLevel_testbench/dut/UART/dataOut/parallelIn
add wave -noupdate -color Orange -radix binary /topLevel_testbench/dut/UART/dataOut/load
add wave -noupdate -color Orange -radix binary /topLevel_testbench/dut/UART/dataOut/clk
add wave -noupdate -color Orange -radix binary /topLevel_testbench/dut/UART/dataOut/reset
add wave -noupdate -color Orange -radix binary /topLevel_testbench/dut/UART/dataOut/controlledClock
add wave -noupdate -color Orange -radix binary /topLevel_testbench/dut/UART/dataOut/loadBuffer
add wave -noupdate -color Orange -radix binary /topLevel_testbench/dut/UART/dataOut/alreadyLoaded
add wave -noupdate -color Pink -radix binary /topLevel_testbench/dut/UART/dataIn/parallelOut
add wave -noupdate -color Pink -radix binary /topLevel_testbench/dut/UART/dataIn/serialIn
add wave -noupdate -color Pink -radix binary /topLevel_testbench/dut/UART/dataIn/charReceived
add wave -noupdate -color Pink -radix binary /topLevel_testbench/dut/UART/dataIn/reset
add wave -noupdate -color Pink -radix binary /topLevel_testbench/dut/UART/dataIn/clk
add wave -noupdate -color Pink -radix binary /topLevel_testbench/dut/UART/dataIn/allData
add wave -noupdate -color {Spring Green} -radix binary /topLevel_testbench/dut/UART/inDataBIC/characterReceived
add wave -noupdate -color {Spring Green} -radix binary /topLevel_testbench/dut/UART/inDataBIC/enable
add wave -noupdate -color {Spring Green} -radix binary /topLevel_testbench/dut/UART/inDataBIC/clk
add wave -noupdate -color {Spring Green} -radix binary /topLevel_testbench/dut/UART/inDataBIC/reset
add wave -noupdate -color {Spring Green} -radix binary /topLevel_testbench/dut/UART/inDataBIC/bitCount
add wave -noupdate -color Salmon -radix binary /topLevel_testbench/dut/UART/inDataBSC/clockControl
add wave -noupdate -color Salmon -radix binary /topLevel_testbench/dut/UART/inDataBSC/enable
add wave -noupdate -color Salmon -radix binary /topLevel_testbench/dut/UART/inDataBSC/clk
add wave -noupdate -color Salmon -radix binary /topLevel_testbench/dut/UART/inDataBSC/reset
add wave -noupdate -color Salmon -radix binary /topLevel_testbench/dut/UART/inDataBSC/count
add wave -noupdate -color {Slate Blue} -radix binary /topLevel_testbench/dut/UART/detector/startBitDetected
add wave -noupdate -color {Slate Blue} -radix binary /topLevel_testbench/dut/UART/detector/characterReceived
add wave -noupdate -color {Slate Blue} -radix binary /topLevel_testbench/dut/UART/detector/data
add wave -noupdate -color {Slate Blue} -radix binary /topLevel_testbench/dut/UART/detector/clk
add wave -noupdate -color {Slate Blue} -radix binary /topLevel_testbench/dut/UART/detector/reset
add wave -noupdate -color {Slate Blue} -radix binary /topLevel_testbench/dut/UART/detector/bitCount
add wave -noupdate -color {Slate Blue} -radix binary /topLevel_testbench/dut/UART/detector/readingData
add wave -noupdate -radix binary /topLevel_testbench/dut/UART/holdLoad/in
add wave -noupdate -radix binary /topLevel_testbench/dut/UART/holdLoad/clk
add wave -noupdate -radix binary /topLevel_testbench/dut/UART/holdLoad/reset
add wave -noupdate -radix binary /topLevel_testbench/dut/UART/holdLoad/count
add wave -noupdate -radix binary /topLevel_testbench/dut/UART/holdLoad/out
add wave -noupdate -radix binary /topLevel_testbench/dut/UART/holdLoad/nsOut
add wave -noupdate -radix binary /topLevel_testbench/dut/UART/holdLoad/countReached
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {148070 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 348
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {4201481 ps}
