vsim -gui work.alu

add wave -position insertpoint  \
sim:/alu/op1 \
sim:/alu/op2 \
sim:/alu/operation \
sim:/alu/result \
sim:/alu/error


force -freeze sim:/alu/op1 32'h0AAAAAAA 0
force -freeze sim:/alu/op2 32'h01111111 0
force -freeze sim:/alu/operation 4'h0 0
run 100ns

force -freeze sim:/alu/op1 32'hFFFFFFFF 0
force -freeze sim:/alu/op2 32'h00000001 0
force -freeze sim:/alu/operation 4'h0 0
run 100ns

force -freeze sim:/alu/op1 32'h0AAAAAAA 0
force -freeze sim:/alu/op2 32'h01111111 0
force -freeze sim:/alu/operation 4'h1 0
run 100ns

force -freeze sim:/alu/op1 32'h00000001 0
force -freeze sim:/alu/op2 32'h00000010 0
force -freeze sim:/alu/operation 4'h1 0
run 100ns

force -freeze sim:/alu/op1 32'h0AAAAAAA 0
force -freeze sim:/alu/op2 32'h01111111 0
force -freeze sim:/alu/operation 4'h2 0
run 100ns

force -freeze sim:/alu/op1 32'h8A5C9FF7 0
force -freeze sim:/alu/op2 32'hF39A0009 0
force -freeze sim:/alu/operation 4'h2 0
run 100ns

force -freeze sim:/alu/op1 32'h03333333 0
force -freeze sim:/alu/op2 32'h01111111 0
force -freeze sim:/alu/operation 4'h3 0
run 100ns

force -freeze sim:/alu/op1 32'h08000000 0
force -freeze sim:/alu/op2 32'h07FFFFFF 0
force -freeze sim:/alu/operation 4'h3 0
run 100ns

force -freeze sim:/alu/op1 32'h7FFFFFFF 0
force -freeze sim:/alu/op2 32'h80000000 0
force -freeze sim:/alu/operation 4'h3 0
run 100ns

force -freeze sim:/alu/op1 32'h00000100 0
force -freeze sim:/alu/op2 32'h00000100 0
force -freeze sim:/alu/operation 4'h4 0
run 100ns

force -freeze sim:/alu/op1 32'h80000000 0
force -freeze sim:/alu/op2 32'h80000001 0
force -freeze sim:/alu/operation 4'h4 0
run 100ns

force -freeze sim:/alu/op1 32'h00000064 0
force -freeze sim:/alu/op2 32'h00000002 0
force -freeze sim:/alu/operation 4'h5 0
run 100ns

force -freeze sim:/alu/op1 32'h80000000 0
force -freeze sim:/alu/op2 32'hFFFFFFFF 0
force -freeze sim:/alu/operation 4'h5 0
run 100ns

force -freeze sim:/alu/op1 32'h0FFFFFFF 0
force -freeze sim:/alu/op2 32'h00000000 0
force -freeze sim:/alu/operation 4'h5 0
run 100ns

force -freeze sim:/alu/op1 32'hAAAAAAAA 0
force -freeze sim:/alu/op2 32'h55555555 0
force -freeze sim:/alu/operation 4'h7 0
run 100ns

force -freeze sim:/alu/op1 32'hFFFFFFFF 0
force -freeze sim:/alu/op2 32'h55555555 0
force -freeze sim:/alu/operation 4'h7 0
run 100ns

force -freeze sim:/alu/op1 32'hAAAAAAAA 0
force -freeze sim:/alu/op2 32'h55555555 0
force -freeze sim:/alu/operation 4'h9 0
run 100ns

force -freeze sim:/alu/op1 32'hFFFFFFFF 0
force -freeze sim:/alu/op2 32'h55555555 0
force -freeze sim:/alu/operation 4'h9 0
run 100ns

force -freeze sim:/alu/op1 32'hABCDEF01 0
force -freeze sim:/alu/op2 32'h55555555 0
force -freeze sim:/alu/operation 4'hB 0
run 100ns

force -freeze sim:/alu/op1 32'hFFFFFFFF 0
force -freeze sim:/alu/op2 32'hABCDEF12 0
force -freeze sim:/alu/operation 4'hC 0
run 100ns

force -freeze sim:/alu/op1 32'hFFFFFFFF 0
force -freeze sim:/alu/op2 32'hABCDEF12 0
force -freeze sim:/alu/operation 4'hD 0
run 100ns

force -freeze sim:/alu/op1 32'hFFFFFFFF 0
force -freeze sim:/alu/op2 32'hABCDEF01 0
force -freeze sim:/alu/operation 4'hE 0
run 100ns

force -freeze sim:/alu/op1 32'hFFFFFFFF 0
force -freeze sim:/alu/op2 32'hABCDEF12 0
force -freeze sim:/alu/operation 4'hF 0
run 100ns