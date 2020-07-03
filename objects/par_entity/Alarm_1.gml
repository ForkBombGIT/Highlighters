if ((y <= scr_getRowPos(global.boardHeight - 1)) && 
	(bottomEntity) && 
	!(global.freeze) &&
	!(global.riseBrake) &&
	!instance_exists(obj_matchmaker) &&
	!(global.victory)) {
	global.gameover = true;
} else obj_controller.canRise = true;
