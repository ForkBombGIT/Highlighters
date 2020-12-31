event_inherited();
ui.state = state;
ui.cursorPosition = cursorPosition;
ui.inputChangeKey = inputChangeKey;
ui.inputPrompt = inputPrompt;
ui.musicTest = musicTest;
ui.soundTest = soundTest;
maxCursorPosition = (state == 0) ? inputMaxCursorPosition : avMaxCursorPosition;
var inputMap = ds_map_find_value(global.options,"input");
var avMap = ds_map_find_value(global.options,"av");
var musicVol = ds_map_find_value(avMap,"musicVol") / 600;
var soundVol = ds_map_find_value(avMap,"soundVol") / 100;

#region Input Control
if !(inputChangeKey) {
	//back
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"B"))) {
		audio_stop_all();
		audio_play_sound(snd_back,1,0);
		audio_sound_gain(snd_back,soundVol,0);
		if (confirmResolution) {
			if (fullscreenOption != ds_map_find_value(avMap,"fullscreen"))
				ds_map_replace(avMap,"fullscreen",fullscreenOption);
			if (resolutionOption != ds_map_find_value(avMap,"resolution"))
				ds_map_replace(avMap,"resolution",resolutionOption);	
		}
		scr_saveOptions(global.optionsFileName)
		exitState = 1;
	}	
	//moving up and down
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"UP"))) 
		cursorPosition = clamp(cursorPosition - 1,0,((state == 0) ? inputMaxCursorPosition : avMaxCursorPosition) - 1);
	else if (keyboard_check_pressed(ds_map_find_value(inputMap,"DOWN"))) 
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
					var inputControlKeys = ds_map_keys_to_array(inputMap);
					//checks for duplicate keys
					
					if (scr_keyToIndex(keyPressed) == -1) {
						validKey = false;
						inputPrompt = 1;
						promptTime = current_time;
					}
					for (var i = 0; i < array_length(inputControlKeys); i++) {
						if (ds_map_find_value(inputMap,inputControlKeys[i]) == keyPressed) {
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
							ds_map_set(inputMap,"UP",keyPressed);
							break;
							case 3:
							ds_map_set(inputMap,"DOWN",keyPressed)
							break;
							case 4:
							ds_map_set(inputMap,"LEFT",keyPressed)
							break;
							case 5:
							ds_map_set(inputMap,"RIGHT",keyPressed)
							break;
							case 6:
							ds_map_set(inputMap,"A",keyPressed)
							break;
							case 7:
							ds_map_set(inputMap,"B",keyPressed)
							break;
						}
						scr_saveOptions(global.optionsFileName);
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
			if (keyboard_key == ds_map_find_value(inputMap,"A")) {
				if (cursorPosition == maxCursorPosition - 1) {
					scr_setInputOptions(objCtrl_game.defaultOptions);
					scr_saveOptions(global.optionsFileName);
				}
				else if (cursorPosition > 1)  && (cursorPosition < 8) {
					inputChangeKey = true;	
				}	
			}
		}
	}
}
else if (state == 1) {
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
		if (cursorPosition == 1) {
			audio_stop_all();
			audio_play_sound(music[musicTest],1,1);
			audio_sound_gain(music[musicTest],musicVol,0);
		} else if (cursorPosition == 3) {
			audio_stop_all();
			audio_play_sound(sounds[soundTest],1,0);
			audio_sound_gain(sounds[soundTest],soundVol,0);
		}
	}
	else if (keyboard_check(vk_anykey)) {
		inputPrompt = -1;
		lastKey = keyboard_key;
		if (lastKey == keyboard_key) {
			if (++keyPressLength == 1) scr_optionMenuCursorMovement(cursorPosition,keyboard_key);
		} else keyPressLength = 0;
	
		if (keyPressLength > longPress) {
			if (keyPressLength > 0) {
				if ((current_time - delayTime) > delay){
					delayTime = current_time;
					scr_optionMenuCursorMovement(cursorPosition,keyboard_key);
				}
			} 
		}
		
		if (cursorPosition != 1) && (cursorPosition != 3) {
			// stop music sounds
			if (audio_is_playing(music[musicTest])) {
				audio_stop_sound(music[musicTest]);	
			}
			// stop sounds
			if (audio_is_playing(sounds[soundTest])) {
				audio_stop_sound(sounds[soundTest]);	
			}
		}
	} else keyPressLength = 0;
	
	if (cursorPosition == 1) || (cursorPosition == 3) {
		inputPrompt = 4;	
	}
	
	if (fullscreenOption != ds_map_find_value(avMap,"fullscreen") || 
	   (resolutionOption != ds_map_find_value(avMap,"resolution"))) {
		if !(confirmResolution) {
			confirmResolution = true;
		} else {
			inputPrompt = 3;	
			if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
				if (cursorPosition == 4) {
					fullscreenOption = ds_map_find_value(avMap,"fullscreen");
					window_set_fullscreen(fullscreenOption);
				}
				if (cursorPosition == 5) {
					resolutionOption = ds_map_find_value(avMap,"resolution");
				}
				scr_setResolution(ds_map_find_value(avMap,"resolution"));
				confirmResolution = false;
				inputPrompt = -1;
			}
		}
	} else {
		if (confirmResolution) {
			confirmResolution = false;
			inputPrompt = -1;
		}
	}
}
#endregion