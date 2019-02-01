if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("Z"))) {
	if (cursor == 4) {
		flash = true;
		if !(alarm[0]) alarm[0] = 2;
	}
}

if (keyboard_check_pressed(vk_anykey)) {
	if (keyboard_key == vk_up) 
		cursor = clamp(cursor - 1,0,4);
	else if (keyboard_key == vk_down) {
		cursor = clamp(cursor + 1,0,4);
	}
	else if (keyboard_key == vk_left){
		if (cursor == 2) board = clamp(board - 1, 0, 2);	
	}
	else if (keyboard_key == vk_right){
		if (cursor == 2) board = clamp(board + 1, 0, 2);	
	}
}

if (start) {
	instance_create_layer(x,y,"Instances",obj_controller);	
	instance_create_layer(408,window_get_height()/4,"Controller",obj_countdown);
}