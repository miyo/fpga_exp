set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]
set_property -dict {PACKAGE_PIN D9 IOSTANDARD LVCMOS33} [get_ports btn]
set_property -dict {PACKAGE_PIN H5 IOSTANDARD LVCMOS33} [get_ports q]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_wiz_0_i/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {counter_100mhz[0]} {counter_100mhz[1]} {counter_100mhz[2]} {counter_100mhz[3]} {counter_100mhz[4]} {counter_100mhz[5]} {counter_100mhz[6]} {counter_100mhz[7]} {counter_100mhz[8]} {counter_100mhz[9]} {counter_100mhz[10]} {counter_100mhz[11]} {counter_100mhz[12]} {counter_100mhz[13]} {counter_100mhz[14]} {counter_100mhz[15]} {counter_100mhz[16]} {counter_100mhz[17]} {counter_100mhz[18]} {counter_100mhz[19]} {counter_100mhz[20]} {counter_100mhz[21]} {counter_100mhz[22]} {counter_100mhz[23]} {counter_100mhz[24]} {counter_100mhz[25]} {counter_100mhz[26]} {counter_100mhz[27]} {counter_100mhz[28]} {counter_100mhz[29]} {counter_100mhz[30]} {counter_100mhz[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {counter_200mhz[0]} {counter_200mhz[1]} {counter_200mhz[2]} {counter_200mhz[3]} {counter_200mhz[4]} {counter_200mhz[5]} {counter_200mhz[6]} {counter_200mhz[7]} {counter_200mhz[8]} {counter_200mhz[9]} {counter_200mhz[10]} {counter_200mhz[11]} {counter_200mhz[12]} {counter_200mhz[13]} {counter_200mhz[14]} {counter_200mhz[15]} {counter_200mhz[16]} {counter_200mhz[17]} {counter_200mhz[18]} {counter_200mhz[19]} {counter_200mhz[20]} {counter_200mhz[21]} {counter_200mhz[22]} {counter_200mhz[23]} {counter_200mhz[24]} {counter_200mhz[25]} {counter_200mhz[26]} {counter_200mhz[27]} {counter_200mhz[28]} {counter_200mhz[29]} {counter_200mhz[30]} {counter_200mhz[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {synch_clock_dout[0]} {synch_clock_dout[1]} {synch_clock_dout[2]} {synch_clock_dout[3]} {synch_clock_dout[4]} {synch_clock_dout[5]} {synch_clock_dout[6]} {synch_clock_dout[7]} {synch_clock_dout[8]} {synch_clock_dout[9]} {synch_clock_dout[10]} {synch_clock_dout[11]} {synch_clock_dout[12]} {synch_clock_dout[13]} {synch_clock_dout[14]} {synch_clock_dout[15]} {synch_clock_dout[16]} {synch_clock_dout[17]} {synch_clock_dout[18]} {synch_clock_dout[19]} {synch_clock_dout[20]} {synch_clock_dout[21]} {synch_clock_dout[22]} {synch_clock_dout[23]} {synch_clock_dout[24]} {synch_clock_dout[25]} {synch_clock_dout[26]} {synch_clock_dout[27]} {synch_clock_dout[28]} {synch_clock_dout[29]} {synch_clock_dout[30]} {synch_clock_dout[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list kick]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list synch_clock_dout_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list synch_clock_rcv]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk100mhz]
