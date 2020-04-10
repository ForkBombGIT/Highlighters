if (instance_exists(obj_gui) && !obj_gui.pause) || !(instance_exists(obj_gui)) {
	if (instance_exists(obj_startGame) || instance_exists(obj_countdown)) {
		characterAnimIndex = 0;
	} 
	else {
		var charFramerateArr = ds_list_find_value(characterFrameRates, character);
		var charAnimSpeed = charFramerateArr[characterState] / room_speed;
		var stateOffset, animMaxIndex;
		
		if (global.active) characterState = 0;
		if (instance_exists(obj_controller))
			if (obj_controller.bounce) characterState = 1;
		if (global.gameover) characterState = 3;
		
		switch (characterState) {
			case 0:
				stateOffset = 0;
				animMaxIndex = sprite_get_number(char_idles[character]);
				break;
			case 1:
				stateOffset = 1;
				animMaxIndex = 3;
				break;
			case 2:
			break;
			case 3:
				stateOffset = 5;
				animMaxIndex = 7;
				break;
		}
		
		characterAnimIndex += charAnimSpeed;
		if (floor(characterAnimIndex) >= animMaxIndex){
			characterAnimIndex = stateOffset;
		}
		
		if (instance_exists(obj_controller)) {
			if (obj_controller.freeze) {
				durmaAnimIndex += charAnimSpeed;
				if (floor(durmaAnimIndex) >= 9) {
					durmaAnimIndex = 7;
				}  
			}
		}
	}
} 