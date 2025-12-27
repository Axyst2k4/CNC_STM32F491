################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Firmware_CNC/grbl/kinematics/corexy.c \
../Firmware_CNC/grbl/kinematics/delta.c \
../Firmware_CNC/grbl/kinematics/maslow.c \
../Firmware_CNC/grbl/kinematics/polar.c \
../Firmware_CNC/grbl/kinematics/wall_plotter.c 

OBJS += \
./Firmware_CNC/grbl/kinematics/corexy.o \
./Firmware_CNC/grbl/kinematics/delta.o \
./Firmware_CNC/grbl/kinematics/maslow.o \
./Firmware_CNC/grbl/kinematics/polar.o \
./Firmware_CNC/grbl/kinematics/wall_plotter.o 

C_DEPS += \
./Firmware_CNC/grbl/kinematics/corexy.d \
./Firmware_CNC/grbl/kinematics/delta.d \
./Firmware_CNC/grbl/kinematics/maslow.d \
./Firmware_CNC/grbl/kinematics/polar.d \
./Firmware_CNC/grbl/kinematics/wall_plotter.d 


# Each subdirectory must supply rules for building sources it contributes
Firmware_CNC/grbl/kinematics/%.o Firmware_CNC/grbl/kinematics/%.su Firmware_CNC/grbl/kinematics/%.cyclo: ../Firmware_CNC/grbl/kinematics/%.c Firmware_CNC/grbl/kinematics/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G491xx -c -I../Core/Inc -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/boards" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Core/Inc/Inc_F4" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Firmware_CNC-2f-grbl-2f-kinematics

clean-Firmware_CNC-2f-grbl-2f-kinematics:
	-$(RM) ./Firmware_CNC/grbl/kinematics/corexy.cyclo ./Firmware_CNC/grbl/kinematics/corexy.d ./Firmware_CNC/grbl/kinematics/corexy.o ./Firmware_CNC/grbl/kinematics/corexy.su ./Firmware_CNC/grbl/kinematics/delta.cyclo ./Firmware_CNC/grbl/kinematics/delta.d ./Firmware_CNC/grbl/kinematics/delta.o ./Firmware_CNC/grbl/kinematics/delta.su ./Firmware_CNC/grbl/kinematics/maslow.cyclo ./Firmware_CNC/grbl/kinematics/maslow.d ./Firmware_CNC/grbl/kinematics/maslow.o ./Firmware_CNC/grbl/kinematics/maslow.su ./Firmware_CNC/grbl/kinematics/polar.cyclo ./Firmware_CNC/grbl/kinematics/polar.d ./Firmware_CNC/grbl/kinematics/polar.o ./Firmware_CNC/grbl/kinematics/polar.su ./Firmware_CNC/grbl/kinematics/wall_plotter.cyclo ./Firmware_CNC/grbl/kinematics/wall_plotter.d ./Firmware_CNC/grbl/kinematics/wall_plotter.o ./Firmware_CNC/grbl/kinematics/wall_plotter.su

.PHONY: clean-Firmware_CNC-2f-grbl-2f-kinematics

