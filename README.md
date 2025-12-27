# CNC_STM32F491

Dự án điều khiển CNC sử dụng vi điều khiển dòng STM32F4/G4, tích hợp thư viện GRBL và hệ điều hành FreeRTOS.

## Cấu trúc thư mục (Project Structure)

```text
└── axyst2k4-cnc_stm32f491/
    ├── README.md
    ├── CNC_Project.ioc                 # File cấu hình STM32CubeMX
    ├── STM32G491RCTX_FLASH.ld          # Linker script cho Flash
    ├── STM32G491RCTX_RAM.ld            # Linker script cho RAM
    ├── boards/
    │   └── generic_map.h               # Cấu hình sơ đồ chân board mạch
    ├── Core/
    │   ├── Inc/                        # Header files hệ thống
    │   │   ├── main.h
    │   │   ├── stm32g4xx_it.h          # Ngắt hệ thống
    │   │   └── Inc_F4/                 # Drivers chuyên biệt cho dòng F4
    │   │       ├── driver.h
    │   │       ├── serial.h            # Giao tiếp UART
    │   │       └── timers.h            # Cấu hình Timer cho Step/Dir
    │   ├── Src/                        # Source files hệ thống
    │   │   ├── main.c                  # Điểm khởi đầu chương trình & RTOS Tasks
    │   │   ├── stm32g4xx_it.c
    │   │   └── Src_F4/                 # Logic thực thi drivers
    │   │       ├── driver_spindles.c
    │   │       ├── stepper.c           # Điều khiển động cơ bước
    │   │       └── tmc_uart.c          # Driver cho dòng chip Trinamic
    │   └── Startup/
    │       └── startup_stm32g491rctx.s
    ├── Firmware_CNC/
    │   └── grbl/                       # Thư viện lõi GRBL ported
    │       ├── gcode.c/h               # Bộ giải mã lệnh G-Code
    │       ├── planner.c/h             # Bộ lập kế hoạch quỹ đạo (Motion Planning)
    │       ├── stepper.c/h             # Bộ phát xung Step
    │       └── kinematics/             # Các thuật toán động học (Delta, CoreXY...)
    └── Drivers/                        # Thư viện HAL và CMSIS từ hãng
