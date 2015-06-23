
###
### Formality (R) hierarchical verification script /share/jinz/Synopsys_Tutorial/virginia/formality/pre_lay/scripts/my_fm_pre_script.tcl
###
### Reference design: r:/WORK/Johnson_count
### Implementation design: i:/WORK/Johnson_count
### Generated Sat Apr  6 10:55:29 2013
###

redirect         ${fm_work_path}fm_my_fm_pre_script.log {echo "**************************************************************************************************"}
redirect -append ${fm_work_path}fm_my_fm_pre_script.log {echo "fm_my_fm_pre_script.log:  Results of hierarchical verification script /share/jinz/Synopsys_Tutorial/virginia/formality/pre_lay/scripts/my_fm_pre_script.tcl"}
redirect -append ${fm_work_path}fm_my_fm_pre_script.log {echo "**************************************************************************************************"}

setup

if [info exists verification_constant_prop_mode] {set fm_write_hier_saved_vars_top(verification_constant_prop_mode) $verification_constant_prop_mode}
set verification_constant_prop_mode none
if [info exists signature_analysis_match_blackbox_input] {set fm_write_hier_saved_vars_top(signature_analysis_match_blackbox_input) $signature_analysis_match_blackbox_input}
set signature_analysis_match_blackbox_input false
if [info exists signature_analysis_match_blackbox_output] {set fm_write_hier_saved_vars_top(signature_analysis_match_blackbox_output) $signature_analysis_match_blackbox_output}
set signature_analysis_match_blackbox_output false
if [info exists signature_analysis_match_primary_input] {set fm_write_hier_saved_vars_top(signature_analysis_match_primary_input) $signature_analysis_match_primary_input}
set signature_analysis_match_primary_input false
if [info exists signature_analysis_match_primary_output] {set fm_write_hier_saved_vars_top(signature_analysis_match_primary_output) $signature_analysis_match_primary_output}
set signature_analysis_match_primary_output false
set fm_save_file_limit 1
set fm_save_time_limit 0
if [info exists fm_hier_result_array] {unset fm_hier_result_array}
set fm_hier_result_count 0
set fm_tmp_result_count 0
set fm_session_files_saved 0


###
### Verifying block i:/WORK/Johnson_count vs r:/WORK/Johnson_count...
###
### 1 instance:
### i:/WORK/Johnson_count vs r:/WORK/Johnson_count
###

set_reference_design r:/WORK/Johnson_count
set_implementation_design i:/WORK/Johnson_count

set_user_match -type port $impl/SCANINPORT $ref/SCANINPORT
set_user_match -type port $impl/SCANOUTPORT $ref/SCANOUTPORT
set_user_match -type port $impl/SE $ref/SE
set_user_match -type port $impl/clk $ref/clk
set_user_match -type port $impl/out[0] $ref/out[0]
set_user_match -type port $impl/out[1] $ref/out[1]
set_user_match -type port $impl/out[2] $ref/out[2]
set_user_match -type port $impl/out[3] $ref/out[3]
set_user_match -type port $impl/out[4] $ref/out[4]
set_user_match -type port $impl/out[5] $ref/out[5]
set_user_match -type port $impl/out[6] $ref/out[6]
set_user_match -type port $impl/out[7] $ref/out[7]
set_user_match -type port $impl/r $ref/r

set fm_pre_verification_cputime [cputime]

verify

set fm_incremental_verification_cputime [expr [cputime] - $fm_pre_verification_cputime]
set fm_cumulative_memory [expr [memory] / 1000]

redirect -append ${fm_work_path}fm_my_fm_pre_script.log {format "Verification %12s: %s vs %s" $verification_status $impl $ref}
redirect -append ${fm_work_path}fm_my_fm_pre_script.log {format "                           %s, %4.0fMB (cumulative), %7.2fsec (incremental)" [date] $fm_cumulative_memory $fm_incremental_verification_cputime}

set fm_tmp_result_count [expr $fm_tmp_result_count + 1]
set fm_hier_result_array($fm_tmp_result_count) [ list $ref $impl $verification_status ]
if [expr (![string compare $verification_status "FAILED"]) && \
         ($fm_session_files_saved < $fm_save_file_limit) && \
         ($fm_incremental_verification_cputime >= $fm_save_time_limit)] {
  save_session -replace /share/jinz/Synopsys_Tutorial/virginia/formality/pre_lay/results/fm_WORK_Johnson_count_vs_WORK_Johnson_count.fss
  lappend fm_hier_result_array($fm_tmp_result_count) /share/jinz/Synopsys_Tutorial/virginia/formality/pre_lay/results/fm_WORK_Johnson_count_vs_WORK_Johnson_count.fss
  set fm_session_files_saved [expr $fm_session_files_saved + 1]
}

setup

remove_user_match -type port $impl/SCANINPORT
remove_user_match -type port $impl/SCANOUTPORT
remove_user_match -type port $impl/SE
remove_user_match -type port $impl/clk
remove_user_match -type port $impl/out[0]
remove_user_match -type port $impl/out[1]
remove_user_match -type port $impl/out[2]
remove_user_match -type port $impl/out[3]
remove_user_match -type port $impl/out[4]
remove_user_match -type port $impl/out[5]
remove_user_match -type port $impl/out[6]
remove_user_match -type port $impl/out[7]
remove_user_match -type port $impl/r

if [info exists fm_write_hier_saved_vars_top ] {foreach _var [array names fm_write_hier_saved_vars_top] {set $_var $fm_write_hier_saved_vars_top($_var)}; unset fm_write_hier_saved_vars_top}

set fm_hier_result_count $fm_tmp_result_count
set fm_log_fp [open ${fm_work_path}fm_my_fm_pre_script.log]
puts [read $fm_log_fp]
close $fm_log_fp
