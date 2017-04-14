
#include "usart.h"

#include "blutwid.h"

#include "bluetooth.h"

void Serial_writeByte(uint8_t byte)
{
  HAL_UART_Transmit(&huart1, &byte, 1, HAL_UART_TIMEOUT_VALUE);
}

void BT_sendMouseState(uint8_t btnState, uint8_t deltaX, uint8_t deltaY, uint8_t deltaZ)
{
  uint8_t mouseReport[] = {0xFD, 0x05, 0x02, btnState, deltaX, deltaY, deltaZ};
  HAL_UART_Transmit(&huart1, mouseReport, 7, HAL_UART_TIMEOUT_VALUE);
}

void BT_sendKeyboardState(uint8_t modifiers, uint8_t *keysPressed)
{
  uint8_t keyboardReport[] = {0xFD, 0x09, 0x01, modifiers, 0x00};
  HAL_UART_Transmit(&huart1, keyboardReport, 5, HAL_UART_TIMEOUT_VALUE);
  HAL_UART_Transmit(&huart1, keysPressed, MAX_KEYS_PRESSED, HAL_UART_TIMEOUT_VALUE);
}

void sendConsumerReport(uint16_t consumerKeys)
{
  uint8_t consumerReport[] = {0xFD, 0x00, 0x02, consumerKeys>>8, consumerKeys, 0x00, 0x00, 0x00, 0x00};
  HAL_UART_Transmit(&huart1, consumerReport, 9, HAL_UART_TIMEOUT_VALUE);
}

void getKeyboardLEDState()
{
  Serial_writeByte(0xFF);
  Serial_writeByte(0x02);

  //TODO
  //what to read from BT device?
}
