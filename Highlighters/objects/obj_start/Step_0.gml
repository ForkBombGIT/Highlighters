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
		//counts down then destroys
		if (image_index == 4)
			instance_destroy()
		break;
}