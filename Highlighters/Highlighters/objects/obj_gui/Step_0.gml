if !(countdown) && (global.active) {
	if !(pause) && !(global.gameover) {	
		//counts time
		milli++;
		totalMillis++;
		if (milli >= room_speed) {
			milli = 0; seconds++;
		} 
		if (seconds >= 60) {seconds = 0; minutes += 1;}	
	}

#region Pause Handling
	if (keyboard_check_pressed(vk_escape)){
		if (pause) countdown = true;
		else pause = !pause;
	}
	
	if (pause){
		//creates screenshot
		if(!sprite_exists(screenShot)){
	        screenShot = sprite_create_from_surface(application_surface,0,0,window_get_width(),window_get_height(),0,0,0,0);    
	    }
		
		//controls countdown sprite
	    if !(countdown) { 
			instance_deactivate_all(1);
		}
		else {
			if (!instance_exists(obj_countdown)) 
				instance_activate_object(instance_create_layer(168,
															   window_get_height()/4,
															   "GUI",
															   obj_countdown));
			
		}
	}
	
	if !(window_has_focus()) {
		pause = true;
	}
	
}
#endregion