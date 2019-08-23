if (instance_exists(obj_controller)) {
	obj_controller.board = board;
	obj_controller.char = char;
	obj_controller.startGameSpeed = level;
	obj_controller.gameSpeed = level;
	obj_controller.risePace -= ((obj_controller.orgRisePace - obj_controller.minRisePace) / obj_controller.maxLevel) * (level - 1)
}