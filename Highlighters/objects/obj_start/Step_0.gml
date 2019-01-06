switch (start) {
	case 0:
		if (keyboard_check_pressed(vk_anykey)) 
			start = 1;	
		break;
	case 1:		
		//increments alpha
		alpha += 0.01;
		//picks the blocks to be used for the game
		selectedEntities = scr_generateBlocks();
		//if alpha is at 1.5, switch rooms
		if (alpha == 1.5) {
			room_instance_add(rm_main,x,y,obj_controller);
			room_goto_next();
			start = 2;
		}
		break;
	case 2:
		//decrements alpha
		if (alpha > 0) alpha -= 0.05;	
		else { 
			//displays count down
			if (start == 2){
				start = 3;
				image_index = 0;
			}
		}
		break;
	case 3:
		//animation for countdown
		switch (frameState) {
			case -1:
				frameTimer = current_time;
				frameState = 0;	
				image_index = 0;
				break;
			case 0:
				image_index = 0;
				break;
			case 1:
				if (image_index > 2)
					image_index = 1;
				break;
			case 2:
				if (image_index > 4)
					image_index = 3;
				break;
			case 3:
				if (image_index > 6)
					image_index = 5;
				break;
			case 4:
				if (image_index > 8)
					image_index = 7;
				break;
			case 5:
				instance_destroy();
				break;
		}
		
		//changes framestate
		if ((current_time - frameTimer)/1000 > 1) {
			frameState++;
			frameTimer = current_time;
		}
		break;
}