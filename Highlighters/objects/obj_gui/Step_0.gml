if !(countdown) && !(instance_exists(obj_countdown)){
	if !(pause) && !(global.gameover) {	
		//counts time
		milli++;
		if (milli >= room_speed) {milli = 0; seconds += 1;} 
		if (seconds >= 60) {seconds = 0; minutes += 1;}	
	}

#region Pause Handling
	if (keyboard_check_pressed(vk_escape)){
		if (pause) countdown = true;
		else pause = !pause;
		if(!sprite_exists(screenShot)){
	        screenShot = sprite_create_from_surface(application_surface,0,0,768,432,0,0,0,0);    
	    }
	}

	if (pause){
	    if !(countdown) instance_deactivate_all(1);
		else {
			if (!instance_exists(obj_countdown)) 
				instance_activate_object(instance_create_layer(408,
															   window_get_height()/4,
															   "GUI",
															   obj_countdown));
			
		}
	}
	
}
#endregion