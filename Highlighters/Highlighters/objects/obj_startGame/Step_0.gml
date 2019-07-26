#region Input Control
if (keyboard_check_released(ord("S"))) {
	if (cursor == 4) {
		flash = true;
		if !(alarm[0]) alarm[0] = 2;
	}
}
else if (keyboard_check_released(ord("A"))) {
	flash = true;
	start = -1;
	if !(alarm[0]) alarm[0] = 2;
}
#endregion

#region Cursor Control
if (keyboard_check_pressed(vk_anykey)) {
	//moving up and down
	if (keyboard_key == vk_up) 
		cursor = clamp(cursor - 1,0,4);
	else if (keyboard_key == vk_down) {
		cursor = clamp(cursor + 1,0,4);
	}
	
	//moving left and right
	if (keyboard_key == vk_left){
		switch (cursor) { 
			case 0:
				level = clamp(level - 1, 1, maxLevel);	
				break;
			case 1:
				char = clamp(char - 1, 0, maxChar);	
				break;
			case 2:
				board = clamp(board - 1, 0, maxBoard);	
				break;
			case 3:
				break;
		} 
	}
	else if (keyboard_key == vk_right){
		switch (cursor) { 
			case 0:
				level = clamp(level + 1, 1, maxLevel);
				break;
			case 1:
				break;
			case 2:
				break;
			case 3:
				break;
		} 	
	}
}
#endregion

//creates the controller obj and countdown obj when the user is ready
if (start) {
	instance_create_layer(x,y,"Instances",obj_controller);	
	instance_create_layer(168,window_get_height()/4,"Controller",obj_countdown);
}