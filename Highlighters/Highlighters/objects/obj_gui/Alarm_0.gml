flash = false;

switch (pauseCursor) {
	case 1:
		global.restart = true;
	case 0:
		instance_activate_all();
		par_entity.visible = true;
		obj_cursor.visible = true;
		screenShot = noone;
		resume = false;
		pause = false;
		pauseCursor = 0;
		break;
	case 2:
		room_goto(0);
		instance_create_layer(x,y,"Entities",obj_startScreen);
		instance_destroy(obj_controller);
		instance_destroy();
		break;
}