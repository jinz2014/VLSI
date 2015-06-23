set_svf -append { ../source/default.svf } 
read_db -container r { ../ref/models/saed90nm_typ_ht.db } 
read_verilog -container r -libname WORK -01 { ../source/Johnson_count.v } 
set_top r:/WORK/Johnson_count 
read_db -container i { ../ref/models/saed90nm_typ_ht.db } 
read_verilog -container i -libname WORK -01 { ../source/dc_out_v/Johnson_count_dc.v } 
set_top i:/WORK/Johnson_count 


set_constant -type port r:/WORK/Johnson_count/SE 0
set_constant -type port r:/WORK/Johnson_count/r 0 
set_constant -type port i:/WORK/Johnson_count/SE 0
set_constant -type port i:/WORK/Johnson_count/r 0 
match 

#set_dont_verify_point -type port

set_dont_verify_point -type port  r:/WORK/Johnson_count/SE

set_dont_verify_point -type port  r:/WORK/Johnson_count/SCANOUTPORT

set_dont_verify_point -type port  r:/WORK/Johnson_count/SCANINPORT

set_dont_verify_point -type port  i:/WORK/Johnson_count/SE

set_dont_verify_point -type port  i:/WORK/Johnson_count/SCANOUTPORT

set_dont_verify_point -type port  i:/WORK/Johnson_count/SCANINPORT

verify 

save_session -replace ../results/design_dc 
