vsim -gui work.dlx_register

add wave -position insertpoint  \
sim:/dlx_register/in_val \
sim:/dlx_register/clock \
sim:/dlx_register/out_val


force -freeze sim:/dlx_register/clock 0 0, 1 {50 ns} -r 100
force -freeze sim:/dlx_register/in_val 32'h00000000 0
run 100ns

force -freeze sim:/dlx_register/in_val 32'h01234567 0
run 100ns

force -freeze sim:/dlx_register/in_val 32'hFFFFFFFF 0
run 100ns


force -freeze sim:/dlx_register/in_val 32'h00000001 0
run 100ns