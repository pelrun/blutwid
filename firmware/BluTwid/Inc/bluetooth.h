
#ifndef INC_BLUETOOTH_H_
#define INC_BLUETOOTH_H_

void BT_sendMouseState(uint8_t btnState, uint8_t deltaX, uint8_t deltaY, uint8_t deltaZ);

void BT_sendKeyboardState(uint8_t modifiers, uint8_t* keysPressed);

#endif /* INC_BLUETOOTH_H_ */
