vsim -gui work.mux

add wave -position insertpoint  \
sim:/mux/input_0 \
sim:/mux/input_1 \
sim:/mux/which \
sim:/mux/output


force -freeze sim:/mux/input_0 32'h11111111 0
force -freeze sim:/mux/input_1 32'hFFFFFFFF 0
force -freeze sim:/mux/which 0 0
run 100ns

force -freeze sim:/mux/input_0 32'h11111111 0
force -freeze sim:/mux/input_1 32'hFFFFFFFF 0
force -freeze sim:/mux/which 1 0
run 100ns

force -freeze sim:/mux/input_0 32'h01234567 0
force -freeze sim:/mux/input_1 32'h00000001 0
force -freeze sim:/mux/which 0 0
run 100ns

force -freeze sim:/mux/input_0 32'h01234567 0
force -freeze sim:/mux/input_1 32'h00000001 0
force -freeze sim:/mux/which 1 0
run 100ns
