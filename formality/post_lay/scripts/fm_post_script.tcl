read_db -container r { ../ref/models/saed90nm_typ_ht.db } 
read_verilog -container r -libname WORK -01 { ../source/Johnson_count_dc.v } 
set_top r:/WORK/Johnson_count 
read_db -container i { ../ref/models/saed90nm_typ_ht.db } 
read_verilog -container i -libname WORK -01 { ../source/icc_out/Johnson_count_fm.v } 
set_top i:/WORK/Johnson_count 

set_constant -type port r:/WORK/Johnson_count/SE 0
set_constant -type port r:/WORK/Johnson_count/r 0 
set_constant -type port i:/WORK/Johnson_count/SE 0
set_constant -type port i:/WORK/Johnson_count/r 0 

match 

verify 

save_session -replace {../results/design_icc} 
