# Exporting Component Description of LSRAM to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component LSRAM
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_SRAM_AHBL_AXI:*} -download_core -component_name {LSRAM} -params {\
"AXI4_AWIDTH:32" \
"AXI4_DWIDTH:64" \
"AXI4_IDWIDTH:8" \
"AXI4_IFTYPE_RD:T" \
"AXI4_IFTYPE_WR:T" \
"AXI4_WRAP_SUPPORT:T" \
"BYTEENABLES:1" \
"BYTE_ENABLE_WIDTH:8" \
"B_REN_POLARITY:2" \
"CASCADE:1" \
"ECC_OPTIONS:0" \
"FABRIC_INTERFACE_TYPE:1" \
"IMPORT_FILE:miv-rv32-ndrbg-services.hex" \
"INIT_RAM:T" \
"LPM_HINT:0" \
"PIPELINE_OPTIONS:1" \
"RDEPTH:65536" \
"RWIDTH:80" \
"USE_NATIVE_INTERFACE:F" \
"WDEPTH:65536" \
"WWIDTH:80" }
# Exporting Component Description of LSRAM to TCL done
