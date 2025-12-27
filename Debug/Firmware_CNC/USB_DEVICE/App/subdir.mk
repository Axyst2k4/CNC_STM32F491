################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Firmware_CNC/USB_DEVICE/App/usb_device.c \
../Firmware_CNC/USB_DEVICE/App/usbd_cdc_if.c \
../Firmware_CNC/USB_DEVICE/App/usbd_desc.c 

OBJS += \
./Firmware_CNC/USB_DEVICE/App/usb_device.o \
./Firmware_CNC/USB_DEVICE/App/usbd_cdc_if.o \
./Firmware_CNC/USB_DEVICE/App/usbd_desc.o 

C_DEPS += \
./Firmware_CNC/USB_DEVICE/App/usb_device.d \
./Firmware_CNC/USB_DEVICE/App/usbd_cdc_if.d \
./Firmware_CNC/USB_DEVICE/App/usbd_desc.d 


# Each subdirectory must supply rules for building sources it contributes
Firmware_CNC/USB_DEVICE/App/%.o Firmware_CNC/USB_DEVICE/App/%.su Firmware_CNC/USB_DEVICE/App/%.cyclo: ../Firmware_CNC/USB_DEVICE/App/%.c Firmware_CNC/USB_DEVICE/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G491xx -c -I../Core/Inc -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Firmware_CNC-2f-USB_DEVICE-2f-App

clean-Firmware_CNC-2f-USB_DEVICE-2f-App:
	-$(RM) ./Firmware_CNC/USB_DEVICE/App/usb_device.cyclo ./Firmware_CNC/USB_DEVICE/App/usb_device.d ./Firmware_CNC/USB_DEVICE/App/usb_device.o ./Firmware_CNC/USB_DEVICE/App/usb_device.su ./Firmware_CNC/USB_DEVICE/App/usbd_cdc_if.cyclo ./Firmware_CNC/USB_DEVICE/App/usbd_cdc_if.d ./Firmware_CNC/USB_DEVICE/App/usbd_cdc_if.o ./Firmware_CNC/USB_DEVICE/App/usbd_cdc_if.su ./Firmware_CNC/USB_DEVICE/App/usbd_desc.cyclo ./Firmware_CNC/USB_DEVICE/App/usbd_desc.d ./Firmware_CNC/USB_DEVICE/App/usbd_desc.o ./Firmware_CNC/USB_DEVICE/App/usbd_desc.su

.PHONY: clean-Firmware_CNC-2f-USB_DEVICE-2f-App

