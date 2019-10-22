if !(countdown) && (global.active) {
	#region Time Counting
	if !(pause) && !(global.gameover) {	
		
		milli++;
		totalMillis++;
		if (milli >= room_speed) {
			milli = 0; seconds++;
		} 
		if (seconds >= 60) {seconds = 0; minutes += 1;}	
	}
	#endregion
	#region Pause Handling
	if (pause){
		#region Menu Control
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
		
		//menu options
		if (keyboard_check_pressed(ord("X"))) {
			switch (pauseCursor) {
				case 0:
					countdown = true;
					break;
				case 1:
					global.restart = true;
					break;
				case 2:
					game_end();
					break;
			}
		}
		#endregion
		
		//creates screenshot
		if(!sprite_exists(screenShot)){
	        screenShot = sprite_create_from_surface(application_surface,0,0,window_get_width(),window_get_height(),0,0,0,0);    
	    }
		
		#region Countdown Control
		//controls countdown sprite
	    if !(countdown) instance_deactivate_all(1);
		//creates countdown
		else {
			if (!instance_exists(countdownInst)) {
				countdownInst = instance_create_layer(168, window_get_height()/4,"GUI",obj_countdown);	
				instance_activate_object(countdownInst);
			}
		}
		#endregion
	}
	else {
		#region Pause Conditions
		//pause on escape press
		if (keyboard_check_pressed(vk_escape)){
			pause = true;
			par_entity.visible = false;
			obj_cursor.visible = false;
			pauseAnim = 0;
		}
		
		//pause when window loses focus
		/*if !(window_has_focus()) {
			pause = true;
			par_entity.visible = false;
			obj_cursor.visible = false;
			pauseAnim = 0;
		}*/
		#endregion
	}	
	#endregion
}

#region On End Countdown / Restart Control
if (countdown) || (global.restart) {
	//if countdown is up, resume game
	if (!instance_exists(countdownInst)) {
		if(sprite_exists(screenShot)){
			sprite_delete(screenShot);
		}	
		instance_activate_all();
		if (countdown) {
			par_entity.visible = true;
			obj_cursor.visible = true;
		}
		countdown = false;
		pause = false;
		pauseCursor = 0;
	}	
}
#endregion

var animSpeed = 0.2;
if (round(pauseAnim) < 7){
	pauseAnim += animSpeed;
} else pauseAnim = 1;