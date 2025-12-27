################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Firmware_CNC/grbl/alarms.c \
../Firmware_CNC/grbl/canbus.c \
../Firmware_CNC/grbl/coolant_control.c \
../Firmware_CNC/grbl/crc.c \
../Firmware_CNC/grbl/crossbar.c \
../Firmware_CNC/grbl/errors.c \
../Firmware_CNC/grbl/fs_device.c \
../Firmware_CNC/grbl/gcode.c \
../Firmware_CNC/grbl/grbllib.c \
../Firmware_CNC/grbl/ioports.c \
../Firmware_CNC/grbl/machine_limits.c \
../Firmware_CNC/grbl/messages.c \
../Firmware_CNC/grbl/modbus.c \
../Firmware_CNC/grbl/modbus_rtu.c \
../Firmware_CNC/grbl/motion_control.c \
../Firmware_CNC/grbl/my_plugin.c \
../Firmware_CNC/grbl/ngc_expr.c \
../Firmware_CNC/grbl/ngc_flowctrl.c \
../Firmware_CNC/grbl/ngc_params.c \
../Firmware_CNC/grbl/nuts_bolts.c \
../Firmware_CNC/grbl/nvs_buffer.c \
../Firmware_CNC/grbl/override.c \
../Firmware_CNC/grbl/pid.c \
../Firmware_CNC/grbl/planner.c \
../Firmware_CNC/grbl/probe.c \
../Firmware_CNC/grbl/protocol.c \
../Firmware_CNC/grbl/regex.c \
../Firmware_CNC/grbl/report.c \
../Firmware_CNC/grbl/settings.c \
../Firmware_CNC/grbl/sleep.c \
../Firmware_CNC/grbl/spindle_control.c \
../Firmware_CNC/grbl/state_machine.c \
../Firmware_CNC/grbl/stepper.c \
../Firmware_CNC/grbl/stepper2.c \
../Firmware_CNC/grbl/stream.c \
../Firmware_CNC/grbl/stream_file.c \
../Firmware_CNC/grbl/stream_json.c \
../Firmware_CNC/grbl/stream_passthru.c \
../Firmware_CNC/grbl/strutils.c \
../Firmware_CNC/grbl/system.c \
../Firmware_CNC/grbl/tool_change.c \
../Firmware_CNC/grbl/utf8.c \
../Firmware_CNC/grbl/vfs.c 

OBJS += \
./Firmware_CNC/grbl/alarms.o \
./Firmware_CNC/grbl/canbus.o \
./Firmware_CNC/grbl/coolant_control.o \
./Firmware_CNC/grbl/crc.o \
./Firmware_CNC/grbl/crossbar.o \
./Firmware_CNC/grbl/errors.o \
./Firmware_CNC/grbl/fs_device.o \
./Firmware_CNC/grbl/gcode.o \
./Firmware_CNC/grbl/grbllib.o \
./Firmware_CNC/grbl/ioports.o \
./Firmware_CNC/grbl/machine_limits.o \
./Firmware_CNC/grbl/messages.o \
./Firmware_CNC/grbl/modbus.o \
./Firmware_CNC/grbl/modbus_rtu.o \
./Firmware_CNC/grbl/motion_control.o \
./Firmware_CNC/grbl/my_plugin.o \
./Firmware_CNC/grbl/ngc_expr.o \
./Firmware_CNC/grbl/ngc_flowctrl.o \
./Firmware_CNC/grbl/ngc_params.o \
./Firmware_CNC/grbl/nuts_bolts.o \
./Firmware_CNC/grbl/nvs_buffer.o \
./Firmware_CNC/grbl/override.o \
./Firmware_CNC/grbl/pid.o \
./Firmware_CNC/grbl/planner.o \
./Firmware_CNC/grbl/probe.o \
./Firmware_CNC/grbl/protocol.o \
./Firmware_CNC/grbl/regex.o \
./Firmware_CNC/grbl/report.o \
./Firmware_CNC/grbl/settings.o \
./Firmware_CNC/grbl/sleep.o \
./Firmware_CNC/grbl/spindle_control.o \
./Firmware_CNC/grbl/state_machine.o \
./Firmware_CNC/grbl/stepper.o \
./Firmware_CNC/grbl/stepper2.o \
./Firmware_CNC/grbl/stream.o \
./Firmware_CNC/grbl/stream_file.o \
./Firmware_CNC/grbl/stream_json.o \
./Firmware_CNC/grbl/stream_passthru.o \
./Firmware_CNC/grbl/strutils.o \
./Firmware_CNC/grbl/system.o \
./Firmware_CNC/grbl/tool_change.o \
./Firmware_CNC/grbl/utf8.o \
./Firmware_CNC/grbl/vfs.o 

C_DEPS += \
./Firmware_CNC/grbl/alarms.d \
./Firmware_CNC/grbl/canbus.d \
./Firmware_CNC/grbl/coolant_control.d \
./Firmware_CNC/grbl/crc.d \
./Firmware_CNC/grbl/crossbar.d \
./Firmware_CNC/grbl/errors.d \
./Firmware_CNC/grbl/fs_device.d \
./Firmware_CNC/grbl/gcode.d \
./Firmware_CNC/grbl/grbllib.d \
./Firmware_CNC/grbl/ioports.d \
./Firmware_CNC/grbl/machine_limits.d \
./Firmware_CNC/grbl/messages.d \
./Firmware_CNC/grbl/modbus.d \
./Firmware_CNC/grbl/modbus_rtu.d \
./Firmware_CNC/grbl/motion_control.d \
./Firmware_CNC/grbl/my_plugin.d \
./Firmware_CNC/grbl/ngc_expr.d \
./Firmware_CNC/grbl/ngc_flowctrl.d \
./Firmware_CNC/grbl/ngc_params.d \
./Firmware_CNC/grbl/nuts_bolts.d \
./Firmware_CNC/grbl/nvs_buffer.d \
./Firmware_CNC/grbl/override.d \
./Firmware_CNC/grbl/pid.d \
./Firmware_CNC/grbl/planner.d \
./Firmware_CNC/grbl/probe.d \
./Firmware_CNC/grbl/protocol.d \
./Firmware_CNC/grbl/regex.d \
./Firmware_CNC/grbl/report.d \
./Firmware_CNC/grbl/settings.d \
./Firmware_CNC/grbl/sleep.d \
./Firmware_CNC/grbl/spindle_control.d \
./Firmware_CNC/grbl/state_machine.d \
./Firmware_CNC/grbl/stepper.d \
./Firmware_CNC/grbl/stepper2.d \
./Firmware_CNC/grbl/stream.d \
./Firmware_CNC/grbl/stream_file.d \
./Firmware_CNC/grbl/stream_json.d \
./Firmware_CNC/grbl/stream_passthru.d \
./Firmware_CNC/grbl/strutils.d \
./Firmware_CNC/grbl/system.d \
./Firmware_CNC/grbl/tool_change.d \
./Firmware_CNC/grbl/utf8.d \
./Firmware_CNC/grbl/vfs.d 


# Each subdirectory must supply rules for building sources it contributes
Firmware_CNC/grbl/%.o Firmware_CNC/grbl/%.su Firmware_CNC/grbl/%.cyclo: ../Firmware_CNC/grbl/%.c Firmware_CNC/grbl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G491xx -c -I../Core/Inc -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/boards" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Core/Inc/Inc_F4" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I"C:/Users/Axyst2k4/STM32CubeIDE/BSR/CNC_Project/Firmware_CNC/grbl" -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Firmware_CNC-2f-grbl

clean-Firmware_CNC-2f-grbl:
	-$(RM) ./Firmware_CNC/grbl/alarms.cyclo ./Firmware_CNC/grbl/alarms.d ./Firmware_CNC/grbl/alarms.o ./Firmware_CNC/grbl/alarms.su ./Firmware_CNC/grbl/canbus.cyclo ./Firmware_CNC/grbl/canbus.d ./Firmware_CNC/grbl/canbus.o ./Firmware_CNC/grbl/canbus.su ./Firmware_CNC/grbl/coolant_control.cyclo ./Firmware_CNC/grbl/coolant_control.d ./Firmware_CNC/grbl/coolant_control.o ./Firmware_CNC/grbl/coolant_control.su ./Firmware_CNC/grbl/crc.cyclo ./Firmware_CNC/grbl/crc.d ./Firmware_CNC/grbl/crc.o ./Firmware_CNC/grbl/crc.su ./Firmware_CNC/grbl/crossbar.cyclo ./Firmware_CNC/grbl/crossbar.d ./Firmware_CNC/grbl/crossbar.o ./Firmware_CNC/grbl/crossbar.su ./Firmware_CNC/grbl/errors.cyclo ./Firmware_CNC/grbl/errors.d ./Firmware_CNC/grbl/errors.o ./Firmware_CNC/grbl/errors.su ./Firmware_CNC/grbl/fs_device.cyclo ./Firmware_CNC/grbl/fs_device.d ./Firmware_CNC/grbl/fs_device.o ./Firmware_CNC/grbl/fs_device.su ./Firmware_CNC/grbl/gcode.cyclo ./Firmware_CNC/grbl/gcode.d ./Firmware_CNC/grbl/gcode.o ./Firmware_CNC/grbl/gcode.su ./Firmware_CNC/grbl/grbllib.cyclo ./Firmware_CNC/grbl/grbllib.d ./Firmware_CNC/grbl/grbllib.o ./Firmware_CNC/grbl/grbllib.su ./Firmware_CNC/grbl/ioports.cyclo ./Firmware_CNC/grbl/ioports.d ./Firmware_CNC/grbl/ioports.o ./Firmware_CNC/grbl/ioports.su ./Firmware_CNC/grbl/machine_limits.cyclo ./Firmware_CNC/grbl/machine_limits.d ./Firmware_CNC/grbl/machine_limits.o ./Firmware_CNC/grbl/machine_limits.su ./Firmware_CNC/grbl/messages.cyclo ./Firmware_CNC/grbl/messages.d ./Firmware_CNC/grbl/messages.o ./Firmware_CNC/grbl/messages.su ./Firmware_CNC/grbl/modbus.cyclo ./Firmware_CNC/grbl/modbus.d ./Firmware_CNC/grbl/modbus.o ./Firmware_CNC/grbl/modbus.su ./Firmware_CNC/grbl/modbus_rtu.cyclo ./Firmware_CNC/grbl/modbus_rtu.d ./Firmware_CNC/grbl/modbus_rtu.o ./Firmware_CNC/grbl/modbus_rtu.su ./Firmware_CNC/grbl/motion_control.cyclo ./Firmware_CNC/grbl/motion_control.d ./Firmware_CNC/grbl/motion_control.o ./Firmware_CNC/grbl/motion_control.su ./Firmware_CNC/grbl/my_plugin.cyclo ./Firmware_CNC/grbl/my_plugin.d ./Firmware_CNC/grbl/my_plugin.o ./Firmware_CNC/grbl/my_plugin.su ./Firmware_CNC/grbl/ngc_expr.cyclo ./Firmware_CNC/grbl/ngc_expr.d ./Firmware_CNC/grbl/ngc_expr.o ./Firmware_CNC/grbl/ngc_expr.su ./Firmware_CNC/grbl/ngc_flowctrl.cyclo ./Firmware_CNC/grbl/ngc_flowctrl.d ./Firmware_CNC/grbl/ngc_flowctrl.o ./Firmware_CNC/grbl/ngc_flowctrl.su ./Firmware_CNC/grbl/ngc_params.cyclo ./Firmware_CNC/grbl/ngc_params.d ./Firmware_CNC/grbl/ngc_params.o ./Firmware_CNC/grbl/ngc_params.su ./Firmware_CNC/grbl/nuts_bolts.cyclo ./Firmware_CNC/grbl/nuts_bolts.d ./Firmware_CNC/grbl/nuts_bolts.o ./Firmware_CNC/grbl/nuts_bolts.su ./Firmware_CNC/grbl/nvs_buffer.cyclo ./Firmware_CNC/grbl/nvs_buffer.d ./Firmware_CNC/grbl/nvs_buffer.o ./Firmware_CNC/grbl/nvs_buffer.su ./Firmware_CNC/grbl/override.cyclo ./Firmware_CNC/grbl/override.d ./Firmware_CNC/grbl/override.o ./Firmware_CNC/grbl/override.su ./Firmware_CNC/grbl/pid.cyclo ./Firmware_CNC/grbl/pid.d ./Firmware_CNC/grbl/pid.o ./Firmware_CNC/grbl/pid.su ./Firmware_CNC/grbl/planner.cyclo ./Firmware_CNC/grbl/planner.d ./Firmware_CNC/grbl/planner.o ./Firmware_CNC/grbl/planner.su ./Firmware_CNC/grbl/probe.cyclo ./Firmware_CNC/grbl/probe.d ./Firmware_CNC/grbl/probe.o ./Firmware_CNC/grbl/probe.su ./Firmware_CNC/grbl/protocol.cyclo ./Firmware_CNC/grbl/protocol.d ./Firmware_CNC/grbl/protocol.o ./Firmware_CNC/grbl/protocol.su ./Firmware_CNC/grbl/regex.cyclo ./Firmware_CNC/grbl/regex.d ./Firmware_CNC/grbl/regex.o ./Firmware_CNC/grbl/regex.su ./Firmware_CNC/grbl/report.cyclo ./Firmware_CNC/grbl/report.d ./Firmware_CNC/grbl/report.o ./Firmware_CNC/grbl/report.su ./Firmware_CNC/grbl/settings.cyclo ./Firmware_CNC/grbl/settings.d ./Firmware_CNC/grbl/settings.o ./Firmware_CNC/grbl/settings.su ./Firmware_CNC/grbl/sleep.cyclo ./Firmware_CNC/grbl/sleep.d ./Firmware_CNC/grbl/sleep.o ./Firmware_CNC/grbl/sleep.su ./Firmware_CNC/grbl/spindle_control.cyclo ./Firmware_CNC/grbl/spindle_control.d ./Firmware_CNC/grbl/spindle_control.o ./Firmware_CNC/grbl/spindle_control.su ./Firmware_CNC/grbl/state_machine.cyclo ./Firmware_CNC/grbl/state_machine.d ./Firmware_CNC/grbl/state_machine.o ./Firmware_CNC/grbl/state_machine.su ./Firmware_CNC/grbl/stepper.cyclo ./Firmware_CNC/grbl/stepper.d ./Firmware_CNC/grbl/stepper.o ./Firmware_CNC/grbl/stepper.su ./Firmware_CNC/grbl/stepper2.cyclo ./Firmware_CNC/grbl/stepper2.d ./Firmware_CNC/grbl/stepper2.o ./Firmware_CNC/grbl/stepper2.su ./Firmware_CNC/grbl/stream.cyclo ./Firmware_CNC/grbl/stream.d ./Firmware_CNC/grbl/stream.o ./Firmware_CNC/grbl/stream.su ./Firmware_CNC/grbl/stream_file.cyclo ./Firmware_CNC/grbl/stream_file.d ./Firmware_CNC/grbl/stream_file.o ./Firmware_CNC/grbl/stream_file.su ./Firmware_CNC/grbl/stream_json.cyclo ./Firmware_CNC/grbl/stream_json.d ./Firmware_CNC/grbl/stream_json.o ./Firmware_CNC/grbl/stream_json.su ./Firmware_CNC/grbl/stream_passthru.cyclo ./Firmware_CNC/grbl/stream_passthru.d ./Firmware_CNC/grbl/stream_passthru.o ./Firmware_CNC/grbl/stream_passthru.su ./Firmware_CNC/grbl/strutils.cyclo ./Firmware_CNC/grbl/strutils.d ./Firmware_CNC/grbl/strutils.o ./Firmware_CNC/grbl/strutils.su ./Firmware_CNC/grbl/system.cyclo ./Firmware_CNC/grbl/system.d ./Firmware_CNC/grbl/system.o ./Firmware_CNC/grbl/system.su ./Firmware_CNC/grbl/tool_change.cyclo ./Firmware_CNC/grbl/tool_change.d ./Firmware_CNC/grbl/tool_change.o ./Firmware_CNC/grbl/tool_change.su ./Firmware_CNC/grbl/utf8.cyclo ./Firmware_CNC/grbl/utf8.d ./Firmware_CNC/grbl/utf8.o ./Firmware_CNC/grbl/utf8.su ./Firmware_CNC/grbl/vfs.cyclo ./Firmware_CNC/grbl/vfs.d ./Firmware_CNC/grbl/vfs.o ./Firmware_CNC/grbl/vfs.su

.PHONY: clean-Firmware_CNC-2f-grbl

