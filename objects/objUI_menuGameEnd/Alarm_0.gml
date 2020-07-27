event_inherited();

if (cursorPosition == 0) {
	characterState = 0;
	restart = true;	room_goto(1);
}
else if (cursorPosition == 1) {
	room_goto(0);
	instance_create_layer(x,y,"Entities",objCtrl_menuGameOptions);
	instance_destroy();
}