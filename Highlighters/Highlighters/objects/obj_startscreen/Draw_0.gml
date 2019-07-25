if (start == 0) {
	#region Menu Drawing
	draw_sprite(spr_mainmenu,0,24,24);
	draw_sprite(spr_oneplayer,(startCursor == 0) ? floor(textImageIndex) : 0,144,312);
	draw_sprite(spr_ok,18,24,72);
	draw_sprite(spr_back,0,120,72);
	#endregion
}

if (flash) draw_rectangle(0,0,768,432,c_black);