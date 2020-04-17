if (instance_exists(obj_controller)) {
	obj_controller.board = board;
	obj_controller.startGameLevel = startGameLevel;
	obj_controller.gameLevel = startGameLevel;
	obj_controller.riseSpeed = scr_getRiseSpeed(startGameLevel);
}