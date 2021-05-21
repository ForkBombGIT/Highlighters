totalMillis = 0; global.minutes = 0; global.seconds = 0; milli = 0; 
global.numFont = font_add_sprite_ext(spr_boardnumbers, "0123456789-", true, 0); 
timeNumbers = [spr_time_default,spr_time_floss,spr_time_cognac,spr_time_hasen,spr_time_milo]
global.timeFont = font_add_sprite_ext(timeNumbers[global.character], "0123456789:", true, 3); 

//handles score animation
levelFlickerDelay = 0.25;
levelFlickerIndex = 0;
flickerOnVal = 2;
levelFlicker = false;