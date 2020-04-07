totalMillis = 0; minutes = 0; seconds = 0; milli = 0; 
numFont = font_add_sprite_ext(spr_ignumbers, "0123456789", true, 3); 
timeFont = font_add_sprite_ext(spr_timenumbers, "0123456789:", true, 0); 
freezeFont = font_add_sprite_ext(spr_freezenumbers, "0123456789", true, 3); 

//board sprites
boards = [spr_boardp,spr_board1, spr_board2];
char_idles = [spr_durma_idle,spr_floss_idle,spr_cognac_idle];
char_other = [spr_durma_other,spr_floss_other,spr_cognac_other];
characterAnimIndex = 0;

//pause state
pause = false;
screenShot = noone;
resume = false;
pauseAnim = 0;
pauseCursor = 0;
pauseCursorPositions = [216,252,288];
//controls flash effect
flash = false;
