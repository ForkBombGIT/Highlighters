flash = false;

switch (pauseCursor) {
	case 0:
		break;
	case 1:
		global.restart = true;
		break;
	case 2:
		room_goto(0);
		instance_create_layer(x,y,"Entities",obj_startscreen);
		instance_destroy(obj_controller);
		instance_destroy();
		break;
}