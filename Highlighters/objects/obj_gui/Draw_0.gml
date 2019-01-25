if !(pause) {
	//draws gui
	draw_set_font(numFont);
	//time
	draw_sprite(spr_time,0,72,24);
	draw_text(72,48,string_replace(string_format(minutes,2,0)," ", "0"));
	draw_text(72 + sprite_get_width(spr_numbers)*2,48, ":");
	draw_text(72 + sprite_get_width(spr_numbers)*3,48,string_replace(string_format(seconds,2,0)," ","0"));
	//score
	draw_sprite(spr_score,0,72,96);
	draw_text(72,120,string_replace_all(string_format(obj_controller.gameScore,6,0)," ", "0"));
	//next
	draw_sprite(spr_next,0,574,24);
	draw_sprite(spr_bomb,obj_controller.nextBomb, 622, 48);
	//game speed
	draw_sprite(spr_speed,0,598,96);
	draw_text(598,120,string_replace_all(string_format(obj_controller.gameSpeed + 1,2,0)," ", "0"));
} else { 
	draw_sprite(screenShot,0,0,0);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,768,672,c_black);
	draw_set_alpha(1);
	if !(countdown) {
		draw_sprite(spr_pause,0,window_get_width()/2,window_get_height()/2);
	}
}