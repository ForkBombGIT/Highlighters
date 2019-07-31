switch (start) {
	case 0:
		draw_text(window_get_width()/2 - string_width("HIGHLIGHTERS")/2,window_get_height()/4,"HIGHLIGHTERS");
		break;
	case 1:
		#region Menu Drawing
		draw_sprite(spr_mainmenu,0,24,24);
		draw_sprite(spr_oneplayer,(startCursor == 0) ? floor(textImageIndex) : 0,144,312);
		draw_sprite(spr_ok,18,24,72);
		draw_sprite(spr_back,0,120,72);
		break;
		#endregion
}
if (flash) draw_rectangle(0,0,768,432,c_black);