if !(pause) {
	//draws gui
	draw_set_font(numFont);
	//time
	draw_sprite(spr_time,0,15,50);
	draw_text(25,100,string_replace(string_format(minutes,2,0)," ", "0"));
	draw_text(25 + sprite_get_width(spr_numbers) * 2.2,100, "'");
	draw_text(25 + sprite_get_width(spr_numbers) * 2.8,100,string_replace(string_format(seconds,2,0)," ","0"));
	//score
	draw_sprite(spr_score,0,15,150);
	draw_text(25,200,string_replace_all(string_format(obj_controller.gameScore,7,0)," ", "0"));
	//next
	draw_sprite(spr_next,0,window_get_width() - 42,50);
	draw_sprite(spr_nextBox,0,window_get_width() - 95,125);
	draw_sprite(spr_bomb,obj_controller.nextBomb, window_get_width() - 95, 125);
	//game speed
	draw_sprite(spr_speed,0,window_get_width() - 25,200);
	draw_text(window_get_width() - 80,250,string_replace_all(string_format(obj_controller.gameSpeed,2,0)," ", "0"));
} else { 
	draw_sprite(screenShot,0,0,0);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,768,672,c_black);
	draw_set_alpha(1);
	if !(countdown) {
		draw_sprite(spr_pause,0,window_get_width()/2,window_get_height()/2);
	}
}