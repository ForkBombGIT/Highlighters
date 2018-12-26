x = scr_getColPos(col) + sprite_get_width(spr_piece) / 2;
y = scr_getRowPos(row);
#region Cursor Movement
if (keyboard_check_pressed(vk_anykey)){
	switch (keyboard_key){
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
			if (row < obj_controller.boardHeight - 1){
				row += 1;
			}
			break;
		case (vk_down):
			if (row > 0){
				row -= 1;
			}
			break;
	}
}
#endregion

#region Piece Swapping
if (keyboard_check_pressed(vk_space)){
	//holds the piece on the left and right of the cursor
	var left = instance_position(scr_getColPos(col),scr_getRowPos(row),par_entity);
	var right = instance_position(scr_getColPos(col + 1),scr_getRowPos(row),par_entity);
	
	//applies swap to left piece
	if (left){
		if !(left.swap){
			left.targetX = col + 1;
			left.swap = true;
		}
	}
	
	//applies swap to right piece
	if (right){
		if !(right.swap){
			right.targetX = col;
			right.swap = true;
		}
	}
}
#endregion
