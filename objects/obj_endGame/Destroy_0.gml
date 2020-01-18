if (instance_exists(obj_controller)) {
	obj_controller.board = board;
	obj_controller.startGameSpeed = startGameSpeed;
	obj_controller.gameSpeed = startGameSpeed;
	obj_controller.risePace -= ((obj_controller.orgRisePace - obj_controller.minRisePace) / obj_controller.maxLevel) * (startGameSpeed - 1)
}