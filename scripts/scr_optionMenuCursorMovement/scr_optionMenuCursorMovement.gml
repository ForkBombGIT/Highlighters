function scr_optionMenuCursorMovement(argument0, argument1, argument2) {
	//used for cursor movement in option menus
	//keyRight and keyLeft should be defined in calling obj
	var cursorPosition = argument0;
	var keyCode = argument1;
	var option = argument2;
	var inputMap = ds_map_find_value(global.options,"input");
	var avMap = ds_map_find_value(global.options,"av");
	var miscMap = ds_map_find_value(global.options,"misc");
	var musicVol = ds_map_find_value(avMap,"musicVol");
	var soundVol = ds_map_find_value(avMap,"soundVol");
	var fullscreen = ds_map_find_value(avMap,"fullscreen");
	var resolution = ds_map_find_value(avMap,"resolution");
	var charmSkin = ds_map_find_value(miscMap,"charmSkin");
	var bombSkin = ds_map_find_value(miscMap,"bombSkin");
	var junkSkin = ds_map_find_value(miscMap,"junkSkin");
	
	var optionChanged = false;
	
	if (keyCode == ds_map_find_value(inputMap,"RIGHT")) {
		switch (cursorPosition) {
			case 0:
				if (option == 1) {
					var currentVal = musicVol;
					musicVol = min(musicVol + 1,100);
					optionChanged = currentVal != musicVol;
					ds_map_replace(avMap,"musicVol",musicVol);
				}
				break;
			case 1:
				if (option == 1) {
					var currentVal = objCtrl_menuOptions.musicTest;
					objCtrl_menuOptions.musicTest = min(objCtrl_menuOptions.musicTest + 1, array_length(objCtrl_menuOptions.music) - 1)
					optionChanged = currentVal != objCtrl_menuOptions.musicTest;
				}
				else if (option == 2) {
					var currentVal = charmSkin;
					charmSkin = min(charmSkin + 1,1);
					optionChanged = currentVal != charmSkin;
					ds_map_replace(miscMap,"charmSkin",charmSkin);
				}
				break;
			case 2:
				if (option == 1) {
					var currentVal = soundVol;
					soundVol = min(soundVol + 1,100);
					optionChanged = currentVal != soundVol;
					ds_map_replace(avMap,"soundVol",soundVol);
				}
				else if (option == 2) {
					var currentVal = bombSkin;
					bombSkin = min(bombSkin + 1,1);
					optionChanged = currentVal != bombSkin;
					ds_map_replace(miscMap,"bombSkin",bombSkin);
				}
				break;
			case 3:
				if (option == 1) {
					var currentVal = objCtrl_menuOptions.soundTest;
					objCtrl_menuOptions.soundTest = min(objCtrl_menuOptions.soundTest + 1,array_length(objCtrl_menuOptions.sounds) - 1);
					optionChanged = currentVal != objCtrl_menuOptions.soundTest;
				}
				else if (option == 2) {
					var currentVal = junkSkin;
					junkSkin = min(junkSkin + 1,0);
					optionChanged = currentVal != junkSkin;
					ds_map_replace(miscMap,"junkSkin",junkSkin);
				}
				break;
			case 4:
				if (option == 1) {
					var currentVal = fullscreen;
					fullscreen = min(fullscreen + 1,1);
					optionChanged = currentVal != fullscreen;
					ds_map_replace(avMap,"fullscreen",fullscreen);
				}
				break;
			case 5:
				if (option == 1) {
					var currentVal = resolution;
					resolution = min(resolution + 1,5);
					optionChanged = currentVal != resolution;
					ds_map_replace(avMap,"resolution",resolution);
				}
				break;
		}
	}

	if (keyCode == ds_map_find_value(inputMap,"LEFT")) {
		switch (cursorPosition) {
			case 0:
				if (option == 1) {
					var currentVal = musicVol;
					musicVol = max(musicVol - 1,0)
					optionChanged = currentVal != musicVol;
					ds_map_replace(avMap,"musicVol",musicVol);
				}
				break;
			case 1:
				if (option == 1) {
					var currentVal = objCtrl_menuOptions.musicTest;
					objCtrl_menuOptions.musicTest = max(objCtrl_menuOptions.musicTest - 1,0);
					optionChanged = currentVal != objCtrl_menuOptions.musicTest;
				}
				else if (option == 2) {
					var currentVal = charmSkin;
					charmSkin = max(charmSkin - 1,0);
					optionChanged = currentVal != charmSkin;
					ds_map_replace(miscMap,"charmSkin",charmSkin);
				}
				break;
			case 2:
				if (option == 1) {
					var currentVal = soundVol;
					soundVol = max(soundVol - 1,0)
					optionChanged = currentVal != soundVol;
					ds_map_replace(avMap,"soundVol",soundVol);
				}
				else if (option == 2) {
					var currentVal = bombSkin;
					bombSkin = max(bombSkin - 1,0);
					optionChanged = currentVal != bombSkin;
					ds_map_replace(miscMap,"bombSkin",bombSkin);
				}
				break;
			case 3:
				if (option == 1) {
					var currentVal = objCtrl_menuOptions.soundTest;
					objCtrl_menuOptions.soundTest = max(objCtrl_menuOptions.soundTest - 1,0);
					optionChanged = currentVal != objCtrl_menuOptions.soundTest;
				}
				else if (option == 2) {
					var currentVal = junkSkin;
					junkSkin = max(junkSkin - 1,0);
					optionChanged = currentVal != junkSkin;
					ds_map_replace(miscMap,"junkSkin",junkSkin);
				}
				break;
			case 4:
				if (option == 1) {
					var currentVal = fullscreen;
					fullscreen = max(fullscreen - 1,0);
					optionChanged = currentVal != fullscreen;
					ds_map_replace(avMap,"fullscreen",fullscreen);
				}
				break;
			case 5:
				if (option == 1) {
					var currentVal = resolution;
					resolution = max(resolution - 1,0);
					optionChanged = currentVal != resolution;
					ds_map_replace(avMap,"resolution",resolution);
				}
				break;
		}
	}
	
	if (optionChanged) {
		if (audio_is_playing(snd_move)) audio_stop_sound(snd_move);
		audio_play_sound(snd_move,1,0);	
	}
}
