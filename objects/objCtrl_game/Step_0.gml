// Close game
if (keyboard_check_pressed(ds_map_find_value(global.controls,"OFF"))) {
	game_end();
}

#region State Control
switch (state) {
	// Splash Screen
	case 0:
		if (instance_exists(objUI_splash)) {
			if !(objUI_splash.splash) {
				state++;	
				instance_destroy(objUI_splash);
			}
		}
	break;
	// Main Menu
	case 1:
		// reset game mode to no selection
		global.gameMode = 0;
		// create main menu if it does not exist
		if !(instance_exists(objCtrl_menuMain)) 
			instance_create_layer(x,y,"GUI",objCtrl_menuMain);	
		
		if (objCtrl_menuMain.state == 5)
			state = 2;
	break;
	// Game Options
	case 2:	
		// if game options have not been created, create them 
		// automatically start if game mode is practice
		if !(instance_exists(objCtrl_menuGameOptions)) {
			var gameOptions = instance_create_layer(0,0,"Controllers",objCtrl_menuGameOptions);
			gameOptions.state = (global.gameMode == 1 ? 1 : 0);
		}
		
		// if the user returns, destroy game options object
		// and return to state 1
		if (objCtrl_menuGameOptions.state == -1) {
			instance_destroy(objCtrl_menuGameOptions);
			state = 1;
			objCtrl_menuMain.state = 1;	
		}
		
		// if the user proceeds, change state and move to next room
		else if (objCtrl_menuGameOptions.state == 1) {
			state = 3;
		}
	break;
	// Game Session
	case 3:
		//Ensures game is not paused
		show_debug_message(instance_number(objCtrl_gameSession));
		if (!(instance_exists(objCtrl_menuPause)) || !(objCtrl_menuPause.pause)) {
			if !(instance_exists(objCtrl_gameSession)) {	
				instance_destroy(objCtrl_menuGameOptions);
				instance_create_layer(x,y,"Controllers",objCtrl_gameSession);
				instance_create_layer(168,window_get_height()/4,"GUI",objUI_countdown);
			}
		
			// If the game has ended, move to gameend menu
			if (objCtrl_gameSession.gameEnd) {
				state = 4;
			}
		}
		else {
			// Returns to main menu if user quits via pause menu
			if (objCtrl_menuPause.state == 2) {
				instance_activate_all()
				instance_destroy(objCtrl_gameSession);
				objCtrl_menuMain.state = 0;
				state = 1;
			}	
		}
	break;
	case 4:
		if !(instance_exists(objCtrl_menuGameEnd)) {
			var endGame = instance_create_layer(x,y,"Controllers",objCtrl_menuGameEnd);
			endGame.state = (global.victory);
			instance_destroy(objCtrl_gameSession);
		}
		if (objCtrl_menuGameEnd.state == 2) {
			instance_destroy(objCtrl_menuGameEnd);	
			objCtrl_menuMain.state = 0;
			state = 1;
		}
	break;
}
#endregion