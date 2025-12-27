################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Src_F4/protocal/can.c \
../Core/Src/Src_F4/protocal/diskio.c \
../Core/Src/Src_F4/protocal/driver.c \
../Core/Src/Src_F4/protocal/driver_spindles.c \
../Core/Src/Src_F4/protocal/enet.c \
../Core/Src/Src_F4/protocal/flash.c \
../Core/Src/Src_F4/protocal/i2c.c \
../Core/Src/Src_F4/protocal/ioports.c \
../Core/Src/Src_F4/protocal/ioports_analog.c 

OBJS += \
./Core/Src/Src_F4/protocal/can.o \
./Core/Src/Src_F4/protocal/diskio.o \
./Core/Src/Src_F4/protocal/driver.o \
./Core/Src/Src_F4/protocal/driver_spindles.o \
./Core/Src/Src_F4/protocal/enet.o \
./Core/Src/Src_F4/protocal/flash.o \
./Core/Src/Src_F4/protocal/i2c.o \
./Core/Src/Src_F4/protocal/ioports.o \
./Core/Src/Src_F4/protocal/ioports_analog.o 

C_DEPS += \
./Core/Src/Src_F4/protocal/can.d \
./Core/Src/Src_F4/protocal/diskio.d \
./Core/Src/Src_F4/protocal/driver.d \
./Core/Src/Src_F4/protocal/driver_spindles.d \
./Core/Src/Src_F4/protocal/enet.d \
./Core/Src/Src_F4/protocal/flash.d \
./Core/Src/Src_F4/protocal/i2c.d \
./Core/Src/Src_F4/protocal/ioports.d \
./Core/Src/Src_F4/protocal/ioports_analog.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Src_F4/protocal/%.o Core/Src/Src_F4/protocal/%.su Core/Src/Src_F4/protocal/%.cyclo: ../Core/Src/Src_F4/protocal/%.c Core/Src/Src_F4/protocal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G491xx -c -I../Core/Inc -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/boards" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Core/Inc/Inc_F4" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Src_F4-2f-protocal

clean-Core-2f-Src-2f-Src_F4-2f-protocal:
	-$(RM) ./Core/Src/Src_F4/protocal/can.cyclo ./Core/Src/Src_F4/protocal/can.d ./Core/Src/Src_F4/protocal/can.o ./Core/Src/Src_F4/protocal/can.su ./Core/Src/Src_F4/protocal/diskio.cyclo ./Core/Src/Src_F4/protocal/diskio.d ./Core/Src/Src_F4/protocal/diskio.o ./Core/Src/Src_F4/protocal/diskio.su ./Core/Src/Src_F4/protocal/driver.cyclo ./Core/Src/Src_F4/protocal/driver.d ./Core/Src/Src_F4/protocal/driver.o ./Core/Src/Src_F4/protocal/driver.su ./Core/Src/Src_F4/protocal/driver_spindles.cyclo ./Core/Src/Src_F4/protocal/driver_spindles.d ./Core/Src/Src_F4/protocal/driver_spindles.o ./Core/Src/Src_F4/protocal/driver_spindles.su ./Core/Src/Src_F4/protocal/enet.cyclo ./Core/Src/Src_F4/protocal/enet.d ./Core/Src/Src_F4/protocal/enet.o ./Core/Src/Src_F4/protocal/enet.su ./Core/Src/Src_F4/protocal/flash.cyclo ./Core/Src/Src_F4/protocal/flash.d ./Core/Src/Src_F4/protocal/flash.o ./Core/Src/Src_F4/protocal/flash.su ./Core/Src/Src_F4/protocal/i2c.cyclo ./Core/Src/Src_F4/protocal/i2c.d ./Core/Src/Src_F4/protocal/i2c.o ./Core/Src/Src_F4/protocal/i2c.su ./Core/Src/Src_F4/protocal/ioports.cyclo ./Core/Src/Src_F4/protocal/ioports.d ./Core/Src/Src_F4/protocal/ioports.o ./Core/Src/Src_F4/protocal/ioports.su ./Core/Src/Src_F4/protocal/ioports_analog.cyclo ./Core/Src/Src_F4/protocal/ioports_analog.d ./Core/Src/Src_F4/protocal/ioports_analog.o ./Core/Src/Src_F4/protocal/ioports_analog.su

.PHONY: clean-Core-2f-Src-2f-Src_F4-2f-protocal

