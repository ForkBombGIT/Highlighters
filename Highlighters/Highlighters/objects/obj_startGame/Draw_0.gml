draw_sprite(backgrounds[board],image_index,0,0);
draw_sprite(boards[board],image_index,240,0);
draw_sprite(characters[char],2,600,240)
//draw_sprite(spr_grid,0,240,0);
draw_sprite(spr_selectCursor,image_speed,264,cursorPositions[cursor]);
draw_set_font(numFont);
draw_sprite(spr_select,0,288,24);
draw_sprite(spr_level,0,288,96);
draw_sprite(spr_numbers,12,432,96);
draw_text(456,96,string_replace_all(string_format(level,3,0)," ", "0"));
draw_sprite(spr_numbers,14,528,96);
draw_sprite(spr_char,0,288,168);
draw_sprite(spr_numbers,12,432,168);
draw_text(456,168,string_replace_all(string_format(char + 1,3,0)," ", "0"));
draw_sprite(spr_numbers,14,528,168);
draw_sprite(spr_theme,0,288,216);
draw_sprite(spr_numbers,12,432,216);
draw_text(456,216,string_replace_all(string_format(board + 1,3,0)," ", "0"));
draw_sprite(spr_numbers,14,528,216);
draw_sprite(spr_track,0,288,264);
draw_sprite(spr_numbers,12,432,264);
draw_text(456,264,string_replace_all(string_format(track + 1,3,0)," ", "0"));
draw_sprite(spr_numbers,14,528,264);
draw_sprite(spr_start,0,288,360);
if (flash) draw_rectangle(0,0,768,432,c_black);