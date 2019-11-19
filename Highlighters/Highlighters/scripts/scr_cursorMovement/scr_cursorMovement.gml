var key = argument0;
switch (key){
	case (obj_controller.keyLeft):
		if (col > 0){
			col -= 1;
		}
		break;
	case (obj_controller.keyRight):
		if (col < obj_controller.boardWidth - 2){
			col += 1;
		}
		break;
	case (obj_controller.keyUp):
		if (y - spr_charm.sprite_height >= scr_getRowPos(8)){
			y -= spr_charm.sprite_height;
			row --;
		}
		break;
	case (obj_controller.keyDown):
		if (y + spr_charm.sprite_height <= scr_getRowPos(0)){
			y += spr_charm.sprite_height;
			row ++;
		}
		break;
}