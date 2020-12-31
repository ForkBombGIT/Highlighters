function scr_optionMenuCursorMovement(argument0, argument1) {
	//used for cursor movement in option menus
	//keyRight and keyLeft should be defined in calling obj
	var cursorPosition = argument0;
	var keyCode = argument1;
	var inputMap = ds_map_find_value(global.options,"input");
	var avMap = ds_map_find_value(global.options,"av");
	var musicVol = ds_map_find_value(avMap,"musicVol");
	var soundVol = ds_map_find_value(avMap,"soundVol");
	var fullscreen = ds_map_find_value(avMap,"fullscreen");
	var resolution = ds_map_find_value(avMap,"resolution");

	if (keyCode == ds_map_find_value(inputMap,"RIGHT")) {
		switch (cursorPosition) {
			case 0:
				musicVol = min(musicVol + 1,100);
				ds_map_replace(avMap,"musicVol",musicVol);
				break;
			case 1:
				objCtrl_menuOptions.musicTest = min(objCtrl_menuOptions.musicTest + 1, array_length(objCtrl_menuOptions.music) - 1)
				break;
			case 2:
				soundVol = min(soundVol + 1,100);
				ds_map_replace(avMap,"soundVol",soundVol);
				break;
			case 3:
				objCtrl_menuOptions.soundTest = min(objCtrl_menuOptions.soundTest + 1,array_length(objCtrl_menuOptions.sounds) - 1);
				break;
			case 4:
				fullscreen = min(fullscreen + 1,1);
				ds_map_replace(avMap,"fullscreen",fullscreen);
				break;
			case 5:
				resolution = min(resolution + 1,5);
				ds_map_replace(avMap,"resolution",resolution);
				break;
		}
	}

	if (keyCode == ds_map_find_value(inputMap,"LEFT")) {
		switch (cursorPosition) {
			case 0:
				musicVol = max(musicVol - 1,0)
				ds_map_replace(avMap,"musicVol",musicVol);
				break;
			case 1:
				objCtrl_menuOptions.musicTest = max(objCtrl_menuOptions.musicTest - 1,0);
				break;
			case 2:
				soundVol = max(soundVol - 1,0)
				ds_map_replace(avMap,"soundVol",soundVol);
				break;
			case 3:
				objCtrl_menuOptions.soundTest = max(objCtrl_menuOptions.soundTest - 1,0);
				break;
			case 4:
				fullscreen = max(fullscreen - 1,0);
				ds_map_replace(avMap,"fullscreen",fullscreen);
				break;
			case 5:
				resolution = max(resolution - 1,0);
				ds_map_replace(avMap,"resolution",resolution);
				break;
		}
	}
}
