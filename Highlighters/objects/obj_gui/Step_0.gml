if (global.restart) { totalMillis = 0; minutes = 0; seconds = 0; milli = 0; }

if (global.active) {
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
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"UP"))) {
			if (pauseCursor > 0) {
				pauseCursor--;	
			}
		}
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"DOWN"))) {
			if (pauseCursor < array_length_1d(pauseCursorPositions) - 1) {
				pauseCursor++;	
			}
		}
		
		//menu options
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"A")) || 
		    keyboard_check_pressed(ds_map_find_value(global.controls,"SELECT"))) {
			switch (pauseCursor) {
				case 0:
					if !(alarm[0]) alarm[0] = 1;	
					break;
				case 1:
					flash = true;
					if !(alarm[0]) alarm[0] = 1;	
					break;
				case 2:
					flash = true;
					if !(alarm[0]) alarm[0] = 1;	
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
	    if !(resume) instance_deactivate_all(1);
		#endregion
	}
	else {
		#region Pause Conditions
		//pause on escape press
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"PAUSE"))){
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

var animSpeed = 0.2;
if (round(pauseAnim) < 7){
	pauseAnim += animSpeed;
} else pauseAnim = 1;