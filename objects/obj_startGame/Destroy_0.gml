if (instance_exists(obj_controller)) {
	obj_controller.board = (global.practice) ? 0 : board;
	obj_controller.char = char;
	obj_controller.startGameLevel = level;
	obj_controller.gameLevel = level;
	obj_controller.riseSpeed = scr_getRiseSpeed(level);
}
if (instance_exists(global.characterPortrait)) {
	global.characterPortrait.characterState = 0;
} 