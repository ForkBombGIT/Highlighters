totalMillis = 0; global.minutes = 0; global.seconds = 0; milli = 0; 
global.numFont = font_add_sprite_ext(spr_boardnumbers, "0123456789-", true, 0); 
global.timeFont = font_add_sprite_ext(spr_timenumbers, "0123456789:", true, 0); 
freezeFont = font_add_sprite_ext(spr_freezenumbers, "0123456789", true, 3); 

//board sprites
boards = [spr_boardp,spr_board1, spr_board2];

//pause state
pause = false;
screenShot = noone;
resume = false;
pauseAnim = 0;
pauseCursor = 0;
pauseCursorPositions = [216,252,288];

//handles score animation
levelFlickerDelay = 0.25;
levelFlickerIndex = 0;
flickerOnVal = 2;
levelFlicker = false;

//controls flash effect
flash = false;

//animations
pauseAnimationSpeed = 0.2;