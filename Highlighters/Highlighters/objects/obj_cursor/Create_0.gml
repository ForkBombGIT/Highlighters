image_speed = 2;
//initialize cursor position
y = scr_getRowPos(4);
//cursor movement
delayTime = current_time; //delay on cursor press
delay = 0.05; //how long
keyPressLength = 0; //how long the key has been pressed
longPress = 12; //how long a key needs to be held
lastKey = -1; //last key pressed
//left right up down buttons, pressed or not
leftB = 0;
rightB = 0;
upB = 0;
downB = 0;

//cursor location
row = 4;
col = 2;
//force rise variables
targY = -1;
initY = -1;

