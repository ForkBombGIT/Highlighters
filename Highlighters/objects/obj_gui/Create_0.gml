totalSeconds = 0; minutes = 0; seconds = 0; milli = 0; 
numFont = font_add_sprite_ext(spr_numbers, "0123456789:", true, 2); 
instance_create_layer(x,y,"Board",obj_board);
image_speed = 0.5;
//holds pause state
pause = false;
screenShot = noone;
countdown = false;

