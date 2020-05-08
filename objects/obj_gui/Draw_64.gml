if !(pause) || !sprite_exists(screenShot) {
	//draws freeze sprite
	if (obj_controller.freeze) {
		draw_set_font(freezeFont);
		draw_text(363,246,string_replace(string_format(obj_controller.freezeTime,2,0)," ","0"));
		draw_set_font(global.numFont);
	}
}

//time
draw_set_font(global.timeFont);
draw_text(369,369,string_replace(string_format(global.minutes,2,0)," ", "0"));
draw_text(414,369,string_replace(string_format(global.seconds,2,0)," ","0"));

if (flash) draw_rectangle(0,0,768,432,c_black);