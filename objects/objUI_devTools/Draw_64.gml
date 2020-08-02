draw_set_font(lowercaseFont);
switch (state) {
	case 1:
		draw_set_color(c_black);
		draw_rectangle(0,0,768,432,false);
		draw_set_color(c_white);
		draw_text(24,48,"debug menu");
	break;
}