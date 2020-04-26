draw_sprite(boards[board],0,0,0);
draw_set_font(global.timeFont);
//time
draw_text(369,369,string_replace(string_format(global.minutes,2,0)," ", "0"));
draw_text(414,369,string_replace(string_format(global.seconds,2,0)," ","0"));
draw_set_font(global.numFont);
//score
draw_sprite(spr_score,0,360,72);
draw_text(377,99,string_replace_all(string_format(global.gameScore,6,0)," ", "0"));
//game level
draw_sprite(spr_speed,0,360,144);
draw_text(422,168,string_replace_all(string_format(global.gameLevel,3,0)," ", "0"));
draw_sprite((endState == 0) ? spr_fadeToBlack : spr_fadeToWhite,15,24,0);
draw_sprite((endState == 0) ? spr_gameoverLose : spr_gameoverWin,gameoverAnim,26,0);
draw_sprite(spr_pause_options,(endCursor == 0) ? 7 + floor(endOptionAnim) : 7,24,258);
draw_sprite(spr_pause_options,(endCursor == 1) ? 14 + floor(endOptionAnim) : 14,24,307);