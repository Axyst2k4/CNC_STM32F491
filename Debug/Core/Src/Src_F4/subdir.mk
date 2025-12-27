################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Src_F4/driver.c \
../Core/Src/Src_F4/driver_spindles.c \
../Core/Src/Src_F4/flash.c \
../Core/Src/Src_F4/ioports.c \
../Core/Src/Src_F4/pwm.c \
../Core/Src/Src_F4/serial.c \
../Core/Src/Src_F4/spi.c \
../Core/Src/Src_F4/thcad2.c \
../Core/Src/Src_F4/timers.c \
../Core/Src/Src_F4/tmc_spi.c \
../Core/Src/Src_F4/tmc_uart.c \
../Core/Src/Src_F4/w5x00_ll_driver.c 

OBJS += \
./Core/Src/Src_F4/driver.o \
./Core/Src/Src_F4/driver_spindles.o \
./Core/Src/Src_F4/flash.o \
./Core/Src/Src_F4/ioports.o \
./Core/Src/Src_F4/pwm.o \
./Core/Src/Src_F4/serial.o \
./Core/Src/Src_F4/spi.o \
./Core/Src/Src_F4/thcad2.o \
./Core/Src/Src_F4/timers.o \
./Core/Src/Src_F4/tmc_spi.o \
./Core/Src/Src_F4/tmc_uart.o \
./Core/Src/Src_F4/w5x00_ll_driver.o 

C_DEPS += \
./Core/Src/Src_F4/driver.d \
./Core/Src/Src_F4/driver_spindles.d \
./Core/Src/Src_F4/flash.d \
./Core/Src/Src_F4/ioports.d \
./Core/Src/Src_F4/pwm.d \
./Core/Src/Src_F4/serial.d \
./Core/Src/Src_F4/spi.d \
./Core/Src/Src_F4/thcad2.d \
./Core/Src/Src_F4/timers.d \
./Core/Src/Src_F4/tmc_spi.d \
./Core/Src/Src_F4/tmc_uart.d \
./Core/Src/Src_F4/w5x00_ll_driver.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Src_F4/%.o Core/Src/Src_F4/%.su Core/Src/Src_F4/%.cyclo: ../Core/Src/Src_F4/%.c Core/Src/Src_F4/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G491xx -c -I../Core/Inc -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/boards" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Core/Inc/Inc_F4" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Src_F4

clean-Core-2f-Src-2f-Src_F4:
	-$(RM) ./Core/Src/Src_F4/driver.cyclo ./Core/Src/Src_F4/driver.d ./Core/Src/Src_F4/driver.o ./Core/Src/Src_F4/driver.su ./Core/Src/Src_F4/driver_spindles.cyclo ./Core/Src/Src_F4/driver_spindles.d ./Core/Src/Src_F4/driver_spindles.o ./Core/Src/Src_F4/driver_spindles.su ./Core/Src/Src_F4/flash.cyclo ./Core/Src/Src_F4/flash.d ./Core/Src/Src_F4/flash.o ./Core/Src/Src_F4/flash.su ./Core/Src/Src_F4/ioports.cyclo ./Core/Src/Src_F4/ioports.d ./Core/Src/Src_F4/ioports.o ./Core/Src/Src_F4/ioports.su ./Core/Src/Src_F4/pwm.cyclo ./Core/Src/Src_F4/pwm.d ./Core/Src/Src_F4/pwm.o ./Core/Src/Src_F4/pwm.su ./Core/Src/Src_F4/serial.cyclo ./Core/Src/Src_F4/serial.d ./Core/Src/Src_F4/serial.o ./Core/Src/Src_F4/serial.su ./Core/Src/Src_F4/spi.cyclo ./Core/Src/Src_F4/spi.d ./Core/Src/Src_F4/spi.o ./Core/Src/Src_F4/spi.su ./Core/Src/Src_F4/thcad2.cyclo ./Core/Src/Src_F4/thcad2.d ./Core/Src/Src_F4/thcad2.o ./Core/Src/Src_F4/thcad2.su ./Core/Src/Src_F4/timers.cyclo ./Core/Src/Src_F4/timers.d ./Core/Src/Src_F4/timers.o ./Core/Src/Src_F4/timers.su ./Core/Src/Src_F4/tmc_spi.cyclo ./Core/Src/Src_F4/tmc_spi.d ./Core/Src/Src_F4/tmc_spi.o ./Core/Src/Src_F4/tmc_spi.su ./Core/Src/Src_F4/tmc_uart.cyclo ./Core/Src/Src_F4/tmc_uart.d ./Core/Src/Src_F4/tmc_uart.o ./Core/Src/Src_F4/tmc_uart.su ./Core/Src/Src_F4/w5x00_ll_driver.cyclo ./Core/Src/Src_F4/w5x00_ll_driver.d ./Core/Src/Src_F4/w5x00_ll_driver.o ./Core/Src/Src_F4/w5x00_ll_driver.su

.PHONY: clean-Core-2f-Src-2f-Src_F4

