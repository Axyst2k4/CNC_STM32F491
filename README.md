# CNC_STM32F491
Directory structure:
└── axyst2k4-cnc_stm32f491/
    ├── README.md
    ├── CNC_Project.ioc
    ├── STM32G491RCTX_FLASH.ld
    ├── STM32G491RCTX_RAM.ld
    ├── .cproject
    ├── .mxproject
    ├── boards/
    │   └── generic_map.h
    ├── Core/
    │   ├── Inc/
    │   │   ├── main.h
    │   │   ├── stm32g4xx_hal_conf.h
    │   │   ├── stm32g4xx_it.h
    │   │   └── Inc_F4/
    │   │       ├── driver.h
    │   │       ├── enet.h
    │   │       ├── flash.h
    │   │       ├── i2c.h
    │   │       ├── my_machine.h
    │   │       ├── pwm.h
    │   │       ├── serial.h
    │   │       ├── spi.h
    │   │       ├── timers.h
    │   │       ├── usb_serial.h
    │   │       └── w5x00_ll_driver.h
    │   ├── Src/
    │   │   ├── main.c
    │   │   ├── stm32g4xx_hal_msp.c
    │   │   ├── stm32g4xx_it.c
    │   │   ├── syscalls.c
    │   │   ├── sysmem.c
    │   │   ├── system_stm32g4xx.c
    │   │   └── Src_F4/
    │   │       ├── driver_spindles.c
    │   │       ├── flash.c
    │   │       ├── ioports.c
    │   │       ├── pwm.c
    │   │       ├── serial.c
    │   │       ├── spi.c
    │   │       ├── thcad2.c
    │   │       ├── timers.c
    │   │       ├── tmc_spi.c
    │   │       ├── tmc_uart.c
    │   │       └── w5x00_ll_driver.c
    │   └── Startup/
    │       └── startup_stm32g491rctx.s
    ├── Debug/
    │   ├── makefile
    │   ├── objects.list
    │   ├── objects.mk
    │   ├── sources.mk
    │   ├── Core/
    │   │   ├── Src/
    │   │   │   ├── main.cyclo
    │   │   │   ├── main.d
    │   │   │   ├── main.su
    │   │   │   ├── stm32g4xx_hal_msp.cyclo
    │   │   │   ├── stm32g4xx_hal_msp.d
    │   │   │   ├── stm32g4xx_hal_msp.su
    │   │   │   ├── stm32g4xx_it.cyclo
    │   │   │   ├── stm32g4xx_it.d
    │   │   │   ├── stm32g4xx_it.su
    │   │   │   ├── subdir.mk
    │   │   │   ├── syscalls.cyclo
    │   │   │   ├── syscalls.d
    │   │   │   ├── syscalls.su
    │   │   │   ├── sysmem.cyclo
    │   │   │   ├── sysmem.d
    │   │   │   ├── sysmem.su
    │   │   │   ├── system_stm32g4xx.cyclo
    │   │   │   ├── system_stm32g4xx.d
    │   │   │   ├── system_stm32g4xx.su
    │   │   │   └── Src_F4/
    │   │   │       ├── driver.cyclo
    │   │   │       ├── driver.d
    │   │   │       ├── driver.su
    │   │   │       ├── driver_spindles.cyclo
    │   │   │       ├── driver_spindles.d
    │   │   │       ├── driver_spindles.su
    │   │   │       ├── flash.cyclo
    │   │   │       ├── flash.d
    │   │   │       ├── flash.su
    │   │   │       ├── ioports.cyclo
    │   │   │       ├── ioports.d
    │   │   │       ├── ioports.su
    │   │   │       ├── pwm.cyclo
    │   │   │       ├── pwm.d
    │   │   │       ├── pwm.su
    │   │   │       ├── serial.cyclo
    │   │   │       ├── serial.d
    │   │   │       ├── serial.su
    │   │   │       ├── spi.cyclo
    │   │   │       ├── spi.d
    │   │   │       ├── spi.su
    │   │   │       ├── subdir.mk
    │   │   │       ├── thcad2.cyclo
    │   │   │       ├── thcad2.d
    │   │   │       ├── thcad2.su
    │   │   │       ├── timers.cyclo
    │   │   │       ├── timers.d
    │   │   │       ├── timers.su
    │   │   │       ├── tmc_spi.cyclo
    │   │   │       ├── tmc_spi.d
    │   │   │       ├── tmc_spi.su
    │   │   │       ├── tmc_uart.cyclo
    │   │   │       ├── tmc_uart.d
    │   │   │       ├── tmc_uart.su
    │   │   │       ├── w5x00_ll_driver.cyclo
    │   │   │       ├── w5x00_ll_driver.d
    │   │   │       ├── w5x00_ll_driver.su
    │   │   │       └── protocal/
    │   │   │           └── subdir.mk
    │   │   └── Startup/
    │   │       ├── startup_stm32g491rctx.d
    │   │       └── subdir.mk
    │   ├── Drivers/
    │   │   └── STM32G4xx_HAL_Driver/
    │   │       └── Src/
    │   │           ├── stm32g4xx_hal.cyclo
    │   │           ├── stm32g4xx_hal.d
    │   │           ├── stm32g4xx_hal.su
    │   │           ├── stm32g4xx_hal_adc.cyclo
    │   │           ├── stm32g4xx_hal_adc.d
    │   │           ├── stm32g4xx_hal_adc.su
    │   │           ├── stm32g4xx_hal_adc_ex.cyclo
    │   │           ├── stm32g4xx_hal_adc_ex.d
    │   │           ├── stm32g4xx_hal_adc_ex.su
    │   │           ├── stm32g4xx_hal_cortex.cyclo
    │   │           ├── stm32g4xx_hal_cortex.d
    │   │           ├── stm32g4xx_hal_cortex.su
    │   │           ├── stm32g4xx_hal_dma.cyclo
    │   │           ├── stm32g4xx_hal_dma.d
    │   │           ├── stm32g4xx_hal_dma.su
    │   │           ├── stm32g4xx_hal_dma_ex.cyclo
    │   │           ├── stm32g4xx_hal_dma_ex.d
    │   │           ├── stm32g4xx_hal_dma_ex.su
    │   │           ├── stm32g4xx_hal_exti.cyclo
    │   │           ├── stm32g4xx_hal_exti.d
    │   │           ├── stm32g4xx_hal_exti.su
    │   │           ├── stm32g4xx_hal_flash.cyclo
    │   │           ├── stm32g4xx_hal_flash.d
    │   │           ├── stm32g4xx_hal_flash.su
    │   │           ├── stm32g4xx_hal_flash_ex.cyclo
    │   │           ├── stm32g4xx_hal_flash_ex.d
    │   │           ├── stm32g4xx_hal_flash_ex.su
    │   │           ├── stm32g4xx_hal_flash_ramfunc.cyclo
    │   │           ├── stm32g4xx_hal_flash_ramfunc.d
    │   │           ├── stm32g4xx_hal_flash_ramfunc.su
    │   │           ├── stm32g4xx_hal_gpio.cyclo
    │   │           ├── stm32g4xx_hal_gpio.d
    │   │           ├── stm32g4xx_hal_gpio.su
    │   │           ├── stm32g4xx_hal_pwr.cyclo
    │   │           ├── stm32g4xx_hal_pwr.d
    │   │           ├── stm32g4xx_hal_pwr.su
    │   │           ├── stm32g4xx_hal_pwr_ex.cyclo
    │   │           ├── stm32g4xx_hal_pwr_ex.d
    │   │           ├── stm32g4xx_hal_pwr_ex.su
    │   │           ├── stm32g4xx_hal_rcc.cyclo
    │   │           ├── stm32g4xx_hal_rcc.d
    │   │           ├── stm32g4xx_hal_rcc.su
    │   │           ├── stm32g4xx_hal_rcc_ex.cyclo
    │   │           ├── stm32g4xx_hal_rcc_ex.d
    │   │           ├── stm32g4xx_hal_rcc_ex.su
    │   │           ├── stm32g4xx_hal_tim.cyclo
    │   │           ├── stm32g4xx_hal_tim.d
    │   │           ├── stm32g4xx_hal_tim.su
    │   │           ├── stm32g4xx_hal_tim_ex.cyclo
    │   │           ├── stm32g4xx_hal_tim_ex.d
    │   │           ├── stm32g4xx_hal_tim_ex.su
    │   │           ├── stm32g4xx_hal_uart.cyclo
    │   │           ├── stm32g4xx_hal_uart.d
    │   │           ├── stm32g4xx_hal_uart.su
    │   │           ├── stm32g4xx_hal_uart_ex.cyclo
    │   │           ├── stm32g4xx_hal_uart_ex.d
    │   │           ├── stm32g4xx_hal_uart_ex.su
    │   │           ├── stm32g4xx_ll_adc.cyclo
    │   │           ├── stm32g4xx_ll_adc.d
    │   │           ├── stm32g4xx_ll_adc.su
    │   │           └── subdir.mk
    │   └── Firmware_CNC/
    │       ├── grbl/
    │       │   ├── alarms.cyclo
    │       │   ├── alarms.d
    │       │   ├── alarms.su
    │       │   ├── canbus.cyclo
    │       │   ├── canbus.d
    │       │   ├── canbus.su
    │       │   ├── coolant_control.cyclo
    │       │   ├── coolant_control.d
    │       │   ├── coolant_control.su
    │       │   ├── crc.cyclo
    │       │   ├── crc.d
    │       │   ├── crc.su
    │       │   ├── crossbar.cyclo
    │       │   ├── crossbar.d
    │       │   ├── crossbar.su
    │       │   ├── errors.cyclo
    │       │   ├── errors.d
    │       │   ├── errors.su
    │       │   ├── fs_device.cyclo
    │       │   ├── fs_device.d
    │       │   ├── fs_device.su
    │       │   ├── gcode.cyclo
    │       │   ├── gcode.d
    │       │   ├── gcode.su
    │       │   ├── grbllib.cyclo
    │       │   ├── grbllib.d
    │       │   ├── grbllib.su
    │       │   ├── ioports.cyclo
    │       │   ├── ioports.d
    │       │   ├── ioports.su
    │       │   ├── machine_limits.cyclo
    │       │   ├── machine_limits.d
    │       │   ├── machine_limits.su
    │       │   ├── messages.cyclo
    │       │   ├── messages.d
    │       │   ├── messages.su
    │       │   ├── modbus.cyclo
    │       │   ├── modbus.d
    │       │   ├── modbus.su
    │       │   ├── modbus_rtu.cyclo
    │       │   ├── modbus_rtu.d
    │       │   ├── modbus_rtu.su
    │       │   ├── motion_control.cyclo
    │       │   ├── motion_control.d
    │       │   ├── motion_control.su
    │       │   ├── my_plugin.cyclo
    │       │   ├── my_plugin.d
    │       │   ├── my_plugin.su
    │       │   ├── ngc_expr.cyclo
    │       │   ├── ngc_expr.d
    │       │   ├── ngc_expr.su
    │       │   ├── ngc_flowctrl.cyclo
    │       │   ├── ngc_flowctrl.d
    │       │   ├── ngc_flowctrl.su
    │       │   ├── ngc_params.cyclo
    │       │   ├── ngc_params.d
    │       │   ├── ngc_params.su
    │       │   ├── nuts_bolts.cyclo
    │       │   ├── nuts_bolts.d
    │       │   ├── nuts_bolts.su
    │       │   ├── nvs_buffer.cyclo
    │       │   ├── nvs_buffer.d
    │       │   ├── nvs_buffer.su
    │       │   ├── override.cyclo
    │       │   ├── override.d
    │       │   ├── override.su
    │       │   ├── pid.cyclo
    │       │   ├── pid.d
    │       │   ├── pid.su
    │       │   ├── planner.cyclo
    │       │   ├── planner.d
    │       │   ├── planner.su
    │       │   ├── probe.cyclo
    │       │   ├── probe.d
    │       │   ├── probe.su
    │       │   ├── protocol.cyclo
    │       │   ├── protocol.d
    │       │   ├── protocol.su
    │       │   ├── regex.cyclo
    │       │   ├── regex.d
    │       │   ├── regex.su
    │       │   ├── report.cyclo
    │       │   ├── report.d
    │       │   ├── report.su
    │       │   ├── settings.cyclo
    │       │   ├── settings.d
    │       │   ├── settings.su
    │       │   ├── sleep.cyclo
    │       │   ├── sleep.d
    │       │   ├── sleep.su
    │       │   ├── spindle_control.cyclo
    │       │   ├── spindle_control.d
    │       │   ├── spindle_control.su
    │       │   ├── state_machine.cyclo
    │       │   ├── state_machine.d
    │       │   ├── state_machine.su
    │       │   ├── stepper.cyclo
    │       │   ├── stepper.d
    │       │   ├── stepper.su
    │       │   ├── stepper2.cyclo
    │       │   ├── stepper2.d
    │       │   ├── stepper2.su
    │       │   ├── stream.cyclo
    │       │   ├── stream.d
    │       │   ├── stream.su
    │       │   ├── stream_file.cyclo
    │       │   ├── stream_file.d
    │       │   ├── stream_file.su
    │       │   ├── stream_json.cyclo
    │       │   ├── stream_json.d
    │       │   ├── stream_json.su
    │       │   ├── stream_passthru.cyclo
    │       │   ├── stream_passthru.d
    │       │   ├── stream_passthru.su
    │       │   ├── strutils.cyclo
    │       │   ├── strutils.d
    │       │   ├── strutils.su
    │       │   ├── subdir.mk
    │       │   ├── system.cyclo
    │       │   ├── system.d
    │       │   ├── system.su
    │       │   ├── tool_change.cyclo
    │       │   ├── tool_change.d
    │       │   ├── tool_change.su
    │       │   ├── utf8.cyclo
    │       │   ├── utf8.d
    │       │   ├── utf8.su
    │       │   ├── vfs.cyclo
    │       │   ├── vfs.d
    │       │   ├── vfs.su
    │       │   └── kinematics/
    │       │       ├── corexy.cyclo
    │       │       ├── corexy.d
    │       │       ├── corexy.su
    │       │       ├── delta.cyclo
    │       │       ├── delta.d
    │       │       ├── delta.su
    │       │       ├── maslow.cyclo
    │       │       ├── maslow.d
    │       │       ├── maslow.su
    │       │       ├── polar.cyclo
    │       │       ├── polar.d
    │       │       ├── polar.su
    │       │       ├── subdir.mk
    │       │       ├── wall_plotter.cyclo
    │       │       ├── wall_plotter.d
    │       │       └── wall_plotter.su
    │       ├── LWIP/
    │       │   ├── App/
    │       │   │   └── subdir.mk
    │       │   └── dp83848/
    │       │       └── Target/
    │       │           └── subdir.mk
    │       └── USB_DEVICE/
    │           ├── App/
    │           │   └── subdir.mk
    │           └── Target/
    │               └── subdir.mk
    ├── Drivers/
    │   ├── CMSIS/
    │   │   ├── LICENSE.txt
    │   │   ├── Device/
    │   │   │   └── ST/
    │   │   │       └── STM32G4xx/
    │   │   │           ├── LICENSE.txt
    │   │   │           └── Include/
    │   │   │               ├── stm32g4xx.h
    │   │   │               └── system_stm32g4xx.h
    │   │   └── Include/
    │   │       ├── cmsis_armcc.h
    │   │       ├── cmsis_armclang.h
    │   │       ├── cmsis_compiler.h
    │   │       ├── cmsis_iccarm.h
    │   │       ├── cmsis_version.h
    │   │       ├── core_cm0.h
    │   │       ├── core_cm0plus.h
    │   │       ├── core_cm1.h
    │   │       ├── core_sc000.h
    │   │       ├── mpu_armv7.h
    │   │       ├── mpu_armv8.h
    │   │       └── tz_context.h
    │   └── STM32G4xx_HAL_Driver/
    │       ├── LICENSE.txt
    │       ├── Inc/
    │       │   ├── stm32g4xx_hal.h
    │       │   ├── stm32g4xx_hal_cortex.h
    │       │   ├── stm32g4xx_hal_def.h
    │       │   ├── stm32g4xx_hal_dma.h
    │       │   ├── stm32g4xx_hal_dma_ex.h
    │       │   ├── stm32g4xx_hal_exti.h
    │       │   ├── stm32g4xx_hal_flash.h
    │       │   ├── stm32g4xx_hal_flash_ex.h
    │       │   ├── stm32g4xx_hal_flash_ramfunc.h
    │       │   ├── stm32g4xx_hal_gpio.h
    │       │   ├── stm32g4xx_hal_gpio_ex.h
    │       │   ├── stm32g4xx_hal_pwr.h
    │       │   ├── stm32g4xx_hal_pwr_ex.h
    │       │   ├── stm32g4xx_ll_cortex.h
    │       │   ├── stm32g4xx_ll_crs.h
    │       │   ├── stm32g4xx_ll_gpio.h
    │       │   ├── stm32g4xx_ll_pwr.h
    │       │   └── stm32g4xx_ll_utils.h
    │       └── Src/
    │           ├── stm32g4xx_hal.c
    │           ├── stm32g4xx_hal_cortex.c
    │           ├── stm32g4xx_hal_dma.c
    │           ├── stm32g4xx_hal_dma_ex.c
    │           ├── stm32g4xx_hal_exti.c
    │           ├── stm32g4xx_hal_flash.c
    │           ├── stm32g4xx_hal_flash_ex.c
    │           ├── stm32g4xx_hal_flash_ramfunc.c
    │           ├── stm32g4xx_hal_gpio.c
    │           ├── stm32g4xx_hal_pwr.c
    │           ├── stm32g4xx_hal_pwr_ex.c
    │           ├── stm32g4xx_hal_rcc.c
    │           └── stm32g4xx_hal_uart_ex.c
    └── Firmware_CNC/
        └── grbl/
            ├── README.md
            ├── alarms.c
            ├── alarms.h
            ├── canbus.c
            ├── canbus.h
            ├── CMakeLists.txt
            ├── coolant_control.c
            ├── coolant_control.h
            ├── COPYING
            ├── core_handlers.h
            ├── crc.c
            ├── crc.h
            ├── crossbar.c
            ├── crossbar.h
            ├── driver_opts.h
            ├── driver_opts2.h
            ├── errors.c
            ├── errors.h
            ├── expanders_init.h
            ├── fs_device.c
            ├── gcode.h
            ├── grbl.h
            ├── grbllib.c
            ├── grbllib.h
            ├── hal.h
            ├── ioports.h
            ├── kinematics.h
            ├── machine_limits.c
            ├── machine_limits.h
            ├── messages.c
            ├── messages.h
            ├── modbus.c
            ├── modbus.h
            ├── modbus_rtu.c
            ├── motion_control.c
            ├── motion_control.h
            ├── motor_pins.h
            ├── my_plugin.c
            ├── ngc_expr.c
            ├── ngc_expr.h
            ├── ngc_flowctrl.c
            ├── ngc_flowctrl.h
            ├── ngc_params.c
            ├── ngc_params.h
            ├── nuts_bolts.c
            ├── nuts_bolts.h
            ├── nvs.h
            ├── nvs_buffer.c
            ├── nvs_buffer.h
            ├── override.c
            ├── override.h
            ├── pid.c
            ├── pid.h
            ├── pin_bits_masks.h
            ├── planner.c
            ├── planner.h
            ├── platform.h
            ├── plugins.h
            ├── plugins_init.h
            ├── probe.c
            ├── probe.h
            ├── protocol.c
            ├── protocol.h
            ├── regex.c
            ├── regex.h
            ├── report.h
            ├── rgb.h
            ├── settings.h
            ├── sleep.c
            ├── sleep.h
            ├── spindle_control.c
            ├── spindle_control.h
            ├── spindle_sync.h
            ├── state_machine.c
            ├── state_machine.h
            ├── stepdir_map.h
            ├── stepper.h
            ├── stepper2.c
            ├── stepper2.h
            ├── stream.c
            ├── stream.h
            ├── stream_file.c
            ├── stream_file.h
            ├── stream_json.c
            ├── stream_json.h
            ├── stream_passthru.c
            ├── stream_passthru.h
            ├── strutils.c
            ├── strutils.h
            ├── system.c
            ├── system.h
            ├── task.h
            ├── tool_change.c
            ├── tool_change.h
            ├── utf8.c
            ├── utf8.h
            ├── vfs.c
            ├── vfs.h
            └── kinematics/
                ├── corexy.c
                ├── corexy.h
                ├── delta.c
                ├── delta.h
                ├── maslow.c
                ├── maslow.h
                ├── polar.c
                ├── polar.h
                ├── wall_plotter.c
                └── wall_plotter.h
