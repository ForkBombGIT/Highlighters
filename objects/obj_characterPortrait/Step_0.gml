if (instance_exists(obj_gui) && !obj_gui.pause) || !(instance_exists(obj_gui)) {
	if (instance_exists(obj_startGame) || instance_exists(obj_countdown)) {
		characterAnimIndex = 0;
	} 
	else {
		var charFramerateArr = ds_list_find_value(characterFrameRates, character);
		var charAnimSpeed = charFramerateArr[characterState] / room_speed;
		var stateOffset;
		switch (characterState) {
			case 0:
				stateOffset = 0;
			break;
			case 1:
			break;
			case 2:
			break;
			case 3:
				stateOffset = 5;
			break;
		}
		if (global.active) {
			characterState = 0;
			if (round(characterAnimIndex) < sprite_get_number(char_idles[character])){
				characterAnimIndex += charAnimSpeed;
			} else characterAnimIndex = stateOffset;
		} 
	
	
		if (global.gameover) {
			characterState = 3;
			if (round(characterAnimIndex) < 7){
				characterAnimIndex += charAnimSpeed;
			} else characterAnimIndex = stateOffset;
		}
	}
} 