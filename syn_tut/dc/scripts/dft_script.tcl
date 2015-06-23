remove_design -all
set test_default_scan_style
read_verilog ../source/Johnson_count_dft.v

source ../source/constr.sdc

set_dft_signal -view exist -type ScanMasterClock -timing {45 55} -port clk
set_dft_signal -view exist -type Reset -active 1 -port r

set_dft_signal -view exist -type ScanEnable -active 1 -port SE
report_dft_signal -view exist

create_test_protocol
dft_drc
write_test_protocol -out ../source/counter_test.spf
create_clock clk -period 1000
set_input_delay 250 SCANINPORT -clock clk
set_input_delay 150 SE -clock clk
compile -scan
link
read_test_protocol ../source/counter_test.spf
set_dft_signal -view exist -type ScanMasterClock -timing {45 55} -port clk
set_dft_signal -view exist -port r -type Reset -active_state 1

set_dft_signal -view exist -port SE  -type ScanEnable  -active_state 1
set_dft_insertion_configuration -preserve_design_name true
set_dft_signal -view spec -port SCANINPORT -type ScanDataIn
set_dft_signal -view spec -port SCANOUTPORT -type ScanDataOut
set_scan_configuration -chain_count 1
preview_dft
insert_dft

set_fix_multiple_port_nets -all -buffer_constants
compile -scan -incremental

dft_drc -coverage_estimate
report_area

write -format ddc -h  -o     ../results/Johnson_count_dft.ddc
write -format verilog -h  -o ../results/Johnson_count_dft.v
write_sdf                    ../results/Johnson_count_dft.sdf
write_scan_def  -out ../results/Johnson_count_dft.scan.def
