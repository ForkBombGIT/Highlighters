randomize();
image_speed = 0.1;
//controls alpha of screen fade
start = 0;
flash = false;

//menu animation variables
cursorImageIndex = 0;
textImageIndex = 0;

//cursor control
startCursor = 0;
cursor = 0;
cursorPositions = [72,120,168,216,264];
delayTime = current_time;
delay = 0.05;
keyPressLength = 0;
longPress = 12;

//holds the blocks to be used in the game
selectedEntities = [];