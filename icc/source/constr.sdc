###################################################################

#

###################################################################
#set sdc_version 1.8
#set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA

set_driving_cell -lib_cell NBUFFX16 -pin Z [get_ports clk]
set_driving_cell -lib_cell SDFFARX1 -pin Q [get_ports r]
set_load -pin_load 0.004 [get_ports {out[7]}]
set_load -pin_load 0.004 [get_ports {out[6]}]
set_load -pin_load 0.004 [get_ports {out[5]}]
set_load -pin_load 0.004 [get_ports {out[4]}]
set_load -pin_load 0.004 [get_ports {out[3]}]
set_load -pin_load 0.004 [get_ports {out[2]}]
set_load -pin_load 0.004 [get_ports {out[1]}]
set_load -pin_load 0.004 [get_ports {out[0]}]


create_clock [get_ports clk]  -period 20  -waveform {0 5}
set_clock_uncertainty 0.4  [get_clocks clk]
set_propagated_clock [get_clocks clk]
set_clock_transition -rise 0.8 [get_clocks clk]
set_clock_transition -fall 0.8 [get_clocks clk]
set_input_delay -clock clk  0.85  [get_ports r]


set_output_delay -clock clk  8  [get_ports {out[7]}]
set_output_delay -clock clk  8  [get_ports {out[6]}]
set_output_delay -clock clk  8  [get_ports {out[5]}]
set_output_delay -clock clk  8  [get_ports {out[4]}]
set_output_delay -clock clk  8  [get_ports {out[3]}]
set_output_delay -clock clk  8  [get_ports {out[2]}]
set_output_delay -clock clk  8  [get_ports {out[1]}]
set_output_delay -clock clk  8  [get_ports {out[0]}]
