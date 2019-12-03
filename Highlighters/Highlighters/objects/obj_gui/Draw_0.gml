#region Board UI
if !(pause) || !sprite_exists(screenShot){
	//draws board
	draw_sprite(boards[obj_controller.board],0,0,0);
	//draws gui
	draw_set_font(timeFont);
	//time
	draw_text(370,366,string_replace(string_format(minutes,2,0)," ", "0"));
	draw_text(352 + sprite_get_width(spr_timenumbers) * 3,366,string_replace(string_format(seconds,2,0)," ","0"));
	draw_set_font(numFont);
	//score
	draw_sprite(spr_score,0,360,72);
	draw_text(378,99,string_replace_all(string_format(obj_controller.gameScore,6,0)," ", "0"));
	//game level
	draw_sprite(spr_speed,0,360,144);
	draw_text(423,168,string_replace_all(string_format(obj_controller.gameSpeed,3,0)," ", "0"));
	//draws freeze sprite
	if (obj_controller.freeze) {
		draw_set_font(freezeFont);
		draw_text(363,246,string_replace(string_format(obj_controller.freezeTime,2,0)," ","0"));
		draw_set_font(numFont);
	}
} 
#endregion
#region Pause Control
if (sprite_exists(screenShot) && pause){  
	draw_sprite(screenShot,0,0,0);
	if !(countdown) {
		draw_sprite(spr_pause,0,168,window_get_height()/4);
		draw_sprite(spr_pause_options,(pauseCursor == 0) ? 0 + floor(pauseAnim) : 0,24,210);
		draw_sprite(spr_pause_options,(pauseCursor == 1) ? 7 + floor(pauseAnim) : 7,24,259);
		draw_sprite(spr_pause_options,(pauseCursor == 2) ? 14 + floor(pauseAnim) : 14,24,306);
	}
}
#endregion