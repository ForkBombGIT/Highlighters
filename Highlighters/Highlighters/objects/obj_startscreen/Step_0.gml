#region Menu Animation
var cursorSpeed = .1;
if (cursorImageIndex < 4){
    cursorImageIndex += cursorSpeed;
} else cursorImageIndex = 0;

var textSpeed = .4;
if (textImageIndex <= 12){
    textImageIndex += textSpeed;
} else textImageIndex = 1;
#endregion

switch (start) {
	case 0:
		if (keyboard_check_released(ord("S"))) {
			start = 1;
			cursor = 0;
			flash = true;
			if !(alarm[0]) alarm[0] = 2;
		}
		break;
	case 2:
		#region Cursor Movement
		if (keyboard_check_pressed(vk_down))
			if (cursor < 4) cursor ++;
		if (keyboard_check_pressed(vk_up))
			if (cursor > 0) cursor --;
		#endregion	
	
		#region Menu Control
		//back to main menu
		if (keyboard_check_released(ord("A"))){ 
			start = 0; flash = true; cursor = 0;
			if !(alarm[0]) alarm[0] = 2;
		}	
		//menu item selection
		if (keyboard_check_released(ord("S"))) {
			if (cursor == 0) { 
				start = 3; flash = true; cursor = 0;
				if !(alarm[0]) alarm[0] = 2;
			} 
		}
		#endregion
		break;
	case 3:
		#region Cursor Movement
		if (keyboard_check_pressed(vk_down))
			if (cursor < 2) cursor ++;
		if (keyboard_check_pressed(vk_up))
			if (cursor > 0) cursor --;
		#endregion
	
		#region Menu Control
		if (keyboard_check_released(ord("A"))){ 
			start = 2; flash = true; cursor = 0;
			if !(alarm[0]) alarm[0] = 2;
		}
		//menu item selection
		if (keyboard_check_released(ord("S"))) {
			if (cursor == 1) { 
				start = 4; flash = true; cursor = 0;
				if !(alarm[0]) alarm[0] = 2;
			} 
		}
		break;
		#endregion
	case 4:	
		instance_create_layer(0,0,"Instances",obj_startGame);
		instance_destroy();
		break;
}