function scr_renderText(font,text,x,y,kern){
	var drawnString = "";
	draw_set_halign(fa_center);;
	draw_set_font(font);
	for (var i = 0; i < string_length(text); i++) {
		draw_text(x + kern * string_length(drawnString), y, string_char_at(text,i + 1));
		drawnString += string_char_at(text,i + 1);
	}
	draw_set_halign(fa_left);;
}