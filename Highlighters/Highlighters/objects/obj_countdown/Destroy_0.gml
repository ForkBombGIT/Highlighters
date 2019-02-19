global.active = true;
if (instance_exists(obj_startscreen)) instance_destroy(obj_startscreen);
if (obj_gui.pause) {
	obj_gui.pause = false;
	obj_gui.countdown = false;
	with (obj_gui) {
		if(sprite_exists(screenShot)){
	        sprite_delete(screenShot);
	    }	
	}
	instance_activate_all();	
}