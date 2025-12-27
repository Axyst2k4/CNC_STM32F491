################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Firmware_CNC/LWIP/dp83848/Target/ethernetif.c 

OBJS += \
./Firmware_CNC/LWIP/dp83848/Target/ethernetif.o 

C_DEPS += \
./Firmware_CNC/LWIP/dp83848/Target/ethernetif.d 


# Each subdirectory must supply rules for building sources it contributes
Firmware_CNC/LWIP/dp83848/Target/%.o Firmware_CNC/LWIP/dp83848/Target/%.su Firmware_CNC/LWIP/dp83848/Target/%.cyclo: ../Firmware_CNC/LWIP/dp83848/Target/%.c Firmware_CNC/LWIP/dp83848/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G491xx -c -I../Core/Inc -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Firmware_CNC-2f-LWIP-2f-dp83848-2f-Target

clean-Firmware_CNC-2f-LWIP-2f-dp83848-2f-Target:
	-$(RM) ./Firmware_CNC/LWIP/dp83848/Target/ethernetif.cyclo ./Firmware_CNC/LWIP/dp83848/Target/ethernetif.d ./Firmware_CNC/LWIP/dp83848/Target/ethernetif.o ./Firmware_CNC/LWIP/dp83848/Target/ethernetif.su

.PHONY: clean-Firmware_CNC-2f-LWIP-2f-dp83848-2f-Target

