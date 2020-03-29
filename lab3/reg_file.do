vsim -gui work.reg_file

add wave -position insertpoint  \
sim:/reg_file/data_in \
sim:/reg_file/readnotwrite \
sim:/reg_file/clock \
sim:/reg_file/data_out \
sim:/reg_file/reg_number


force -freeze sim:/reg_file/clock 0 0, 1 {50 ns} -r 100
force -freeze sim:/reg_file/data_in 32'h11111111 0
force -freeze sim:/reg_file/readnotwrite 0 0
force -freeze sim:/reg_file/reg_number 5'h00 0
run 100ns

force -freeze sim:/reg_file/data_in 32'h76543210 0
force -freeze sim:/reg_file/readnotwrite 0 0
force -freeze sim:/reg_file/reg_number 5'h01 0
run 100ns

force -freeze sim:/reg_file/data_in 32'h33333333 0
force -freeze sim:/reg_file/readnotwrite 1 0
force -freeze sim:/reg_file/reg_number 5'h01 0
run 100ns

force -freeze sim:/reg_file/data_in 32'h01234567 0
force -freeze sim:/reg_file/readnotwrite 0 0
force -freeze sim:/reg_file/reg_number 5'h02 0
run 100ns

force -freeze sim:/reg_file/data_in 32'hFFFFFFFF 0
force -freeze sim:/reg_file/readnotwrite 1 0
force -freeze sim:/reg_file/reg_number 5'h00 0
run 100ns

force -freeze sim:/reg_file/data_in 32'h22222222 0
force -freeze sim:/reg_file/readnotwrite 1 0
force -freeze sim:/reg_file/reg_number 5'h01 0
run 100ns

force -freeze sim:/reg_file/data_in 32'h00000000 0
force -freeze sim:/reg_file/readnotwrite 1 0
force -freeze sim:/reg_file/reg_number 5'h02 0
run 100ns

force -freeze sim:/reg_file/data_in 32'h00000000 0
force -freeze sim:/reg_file/readnotwrite 1 0
force -freeze sim:/reg_file/reg_number 5'h03 0
run 100ns