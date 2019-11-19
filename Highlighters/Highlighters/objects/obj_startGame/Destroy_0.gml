if (instance_exists(obj_controller)) {
	obj_controller.board = board;
	obj_controller.char = char;
	obj_controller.startGameSpeed = level;
	obj_controller.gameSpeed = level;
	obj_controller.risePace -= ((obj_controller.orgRisePace - obj_controller.minRisePace) / obj_controller.maxLevel) * (level - 1)
	obj_controller.practice = practice;
	obj_controller.keyA = keyA;
	obj_controller.keyB = keyB;
	obj_controller.keySelect = keySelect;
	obj_controller.keyUp = keyUp;
	obj_controller.keyDown = keyDown;
	obj_controller.keyLeft = keyLeft;
	obj_controller.keyRight = keyRight;
	obj_controller.keyPause = keyPause;
	obj_controller.keyOff = keyOff;
}