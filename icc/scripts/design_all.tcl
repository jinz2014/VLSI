create_floorplan -core_utilization 0.33 -start_first_row -flip_first_row -left_io2core 1 -bottom_io2core 1 -right_io2core 1 -top_io2core 1

set power                    "VDD"
set ground                   "VSS"
set powerPort                "VDD"
set groundPort               "VSS"
set mw_logic0_net 	     "VSS"
set mw_logic1_net 	     "VDD"

# defining power/ground nets and pins			 
derive_pg_connection -power_net VDD	-ground_net VSS	-power_pin VDD -ground_pin VSS	

#creating power rectangular ring		
create_rectangular_rings  -nets  {VDD VSS}  \
  -left_offset 0.2 -left_segment_layer M4 \
  -right_offset 0.2 -right_segment_layer M4 \
  -bottom_offset 0.2 -bottom_segment_layer M3 -extend_bh \
  -top_offset 0.2 -top_segment_layer M3 

# M4 (left/right), M3(top/bot)
create_power_straps  -direction horizontal  -nets  {VDD}  \
  -layer M4 -configure groups_and_step  -num_groups 28 -step 3

create_power_straps  -direction horizontal  -start_at 1.5 -nets  {VSS}  \
  -layer M4 -configure groups_and_step  -num_groups 28 -step 3

create_power_straps  -direction vertical  -nets  {VDD}  \
  -layer M3 -configure groups_and_step  -num_groups 28 -step 3

create_power_straps  -direction vertical  -start_at 1.5 -nets  {VSS}  \
  -layer M3 -configure groups_and_step  -num_groups 28 -step 3

## read DFT scan.def
read_def -verbose ../../syn_tut/dc/results/Johnson_count_dft.scan.def

puts "start_place"

## This should be changed back once we figure out how to deal with read_def!!!!
place_opt -effort high -optimize_dft -congestion
legalize_placement -effort high -incremental 

set_fix_multiple_port_nets -all -buffer_constants

# run again after set_fix_multiple_port_nets 
place_opt -effort high -optimize_dft -congestion
#place_opt -effort high -continue_on_missing_scandef -congestion
legalize_placement -effort high -incremental 

#
preroute_standard_cells -nets VSS -connect horizontal
preroute_standard_cells -nets VDD -connect horizontal

verify_pg_nets  -pad_pin_connection all
save_mw_cel

puts "finish_place"

puts "start_cts"

check_legality

#	unknown option:	-delay_insertion true
#-target_early_delay insertion_delay
set_clock_tree_options -clock_trees clk \
		-insert_boundary_cell true \
		-ocv_clustering true \
		-buffer_relocation true \
		-buffer_sizing true \
		-gate_relocation true \
		-gate_sizing true 

		
set cts_use_debug_mode true
set cts_do_characterization true

puts "stdcell_filler"

#The options for clock_opt:
#--------------------------
#COPT:  Clock Tree Synthesis                 : Yes
#COPT:  Post CTS Optimization                : Yes
#COPT:  Concurrent Clock/Data Optimization   : No
#COPT:  Operation Condition                  : max
#COPT:  Balance Inter Clock Delay            : No
#COPT:  Route Clock Nets                     : Yes
#COPT:  Update Clock Latency                 : No
#COPT:  Optimize Hold for All Clocks         : Yes
#COPT:  Optimize Hold Timing Only            : No
#COPT:  Optimize DFT                         : No
#COPT:  Area Recovery                        : No
#COPT:  Size Only                            : No
#COPT:  In Place Size Only                   : No
#COPT:  Congestion removal                   : No
#COPT:  Optimize Power                       : No
#---------------------------------------------------
#clock_opt -fix_hold_all_clocks -continue_on_missing_scandef
clock_opt -fix_hold_all_clocks

# show slack
report_clock_tree -operating_condition max

# defining power/ground nets and pins again ?
#derive_pg_connection -power_net VDD		\
			 -ground_net VSS	\
			 -power_pin VDD		\
			 -ground_pin VSS	
			 
#preroute_standard_cells -nets VSS -connect horizontal
#preroute_standard_cells -nets VDD -connect horizontal
#verify_pg_nets -pad_pin_connection all

save_mw_cel

puts "finish_cts"

puts "start_route"

check_routeability

#Error: value not specified for option '-arnoldi_effort'
set_delay_calculation -arnoldi medium


set_net_routing_layer_constraints \
	-max_layer_name M5 -min_layer_name M1 {*}

set_si_options -route_xtalk_prevention true\
	 -delta_delay true \
	 -min_delta_delay true \
	 -static_noise true\
	 -max_transition_mode normal_slew \
	 -timing_window true 

set_route_options -groute_timing_driven true \
	-groute_incremental true \
	-track_assign_timing_driven true \
	-same_net_notch check_and_fix 

#
route_opt -effort high \
	-stage global \
  -incremental 

save_mw_cel
	
# zrout doen't support the option -optimize_wire_via
route_opt -effort high \
	-stage track \
	-xtalk_reduction \
	-incremental 
	#-optimize_wire_via \

save_mw_cel
	
verify_route

insert_redundant_vias -auto_mode insert

insert_stdcell_filler -cell_without_metal SHFILL1 \
	-connect_to_power VDD -connect_to_ground VSS
	
insert_stdcell_filler -cell_without_metal SHFILL2 \
	-connect_to_power VDD -connect_to_ground VSS

insert_well_filler -layer NWELL \
	-higher_edge max -lower_edge min
	
#preroute_standard_cells -nets VDD -connect horizontal
#preroute_standard_cells -nets VSS -connect horizontal
#verify_pg_nets  -pad_pin_connection all

route_opt -incremental -size_only

# 
	
# DRC check
route_search_repair -loop 500 -rerun_drc 

# remove null error for LVS
derive_pg_connection -power_net VDD	-ground_net VSS	-power_pin VDD -ground_pin VSS	

# Layout vs. Schematic
verify_lvs

save_mw_cel

puts "finish_route"

close_mw_cel
close_mw_lib

set_mw_lib_reference  -mw_reference_library {../ref/saed90nm_dv} ./COUNT/
open_mw_lib ./COUNT
set ::auto_restore_mw_cel_lib_setup false
open_mw_cel  Johnson_count

set_write_stream_options -map_layer ../ref/saed90nm.gdsout.map \
                               -output_filling fill \
                               -child_depth 20 \
                               -output_outdated_fill  \
                              -output_pin  {text geometry}

write_stream -lib COUNT\
              -format gds\
              -cells Johnson_count\
              ../results/Johnson_count.gds

extract_rc

write_parasitics -output {../results/Johnson_count.spef}

write_verilog -pg -no_physical_only_cells ../results/Johnson_count.v

write_verilog -no_physical_only_cells ../results/Johnson_count_fm.v
