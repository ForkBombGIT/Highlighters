event_inherited();
ui.state = state;
ui.cursorPosition = cursorPosition;
ui.gameEndState = gameEndState;
var inputMap = ds_map_find_value(global.options,"input");
var avMap = ds_map_find_value(global.options,"av");
var soundVol = ds_map_find_value(avMap,"soundVol") / 100;
	
#region Menu navigation
if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
	audio_play_sound(snd_ok,1,0);
	audio_sound_gain(snd_ok,soundVol,0);
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

if (keyboard_check_pressed(ds_map_find_value(inputMap,"UP"))) {
	if (cursorPosition > 0) {
		cursorPosition--;	
	}
}

if (keyboard_check_pressed(ds_map_find_value(inputMap,"DOWN"))) {
	if (cursorPosition < 1) {
		cursorPosition++;	
	}
}
#endregion