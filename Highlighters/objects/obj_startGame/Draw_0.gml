draw_sprite(boards[board],image_index,240,0);
//draw_sprite(spr_grid,0,0,0);
draw_sprite(spr_selectCursor,image_index,288,cursorPositions[cursor]);

draw_sprite(spr_level,0,312,96);
draw_sprite(spr_char,0,312,168);
draw_sprite(spr_theme,0,312,216);
draw_sprite(spr_track,0,312,264);
draw_sprite(spr_start,0,312,360);


if (flash) draw_rectangle(0,0,768,432,c_black);