totalMillis = 0; minutes = 0; seconds = 0; milli = 0; 
numFont = font_add_sprite_ext(spr_numbers, "0123456789:<>", true, 0); 
boardSprite = instance_create_layer(240,y,"Board",obj_board);
boardSprite.board = obj_controller.board;
image_speed = 0.5;
//holds pause state
pause = false;
screenShot = noone;
countdown = false;

