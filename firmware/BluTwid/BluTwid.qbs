import qbs

Product {
    Depends { name : "cpp" }
    type: "application"
    consoleApplication: true
    cpp.positionIndependentCode: false
    name: "BluTwid"
    cpp.includePaths : [ 
        "Inc",
        "Drivers/CMSIS/Include",
        "Drivers/CMSIS/Device/ST/STM32F0xx/Include",
        "Drivers/STM32F0xx_HAL_Driver/Inc"
        ]

    cpp.linkerScripts : [ "STM32F030K6Tx_FLASH.ld", "LIBS.ld" ]
    cpp.defines: [ "STM32F030xx" ]
    cpp.cLanguageVersion: "c99"
    cpp.cxxLanguageVersion: "c++11"


    Group {
        files: [ 
            "Inc/gpio.h",
            "Inc/adc.h",
            "Inc/iwdg.h",
            "Inc/spi.h",
            "Inc/usart.h",
            "Inc/stm32f0xx_it.h",
            "Inc/stm32f0xx_hal_conf.h",
            "Inc/mxconstants.h",
            "Src/gpio.c",
            "Src/adc.c",
            "Src/iwdg.c",
            "Src/spi.c",
            "Src/usart.c",
            "Src/stm32f0xx_it.c",
            "Src/stm32f0xx_hal_msp.c",
            "Src/main.c"
            ]
        name: "STM32CubeMX"
    }

    Group {
        files: [ 
            "Drivers/CMSIS/Include/core_cm0.h"
            ]
        name: "CMSIS.CORE"
    }

    Group {
        files: [ 
            "Drivers/CMSIS/Device/ST/STM32F0xx/Include/stm32f0xx.h",
            "Drivers/CMSIS/Device/ST/STM32F0xx/Include/system_stm32f0xx.h",
            "Drivers/CMSIS/Device/ST/STM32F0xx/Source/Templates/system_stm32f0xx.c",
            "Drivers/CMSIS/Device/ST/STM32F0xx/Source/Templates/gcc/startup_stm32f030x6.s"
            ]
        name: "Device.Startup"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal.c"
            ]
        name: "Device.STM32Cube HAL.COMMON"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_adc.h",
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_adc_ex.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_adc.c",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_adc_ex.c"
            ]
        name: "Device.STM32Cube HAL.ADC"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_iwdg.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_iwdg.c"
            ]
        name: "Device.STM32Cube HAL.IWDG"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_rcc.h",
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_rcc_ex.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_rcc.c",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_rcc_ex.c"
            ]
        name: "Device.STM32Cube HAL.RCC"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_cortex.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_cortex.c"
            ]
        name: "Device.STM32Cube HAL.CORTEX"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_dma_ex.h",
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_dma.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_dma.c"
            ]
        name: "Device.STM32Cube HAL.DMA"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_uart.h",
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_uart_ex.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_uart.c",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_uart_ex.c"
            ]
        name: "Device.STM32Cube HAL.UART"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_tim.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_tim.c",
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_tim_ex.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_tim_ex.c"
            ]
        name: "Device.STM32Cube HAL.TIM"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_pwr.h",
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_pwr_ex.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_pwr.c",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_pwr_ex.c"
            ]
        name: "Device.STM32Cube HAL.PWR"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_flash.h",
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_flash_ex.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_flash.c",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_flash_ex.c"
            ]
        name: "Device.STM32Cube HAL.FLASH"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_spi.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_spi.c",
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_spi_ex.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_spi_ex.c"
            ]
        name: "Device.STM32Cube HAL.SPI"
    }

    Group {
        files: [ 
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_gpio.h",
            "Drivers/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_gpio.c",
            "Drivers/STM32F0xx_HAL_Driver/Inc/stm32f0xx_hal_gpio_ex.h"
            ]
        name: "Device.STM32Cube HAL.GPIO"
    }

}