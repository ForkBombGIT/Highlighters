if (start != -1) {
	flash = false;
	start = true;
	global.startGameLevel = global.gameLevel;
	room_goto(1);
}
else {
	startscreen = instance_create_layer(x,y,"Instances",obj_startScreen);
	startscreen.start = 1;
	instance_destroy();
}