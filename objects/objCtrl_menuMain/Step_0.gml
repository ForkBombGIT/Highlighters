event_inherited();
ui.state = ((state == 5) && (global.gameMode == 1) && 
          !(instance_exists(objCtrl_gameSession)) && 
          !(instance_exists(objCtrl_menuGameEnd))) ? 4 : state;
ui.cursorPosition = cursorPosition;

#region Navigation
//menu item selection
if (keyboard_check_pressed(ds_map_find_value(global.controls,"B")) && 
	(state != 0) &&
	(state != 3) &&
	(state != 5)) {
	audio_play_sound(snd_back,1,0);
	if (state == 4) nextState = 1;
	else nextState = clamp(state - 1, 0, 5); 
	objCtrl_game.ui.transition = true; transitioning = true;
	objCtrl_game.ui.transitionColor = c_black;
	objCtrl_game.ui.alphaChange = objCtrl_game.ui.mainMenuAlphaChange;
}	
	
if (keyboard_check_pressed(vk_anykey)) {
	//moving up and down
	if (keyboard_key == ds_map_find_value(global.controls,"UP")) 
		cursorPosition = clamp(cursorPosition - 1,0, 2);
	else if (keyboard_key == ds_map_find_value(global.controls,"DOWN")) 
		cursorPosition = clamp(cursorPosition + 1,0, state == 2 ? 1 : 2);
}

// Main Menu State control
if (objCtrl_game.ui.transitionAlpha == 0) {
	switch (state) {
		case 0:
			//menu item selection
			if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
				audio_play_sound(snd_ok,1,0);
				nextState = 1;
				objCtrl_game.ui.transitionColor = c_white;
				objCtrl_game.ui.transition = true;
				objCtrl_game.ui.alphaChange = objCtrl_game.ui.subMenuAlphaChange;
				objCtrl_game.ui.transitionHold = 30;
				transitioning = true;
			}
		break;
		case 1:
			global.gameMode = 0;
			if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
				audio_play_sound(snd_ok,1,0);
				objCtrl_game.ui.transitionColor = c_black;
				objCtrl_game.ui.alphaChange = objCtrl_game.ui.mainMenuAlphaChange;
				switch (cursorPosition) {
					case 0: //classic
						nextState = 5;
					case 1: //practice
						if (nextState != 5) nextState = 4; 
						objCtrl_game.ui.transition = true; transitioning = true;
						break;
					case 2: //options
						nextState = 2;
						objCtrl_game.ui.transition = true; transitioning = true;
						break;
				}
			}
		break;
		case 2:
			if (instance_exists(objCtrl_menuOptions)) {
				option = -1;
				instance_destroy(objCtrl_menuOptions);	
			}
		
			if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
				audio_play_sound(snd_ok,1,0);
				switch (cursorPosition) {
					case 0: //input
						option = 0
					case 1: //audio video
						if (option == -1) option = 1;
						nextState = 3;
						objCtrl_game.ui.transition = true; transitioning = true;
						objCtrl_game.ui.transitionColor = c_white;
						objCtrl_game.ui.alphaChange = 1;
						objCtrl_game.ui.transitionHold = 5;
						break;
				}
			}
		break;
		//Options Menu
		case 3:
			// Create options menu, if not created
			if !(instance_exists(objCtrl_menuOptions)) {
				var menuOptionsCtrl = instance_create_layer(x,y,"GUI",objCtrl_menuOptions);
				menuOptionsCtrl.state = option;				
			}
			else if (objCtrl_menuOptions.exitState == 1) {
				objCtrl_game.ui.transition = true;
				nextState = 2;
				transitioning = true;
			}
		break;
		// Practice
		case 4:
			if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
				audio_play_sound(snd_ok,1,0);
				state = 5;
				global.gameMode = 1;
			}
		break;
		// Classic
		case 5:
			if (global.gameMode == 0)
				global.gameMode = 2;
		break;
	}
}
#endregion