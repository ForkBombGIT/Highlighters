draw_sprite(boards[board],image_index,0,0);
draw_sprite(characters[char],2,360,240)
//draw_sprite(spr_grid,0,240,0);
draw_sprite(spr_selectCursor,image_speed,24,cursorPositions[cursor]);
draw_set_font(numFont);
draw_sprite(spr_select,0,48,24);
draw_sprite(spr_level,0,48,96);
draw_sprite(spr_numbers,12,192,96);
draw_text(216,96,string_replace_all(string_format(level,3,0)," ", "0"));
draw_sprite(spr_numbers,14,288,96);
draw_sprite(spr_char,0,48,168);
draw_sprite(spr_numbers,12,192,168);
draw_text(216,168,string_replace_all(string_format(char + 1,3,0)," ", "0"));
draw_sprite(spr_numbers,14,288,168);
draw_sprite(spr_theme,0,48,216);
draw_sprite(spr_numbers,12,192,216);
draw_text(216,216,string_replace_all(string_format(board + 1,3,0)," ", "0"));
draw_sprite(spr_numbers,14,288,216);
draw_sprite(spr_track,0,48,264);
draw_sprite(spr_numbers,12,192,264);
draw_text(216,264,string_replace_all(string_format(track + 1,3,0)," ", "0"));
draw_sprite(spr_numbers,14,288,264);
draw_sprite(spr_start,0,48,360);
if (flash) draw_rectangle(0,0,768,432,c_black);