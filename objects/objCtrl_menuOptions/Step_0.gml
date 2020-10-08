event_inherited();
ui.state = state;
ui.cursorPosition = cursorPosition;
ui.inputChangeKey = inputChangeKey;
ui.inputPrompt = inputPrompt;
maxCursorPosition = (state == 0) ? inputMaxCursorPosition : avMaxCursorPosition;

#region Input Control
if !(inputChangeKey) {
	//back
	if (keyboard_check_pressed(ds_map_find_value(global.controls,"B"))) {
		audio_play_sound(snd_back,1,0);
		state = -1;
	}	
	//moving up and down
	if (keyboard_check_pressed(ds_map_find_value(global.controls,"UP"))) 
		cursorPosition = clamp(cursorPosition - 1,0,((state == 0) ? inputMaxCursorPosition : avMaxCursorPosition) - 1);
	else if (keyboard_check_pressed(ds_map_find_value(global.controls,"DOWN"))) 
		cursorPosition = clamp(cursorPosition + 1,0,((state == 0) ? inputMaxCursorPosition : avMaxCursorPosition) - 1);
	
}

// if the user is changing the key
if (state == 0) {
	if ((current_time - promptTime) / 1000 >= promptLife) {
		promptTime = current_time;
		inputPrompt = -1;
	}
	if (inputChangeKey) {
		if (keyboard_check_pressed(vk_anykey)) {
				var keyPressed = keyboard_key;
				show_debug_message(keyPressed);
				// if cursor is not at select
				if (cursorPosition - 1 >= 0) {
					var validKey = true;
					var inputControlKeys = ds_map_keys_to_array(global.controls);
					//checks for duplicate keys
					
					if (scr_keyToIndex(keyPressed) == -1) {
						validKey = false;
						inputPrompt = 1;
						promptTime = current_time;
					}
					for (var i = 0; i < array_length(inputControlKeys); i++) {
						if (ds_map_find_value(global.controls,inputControlKeys[i]) == keyPressed) {
							validKey = false;
							inputPrompt = 0;
						promptTime = current_time;
							break;
						}
					}
					if (keyPressed == vk_escape) {
						inputPrompt = 2;
						promptTime = current_time;	
						validKey = false;
					}
					//if valid index
					if (validKey) {
						inputPrompt = -1;
						//set the key to the new control
						switch (cursorPosition) {
							case 2:
							ds_map_set(global.controls,"UP",keyPressed);
							break;
							case 3:
							ds_map_set(global.controls,"DOWN",keyPressed)
							break;
							case 4:
							ds_map_set(global.controls,"LEFT",keyPressed)
							break;
							case 5:
							ds_map_set(global.controls,"RIGHT",keyPressed)
							break;
							case 6:
							ds_map_set(global.controls,"A",keyPressed)
							break;
							case 7:
							ds_map_set(global.controls,"B",keyPressed)
							break;
						}
						scr_saveControls("data.json");
					}
				}		
			inputChangeKey = false;
		}
	} else {
		//handles key selection
		if (keyboard_check_pressed(vk_anykey)) {
			// if enter is pressed (key changing key), and not at position 0
			// allow the user to change the key
			inputPrompt = -1;
			if (keyboard_key == ds_map_find_value(global.controls,"A")) {
				if (cursorPosition == maxCursorPosition - 1) {
					ds_map_clear(global.controls);
					var defaultControlsKeys = ds_map_keys_to_array(objCtrl_game.defaultControls);
					for (var i = 0; i < array_length(defaultControlsKeys); i++) {
						ds_map_add(global.controls,defaultControlsKeys[i],ds_map_find_value(objCtrl_game.defaultControls,defaultControlsKeys[i]));
					}
				}
				else if (cursorPosition > 1)  && (cursorPosition < 8) {
					inputChangeKey = true;	
				}	
			}
		}
	}
}
#endregion