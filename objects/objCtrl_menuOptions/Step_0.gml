event_inherited();
#region Input Control
if !(inputChangeKey) {
	if (keyboard_check_pressed(ds_map_find_value(global.controls,"B"))) {
		audio_play_sound(snd_back,1,0);
		objCtrl_game.ui.flash = true;
		state = -1;
	}	
	
	if (keyboard_check_pressed(vk_anykey)) {
		//moving up and down
		if (keyboard_key == ds_map_find_value(global.controls,"UP")) 
			cursorPosition = clamp(cursorPosition - 1,0,(state == 0) ? array_length_1d(ui.inputCursorPositions) - 1 : 0);
		else if (keyboard_key == ds_map_find_value(global.controls,"DOWN")) 
			cursorPosition = clamp(cursorPosition + 1,0,(state == 0) ? array_length_1d(ui.inputCursorPositions) - 1 : 0);
	}
}

// if the user is changing the key
if (inputChangeKey) {
	if (keyboard_check_pressed(vk_anykey)) {
			var keyPressed = keyboard_key;
			// if cursor is not at select
			if (cursorPosition - 1 >= 0) {
				//sprite index
				var index = scr_keyToIndex(keyPressed);
				var validKey = true;
				//checks for duplicate keys
				for (var i = 0; i < array_length_1d(inputControlValues); i++) {
					if (inputControlValues[i] == index) {
						validKey = false;
						break;
					}
				}
				//if valid index
				if (index != 0) && (validKey) {
					//set the sprite to the index
					inputControlValues[cursorPosition - 1] = index;
					//set the key to the new control
					switch (cursorPosition - 1) {
						case 0:
						ds_map_set(global.controls,"UP",keyPressed);
						break;
						case 1:
						ds_map_set(global.controls,"DOWN",keyPressed)
						break;
						case 2:
						ds_map_set(global.controls,"LEFT",keyPressed)
						break;
						case 3:
						ds_map_set(global.controls,"RIGHT",keyPressed)
						break;
						case 4:
						ds_map_set(global.controls,"A",keyPressed)
						break;
						case 5:
						ds_map_set(global.controls,"B",keyPressed)
						break;
						case 6:
						ds_map_set(global.controls,"PAUSE",keyPressed)
						break;
					}
				}
			}
				
			inputChangeKey = false;
			inputPrompt = 0;
			scr_saveControls("data.json");
	}
} else {
	//handles key selection
	if (keyboard_check_pressed(vk_anykey)) {
		//resets input prompt if it is set to 1, and the cursor is not at the esc option
		if (inputPrompt == 1)
			inputPrompt = 0;
		// if enter is pressed (key changing key), and not at position 0
		// allow the user to change the key
		if (keyboard_key == vk_enter) && (cursorPosition != 0) {
			if (cursorPosition == array_length_1d(ui.inputCursorPositions) - 1)
				inputPrompt = 1
			else {
				inputChangeKey = true;	
				inputPrompt = 2;
			}
		}	
	}
}
#endregion