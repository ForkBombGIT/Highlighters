if ((y <= scr_getRowPos(obj_controller.boardHeight - 1)) && 
	(bottomEntity) && 
	(obj_controller.freezeTime == 0) &&
	!instance_exists(obj_matchmaker)){
	global.gameover = true;
} else obj_controller.canRise = true;
