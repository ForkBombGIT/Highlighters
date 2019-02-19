randomize();
image_speed = 0.5;
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

//cursor control
cursor = 0;
cursorPositions = [72,120,168,216,264];

//holds the blocks to be used in the game
selectedEntities = [];