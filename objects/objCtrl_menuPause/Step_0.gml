ui.cursorPosition = cursorPosition; 

if (!instance_exists(ui)) instance_destroy();

#region Pause Handling
if (global.active) {
	var inputMap = ds_map_find_value(global.options,"input");
	if (pause) {
		#region Menu Control
		if (keyboard_check_pressed(ds_map_find_value(inputMap,"UP"))) {
			if (cursorPosition > 0) {
				cursorPosition--;	
			}
		}
		if (keyboard_check_pressed(ds_map_find_value(inputMap,"DOWN"))) {
			if (cursorPosition < array_length(ui.pauseCursorPositions) - 1) {
				cursorPosition++;	
			}
		}
		
		//menu options
		if (keyboard_check_pressed(ds_map_find_value(inputMap,"A")) || 
		   (keyboard_check_pressed(ds_map_find_value(inputMap,"PAUSE")))) {
			if (keyboard_key == ds_map_find_value(inputMap,"PAUSE")) {
				cursorPosition = 0;
			}
			var sound = (keyboard_key == ds_map_find_value(inputMap,"PAUSE")) ? snd_back : snd_ok;
			audio_play_sound(sound,1,0);
			if (cursorPosition == 1) 
				objCtrl_game.ui.transition = true;
			resume = true;
			state = 1;
		}
		#endregion
		
		//creates screenshot
		if(!sprite_exists(screenShot)){
			screenShot = sprite_create_from_surface(application_surface,0,0,window_get_width(),window_get_height(),0,0,0,0);    
		}
		
		#region Countdown Control
		//controls countdown sprite
		if !(resume) {
			instance_deactivate_all(1);
			instance_activate_object(objCtrl_game);
			instance_activate_object(objUI_menuPause);
			instance_activate_object(objUI_characterPortrait);
			instance_activate_object(objUI_gameSession);
		}
		#endregion
	}
	else {
		#region Pause Conditions
		//pause on escape press
		if !(global.gameover) && 
			!(global.victory) {
			if (keyboard_check_pressed(ds_map_find_value(inputMap,"PAUSE"))) {
				pause = true;
				audio_play_sound(snd_pausea,1,0);
				objPar_piece.visible = false;
				obj_cursor.visible = false;
				if (instance_exists(obj_combo)) {
					obj_combo.visible = false;	
				}
				if (instance_exists(obj_chain)) {
					obj_chain.visible = false;	
				}
		
				ui.pauseAnim = 0;
			}
		
			//pause when window loses focus
			if !(window_has_focus()) {
				audio_play_sound(snd_pausea,1,0);
				pause = true;
				objPar_piece.visible = false;
				obj_cursor.visible = false;
				ui.pauseAnim = 0;
			}
		}
		#endregion
	}
}
#endregion

#region Pause Menu actions
if (state == 1) {
	switch (cursorPosition) {
		case 1:
			global.restart = true;
		case 0:
			instance_activate_all();
			objPar_piece.visible = true;
			obj_cursor.visible = true;
			if (instance_exists(obj_combo)) {
				obj_combo.visible = true;	
			}
			if (instance_exists(obj_chain)) {
				obj_chain.visible = true;	
			}
			
			//reset variables
			screenShot = noone;
			resume = false;
			pause = false;
			cursorPosition = 0;
			state = 0;
			break;
		case 2:
			state = 2;
			instance_activate_all()
			break;
	}
	
}
#endregion