#region Animation Control
var cursorFlickerSpeed = 0.0333;
if (round(cursorFlickerIndex) < 2){
	cursorFlickerIndex += cursorFlickerSpeed;
} else cursorFlickerIndex = 0;
#endregion

if (instance_exists(obj_startscreen)) instance_destroy(obj_startscreen);
#region Input Control
if (practice) {
	if !(alarm[0]) alarm[0] = 1;	
}
else if (keyboard_check_released(ord(keyA))) {
	if (cursor == 2) {
		flash = true;
		if !(alarm[0]) alarm[0] = 2;
	}
}
else if (keyboard_check_released(ord(keyB))) {
	flash = true;
	start = -1;
	if !(alarm[0]) alarm[0] = 2;
}
#endregion

#region Cursor Control
if (keyboard_check_pressed(vk_anykey)) {
	//moving up and down
	if (keyboard_key == vk_up) 
		cursor = clamp(cursor - 1,0,2);
	else if (keyboard_key == vk_down) {
		cursor = clamp(cursor + 1,0,2);
	}
}

if (keyboard_check(vk_anykey)) {
	lastKey = keyboard_key;
	if (lastKey == keyboard_key) {
		if (++keyPressLength == 1) scr_menuCursorMovement(cursor,keyboard_key);
	} else keyPressLength = 0;
	
	if (keyPressLength > longPress) {
		if (keyPressLength > 0) {
			if ((current_time - delayTime) > delay){
				delayTime = current_time;
				scr_menuCursorMovement(cursor,keyboard_key);
			}
		} 
	}
} else keyPressLength = 0;
#endregion

//creates the controller obj and countdown obj when the user is ready
if (start) {
	instance_create_layer(x,y,"Entities",obj_controller);	
	instance_create_layer(168,window_get_height()/4,"GUI",obj_countdown);
}

//changes cursor type
switch (cursor) {
	case 0: //level
		if (level == 1) cursorType = 0;
		else if (level < maxLevel) cursorType = 2;
		else cursorType = 4
	break;
	case 1: //character
		if (board == 0) cursorType = 0;
		else if (board < maxBoard) cursorType = 2;
		else cursorType = 4
	break;
}