if !(pause) || !sprite_exists(screenShot){
	//draws gui
	draw_set_font(timeFont);
	//time
	draw_text(368,369,string_replace(string_format(minutes,2,0)," ", "0"));
	draw_text(368 + sprite_get_width(spr_timenumbers) * 2,369, ":");
	draw_text(360 + sprite_get_width(spr_timenumbers) * 3,369,string_replace(string_format(seconds,2,0)," ","0"));
	draw_set_font(numFont);
	//score
	draw_sprite(spr_score,0,360,72);
	draw_text(378,96,string_replace_all(string_format(obj_controller.gameScore,6,0)," ", "0"));
	//game level
	if !obj_controller.freeze draw_sprite(spr_speed,0,360,144) else draw_sprite(spr_stop,0,360,144);
	if (obj_controller.freeze) {
		draw_set_font(freezeFont);
		draw_text(362,168,obj_controller.freezeTime);
		draw_set_font(numFont);
	}
	draw_text(423,168,string_replace_all(string_format(obj_controller.gameSpeed,3,0)," ", "0"));
	//draws character
	//draw_sprite(characters[obj_controller.char],2,360,240)
} 
if (sprite_exists(screenShot) && pause){  
	draw_sprite(screenShot,0,0,0);
	if !(countdown) {
		draw_sprite(spr_pause,floor(pauseAnim),168,window_get_height()/4);
		draw_sprite(spr_pauseOptions,0,96,216);
		draw_sprite(spr_pauseOptions,1,96,252);
		draw_sprite(spr_pauseOptions,2,96,288);
		draw_sprite(spr_selectCursor,0,48,pauseCursorPositions[pauseCursor]);
	}
}
