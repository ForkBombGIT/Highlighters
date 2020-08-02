event_inherited();

if (sprite_exists(objCtrl_menuPause.screenShot) && objCtrl_menuPause.pause){  
	draw_sprite(objCtrl_menuPause.screenShot,0,0,0);
	draw_sprite(spr_pause,0,168,window_get_height()/4);
	draw_sprite(spr_pause_options,(cursorPosition == 0) ? 0 + floor(pauseAnim) : 0,24,210);
	draw_sprite(spr_pause_options,(cursorPosition == 1) ? 7 + floor(pauseAnim) : 7,24,259);
	draw_sprite(spr_pause_options,(cursorPosition == 2) ? 14 + floor(pauseAnim) : 14,24,306);
}