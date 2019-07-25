if (start != -1) {
	flash = false;
	start = true;
	room_goto_next();
}
else {
	var startscreen = instance_create_layer(x,y,"Instances",obj_startscreen);
	startscreen.start = 0;
	instance_destroy();
}