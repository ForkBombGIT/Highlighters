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

#region Pause Handlin
	if (pause){
		//unpause
		if (keyboard_check_pressed(ord("S"))) {
			switch (pauseCursor) {
				case 0:
					countdown = true;
					break;
				case 1:
					break;
				case 2:
					game_end();
					break;
			}
		}
		if (keyboard_check_pressed(vk_up)) {
			if (pauseCursor > 0) {
				pauseCursor--;	
			}
		}
		if (keyboard_check_pressed(vk_down)) {
			if (pauseCursor < array_length_1d(pauseCursorPositions) - 1) {
				pauseCursor++;	
			}
		}
			
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
	else {
		//pause on escape press
		if (keyboard_check_pressed(vk_escape)){
			pause = true;
			par_entity.visible = false;
			obj_cursor.visible = false;
			pauseAnim = 0;
		}
		
		//pause when window loses focus
		if !(window_has_focus()) {
			pause = true;
			par_entity.visible = false;
			obj_cursor.visible = false;
			pauseAnim = 0;
		}
	}		
}

var animSpeed = 0.2;
if (round(pauseAnim) < sprite_get_number(spr_pause)){
	pauseAnim += animSpeed;
} else pauseAnim = 0;

#endregion