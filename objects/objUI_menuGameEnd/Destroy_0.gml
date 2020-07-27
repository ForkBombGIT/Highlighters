if (instance_exists(objCtrl_gameSession)) {
	global.gameLevel = global.startGameLevel;
	global.riseSpeed = scr_getRiseSpeed(global.gameLevel);
}