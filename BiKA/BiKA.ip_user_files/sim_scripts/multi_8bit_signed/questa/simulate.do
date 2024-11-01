onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib multi_8bit_signed_opt

do {wave.do}

view wave
view structure
view signals

do {multi_8bit_signed.udo}

run -all

quit -force
