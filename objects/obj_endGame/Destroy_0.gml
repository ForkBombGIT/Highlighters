if (instance_exists(obj_controller)) {
	obj_controller.board = board;
	global.gameLevel = global.startGameLevel;
	obj_controller.riseSpeed = scr_getRiseSpeed(global.gameLevel);
}