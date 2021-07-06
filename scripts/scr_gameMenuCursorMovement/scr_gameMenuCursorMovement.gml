function scr_gameMenuCursorMovement(argument0, argument1) {
	//used for cursor movement in menus
	//keyRight and keyLeft should be defined in calling obj
	var cursorPosition = argument0;
	var keyCode = argument1;
	var inputMap = ds_map_find_value(global.options,"input");
	
	var optionChanged = false;
	
	if (keyCode == ds_map_find_value(inputMap,"UP")) {
		switch (cursorPosition) {
			case 0:
				var currentVal = global.gameLevel;
				global.gameLevel = min(global.gameLevel + 100,global.maxLevel - 1);
				optionChanged = currentVal != global.gameLevel;
				break;
		}
	}

	if (keyCode == ds_map_find_value(inputMap,"DOWN")) {
		switch (cursorPosition) {
			case 0:
				var currentVal = global.gameLevel;
				global.gameLevel = max(global.gameLevel - 100,0);
				optionChanged = currentVal != global.gameLevel;
				break;
		}
	}

	if (keyCode == ds_map_find_value(inputMap,"RIGHT")) {
		switch (cursorPosition) {
			case 0:
				var currentVal = global.gameLevel;
				global.gameLevel = min(global.gameLevel + 1,global.maxLevel - 1)
				optionChanged = currentVal != global.gameLevel;
				break;
			case 1:
				var currentVal = global.character;
				global.character = clamp(global.character + 1,1,global.maxChar)
				optionChanged = currentVal != global.character;
				break;
		}
	}

	if (keyCode == ds_map_find_value(inputMap,"LEFT")) {
		switch (cursorPosition) {
			case 0:
				var currentVal = global.gameLevel;
				global.gameLevel = max(global.gameLevel - 1,0)
				optionChanged = currentVal != global.gameLevel;
				break;
			case 1:
				var currentVal = global.character;
				global.character = clamp(global.character - 1,1,global.maxChar)
				optionChanged = currentVal != global.character;
				break;
		}
	}
	
	if (optionChanged) {
		if (audio_is_playing(snd_move)) audio_stop_sound(snd_move);
		audio_play_sound(snd_move,1,0);	
	}

}
