# (∅) **Phi**OS

PhiOS is a minimal operating system kernel that can be used on the smallest RISCV core that exists at present.

## Features

1. Task Scheduler: A lightweight task scheduler to manage and switch between tasks efficiently, typically using a cooperative or simple preemptive scheduling approach.

2. Interrupt Handling: Support for handling hardware interrupts efficiently and effectively, as embedded devices often rely heavily on interrupt-driven mechanisms.

3. Memory Management: Basic memory management, including support for memory allocation and deallocation, especially in resource-constrained environments.

4. Device Drivers: Minimal device drivers to handle communication with essential peripherals like UART, SPI, I2C, GPIO, timers, and possibly some specialized hardware unique to the embedded device.

5. Low-Power Modes: Support for low-power modes to optimize power consumption when the device is idle or not actively processing tasks.

6. Clock and Timer Management: Basic clock and timer management for scheduling tasks and handling time-related operations.

7. Communication Protocols: Support for relevant communication protocols, such as UART, SPI, I2C, or USB, depending on the device's connectivity requirements.

8. File System (Optional): If the device requires persistent data storage, a minimal file system with read/write capabilities may be included. However, in some cases, it might be sufficient to have just a simple flash memory interface.

9. Error Handling: Basic error handling and reporting mechanisms for debugging and diagnostics.

10. Startup and Initialization: Code to initialize hardware and set up the initial state of the system during boot-up.

11. Debugging Support: Basic debugging support, such as logging and tracing mechanisms.

12. Configurability: Some level of configurability to allow users to enable/disable certain features based on their specific needs, as embedded devices can have various use cases.


## Test

```shell
cd test/hw
#compile hardware
iverilog -s testbench -o ice.vvp  hw/icebreaker_tb.v hw/icebreaker.v hw/ice40up5k_spram.v hw/spimemio.v hw/simpleuart.v hw/picosoc.v hw/picorv32.v hw/spiflash.v -DNO_ICE40_DEFAULT_ASSIGNMENTS  `yosys-config --datdir/ice40/cells_sim.v
#simulate hardware
vvp -N ice.vvp ../fw/bootapp.hex +firmware=../fw/bootapp.hex
```