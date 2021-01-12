ui.state = state;
if (!instance_exists(objCtrl_menuGameOptions) && !instance_exists(objUI_countdown)) {
	// game ending state animations
	if (instance_exists(objCtrl_gameAnimation)) {
		if (objCtrl_gameAnimation.gameEndState == 1) {
			if (global.gameover) state = 3
			else if (global.victory) state = 2;
		}
	} else {
		if (global.gameover) 
			state = 3;
		else if (global.victory) 
			state = 2
	}
	
	// non game ending state animation
	if !(global.gameover || global.victory) {
		// idle
		if (global.active) state = 0;
		// panic
		if (instance_exists(objCtrl_gameSession)) {
			var panic = false;
			with (objPar_piece) {
				if (y <= scr_getRowPos(6)) panic = true;
			}
			if (panic) state = 1;
		}
	}
	
}