# Exporting Component Description of crypto_processor to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component crypto_processor
create_and_configure_core -core_vlnv {Actel:SgCore:PF_CRYPTO:*} -download_core -component_name {crypto_processor} -params {\
"DLL_FREQUENCY:125"  \
"DLL_JITTER_TOLERANCE:Medium_Low"  \
"ENABLE_ALARM:false"  \
"ENABLE_BUSERROR:false"  \
"ENABLE_COMPLETE:false"  \
"SHOW_DRI_PORTS:false"  \
"SHOW_TEST_PORTS:false"  \
"USE_EMBEDDED_DLL:true"   }
# Exporting Component Description of crypto_processor to TCL done
