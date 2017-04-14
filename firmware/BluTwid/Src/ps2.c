
#include <stdbool.h>

#include "gpio.h"
#include "ps2.h"

#include "blutwid.h"

static inline void Delay(__IO uint32_t micros) {
  /* Go to clock cycles */
  micros *= (SystemCoreClock / 1000000) / 5;

  /* Wait till done */
  while (micros--);
}

static inline void _clockHigh(PS2_Device_Def *dev)
{
  HAL_GPIO_WritePin(dev->GPIOx_CLK, dev->Pin_CLK, GPIO_PIN_SET);
}

static inline void _clockLow(PS2_Device_Def *dev)
{
  HAL_GPIO_WritePin(dev->GPIOx_CLK, dev->Pin_CLK, GPIO_PIN_RESET);
}

static inline bool _isClockHigh(PS2_Device_Def *dev)
{
  return (HAL_GPIO_ReadPin(dev->GPIOx_CLK, dev->Pin_CLK) == GPIO_PIN_SET);
}

static inline void _dataHigh(PS2_Device_Def *dev)
{
  HAL_GPIO_WritePin(dev->GPIOx_DATA, dev->Pin_DATA, GPIO_PIN_SET);
}

static inline void _dataLow(PS2_Device_Def *dev)
{
  HAL_GPIO_WritePin(dev->GPIOx_DATA, dev->Pin_DATA, GPIO_PIN_RESET);
}

static inline bool _isDataHigh(PS2_Device_Def *dev)
{
  return (HAL_GPIO_ReadPin(dev->GPIOx_DATA, dev->Pin_DATA) == GPIO_PIN_SET);
}

bool PS2_ReadByte(PS2_Device_Def *dev, uint8_t *data)
{
  uint8_t in = 0;

  _dataHigh(dev);
  // enable device
  _clockHigh(dev);

  uint32_t timeout = HAL_GetTick() + BT_PS2_READ_TIMEOUT_MS;

  while (_isClockHigh(dev))
  {
    // busy wait
    if (HAL_GetTick() - timeout > 0)
    {
      // timeout
      _clockLow(dev);
      return false;
    }
  }

  // busy wait, start bit
  while (!_isClockHigh(dev));

  bool parity = false;

  for (uint8_t i=0; i<8; i++)
  {
    while (_isClockHigh(dev));

    if (_isDataHigh(dev))
    {
      in |= (1<<i);
      parity = !parity;
    }

    while (!_isClockHigh(dev));
  }

  // read/check parity
  while (_isClockHigh(dev));
  if (_isDataHigh(dev) == parity)
  {
    // parity error
    _clockLow(dev);
    return false;
  }
  while (!_isClockHigh(dev));

  // read stop bit
  while (_isClockHigh(dev));
  while (!_isClockHigh(dev));

  // disable device
  _clockLow(dev);

  *data = in;

  return true;
}

bool PS2_Expect(PS2_Device_Def *dev, uint8_t expected)
{
  uint8_t data;

  return PS2_ReadByte(dev, &data) && data == expected;
}

bool PS2_WriteByte(PS2_Device_Def *dev, uint8_t data)
{
  // signal device that we want to talk
  _dataHigh(dev);
  _clockHigh(dev);
  Delay(300);
  _clockLow(dev);
  Delay(300);
  _dataLow(dev);
  Delay(10);
  _clockHigh(dev);

  uint32_t timeout = HAL_GetTick() + BT_PS2_WRITE_TIMEOUT_MS;

  while (HAL_GetTick() - timeout < 0)
  {
    if (!_isClockHigh(dev))
    {
      break;
    }
  }

  if (_isClockHigh(dev))
  {
    // timeout
    return false;
  }

  bool parity = true;

  for (uint8_t i=0; i<8; i++)
  {
    if (data & (1<<i))
    {
      parity = !parity;
      _dataHigh(dev);
    }
    else
    {
      _dataLow(dev);
    }

    // wait for a falling clock edge
    while(!_isClockHigh(dev));
    while(_isClockHigh(dev));
  }

  // send parity bit
  if (parity)
  {
    _dataHigh(dev);
  }
  else
  {
    _dataLow(dev);
  }

  // wait for a falling clock edge
  while(!_isClockHigh(dev));
  while(_isClockHigh(dev));

  _dataHigh(dev);

  // wait for rising edge
  while(_isClockHigh(dev));

  // wait for device to release bus
  while (!_isClockHigh(dev) || !_isDataHigh(dev));

  // suspend device
  _clockLow(dev);

  return true;
}
