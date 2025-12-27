/*
  serial.c - serial port implementation for STM32G4xx ARM processors

  Part of grblHAL

  Copyright (c) 2019-2025 Terje Io
  Ported to STM32G4 2025
*/

#include <string.h>

#include "main.h"
#include "driver.h"
#include "hal.h"
#include "protocol.h"
#include "stream.h"

#ifdef SERIAL_PORT
static stream_rx_buffer_t rxbuf = {0};
static stream_tx_buffer_t txbuf = {0};
static enqueue_realtime_command_ptr enqueue_realtime_command;
static const io_stream_t *serialInit (uint32_t baud_rate);
#else
#define SERIAL_PORT 0
#endif


#if (SERIAL_PORT >= 10 && SERIAL_PORT < 19)
#define UART0            usart(1)
#define UART0_IRQ        usartINT(1)
#define UART0_IRQHandler usartHANDLER(1)
#define UART0_CLK_En     usartCLKEN(1)
#endif

#if SERIAL_PORT == 1 || (SERIAL_PORT >= 10 && SERIAL_PORT < 19)
#define UART0_CLK HAL_RCC_GetPCLK2Freq()
#else
#define UART0_CLK HAL_RCC_GetPCLK1Freq()
#endif

#if SERIAL_PORT == 10
#define UART0_TX_PIN 10
#define UART0_RX_PIN 11
#define UART0_PORT GPIOB
#define UART0_AF GPIO_AF7_USART1


#ifdef UART0_PORT
#define UART0_TX_PORT UART0_PORT
#define UART0_RX_PORT UART0_PORT
#endif

#endif // SERIAL_PORT



static bool uart_release (uint8_t instance);
static const io_stream_status_t *get_uart_status (uint8_t instance);

static io_stream_status_t stream_status[] = {
#if SERIAL_PORT
    {
        .baud_rate = 115200,
        .format = {
            .width = Serial_8bit,
            .stopbits = Serial_StopBits1,
            .parity = Serial_ParityNone,
        }
    },
#endif

};
static io_stream_properties_t serial[] = {
#if SERIAL_PORT
    {
      .type = StreamType_Serial,
      .instance = 0,
      .flags.claimable = On,
      .flags.claimed = Off,
      .flags.can_set_baud = On,
      .flags.modbus_ready = On,
      .claim = serialInit,
      .release = uart_release,
      .get_status = get_uart_status
    },
#endif

};

void serialRegisterStreams (void)
{
    static io_stream_details_t streams = {
        .n_streams = sizeof(serial) / sizeof(io_stream_properties_t),
        .streams = serial,
    };

    stream_register_streams(&streams);
}

static bool uart_release (uint8_t instance)
{
    if(instance < sizeof(serial) / sizeof(io_stream_properties_t)) {
        serial[instance].flags.claimed = Off;
        return true;
    }
    return false;
}

static const io_stream_status_t *get_uart_status (uint8_t instance)
{
    return instance < sizeof(stream_status) / sizeof(io_stream_status_t) ? &stream_status[instance] : NULL;
}

// SERIAL PORT 0 Implementation

static uint16_t serialRxFree (void)
{
    uint32_t tail = rxbuf.tail, head = rxbuf.head;
    return (RX_BUFFER_SIZE - 1) - BUFCOUNT(head, tail, RX_BUFFER_SIZE);
}

static uint16_t serialRxCount (void)
{
    uint32_t tail = rxbuf.tail, head = rxbuf.head;
    return BUFCOUNT(head, tail, RX_BUFFER_SIZE);
}

static void serialRxFlush (void)
{
    rxbuf.tail = rxbuf.head;
}

static void serialRxCancel (void)
{
    rxbuf.data[rxbuf.head] = ASCII_CAN;
    rxbuf.tail = rxbuf.head;
    rxbuf.head = BUFNEXT(rxbuf.head, rxbuf);
}

static bool serialPutC (const uint8_t c)
{
    uint16_t next_head = BUFNEXT(txbuf.head, txbuf);
    while(txbuf.tail == next_head) {
        if(!hal.stream_blocking_callback())
            return false;
    }
    txbuf.data[txbuf.head] = c;
    txbuf.head = next_head;
    UART0->CR1 |= USART_CR1_TXEIE;
    return true;
}

static void serialWriteS (const char *s)
{
    uint8_t c, *ptr = (uint8_t *)s;
    while((c = *ptr++) != '\0')
        serialPutC(c);
}

static void serialWrite (const uint8_t *s, uint16_t length)
{
    uint8_t *ptr = (uint8_t *)s;
    while(length--)
        serialPutC(*ptr++);
}

static void serialTxFlush (void)
{
    UART0->CR1 &= ~USART_CR1_TXEIE;
    txbuf.tail = txbuf.head;
}

static uint16_t serialTxCount (void)
{
    uint32_t tail = txbuf.tail, head = txbuf.head;
    return BUFCOUNT(head, tail, TX_BUFFER_SIZE) + (UART0->ISR & USART_ISR_TC ? 0 : 1);
}

static int32_t serialGetC (void)
{
    uint_fast16_t tail = rxbuf.tail;
    if(tail == rxbuf.head)
        return -1;
    int32_t data = (int32_t)rxbuf.data[tail];
    rxbuf.tail = BUFNEXT(tail, rxbuf);
    return data;
}

static bool serialSuspendInput (bool suspend)
{
    return stream_rx_suspend(&rxbuf, suspend);
}
static bool serialSetBaudRate (uint32_t baud_rate)
{
    UART0->CR1 &= ~USART_CR1_UE; // Tắt UART để cấu hình

    if (UART0 == LPUART1) {
        // Công thức chuẩn cho LPUART (Clock * 256)
        UART0->BRR = (uint32_t)((((uint64_t)UART0_CLK) << 8U) / baud_rate);
    } else {
        // Công thức cho USART (Sampling 16)
        UART0->BRR = (uint32_t)((UART0_CLK + (baud_rate / 2U)) / baud_rate);
    }

    UART0->ICR = 0xFFFFFFFF; // Xóa tất cả cờ lỗi cũ (Overrun, Noise, v.v.)
    UART0->CR1 |= (USART_CR1_RE | USART_CR1_TE | USART_CR1_UE); // Bật lại
    return true;
}

static bool serialSetFormat (serial_format_t format)
{
    stream_status[0].format = format;
    UART0->CR1 &= ~(USART_CR1_M|USART_CR1_PCE|USART_CR1_PS);
    if(format.parity != Serial_ParityNone)
        UART0->CR1 |= (format.parity == Serial_ParityEven ? (USART_CR1_M0|USART_CR1_PCE) : (USART_CR1_M0|USART_CR1_PCE|USART_CR1_PS));
    return true;
}

static bool serialDisable (bool disable)
{
    if(disable)
        UART0->CR1 &= ~USART_CR1_RXNEIE_RXFNEIE;
    else
        UART0->CR1 |= USART_CR1_RXNEIE_RXFNEIE;
    return true;
}

static bool serialEnqueueRtCommand (uint8_t c)
{
    return enqueue_realtime_command(c);
}

static enqueue_realtime_command_ptr serialSetRtHandler (enqueue_realtime_command_ptr handler)
{
    enqueue_realtime_command_ptr prev = enqueue_realtime_command;
    if(handler)
        enqueue_realtime_command = handler;
    return prev;
}

static const io_stream_t *serialInit (uint32_t baud_rate)
{
    static const io_stream_t stream = {
        .type = StreamType_Serial,
        .instance = 0,
        .is_connected = stream_connected,
        .read = serialGetC,
        .write = serialWriteS,
        .write_n =  serialWrite,
        .write_char = serialPutC,
        .enqueue_rt_command = serialEnqueueRtCommand,
        .get_rx_buffer_free = serialRxFree,
        .get_rx_buffer_count = serialRxCount,
        .get_tx_buffer_count = serialTxCount,
        .reset_write_buffer = serialTxFlush,
        .reset_read_buffer = serialRxFlush,
        .cancel_read_buffer = serialRxCancel,
        .suspend_read = serialSuspendInput,
        .disable_rx = serialDisable,
        .set_baud_rate = serialSetBaudRate,
        .set_format = serialSetFormat,
#if MODBUS_RTU_STREAM == 0 && defined(RS485_DIR_PORT)
        .set_direction = rs485SetDirection,
#endif
        .set_enqueue_rt_handler = serialSetRtHandler
    };

    if(!serial[0].flags.claimable || serial[0].flags.claimed)
        return NULL;

    serial[0].flags.claimed = On;

    if(!serial[0].flags.init_ok) {
        UART0_CLK_En();

        GPIO_InitTypeDef GPIO_InitStructure = {
            .Mode      = GPIO_MODE_AF_PP,
            .Pull      = GPIO_NOPULL,
            .Speed     = GPIO_SPEED_FREQ_VERY_HIGH,
            .Pin       = (1 << UART0_RX_PIN)|(1 << UART0_TX_PIN),
            .Alternate = UART0_AF
        };
        HAL_GPIO_Init(UART0_PORT, &GPIO_InitStructure);

        HAL_NVIC_SetPriority(UART0_IRQ, 1, 0);
        HAL_NVIC_EnableIRQ(UART0_IRQ);

        serial[0].flags.init_ok = On;
    }

    stream_set_defaults(&stream, baud_rate);
    return &stream;
}

void UART0_IRQHandler (void)
{
    if(UART0->ISR & USART_ISR_RXNE_RXFNE) {
        uint32_t data = UART0->RDR;
        if(!enqueue_realtime_command((uint8_t)data)) {
            uint16_t next_head = BUFNEXT(rxbuf.head, rxbuf);
            if(next_head == rxbuf.tail)
                rxbuf.overflow = 1;
            else {
                rxbuf.data[rxbuf.head] = (uint8_t)data;
                rxbuf.head = next_head;
            }
        }
    }

    if((UART0->ISR & USART_ISR_TXE_TXFNF) && (UART0->CR1 & USART_CR1_TXEIE)) {
        uint_fast16_t tail = txbuf.tail;
        UART0->TDR = txbuf.data[tail];
        txbuf.tail = tail = BUFNEXT(tail, txbuf);
        if(tail == txbuf.head)
            UART0->CR1 &= ~USART_CR1_TXEIE;
   }
}
