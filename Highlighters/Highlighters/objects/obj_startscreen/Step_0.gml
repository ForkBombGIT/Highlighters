#region Menu Animation
var cursorSpeed = .1;
if (cursorImageIndex < 4){
    cursorImageIndex += cursorSpeed;
} else cursorImageIndex = 0;

var textSpeed = .4;
if (textImageIndex <= 12){
    textImageIndex += textSpeed;
} else textImageIndex = 2;
#endregion

switch (start) {
	case 0:
		#region Menu Control
		//back to main menu
		if (keyboard_check_pressed(ord("A"))){ 
			start = 0; flash = true; startCursor = 0;
			if !(alarm[0]) alarm[0] = 2;
		}	
		//menu item selection
		if (keyboard_check_pressed(ord("S"))) {
			start = 1; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		}
		#endregion
		break;
	case 1:
		#region Cursor Movement
		if (keyboard_check_pressed(vk_left))
			if (startCursor > 0) startCursor --;
		if (keyboard_check_pressed(vk_right))
			if (startCursor < 2) startCursor ++;
		#endregion	
	
		#region Menu Control
		//back to main menu
		if (keyboard_check_pressed(ord("A"))){ 
			start = 0; flash = true; startCursor = 0;
			if !(alarm[0]) alarm[0] = 2;
		}	
		//menu item selection
		if (keyboard_check_pressed(ord("S"))) {
			if (startCursor == 0) { 
				start = 2; flash = true; startCursor = 0;
				if !(alarm[0]) alarm[0] = 2;
			} 
			else if (startCursor == 2) {
				game_end();	
			}
		}
		#endregion
		break;
	case 2:
		instance_create_layer(0,0,"Instances",obj_startGame);
		instance_destroy();
		break;
}