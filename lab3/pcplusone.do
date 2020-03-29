vsim -gui work.pcplusone

add wave -position insertpoint  \
sim:/pcplusone/input \
sim:/pcplusone/clock \
sim:/pcplusone/output

force -freeze sim:/pcplusone/clock 0 0, 1 {50 ns} -r 100
force -freeze sim:/pcplusone/input 32'h00000001 0
run 100ns

force -freeze sim:/pcplusone/input 32'h00000002 0
run 100ns

force -freeze sim:/pcplusone/input 32'h00000003 0
run 100ns

force -freeze sim:/pcplusone/input 32'h00000004 0
run 100ns