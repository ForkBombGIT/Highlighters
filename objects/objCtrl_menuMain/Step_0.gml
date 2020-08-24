event_inherited();
ui.state = state;
ui.cursorPosition = cursorPosition;

#region Navigation
//menu item selection
if (keyboard_check_pressed(ds_map_find_value(global.controls,"B")) && 
	(state != 0) &&
	(state != 3) &&
	(state != 5)) {
	audio_play_sound(snd_back,1,0);
	if (state == 4) state = 2;
	state = clamp(state - 1, 0, 5); objCtrl_game.ui.flash = true;
}	
	
if (keyboard_check_pressed(vk_anykey)) {
	//moving up and down
	if (keyboard_key == ds_map_find_value(global.controls,"UP")) 
		cursorPosition = clamp(cursorPosition - 1,0,(state == 2) ? 0 : 2);
	else if (keyboard_key == ds_map_find_value(global.controls,"DOWN")) 
		cursorPosition = clamp(cursorPosition + 1,0,(state == 2) ? 0 : 2);
}

// Main Menu State control
switch (state) {
	case 0:
		//menu item selection
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
			audio_play_sound(snd_ok,1,0);
			state = 1; objCtrl_game.ui.flash = true;
		}
	break;
	case 1:
		global.gameMode = 0;
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
			audio_play_sound(snd_ok,1,0);
			switch (cursorPosition) {
				case 0: //classic
					state = 5;
				case 1: //practice
					if (state == 1) state = 4; 
					objCtrl_game.ui.flash = true;
					break;
				case 2: //options
					state = 2; objCtrl_game.ui.flash = true;
					break;
			}
		}
	break;
	case 2:
		option = -1;
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
			audio_play_sound(snd_ok,1,0);
			switch (cursorPosition) {
				case 0: //input
					option = 0
				case 1: //audio video
					if (option == -1) option = 1;
					state = 3;	objCtrl_game.ui.flash = true;
					break;
			}
		}
	break;
	//Options Menu
	case 3:
		// Create options menu, if not created
		if !(instance_exists(objUI_menuOptions)) {
			var menuOptionsCtrl = instance_create_layer(x,y,"GUI",objCtrl_menuOptions);
			menuOptionsCtrl.state = option;				
		}
		if (objCtrl_menuOptions.state == -1) {
			instance_destroy(objCtrl_menuOptions);
			state = 2;
		}
	break;
	// Practice
	case 4:
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
			audio_play_sound(snd_ok,1,0);
			state++;
			global.gameMode = 1;
			objCtrl_game.ui.flash = true;
		}
	break;
	// Classic
	case 5:
		if (global.gameMode == 0)
			global.gameMode = 2;
	break;
}
#endregion