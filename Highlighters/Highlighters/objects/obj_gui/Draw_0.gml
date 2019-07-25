if !(pause) {
	//draws gui
	draw_set_font(timeFont);
	//time
	draw_text(368,369,string_replace(string_format(minutes,2,0)," ", "0"));
	draw_text(368 + sprite_get_width(spr_timenumbers) * 2,369, ":");
	draw_text(360 + sprite_get_width(spr_timenumbers) * 3,369,string_replace(string_format(seconds,2,0)," ","0"));
	draw_set_font(numFont);
	//score
	draw_sprite(spr_score,0,360,72);
	draw_text(360,96,string_replace_all(string_format(obj_controller.gameScore,6,0)," ", "0"));
	//game level
	draw_sprite(spr_speed,0,360,144);
	draw_text(408,168,string_replace_all(string_format(obj_controller.gameSpeed,3,0)," ", "0"));
	//draws character
	draw_sprite(characters[obj_controller.char],2,360,240)
} else { 
	draw_sprite(screenShot,0,0,0);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,480,432,c_black);
	draw_set_alpha(1);
	if !(countdown) {
		draw_sprite(spr_pause,0,window_get_width()/2,window_get_height()/2);
	}
}