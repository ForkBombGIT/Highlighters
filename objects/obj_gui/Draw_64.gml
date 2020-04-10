if !(pause) || !sprite_exists(screenShot) {
	//draws freeze sprite
	if (obj_controller.freeze) {
		draw_set_font(freezeFont);
		draw_text(363,246,string_replace(string_format(obj_controller.freezeTime,2,0)," ","0"));
		draw_set_font(numFont);
	}
}