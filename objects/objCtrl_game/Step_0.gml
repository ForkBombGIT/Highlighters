event_inherited();
var inputMap = ds_map_find_value(global.options,"input");
// Close game
if (keyboard_check_pressed(ds_map_find_value(inputMap,"PAUSE")) && state != 3) {
	var keyChange = (instance_exists(objCtrl_menuOptions) && (objCtrl_menuOptions.inputChangeKey))
	if !(instance_exists(objCtrl_menuQuit)) && !(keyChange)
		instance_create_layer(0,0,"Controllers",objCtrl_menuQuit);
		
}

#region State Control
if (nextState != -1) {
	ui.transition = true;
	transitioning = true;
}

switch (state) {
	// Splash Screen
	case 0:
		if (instance_exists(objUI_splash)) {
			if !(objUI_splash.splash) {
				nextState = 1;	
			}
		}
	break;
	// Main Menu
	case 1:
		if (instance_exists(objCtrl_menuGameOptions)) {
			instance_destroy(objCtrl_menuGameOptions);	
		}
		if (instance_exists(objCtrl_gameSession)) {
			instance_destroy(objCtrl_gameSession);	
		}
		// reset game mode to no selection
		if !(instance_exists(objCtrl_menuMain)) {
			instance_destroy(objUI_splash);
			instance_create_layer(x,y,"GUI",objCtrl_menuMain);	
		}
		
		if (objCtrl_menuMain.state == 5) && 
		   (objCtrl_menuMain.nextState == - 1) {
			   if (global.gameMode == 1) state = 2;
			   else nextState = 2;
		}
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
			nextState = 1;
			objCtrl_menuMain.nextState = 1;
			objCtrl_menuMain.transitioning = true;	
		}
		
		// if the user proceeds, change state and move to next room
		else if (objCtrl_menuGameOptions.state == 1) {
			objCtrl_game.ui.transitionColor = c_white;
			objCtrl_game.ui.alphaChange = 1;
			objCtrl_game.ui.transitionHold = 5;
			nextState = 3;
		}
		
	break;
	// Game Session
	case 3:
		//Ensures game is not paused
		if (!(instance_exists(objCtrl_menuPause)) || !(objCtrl_menuPause.pause)) {
			if !(instance_exists(objCtrl_gameSession)) {	
				instance_create_layer(x,y,"Controllers",objCtrl_gameSession);
				instance_create_layer(168,132,"GUI",objUI_countdown);
				instance_destroy(objCtrl_menuGameOptions);
			}
		
			// If the game has ended, move to gameend menu
			if (objCtrl_gameSession.gameEnd) {
				state = 4;
			}
		}
		else {
			// Returns to main menu if user quits via pause menu
			if (objCtrl_menuPause.state == 2) && 
			  !(transitioning){
				objCtrl_menuMain.nextState = 0;
				objCtrl_menuMain.transitioning = true;
				ui.transitionColor = c_white;
				ui.alphaChange = 1;
				ui.transitionHold = 5;
				nextState = 1;
				instance_destroy(obj_star);
			}	
		}
	break;
	// Game Session End
	case 4:
		// Create Menu Game End when transition over
		if !(instance_exists(objCtrl_menuGameEnd)) && 
		   !(transitioning) && 
			(ui.transitionAlpha == 0) {
			var endGame = instance_create_layer(x,y,"Controllers",objCtrl_menuGameEnd);
			endGame.gameEndState = (global.victory);
			instance_destroy(objCtrl_gameSession);
		}
		// Game End Menu options
		if (instance_exists(objCtrl_menuGameEnd)) {
			// Restart Game
			if (objCtrl_menuGameEnd.state == 1) {
				instance_destroy(objCtrl_menuGameEnd);	
				nextState = 3;
			}
			// End Game
			else if (objCtrl_menuGameEnd.state == 2) {
				instance_destroy(objCtrl_menuGameEnd);	
				objCtrl_menuMain.transitioning = true;	
				objCtrl_menuMain.nextState = 0;
				ui.transitionColor = c_white;
				ui.alphaChange = 1;
				ui.transitionHold = 5;
				nextState = 1;
				instance_destroy(obj_star);
			}
		}
	break;
}
#endregion