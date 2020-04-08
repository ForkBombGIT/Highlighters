if !(global.practice) {
	draw_sprite(boards[board],0,0,0);
	draw_set_font(numFont);
	draw_sprite(spr_select,0,48,24);
	//level portion
	draw_sprite(spr_level,0,48,120);
	draw_text(132,168,string_replace_all(string_format(level,3,0)," ", "0"));
	//character portion
	draw_sprite(spr_char,(board - 1) * 2,48,240);
	draw_sprite(spr_characters,(board - 1) * 2,24,288);
	//arrow positioning
	if (cursor < 2) && (cursor > -1)
		draw_sprite(spr_arrows,cursorType + floor(cursorFlickerIndex),24,cursorPositions[cursor]);

	if (flash) draw_rectangle(0,0,768,432,c_black);
}