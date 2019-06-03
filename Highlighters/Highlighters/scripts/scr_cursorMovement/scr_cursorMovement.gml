var key = argument0;
switch (key){
	case (vk_left):
		if (col > 0){
			col -= 1;
		}
		break;
	case (vk_right):
		if (col < obj_controller.boardWidth - 2){
			col += 1;
		}
		break;
	case (vk_up):
		if (y - spr_piece.sprite_height >= scr_getRowPos(8)){
			y -= spr_piece.sprite_height;
			row --;
		}
		break;
	case (vk_down):
		if (y + spr_piece.sprite_height <= scr_getRowPos(0)){
			y += spr_piece.sprite_height;
			row ++;
		}
		break;
}