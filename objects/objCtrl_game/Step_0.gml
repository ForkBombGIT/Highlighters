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
			}
		}
	break;
	// Main Menu
	case 1:
		if !(instance_exists(objCtrl_menuMain)) 
			instance_create_layer(x,y,"GUI",objCtrl_menuMain);	
		
		if (objCtrl_menuMain.state == 5)
			state = 2;
	break;
	// Game Options
	case 2:	
		if !(instance_exists(objCtrl_menuGameOptions)) {
			var gameOptions = instance_create_layer(0,0,"Instances",objCtrl_menuGameOptions);
			gameOptions.state = (global.gameMode == 1 ? 1 : 0);
		}
		
		if (objCtrl_menuGameOptions.state == -1) {
			state = 1;
			objCtrl_menuMain.state = 1;	
			instance_destroy(objCtrl_menuGameOptions);
		}
		else if (objCtrl_menuGameOptions.state == 1) {
			state = 3;
			room_goto(1);
		}
	break;
	// Game Session
	case 3:
		if !(instance_exists(objCtrl_gameSession)) {
			instance_create_layer(x,y,"Controllers",objCtrl_gameSession);
			instance_create_layer(168,window_get_height()/4,"GUI",objUI_countdown);	
			instance_destroy(objCtrl_menuGameOptions);
		}
		else if (objCtrl_gameSession.gameEnd) {
			instance_destroy(objCtrl_gameSession);
			room_goto(2);
			state = 4;
		}
	break;
	case 4:
		if !(instance_exists(objCtrl_menuGameEnd)) {
			var endGame = instance_create_layer(x,y,"Controllers",objCtrl_menuGameEnd);
			endGame.endState = (global.victory);
		}
	break;
}
#endregion