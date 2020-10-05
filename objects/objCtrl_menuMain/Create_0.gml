event_inherited();
ui = instance_create_layer(x,y,"GUI",objUI_menuMain);
nextState = 0;
transitioning = false;
//Cursor control
cursorPosition = 0;
cursorPositions = [72,120,168,216,264];

// Time key has been pressed for
keyPressLength = 0;

// Time to trigger a key press
longPress = 12;