riscv32-unknown-elf-gcc boot.c -c -mabi=ilp32 -march=rv32ic -Os --std=c99 -ffreestanding -nostdlib
riscv32-unknown-elf-gcc -Os -mabi=ilp32 -march=rv32imc -ffreestanding -nostdlib -o boot.elf -Wl,--build-id=none,-Bstatic,-T,boot.lds,-Map,boot.map,--strip-debug boot.o -lgcc



riscv32-unknown-elf-gcc -nostdlib -fno-builtin -mcmodel=medany -march=rv32ima -mabi=ilp32 -T os.lds -o os.elf start.S sys.s lib.c task.c os.c user.c


# riscv32-unknown-elf-objcopy boot.elf --pad-to=0x4000 --gap-fill=0x00 -O verilog  boot.hex
riscv32-unknown-elf-objcopy os.elf -O verilog  os.hex
cat boot.hex os.hex > bootos.hex
