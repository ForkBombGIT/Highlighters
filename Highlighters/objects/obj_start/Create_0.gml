randomize();
image_speed = 0.5;
//controls alpha of screen fade
alpha = 0;
start = 0;

//used for controlling count down frame
frameState = -1;
frameTimer = current_time;

//handles color switching for start screen
colorTimer = current_time;
colorb = irandom_range(0,10);
colorbLast = colorb;
coloraOrg = irandom_range(0,10) * 16;
colora = coloraOrg;
colorDelay = 2;
transition = false;

//holds the blocks to be used in the game
selectedEntities = [];