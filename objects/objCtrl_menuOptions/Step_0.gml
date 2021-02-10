event_inherited();
ui.state = state;
ui.cursorPosition = cursorPosition;
ui.inputChangeKey = inputChangeKey;
ui.inputPrompt = inputPrompt;
ui.musicTest = musicTest;
ui.soundTest = soundTest;

var inputMap = ds_map_find_value(global.options,"input");
var avMap = ds_map_find_value(global.options,"av");

#region Input Control
if !(inputChangeKey) {
	// Return to  main menu
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"B"))) {
		if (testAudio) {
			audio_stop_all();
		}
		scr_updateAudioLevels();
		if (confirmResolution) {
			if (fullscreenOption != ds_map_find_value(avMap,"fullscreen"))
				ds_map_replace(avMap,"fullscreen",fullscreenOption);
			if (resolutionOption != ds_map_find_value(avMap,"resolution"))
				ds_map_replace(avMap,"resolution",resolutionOption);	
		}
		testAudio = false;
		scr_saveOptions(global.optionsFileName)
		// TODO Fix this sound not always playing
		audio_play_sound(snd_back,1,0);
		exitState = 1;
	}	
	// Cursor movement
	var maxCursorPosition;
	if (state == 0) maxCursorPosition = inputMaxCursorPosition;
	else if (state == 1) maxCursorPosition = avMaxCursorPosition; 
	else if (state == 2) maxCursorPosition = miscMaxCursorPosition; 
	var lastCursorPosition = cursorPosition;
	//moving up and down
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"UP"))) {
		cursorPosition = clamp(cursorPosition - 1,0,maxCursorPosition - 1);
		if (lastCursorPosition != cursorPosition) {
			if (audio_is_playing(snd_move)) {
				audio_stop_sound(snd_move)	
			}
			audio_play_sound(snd_move,1,0);	
		}
	}
	else if (keyboard_check_pressed(ds_map_find_value(inputMap,"DOWN"))) {
		cursorPosition = clamp(cursorPosition + 1,0,maxCursorPosition - 1)
		if (lastCursorPosition != cursorPosition) {
			if (audio_is_playing(snd_move)) {
				audio_stop_sound(snd_move)	
			}
			audio_play_sound(snd_move,1,0);	
		}
	}
}

// INPUT SETTINGS
if (state == 0) {
	if ((current_time - promptTime) / 1000 >= promptLife) {
		promptTime = current_time;
		inputPrompt = -1;
	}
	if (inputChangeKey) {
		if (keyboard_check_pressed(vk_anykey)) {
				var keyPressed = keyboard_key;
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
				if (cursorPosition == inputMaxCursorPosition - 1) {
					//apply default av settings to options map
					scr_setOptionDefault(objCtrl_game.defaultOptions,"input");
					scr_saveOptions(global.optionsFileName);
				}
				else if (cursorPosition > 1)  && (cursorPosition < 8) {
					inputChangeKey = true;	
				}	
			}
		}
	}
}
// AUDIO VIDEO SETTINGS
else if (state == 1) {
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
		scr_updateAudioLevels();
		if (cursorPosition == 1) {
			audio_stop_all();
			audio_play_sound(music[musicTest],1,1);
			testAudio = true;
		} else if (cursorPosition == 3) {
			audio_stop_all();
			audio_play_sound(sounds[soundTest],1,0);
			testAudio = true;
		} else if (cursorPosition == avMaxCursorPosition - 1) {
			scr_setOptionDefault(objCtrl_game.defaultOptions,"av");
			scr_saveOptions(global.optionsFileName);
		}
	}
	else if (keyboard_check(vk_anykey)) {
		// TODO Only stop if a test sound was being played
		if (cursorPosition != 1 && cursorPosition != 3) {
			if (testAudio) {
				audio_stop_all();
				testAudio = false;
			}
		}
		inputPrompt = -1;
		lastKey = keyboard_key;
		if (lastKey == keyboard_key) {
			if (++keyPressLength == 1) scr_optionMenuCursorMovement(cursorPosition,keyboard_key,state);
		} else keyPressLength = 0;
	
		if (keyPressLength > longPress) {
			if (keyPressLength > 0) {
				if ((current_time - delayTime) > delay){
					delayTime = current_time;
					scr_optionMenuCursorMovement(cursorPosition,keyboard_key,state);
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
			if (cursorPosition != avMaxCursorPosition - 1) { 
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
			} else {
				fullscreenOption = ds_map_find_value(avMap,"fullscreen");
				resolutionOption = ds_map_find_value(avMap,"resolution");
				window_set_fullscreen(fullscreenOption);
				scr_setResolution(resolutionOption);
			}
		}
	} else {
		if (confirmResolution) {
			confirmResolution = false;
			inputPrompt = -1;
		}
	}
}
// MISC SETTINGS
else if (state == 2) {
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
		if (cursorPosition == miscMaxCursorPosition - 1) {
			scr_setOptionDefault(objCtrl_game.defaultOptions,"misc");
			scr_saveOptions(global.optionsFileName);
		}
	}
	else if (keyboard_check(vk_anykey)) {
		lastKey = keyboard_key;
		if (lastKey == keyboard_key) {
			if (++keyPressLength == 1) scr_optionMenuCursorMovement(cursorPosition,keyboard_key,state);
		} else keyPressLength = 0;
	
		if (keyPressLength > longPress) {
			if (keyPressLength > 0) {
				if ((current_time - delayTime) > delay){
					delayTime = current_time;
					scr_optionMenuCursorMovement(cursorPosition,keyboard_key,state);
				}
			} 
		}
	} else keyPressLength = 0;
}
#endregion