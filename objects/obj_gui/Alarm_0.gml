flash = false;

switch (pauseCursor) {
	case 1:
		global.restart = true;
	case 0:
		instance_activate_all();
		par_entity.visible = true;
		obj_cursor.visible = true;
		if (instance_exists(obj_combo)) {
			obj_combo.visible = true;	
		}
		if (instance_exists(obj_chain)) {
			obj_chain.visible = true;	
		}
		screenShot = noone;
		resume = false;
		pause = false;
		pauseCursor = 0;
		break;
	case 2:
		instance_activate_object(obj_splash);
		room_goto(0);
		startscreen = instance_create_layer(x,y,"Entities",obj_startScreen);
		instance_destroy(obj_controller);
		instance_destroy();
		break;
}