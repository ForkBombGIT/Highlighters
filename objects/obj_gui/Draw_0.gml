#region Board UI
if !(global.active) characterAnimIndex = 0;
if !(pause) || !sprite_exists(screenShot){
	//draws board
	draw_sprite(boards[obj_controller.board],0,0,0);
	draw_sprite(!(global.active) ? char_other[obj_controller.board] : char_idles[obj_controller.board],characterAnimIndex,360,240);
	//draws gui
	draw_set_font(timeFont);
	//time
	draw_text(369,369,string_replace(string_format(minutes,2,0)," ", "0"));
	draw_text(414,369,string_replace(string_format(seconds,2,0)," ","0"));
	draw_set_font(numFont);
	//score
	draw_sprite(spr_score,0,360,72);
	draw_text(377,99,string_replace_all(string_format(obj_controller.gameScore,6,0)," ", "0"));
	//game level
	draw_sprite(spr_speed,0,360,144);
	draw_text(422,168,string_replace_all(string_format(obj_controller.gameSpeed,3,0)," ", "0"));
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
	draw_sprite(spr_pause,0,168,window_get_height()/4);
	draw_sprite(spr_pause_options,(pauseCursor == 0) ? 0 + floor(pauseAnim) : 0,24,210);
	draw_sprite(spr_pause_options,(pauseCursor == 1) ? 7 + floor(pauseAnim) : 7,24,259);
	draw_sprite(spr_pause_options,(pauseCursor == 2) ? 14 + floor(pauseAnim) : 14,24,306);
}
#endregion

if (flash) draw_rectangle(0,0,768,432,c_black);