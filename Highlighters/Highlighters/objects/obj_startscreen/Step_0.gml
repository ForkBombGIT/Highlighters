switch (start) {
	case 0:
		if (keyboard_check_released(ord("X"))) {
			start = 1;
			cursor = 0;
			flash = true;
			if !(alarm[0]) alarm[0] = 2;
			
		}
		break;
	case 4:	
		instance_create_layer(0,0,"Instances",obj_startGame);
		instance_destroy();
		break;
}