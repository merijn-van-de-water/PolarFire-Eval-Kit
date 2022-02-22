## Mi-V Extended Subsystem Design Guide Configuration 3: PF uPROM Boot
This folder contains Tcl scripts that build Libero SoC v2021.3 MIV_ESS DGC1 design project for the PolarFire Eval Kit. The script is executed in Libero SoC to generate the sample design. 
> Design is catered for Libero SoC v2021.3. Using older versions of Libero SoC will result in errors.

#### PF_Avalanche_MIV_RV32_BaseDesign (no PolarFire Engineering Sample silicon project for DGC3)

| Config  | Description |
| :------:|:----------------------------------------|
| DGC3    | This design uses the **MIV_RV32** core configured as follows: <ul><li>RISC-V Extensions: IMC</li><li>Multiplier: MACC (Pipelined)</li><li>Interfaces: AHB Master (mirrored), APB3 Master</li><li>Reset Vector Address: 0x4000_0000</li><li>Internal IRQs: 6</li><li>TCM: Enabled</li><li>TCM APB Slave (TAS): Enabled</li><li>System Timer: Internal MTIME enabled, Internal MTIME IRQ enabled</li><li>Debug: enabled</li></ul>This design uses the **MIV_ESS** core configured as follows: <ul><li>Bootstrap: Enabled</li><li>Bootstrap Source: uPROM</li><li>uDMA: Disabled</li><li>GPIO: Enabled, 2 GPIO_IN and 4 GPIO_OUT (fixed config)</li><li>I2C: Disabled</li><li>PLIC: Disabled</li><li>SPI: Disabled</li><li>Timer: Disabled</li><li>UART: Enabled</li><li>Watchdog: Disabled</li></ul>|

> This design configuration is only available for the PolarFire Eval Kit (Revision D with production silicon devices).


## <a name="quick"></a> Instructions

#### Running Libero SoC in GUI mode, with Script Arguments
    1. Open Libero SoC
    2. Execute the selected script, Project -> Execute Script
    3. Select the directory that the script is located in, using the "..."
    4. Select the script and select "Open"
    5. In the arguments text box, enter "DGC3 SYNTHESIZE"
    6. Select the "Run" button to execute the script
    7. Once complete, a script report will be generated.

In this example, the arguments "DGC3 SYNTHESIZE" are entered to take the project through to Synthesis.

Libero executes the script and opens the Mi-V sample project. The script adds Timing constraints to the project for Synthesis, Place and Route, and Timing Verification. Additionally, IO Constraints are added to the project for Place and Route. The project can now be taken through the remainder of the Libero SoC design flow.

## <a name="Script arguments"></a> Script Arguments
The complete set of script arguments are documented here.

#### First argument:
| Argument                  |  Description   |
| ------------------------- |:---------------|
| DGC1                      | Generate a MIV_ESS example design from the MIV_ESS Design Guide  |

#### Second argument:
| Argument                  |  Description   |
| ------------------------- |:---------------|
| SYNTHESIZE                | Run synthesis on the design  |
| PLACE_AND_ROUTE           | Run place and route on the design  |
| GENERATE_BITSTREAM        | Generate the bitstream for the design|
| EXPORT_PROGRAMMING_FILE   | Export the programming file (.job) |


## <a name="Software Provided"></a> Software Provided
There are two programs included with this configuration:
* **miv-rv32i-systick-blinky.hex**: A Hex program configured to run from TCM's address (0x4000_0000). The program is initialized in the uPROM system controller component (PF_uPROM).
    > The example hex program was created using  miv-rv32i-systick-blinky in release mode (mivrv32i-Release).


## <a name="Design Guide Configuration - DGC1: SPI Write & Boot"></a> Design Guide Configuration - DGC3: PF uPROM Boot

### Features
The Libero designs include the following features:
* A soft RISC-V processor.
* A RISC-V debug block allowing on-target debug using SoftConsole
* An Extended subsystem with peripheral cores
* The operating frequency of the design is 50MHz
* Target memory is TCM (32kB)
* User peripherals: MIV_ESS (Bootstrap, GPIO, UART), PF_uPROM

### Boot Sequence Operation
A more detailed description of the boot sequence can be found in this section.

> Pre-requisites:
> * The board needs to be programmed with DGC3 bitstream. Refer to this section, run the [Libero Design](#Running Libero SoC in GUI mode, with Script Arguments)

    1. Once the board has been powered-on, hold SW8 to enable the Bootstrap functionality in the MIV_ESS. Then press and release SW6 or SW7 to perform a system reset request or reset cycle the board.
    2. MIV_ESS copies a program from the PF_uPROM component to the MIV_RV32 Tightly-Coupled Memory (TCM) via the TCM APB Slave (TAS) interface.
    3. When the transfer from PF_uPROM component is complete, MIV_ESS releases MIV_RV32 core from reset and MIV_RV32 is allowed to boot the program from TCM.
    4. The LEDs on the PolarFire Eval Kit will start blinking, signifying Bootstrap has completed its transfer and SW6 can then be released.   

### Peripherals - MIV_ESS

| Peripheral                       | Address Start | Address End    |
| ------------------------------:  |:-------------:|:--------------:|
| PLIC                             | 0x7000_0000   | 0x70FF_FFFF    |
| CoreUARTapb                      | 0x7100_0000   | 0x71FF_FFFF    |
| Timer                            | 0x7200_0000   | 0x72FF_FFFF    |
| CoreTimer_0 / MIV_ESS_APBSLOT3   | 0x7300_0000   | 0x73FF_FFFF    |
| CoreTimer_1 / MIV_ESS_APBSLOT4   | 0x7400_0000   | 0x74FF_FFFF    |
| CoreGPIO_OUT                     | 0x7500_0000   | 0x75FF_FFFF    |
| SPI                              | 0x7600_0000   | 0x76FF_FFFF    |
| uDMA                             | 0x7800_0000   | 0x78FF_FFFF    |
| WDOG                             | 0x7900_0000   | 0x79FF_FFFF    |
| I2C                              | 0x7A00_0000   | 0x7AFF_FFFF    |
| MIV_ESS_APBSLOTB_BASE            | 0x7B00_0000   | 0x7BFF_FFFF    |
| MIV_ESS_APBSLOTC_BASE            | 0x7C00_0000   | 0x7CFF_FFFF    |
| MIV_ESS_APBSLOTD_BASE            | 0x7D00_0000   | 0x7DFF_FFFF    |
| MIV_ESS_APBSLOTE_BASE            | 0x7E00_0000   | 0x7EFF_FFFF    |
| MIV_ESS_APBSLOTF_BASE            | 0x7F00_0000   | 0x7FFF_FFFF    |
    
### Memory Sources
    
| Memory Source                    | Address Start | Address End | Size   |
| -------------------------------: |:-------------:|:-----------:|:------:|
| TCM                              | 0x4000_0000   | 0x4000_7FFF | 32kB   | 
| LSRAM                            | 0x8000_0000   | 0x8000_7FFF | 32kB   |


