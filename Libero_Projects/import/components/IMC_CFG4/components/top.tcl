# Creating SmartDesign top
set sd_name {BaseDesign}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CTRLR_READY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD1} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISCLKO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPISS} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SS_BUSY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N} -port_direction {OUT} -port_is_pad {1}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[15:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[2:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OUTS} -port_direction {OUT} -port_range {[3:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[15:0]} -port_is_pad {1}

# Add AHBL_bus_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {AHBL_bus} -instance_name {AHBL_bus_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {AHBL_bus_0:REMAP_M0} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {AHBL_bus_0:AHBmslave0}



# Add ahbm_to_ahbs_bridge_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {ahbm_to_ahbs_bridge} -instance_name {ahbm_to_ahbs_bridge_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ahbm_to_ahbs_bridge_0:BURST_ERROR}



# Add ahbs_to_ahbm_bridge_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {ahbs_to_ahbm_bridge} -instance_name {ahbs_to_ahbm_bridge_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ahbs_to_ahbm_bridge_0:BURST_ERROR}



# Add APB3_bus_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {APB3_bus} -instance_name {APB3_bus_0}



# Add AXI_Interconnect_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {AXI_Interconnect} -instance_name {AXI_Interconnect_0}



# Add CCC_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CCC_0} -instance_name {CCC_0_0}



# Add CoreGPIO_OUT_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreGPIO_OUT} -instance_name {CoreGPIO_OUT_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_OUT_0:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreGPIO_OUT_0:GPIO_IN} -value {GND}



# Add crypto_buffer_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {crypto_buffer} -instance_name {crypto_buffer_0}



# Add crypto_processor_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {crypto_processor} -instance_name {crypto_processor_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {crypto_processor_0:PURGE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {crypto_processor_0:START} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {crypto_processor_0:BUSY}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {crypto_processor_0:STALL} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {crypto_processor_0:DLL_LOCK}



# Add DDR3_Subsys_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR3_Subsys} -instance_name {DDR3_Subsys_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DDR3_Subsys_0:PLL_LOCK}



# Add DEV_INIT_MONITOR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DEV_INIT_MONITOR} -instance_name {DEV_INIT_MONITOR_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:FABRIC_POR_N}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DEV_INIT_MONITOR_0:AUTOCALIB_DONE}



# Add JTAG_IF_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {JTAG_IF} -instance_name {JTAG_IF_0}



# Add LSRAM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LSRAM} -instance_name {LSRAM_0}



# Add MIV_RV32_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_RV32_C0} -instance_name {MIV_RV32_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:JTAG_TDO_DR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:EXT_RESETN}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:EXT_IRQ} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:TIME_COUNT_OUT}



# Add reset_gen_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {reset_gen} -instance_name {reset_gen_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_gen_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_gen_0:FF_US_RESTORE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_gen_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_gen_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_gen_0:FPGA_POR_N} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {reset_gen_0:PLL_POWERDOWN_B}



# Add reset_sync_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {reset_sync} -instance_name {reset_sync_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_0:FF_US_RESTORE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_0:FPGA_POR_N} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {reset_sync_0:PLL_POWERDOWN_B}



# Add reset_sync_crypto_clk_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {reset_sync_crypto_clk} -instance_name {reset_sync_crypto_clk_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_crypto_clk_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_crypto_clk_0:FF_US_RESTORE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_crypto_clk_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_crypto_clk_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_crypto_clk_0:FPGA_POR_N} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {reset_sync_crypto_clk_0:PLL_POWERDOWN_B}



# Add SPI_Controller_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SPI_Controller} -instance_name {SPI_Controller_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {SPI_Controller_0:SPISS} -pin_slices {[0:0]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SPI_Controller_0:SPIINT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SPI_Controller_0:SPIRXAVAIL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SPI_Controller_0:SPITXRFM}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SPI_Controller_0:SPISSI} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SPI_Controller_0:SPICLKI} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SPI_Controller_0:SPIOEN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SPI_Controller_0:SPIMODE}



# Add SystemServices_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SystemServices} -instance_name {SystemServices_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SystemServices_0:USR_CMD_ERROR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SystemServices_0:USR_BUSY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SystemServices_0:USR_RDVLD}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SystemServices_0:SYSSERV_INIT_REQ}



# Add UART_IF_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {UART_IF} -instance_name {UART_IF_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_IF_0:TXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_IF_0:RXRDY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_IF_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_IF_0:OVERFLOW}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_IF_0:FRAMING_ERR}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AHBL_bus_0:HCLK" "AXI_Interconnect_0:ACLK" "CCC_0_0:OUT0_FABCLK_0" "CoreGPIO_OUT_0:PCLK" "DDR3_Subsys_0:PLL_REF_CLK" "LSRAM_0:ACLK" "MIV_RV32_C0_0:CLK" "SPI_Controller_0:PCLK" "SystemServices_0:CLK" "UART_IF_0:PCLK" "ahbm_to_ahbs_bridge_0:HCLK_M0" "ahbs_to_ahbm_bridge_0:HCLK_S0" "crypto_buffer_0:HCLK" "reset_gen_0:CLK" "reset_sync_0:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AHBL_bus_0:HRESETN" "AXI_Interconnect_0:ARESETN" "CoreGPIO_OUT_0:PRESETN" "LSRAM_0:ARESETN" "MIV_RV32_C0_0:RESETN" "SPI_Controller_0:PRESETN" "SystemServices_0:RESETN" "UART_IF_0:PRESETN" "ahbm_to_ahbs_bridge_0:HRESETN_M0" "ahbs_to_ahbm_bridge_0:HRESETN_S0" "crypto_buffer_0:HRESETN" "reset_gen_0:FABRIC_RESET_N" "reset_sync_crypto_clk_0:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_Interconnect_0:S_CLK1" "DDR3_Subsys_0:SYS_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAS_N" "DDR3_Subsys_0:CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_0_0:OUT1_FABCLK_0" "ahbm_to_ahbs_bridge_0:HCLK_S0" "ahbs_to_ahbm_bridge_0:HCLK_M0" "crypto_processor_0:HCLK" "reset_sync_crypto_clk_0:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_0_0:PLL_LOCK_0" "reset_gen_0:PLL_LOCK" "reset_sync_0:PLL_LOCK" "reset_sync_crypto_clk_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_0_0:REF_CLK_0" "REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0" "DDR3_Subsys_0:CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0_N" "DDR3_Subsys_0:CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "DDR3_Subsys_0:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS_N" "DDR3_Subsys_0:CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CTRLR_READY" "DDR3_Subsys_0:CTRLR_READY" "reset_gen_0:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:ODT" "ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:RAS_N" "RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:SHIELD0" "SHIELD0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:SHIELD1" "SHIELD1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:SYS_RESET_N" "reset_sync_0:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:WE_N" "WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DEV_INIT_MONITOR_0:BANK_1_CALIB_STATUS" "reset_sync_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DEV_INIT_MONITOR_0:DEVICE_INIT_DONE" "reset_gen_0:INIT_DONE" "reset_sync_crypto_clk_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EXT_RST_N" "reset_sync_0:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JTAG_IF_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JTAG_IF_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JTAG_IF_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JTAG_IF_0:TGT_TCK_0" "MIV_RV32_C0_0:JTAG_TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JTAG_IF_0:TGT_TDI_0" "MIV_RV32_C0_0:JTAG_TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JTAG_IF_0:TGT_TDO_0" "MIV_RV32_C0_0:JTAG_TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JTAG_IF_0:TGT_TMS_0" "MIV_RV32_C0_0:JTAG_TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JTAG_IF_0:TGT_TRSTN_0" "MIV_RV32_C0_0:JTAG_TRSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JTAG_IF_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"JTAG_IF_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX" "UART_IF_0:RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPISCLKO" "SPI_Controller_0:SPISCLKO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPISDI" "SPI_Controller_0:SPISDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPISDO" "SPI_Controller_0:SPISDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPISS" "SPI_Controller_0:SPISS[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SS_BUSY" "SystemServices_0:SS_BUSY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TX" "UART_IF_0:TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ahbm_to_ahbs_bridge_0:HRESETN_S0" "ahbs_to_ahbm_bridge_0:HRESETN_M0" "crypto_processor_0:HRESETN" "reset_sync_crypto_clk_0:FABRIC_RESET_N" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A" "DDR3_Subsys_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA" "DDR3_Subsys_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_OUT_0:GPIO_OUT" "GPIO_OUTS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:DM" "DM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:DQ" "DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:DQS" "DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR3_Subsys_0:DQS_N" "DQS_N" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AHBL_bus_0:AHBmmaster0" "MIV_RV32_C0_0:AHBL_MSTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AHBL_bus_0:AHBmmaster1" "ahbm_to_ahbs_bridge_0:AHBL_Master" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AHBL_bus_0:AHBmslave1" "crypto_buffer_0:AHBSlaveInterface" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AHBL_bus_0:AHBmslave2" "ahbs_to_ahbm_bridge_0:AHBL_Slave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB3_bus_0:APB3mmaster" "MIV_RV32_C0_0:APB_MSTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB3_bus_0:APBmslave0" "UART_IF_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB3_bus_0:APBmslave1" "CoreGPIO_OUT_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB3_bus_0:APBmslave2" "SPI_Controller_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB3_bus_0:APBmslave3" "SystemServices_0:APBSlave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_Interconnect_0:AXI4mmaster0" "MIV_RV32_C0_0:AXI4_MSTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_Interconnect_0:AXI4mslave0" "LSRAM_0:AXI4_Slave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_Interconnect_0:AXI4mslave1" "DDR3_Subsys_0:AXI4slave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ahbm_to_ahbs_bridge_0:AHBL_MMaster" "crypto_processor_0:AHB_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ahbs_to_ahbm_bridge_0:AHBL_MSlave" "crypto_processor_0:AHB_SLAVE" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign top
generate_component -component_name ${sd_name}
