flash = false;
if (endCursor == 0) {
	characterState = 0;
	restart = true;	room_goto(1);
}
else if (endCursor == 1) {
	flash = false; room_goto(0);
	instance_create_layer(x,y,"Entities",obj_startScreen);
	instance_destroy();
}