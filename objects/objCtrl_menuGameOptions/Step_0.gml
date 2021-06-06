event_inherited();
ui.cursorPosition = cursorPosition;

#region Input Control
//advance to practice
var inputMap = ds_map_find_value(global.options,"input");
if (global.gameMode == 1) state = 1;
if (keyboard_check_pressed(ds_map_find_value(inputMap,"A")) && 
   (objCtrl_game.ui.transitionAlpha == 0)) {
	audio_play_sound(snd_ok,1,0);
	if (++cursorPosition == 2) {
		state = 1;
	}
}
else if (keyboard_check_pressed(ds_map_find_value(inputMap,"B"))) {
	audio_play_sound(snd_back,1,0);
	if (--cursorPosition == -1) {
		state = -1;
	}
}

if (keyboard_check(vk_anykey) &&
   (objCtrl_game.ui.transitionAlpha == 0)) {
	lastKey = keyboard_key;
	if (lastKey == keyboard_key) {
		if (++keyPressLength == 1) {
			var preLevel = global.gameLevel;
			var preChar = global.character;
			scr_gameMenuCursorMovement(cursorPosition,keyboard_key);
			#region Movement Sounds
			if (preLevel != global.gameLevel || preChar != global.character) {
				if (audio_is_playing(snd_move)) {
					audio_stop_sound(snd_move)	
				}
				audio_play_sound(snd_move,1,0);	
			}
			#endregion
		}
	} else keyPressLength = 0;
	
	if (keyPressLength > longPress) {
		if (keyPressLength > 0) {
			if ((current_time - delayTime) > delay) {
				delayTime = current_time;
				scr_gameMenuCursorMovement(cursorPosition,keyboard_key);
			}
		} 
	}
} else keyPressLength = 0;
#endregion