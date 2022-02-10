set project_folder_name MIV_CFG4_BD
set project_dir4 "./$project_folder_name"

puts "\n---------------------------------------------------------------------------------------------------------"
puts "Importing Components..."
puts "---------------------------------------------------------------------------------------------------------\n"

source ./import/components/IMC_CFG4/top_level_pf_eval_kits_rv32imc_cfg4.tcl

puts "\n---------------------------------------------------------------------------------------------------------"
puts "Components Imported."
puts "---------------------------------------------------------------------------------------------------------\n"

build_design_hierarchy
set_root BaseDesign

puts "\n---------------------------------------------------------------------------------------------------------"
puts "Applying Design Constraints..."
puts "---------------------------------------------------------------------------------------------------------\n"

import_files -io_pdc ./import/components/IMC_CFG4/constraints/io_constraints.pdc
import_files -sdc ./import/components/IMC_CFG4/constraints/timing_user_constraints.sdc
import_files -fp_pdc ./import/components/IMC_CFG4/constraints/fp_constraints.pdc


# #Associate SDC constraint file to Place and Route tool
organize_tool_files -tool {PLACEROUTE} \
    -file $project_dir4/constraint/io/io_constraints.pdc \
    -file $project_dir4/constraint/timing_user_constraints.sdc \
	-file $project_dir4/constraint/fp/fp_constraints.pdc \
    -module {BaseDesign::work} -input_type {constraint}

organize_tool_files -tool {SYNTHESIZE} \
	-file $project_dir4/constraint/timing_user_constraints.sdc \
    -module {BaseDesign::work} -input_type {constraint}

organize_tool_files -tool {VERIFYTIMING} \
	-file $project_dir4/constraint/timing_user_constraints.sdc \
    -module {BaseDesign::work} -input_type {constraint}

set_root BaseDesign
run_tool -name {CONSTRAINT_MANAGEMENT}
derive_constraints_sdc

puts "\n---------------------------------------------------------------------------------------------------------"
puts "Design Constraints Applied."
puts "---------------------------------------------------------------------------------------------------------\n"

puts "\n---------------------------------------------------------------------------------------------------------"
puts "CFG4 Memory Map"
puts "\n---------------------------------------------------------------------------------------------------------"

puts "| Component             | Address Offset  | Range  | High Address |"
puts "| Crypto_Buffer_0       | 0x0100_0000     | 16MB   | 0x01FF_FFFF  |"
puts "| AHBS_TO_AHBM_Bridge   | 0x0200_0000     | 16MB   | 0x02FF_FFFF  |"
puts "| UART_IF_0             | 0x7000_0000     | 4KB    | 0x0000_0FFF  |"
puts "| CoreGPIO_OUT_0        | 0x7000_1000     | 4KB    | 0x0000_1FFF  |"
puts "| SPI_Controller        | 0x7000_2000     | 4KB    | 0x0000_2FFF  |"
puts "| SystemServices_0      | 0x7000_3000     | 4KB    | 0x0000_3FFF  |"
puts "| LSRAM_0               | 0x8000_0000     | 64kB   | 0x8000_FFFF  |"
puts "| DDR3_Subsys_0         | 0x8001_0000     | 15MB   | 0x80FF_FFFF  |"