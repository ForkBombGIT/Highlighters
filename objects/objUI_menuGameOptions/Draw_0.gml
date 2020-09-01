if !(global.gameMode == 1) && !(start) {
	draw_sprite(spr_board,global.character,0,0);
	draw_set_font(numFont);
	draw_sprite(spr_select,0,48,24);
	//level portion
	draw_sprite(spr_level,0,48,120);
	draw_text(132,168,string_replace_all(string_format(global.gameLevel,3,0)," ", "0"));
	//character portion
	draw_sprite(spr_char,(global.character - 1) * 2,48,240);
	draw_sprite(spr_characters,(global.character - 1) * 2,24,288);
	//arrow positioning
	if (cursorPosition < 2) && (cursorPosition > -1)
		draw_sprite(spr_arrows,cursorType + floor(cursorFlickerIndex),24,cursorPositions[cursorPosition]);
}