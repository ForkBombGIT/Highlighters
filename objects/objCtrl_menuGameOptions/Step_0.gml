event_inherited();
ui.cursorPosition = cursorPosition;

#region Input Control
if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
	audio_play_sound(snd_ok,1,0);
	if (++cursorPosition == 2) {
		objCtrl_game.ui.flash = true;
		state = 1;
	}
}
else if (keyboard_check_pressed(ds_map_find_value(global.controls,"B"))) {
	audio_play_sound(snd_back,1,0);
	if (--cursorPosition == -1) {
		state = -1;
		objCtrl_game.ui.flash = true;
	}
}

if (keyboard_check(vk_anykey)) {
	lastKey = keyboard_key;
	if (lastKey == keyboard_key) {
		if (++keyPressLength == 1) scr_menuCursorMovement(cursorPosition,keyboard_key);
	} else keyPressLength = 0;
	
	if (keyPressLength > longPress) {
		if (keyPressLength > 0) {
			if ((current_time - delayTime) > delay){
				delayTime = current_time;
				scr_menuCursorMovement(cursorPosition,keyboard_key);
			}
		} 
	}
} else keyPressLength = 0;
#endregion