#region Board UI
if !(global.active) {
	characterAnimIndex = 0;
}
if !(pause) || !sprite_exists(screenShot) {
	//draws board
	draw_sprite(boards[obj_controller.board],0,0,0);
	//draws gui
	draw_set_font(global.numFont);
	//score
	draw_sprite(spr_score,0,360,72);
	draw_text(377,99,string_replace_all(string_format(global.gameScore,6,0)," ", "0"));
	//game level
	draw_sprite(spr_speed,0,360,144);
	draw_text((global.practice) ? 446 : 422 ,168,(global.practice) ? "-" : string_replace_all(string_format(global.gameLevel,3,0)," ", "0"));
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