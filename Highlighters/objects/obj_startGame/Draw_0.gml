draw_sprite(backgrounds[board],image_index,0,0);
draw_sprite(boards[board],image_index,240,0);
//draw_sprite(spr_grid,0,0,0);
draw_sprite(spr_selectCursor,image_index,288,cursorPositions[cursor]);
draw_set_font(numFont);

draw_sprite(spr_select,0,312,24);
draw_sprite(spr_level,0,312,96);
draw_sprite(spr_numbers,12,456,96);
draw_text(480,96,string_replace(string_format(level,2,0)," ", "0"));
draw_sprite(spr_numbers,14,528,96);
draw_sprite(spr_char,0,312,168);
draw_sprite(spr_numbers,12,456,168);
draw_text(480,168,string_replace(string_format(char + 1,2,0)," ", "0"));
draw_sprite(spr_numbers,14,528,168);
draw_sprite(spr_theme,0,312,216);
draw_sprite(spr_numbers,12,456,216);
draw_text(480,216,string_replace(string_format(board + 1,2,0)," ", "0"));
draw_sprite(spr_numbers,14,528,216);
draw_sprite(spr_track,0,312,264);
draw_sprite(spr_numbers,12,456,264);
draw_text(480,264,string_replace(string_format(track + 1,2,0)," ", "0"));
draw_sprite(spr_numbers,14,528,264);
draw_sprite(spr_start,0,312,360);

if (flash) draw_rectangle(0,0,768,432,c_black);