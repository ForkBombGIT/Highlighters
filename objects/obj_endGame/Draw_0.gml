draw_sprite(boards[board],0,0,0);
draw_sprite(spr_fadeToBlack,15,24,0);
draw_sprite(spr_gameover,gameoverAnim,26,0);
draw_sprite(spr_pause_options,(endCursor == 0) ? 7 + floor(endOptionAnim) : 7,24,258);
draw_sprite(spr_pause_options,(endCursor == 1) ? 14 + floor(endOptionAnim) : 14,24,307);

if (flash) draw_rectangle(0,0,768,432,c_black);