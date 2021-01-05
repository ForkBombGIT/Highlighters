totalMillis = 0; global.minutes = 0; global.seconds = 0; milli = 0; 
global.numFont = font_add_sprite_ext(spr_boardnumbers, "0123456789-", true, 0); 
global.timeFont = font_add_sprite_ext(spr_timenumbers, "0123456789:", true, 0); 

//handles score animation
levelFlickerDelay = 0.25;
levelFlickerIndex = 0;
flickerOnVal = 2;
levelFlicker = false;