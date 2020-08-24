if ((y <= scr_getRowPos(objCtrl_gameSession.boardHeight - 1)) && 
	(bottomEntity) && 
	!(global.freeze) &&
	!(global.riseBrake) &&
	!instance_exists(obj_matchmaker) &&
	!(global.victory)) {
	global.gameover = true;
} else objCtrl_gameSession.canRise = true;
