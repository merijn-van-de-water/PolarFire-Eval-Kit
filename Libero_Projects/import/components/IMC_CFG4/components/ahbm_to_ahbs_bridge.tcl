# Exporting Component Description of ahbm_to_ahbs_bridge to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component ahbm_to_ahbs_bridge
create_and_configure_core -core_vlnv {Actel:DirectCore:COREAHBL2AHBL_BRIDGE:2.2.100} -component_name {ahbm_to_ahbs_bridge} -params {\
"FIFO_EN:true"  \
"MASTER_BIF_TYPE:0"  \
"SLAVE_BIF_TYPE:1"  \
"SYNC_CLOCK:false"   }
# Exporting Component Description of ahbm_to_ahbs_bridge to TCL done
