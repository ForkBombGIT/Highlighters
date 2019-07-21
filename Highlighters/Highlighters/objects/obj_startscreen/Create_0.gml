randomize();
image_speed = 0.1;
//controls alpha of screen fade
start = 0;
flash = false;

//handles color switching for start screen
colorTimer = current_time;
colorb = irandom_range(0,10);
colorbLast = colorb;
coloraOrg = irandom_range(0,10) * 16;
colora = coloraOrg;
colorDelay = 2;
transition = false;

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