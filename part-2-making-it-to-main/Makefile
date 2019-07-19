TARGET = main

# Define the linker script locaiton and chip architecture
LD_SCRIPT = STM32L4A6RG_FLASH.ld
MCU_SPEC  = cortex-m4

# Toolchain definitions ARM bare metal defaults
TOOLCHAIN = /usr
CC = $(TOOLCHAIN)/bin/arm-none-eabi-gcc
AS = $(TOOLCHAIN)/bin/arm-none-eabi-as
LD = $(TOOLCHAIN)/bin/arm-none-eabi-ld
OC = $(TOOLCHAIN)/bin/arm-none-eabi-objcopy
OD = $(TOOLCHAIN)/bin/arm-none-eabi-objdump
OS = $(TOOLCHAIN)/bin/arm-none-eabi-size

# Assembly directives
ASFLAGS += -c
ASFLAGS += -O0
ASFLAGS += -mcpu=$(MCU_SPEC)
ASFLAGS += -mthumb
ASFLAGS += -Wall
ASFLAGS += -fmessage-length=0

# C Compiler Directives
CFLAGS += -mcpu=$(MCU_SPEC)
CFLAGS += -mthumb
CFLAGS += -Wall
CFLAGS += -g
CFLAGS += -fmessage-length=0
CFLAGS += --specs=nosys.specs

# Linker Directives
LSCRIPT = ./$(LD_SCRIPT)
LFLAGS += -mcpu=$(MCU_SPEC)
LFLAGS += -mthumb
LFLAGS += -Wall
LFLAGS += --specs=nosys.specs
LFLAGS += -nostdlib
LFLAGS += -lgcc
LFLAGS += -T$(LSCRIPT)

VECT_TBL = ./startup_stm32l4a6xx.S
C_SRC = ./main.c

OBJS = $(VECT_TBL:.S=.o)
OBJS += $(C_SRC:.c=.o)


.PHONY: all
all: $(TARGET).bin

%.o: %.S
	$(CC) -x assembler-with-cpp $(ASFLAGS) $< -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $(INCLUDE) $< -o $@

$(TARGET).elf: $(OBJS)
	$(CC) $^ $(LFLAGS) -o $@

$(TARGET).bin: $(TARGET).elf
	$(OC) -S -O binary $< $@
	$(OC) $<


.PHONY: clean
clean:
	rm -f $(OBJS)
	rm -f $(TARGET).elf









