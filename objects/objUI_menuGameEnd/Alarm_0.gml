event_inherited();

if (cursorPosition == 0) {
	global.restart = true;
}
else if (cursorPosition == 1) {
	instance_create_layer(x,y,"Entities",objCtrl_menuGameOptions);
	instance_destroy();
}