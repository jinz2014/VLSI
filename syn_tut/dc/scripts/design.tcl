
read_verilog  ../source/Johnson_count.v
analyze -library WORK -format verilog {../source/Johnson_count.v}
elaborate Johnson_count -architecture verilog -library DEFAULT
link
check_design
source ../source/constr.sdc		
compile -exact_map
report_area
report_constraint
report_timing
write -hierarchy -format verilog -output ../results/Johnson_count_dc.v
