if (start != -1) {
	flash = false;
	start = true;
	room_goto(1);
}
else {
	var startscreen = instance_create_layer(x,y,"Instances",obj_startscreen);
	startscreen.start = 1;
	instance_destroy();
}