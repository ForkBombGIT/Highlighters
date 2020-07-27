instance_destroy(objUI_menuGameOptions);

if (instance_exists(objCtrl_gameSession)) {
	global.startGameLevel = global.gameLevel;
	global.orgRiseSpeed = scr_getRiseSpeed(global.gameLevel);
	global.riseSpeed = global.orgRiseSpeed;
}

if (instance_exists(objUI_characterPortrait)) {
	if (state == -1) instance_destroy(objUI_characterPortrait);
	else objUI_characterPortrait.state = 0;
} 
