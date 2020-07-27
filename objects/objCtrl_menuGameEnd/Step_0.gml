event_inherited();
ui.state = state;
ui.cursorPosition = cursorPosition;

#region Menu navigation
if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
	audio_play_sound(snd_ok,1,0);
	ui.flash = true;
	if (cursorPosition == 1) instance_destroy(objUI_characterPortrait);
	alarm[0] = 2;		
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