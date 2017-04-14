
#ifndef INC_PS2KEYBOARD_H_
#define INC_PS2KEYBOARD_H_

bool PS2Keyboard_Init(GPIO_TypeDef* GPIOx_CLK, uint16_t Pin_CLK, GPIO_TypeDef* GPIOx_DATA, uint16_t Pin_DATA);

void PS2Keyboard_Process();

uint8_t* PS2Keyboard_GetKeysPressed();

uint8_t PS2Keyboard_GetKeyModifiers();

#endif /* INC_PS2KEYBOARD_H_ */
