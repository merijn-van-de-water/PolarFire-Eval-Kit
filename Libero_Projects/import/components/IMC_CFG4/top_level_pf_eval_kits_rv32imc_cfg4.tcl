#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source ./import/components/IMC_CFG4/components/AHBL_bus.tcl 
source ./import/components/IMC_CFG4/components/APB3_bus.tcl 
source ./import/components/IMC_CFG4/components/AXI_Interconnect.tcl 
source ./import/components/IMC_CFG4/components/CCC_0.tcl 
source ./import/components/IMC_CFG4/components/CoreGPIO_OUT.tcl 
source ./import/components/IMC_CFG4/components/DDR3_Subsys.tcl 
source ./import/components/IMC_CFG4/components/DEV_INIT_MONITOR.tcl 
source ./import/components/IMC_CFG4/components/JTAG_IF.tcl 
source ./import/components/IMC_CFG4/components/LSRAM.tcl 
source ./import/components/IMC_CFG4/components/MIV_RV32_C0.tcl 
source ./import/components/IMC_CFG4/components/SPI_Controller.tcl 
source ./import/components/IMC_CFG4/components/SystemServices.tcl 
source ./import/components/IMC_CFG4/components/UART_IF.tcl 
source ./import/components/IMC_CFG4/components/ahbm_to_ahbs_bridge.tcl 
source ./import/components/IMC_CFG4/components/ahbs_to_ahbm_bridge.tcl 
source ./import/components/IMC_CFG4/components/crypto_buffer.tcl 
source ./import/components/IMC_CFG4/components/crypto_processor.tcl 
source ./import/components/IMC_CFG4/components/reset_gen.tcl 
source ./import/components/IMC_CFG4/components/reset_sync_crypto_clk.tcl 
source ./import/components/IMC_CFG4/components/reset_sync.tcl 
source ./import/components/IMC_CFG4/components/top.tcl 
build_design_hierarchy
