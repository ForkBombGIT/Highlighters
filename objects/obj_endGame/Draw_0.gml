draw_sprite(boards[board],0,0,0);
draw_sprite((endState == 0) ? spr_fadeToBlack : spr_fadeToWhite,15,24,0);
draw_sprite((endState == 0) ? spr_gameoverLose : spr_gameoverWin,gameoverAnim,26,0);
draw_sprite(spr_pause_options,(endCursor == 0) ? 7 + floor(endOptionAnim) : 7,24,258);
draw_sprite(spr_pause_options,(endCursor == 1) ? 14 + floor(endOptionAnim) : 14,24,307);