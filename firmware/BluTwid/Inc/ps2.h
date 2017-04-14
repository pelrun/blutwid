#ifndef INC_PS2_H_
#define INC_PS2_H_

typedef struct
{
  GPIO_TypeDef* GPIOx_CLK;
  uint16_t Pin_CLK;
  GPIO_TypeDef* GPIOx_DATA;
  uint16_t Pin_DATA;
  bool initialised;
} PS2_Device_Def;

bool PS2_ReadByte(PS2_Device_Def *dev, uint8_t *in);
bool PS2_WriteByte(PS2_Device_Def *dev, uint8_t out);

bool PS2_Expect(PS2_Device_Def *dev, uint8_t expected);

#endif /* INC_PS2_H_ */
