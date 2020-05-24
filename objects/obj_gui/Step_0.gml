if (global.restart) { totalMillis = 0; global.minutes = 0; global.seconds = 0; milli = 0; }

//flickers game level when a combo/chain is required to proceed (gameLevel = x99)
if (global.requiresCombo) && 
   (global.active) {
	levelFlickerIndex += levelFlickerDelay	
	if (floor(levelFlickerIndex) > flickerOnVal) {
		levelFlicker = !levelFlicker;
		levelFlickerIndex = 0;
	}
} 
else { levelFlicker = true; levelFlickerIndex = 0; }

if (global.active) {
	#region Time Counting
	if !(global.gameover) && 
	   !(global.victory) {	
		milli++;
		totalMillis++;
		if (milli >= room_speed) {
			milli = 0; global.seconds++;
		} 
		if (global.seconds >= 60) {global.seconds = 0; global.minutes += 1;}	
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
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
			if (pauseCursor != 0) 
				flash = true;
			if !(alarm[0]) alarm[0] = 1;
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
			if (instance_exists(obj_combo)) {
				obj_combo.visible = false;	
			}
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

var pauseAnimSpeed = pauseAnimationSpeed;
pauseAnim += pauseAnimSpeed;
if (floor(pauseAnim) > 6) {
	pauseAnim = 1;
}
