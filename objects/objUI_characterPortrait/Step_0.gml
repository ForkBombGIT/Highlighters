if (instance_exists(objCtrl_gameSession) || instance_exists(objCtrl_menuGameEnd))  {
	if (instance_exists(objCtrl_menuGameOptions) || instance_exists(objUI_countdown)) {
		characterAnimIndex = 0;
	} 
	else {
		var charFramerateArr = ds_list_find_value(characterFrameRates, global.character);
		var charAnimSpeed = charFramerateArr[state] / room_speed;
		var stateOffset, animMaxIndex;
		switch (state) {
			case 0:
				stateOffset = 0;
				animMaxIndex = sprite_get_number(char_idles[global.character]);
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
		
		// checks for a state change
		if (state != lastState) {
			characterAnimIndex = stateOffset;	
		}
		
		//progresses character animation index
		characterAnimIndex += charAnimSpeed;
		if (floor(characterAnimIndex) > animMaxIndex - 1){
			characterAnimIndex = stateOffset;
		}
		
		// progresses don durma animation index
		if (global.freeze) &&
		  !(global.riseBrake){
			durmaAnimIndex += charAnimSpeed;
			if (floor(durmaAnimIndex) > 8) {
				durmaAnimIndex = 7;
			}  
		}
		
	}
} 