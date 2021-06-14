event_inherited();
ui.menuSection = menuSection;
var inputMap = ds_map_find_value(global.options,"input");
ui.state = ((state == 5) && (global.gameMode == 1) && 
          !(instance_exists(objCtrl_gameSession)) && 
          !(instance_exists(objCtrl_menuGameEnd))) ? 4 : state;
ui.cursorPosition = cursorPosition;

#region Navigation
//menu item selection
if (keyboard_check_pressed(ds_map_find_value(inputMap,"B")) && 
	(state != 0) &&
	(state != 3)) {
	audio_play_sound(snd_back,1,0);
	if (state == 4) nextState = 1;
	else nextState = clamp(state - 1, 0, 5); 
	transitioning = true;
	scr_menuTransition(c_black,objCtrl_game.ui.mainMenuAlphaChange,30);
}	
	
if (keyboard_check_pressed(vk_anykey) && 
   (state < 3) && 
   (state > 0) &&
   (objCtrl_game.ui.transitionAlpha == 0)) {
	// Cursor movement
	var lastCursorPosition = cursorPosition;
	var lastSection = menuSection;
	//moving up and down
	var maxCursorPosition = 0;
	switch (menuSection) {
		case 0:
			maxCursorPosition = 0;
			break;
		case 2:
			maxCursorPosition = 0;
			break;
		case 4:
			maxCursorPosition = 2;
	}
	#region Menu Navigation
	if (keyboard_key == ds_map_find_value(inputMap,"UP")) {
		cursorPosition = clamp(cursorPosition - 1,0,maxCursorPosition);
		if (lastCursorPosition != cursorPosition) {
			if (audio_is_playing(snd_move)) {
				audio_stop_sound(snd_move)	
			}
			audio_play_sound(snd_move,1,0);	
		}
	}
	else if (keyboard_key == ds_map_find_value(inputMap,"DOWN")) {
		cursorPosition = clamp(cursorPosition + 1,0,maxCursorPosition);
		if (lastCursorPosition != cursorPosition) {
			if (audio_is_playing(snd_move)) {
				audio_stop_sound(snd_move)	
			}
			audio_play_sound(snd_move,1,0);	
		}
	}
	#endregion
	#region Menu Section Navigation
	else if (keyboard_key == ds_map_find_value(inputMap,"LEFT")) {
		if (menuSection == 0) menuSection = 4;
		else menuSection = clamp(menuSection - 1,0,4);
		cursorPosition = 0;
		if (audio_is_playing(snd_move)) {
			audio_stop_sound(snd_move)	
		}
		audio_play_sound(snd_move,1,0);
	}     
	else if (keyboard_key == ds_map_find_value(inputMap,"RIGHT")) {
		if (menuSection == 4) menuSection = 0;
		else menuSection = clamp(menuSection + 1,0,4);
		if (lastSection != menuSection) {
			cursorPosition = 0;
			if (audio_is_playing(snd_move)) {
				audio_stop_sound(snd_move)	
			}
			audio_play_sound(snd_move,1,0);
		}
	}
	#endregion
}

// Main Menu State control
if (objCtrl_game.ui.transitionAlpha == 0) {
	switch (state) {
		// Landing Screen
		case 0:
			//menu item selection
			if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
				audio_play_sound(snd_ok,1,0);
				nextState = 1;
				menuSection = 0;
				scr_menuTransition(c_white,objCtrl_game.ui.subMenuAlphaChange,30);
				transitioning = true;
			}
		break;
		// Main Menu
		case 1:
			if (instance_exists(objCtrl_menuOptions)) {
				option = -1;
				instance_destroy(objCtrl_menuOptions);	
			}
			global.gameMode = 0;
			if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
				var optionSelected = false;
				switch (menuSection) {
					case 0: 
						#region Single Player
						switch (cursorPosition) {
							case 0: //classic
								nextState = 3;
								transitioning = true;
								scr_menuTransition(c_white,objCtrl_game.ui.subMenuAlphaChange,30);
								optionSelected = true;
								break;
						}
						#endregion
						break
					case 2:
						switch (cursorPosition) {
							case 0: //practice
								nextState = 2; 	
								transitioning = true;
								scr_menuTransition(c_white,objCtrl_game.ui.subMenuAlphaChange,30);
								optionSelected = true;
								break;
						}
						break
					case 4: 
						#region Options
						switch (cursorPosition) {
							case 0: //input
								option = 0
							case 1: //audio video
								if (option == -1) option = 1;
							case 2: // misc
								if (option == -1) option = 2;
								optionSelected = true;
								nextState = 4;
								transitioning = true;
								scr_menuTransition(c_white,objCtrl_game.ui.subMenuAlphaChange,30);
								break;
						}
						#endregion
						break;
				}
				if (optionSelected) audio_play_sound(snd_ok,1,0);
			}
			break;
		// Practice
		case 2:
			if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
				audio_play_sound(snd_ok,1,0);
				state = 3;
				global.gameMode = 1;
			}
			break;
		// Classic
		case 3:
			if (global.gameMode == 0)
				global.gameMode = 2;
			break
		//Options Menu
		case 4:
			// Create options menu, if not created
			if !(instance_exists(objCtrl_menuOptions)) {
				var menuOptionsCtrl = instance_create_layer(x,y,"GUI",objCtrl_menuOptions);
				menuOptionsCtrl.state = option;				
			}
			else if (objCtrl_menuOptions.exitState == 1) {
				scr_menuTransition(c_black,objCtrl_game.ui.mainMenuAlphaChange,30);
				nextState = 1;
				transitioning = true;
			}
			break;
	}
}
#endregion
if (instance_exists(objCtrl_menuOptions))
	show_debug_message(objCtrl_menuOptions.state);