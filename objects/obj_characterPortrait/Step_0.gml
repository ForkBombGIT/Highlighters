if (instance_exists(obj_gui) && !obj_gui.pause) || !(instance_exists(obj_gui)) {
	if (instance_exists(obj_startGame) || instance_exists(obj_countdown)) {
		characterAnimIndex = 0;
	} 
	else {
		var charFramerateArr = ds_list_find_value(characterFrameRates, character);
		var charAnimSpeed = charFramerateArr[characterState] / room_speed;
		var stateOffset, animMaxIndex;
		
		if (global.gameover) characterState = 3;
		else if (global.victory) characterState = 2
		else {
			//idle
			if (global.active) characterState = 0;
			//panic
			if (instance_exists(obj_controller)) {
				var panic = false;
				with (par_entity) {
					if (y <= scr_getRowPos(6)) panic = true;
				}
				if (panic) characterState = 1;
			}
		}
		
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
				stateOffset = 3;
				animMaxIndex = 5;
				break;
			case 3:
				stateOffset = 5;
				animMaxIndex = 7;
				break;
		}
		
		characterAnimIndex += charAnimSpeed;
		if (floor(characterAnimIndex) > animMaxIndex - 1){
			characterAnimIndex = stateOffset;
		}
		
		if (global.freeze) &&
		  !(global.riseBrake){
			durmaAnimIndex += charAnimSpeed;
			if (floor(durmaAnimIndex) > 8) {
				durmaAnimIndex = 7;
			}  
		}
		
	}
} 