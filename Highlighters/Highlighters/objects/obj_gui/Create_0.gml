totalMillis = 0; minutes = 0; seconds = 0; milli = 0; 
numFont = font_add_sprite_ext(spr_ignumbers, "0123456789", true, 3); 
timeFont = font_add_sprite_ext(spr_timenumbers, "0123456789:", true, 3); 
freezeFont = font_add_sprite_ext(spr_freezenumbers, "0123456789", true, 3); 
boardSprite = instance_create_layer(240,y,"Board",obj_board);
boardSprite.board = obj_controller.board;
characters = [spr_cognac];
//holds pause state
countdownInst = noone;
pause = false;
screenShot = noone;
countdown = false;
pauseAnim = 0;
pauseCursor = 0;
pauseCursorPositions = [216,252,288];
