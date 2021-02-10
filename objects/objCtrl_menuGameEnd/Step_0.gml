event_inherited();
ui.state = state;
ui.cursorPosition = cursorPosition;
ui.gameEndState = gameEndState;
var inputMap = ds_map_find_value(global.options,"input");
	
#region Menu navigation
if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
	audio_play_sound(snd_ok,1,0);
	objCtrl_game.ui.transition = true;
	switch (cursorPosition) {
		case 0:
			state = 1;
			instance_destroy(obj_star);
		break;
		case 1:
			state = 2;
			instance_destroy(objCtrl_characterPortrait);
		break;
	}
}

// Cursor movement
var lastCursorPosition = cursorPosition;
//moving up and down
if (keyboard_check_pressed(ds_map_find_value(inputMap,"UP"))) {
	cursorPosition = clamp(cursorPosition - 1,0,1);
	if (lastCursorPosition != cursorPosition) {
		if (audio_is_playing(snd_move)) {
			audio_stop_sound(snd_move)	
		}
		audio_play_sound(snd_move,1,0);	
	}
}
else if (keyboard_check_pressed(ds_map_find_value(inputMap,"DOWN"))) {
	cursorPosition = clamp(cursorPosition + 1,0,1)
	if (lastCursorPosition != cursorPosition) {
		if (audio_is_playing(snd_move)) {
			audio_stop_sound(snd_move)	
		}
		audio_play_sound(snd_move,1,0);	
	}
}
#endregion