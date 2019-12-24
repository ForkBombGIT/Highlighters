if ((y <= scr_getRowPos(obj_controller.boardHeight - 1)) && 
	(bottomEntity) && 
	(obj_controller.freezeTime == 0)) {
	global.gameover = true;
} else obj_controller.canRise = true;
