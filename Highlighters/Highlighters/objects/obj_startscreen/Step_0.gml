switch (start) {
	case 0:
		if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("Z"))) {
			start = 1;
			flash = true;
			if !(alarm[0]) alarm[0] = 2;
			
		}
		break;
	case 4:	
		instance_create_layer(0,0,"Instances",obj_startGame);
		instance_destroy();
		break;
}