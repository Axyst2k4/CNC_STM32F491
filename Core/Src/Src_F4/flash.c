#include <string.h>
#include "driver.h"
#include "hal.h"

#if FLASH_ENABLE

// Thay vì extern, ta định nghĩa trực tiếp địa chỉ Page cuối cùng của G491RC (256KB)
#define EEPROM_EMUL_ADDR    0x0803F800

static uint32_t GetPage(uint32_t Address)
{
    return (Address - FLASH_BASE) / FLASH_PAGE_SIZE;
}

bool memcpy_from_flash (uint8_t *dest)
{
    // Copy trực tiếp từ địa chỉ cứng
    memcpy(dest, (void *)EEPROM_EMUL_ADDR, hal.nvs.size);
    return true;
}

bool memcpy_to_flash (uint8_t *source)
{
    if (!memcmp(source, (void *)EEPROM_EMUL_ADDR, hal.nvs.size))
        return true;

    HAL_StatusTypeDef status = HAL_ERROR;
    uint32_t PageError = 0;

    if ((status = HAL_FLASH_Unlock()) == HAL_OK) {
        FLASH_EraseInitTypeDef EraseInitStruct;
        EraseInitStruct.TypeErase   = FLASH_TYPEERASE_PAGES;
        EraseInitStruct.Banks       = FLASH_BANK_1;
        EraseInitStruct.Page        = GetPage(EEPROM_EMUL_ADDR);
        EraseInitStruct.NbPages     = 1;

        status = HAL_FLASHEx_Erase(&EraseInitStruct, &PageError);

        if (status == HAL_OK) {
            uint32_t address = EEPROM_EMUL_ADDR;
            uint32_t remaining = hal.nvs.size;
            uint64_t data64;
            uint8_t *p_source = source;

            while (remaining > 0 && status == HAL_OK) {
                data64 = 0xFFFFFFFFFFFFFFFFULL;
                size_t copy_size = remaining >= 8 ? 8 : remaining;
                memcpy(&data64, p_source, copy_size);

                status = HAL_FLASH_Program(FLASH_TYPEPROGRAM_DOUBLEWORD, address, data64);

                if (status == HAL_OK) {
                    address += 8;
                    p_source += 8;
                    remaining = remaining > 8 ? remaining - 8 : 0;
                }
            }
        }
        HAL_FLASH_Lock();
    }
    return status == HAL_OK;
}
#endif
