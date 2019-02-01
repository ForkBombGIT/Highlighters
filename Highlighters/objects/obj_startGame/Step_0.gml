if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("Z"))) {
	if (cursor == 4) {
		flash = true;
		if !(alarm[0]) alarm[0] = 2;
	}
}

if (keyboard_check_pressed(vk_anykey)) {
	if (keyboard_key == vk_up) 
		if (cursor > 0) cursor--;
		else cursor = 4;
	else if (keyboard_key == vk_down) 
		if (cursor < 4) cursor++;
		else cursor = 0;
}

if (start) {
	instance_create_layer(x,y,"Instances",obj_controller);	
	instance_create_layer(408,window_get_height()/4,"Controller",obj_countdown);
}