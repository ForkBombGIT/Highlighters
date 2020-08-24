ui.state = state;
if (!instance_exists(objCtrl_menuGameOptions) && !instance_exists(objUI_countdown)) {
	if (global.gameover) state = 3;
	else if (global.victory) state = 2
	else {
		//idle
		if (global.active) state = 0;
		//panic
		if (instance_exists(objCtrl_gameSession)) {
			var panic = false;
			with (objPar_piece) {
				if (y <= scr_getRowPos(6)) panic = true;
			}
			if (panic) state = 1;
		}
	}
	
}