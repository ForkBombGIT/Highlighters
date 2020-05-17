if ((y <= scr_getRowPos(global.boardHeight - 1)) && 
	(bottomEntity) && 
	!(global.freeze) &&
	!instance_exists(obj_matchmaker)){
	global.gameover = true;
} else obj_controller.canRise = true;
