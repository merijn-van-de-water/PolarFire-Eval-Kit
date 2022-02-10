# JTAG Clock (TCK) constraint - TCK is typically 6 MHz when debugging with FlashPro, 
# with a maximum frequency of 30 MHz supported by FlashPro5.
create_clock -name {TCK} -period 33.3333 -waveform {0 16.6667 } [ get_ports { TCK } ]

# Asynchronous clock groups in the design
# JATG and Mi-V clocks are independent - adding asynchronous clock group
set_clock_groups -name {asynch_grp1} -asynchronous -group [ get_clocks { CCC_0_0/CCC_0_0/pll_inst_0/OUT0 } ] -group [ get_clocks { TCK } ]
set_clock_groups -name {asynch_grp2} -asynchronous -group [ get_clocks { CCC_0_0/CCC_0_0/pll_inst_0/OUT0 } ] -group [ get_clocks { CCC_0_0/CCC_0_0/pll_inst_0/OUT1 } ]
# Mi-V clock/system clock and DDR AXI clock are independent because CoreAXI4_Interconnect IP takes care of clock domain crossing- adding asynchronous clock group
set_clock_groups -name {asynch_grp3} -asynchronous -group [ get_clocks { CCC_0_0/CCC_0_0/pll_inst_0/OUT0 } ] -group [ get_clocks { DDR3_Subsys_0/CCC_0/pll_inst_0/OUT1 } ]

set_false_path -to [ get_pins { DDR3_Subsys_0/DDRPHY_BLK_0/LANECTRL_ADDR_CMD_0/I_LANECTRL*/HS_IO_CLK_PAUSE } ]

