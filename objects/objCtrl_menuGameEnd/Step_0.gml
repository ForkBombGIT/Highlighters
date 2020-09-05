event_inherited();
ui.state = state;
ui.cursorPosition = cursorPosition;

#region Menu navigation
if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
	audio_play_sound(snd_ok,1,0);
	objCtrl_game.ui.flash = true;
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

if (keyboard_check_pressed(ds_map_find_value(global.controls,"UP"))) {
	if (cursorPosition > 0) {
		cursorPosition--;	
	}
}

if (keyboard_check_pressed(ds_map_find_value(global.controls,"DOWN"))) {
	if (cursorPosition < 1) {
		cursorPosition++;	
	}
}
#endregion