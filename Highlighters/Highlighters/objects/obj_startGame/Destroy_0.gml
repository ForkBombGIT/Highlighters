if (instance_exists(obj_controller)) {
	obj_controller.board = board;
	obj_controller.char = char;
	obj_controller.gameSpeed = level;
	global.orgRiseSpeed += (obj_controller.maxRiseSpeed/obj_controller.maxLevel) * (level - 1)
}