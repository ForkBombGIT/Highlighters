//updates position based of row and col
x = scr_getColPos(col) + sprite_get_width(spr_piece) / 2;

#region New Row Control

//handles sliding cursor up
if !(global.gameover) && (global.active)
	y -= global.riseSpeed;

#endregion
		
#region Cursor Movement
if !(global.gameover){
	if (keyboard_check_pressed(vk_anykey)){
		if ((current_time - delayTime) > delay){
			delayTime = current_time;
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
					if (y - sprite_height > 0){
						y -= spr_piece.sprite_height;
						row --;
					}
					break;
				case (vk_down):
					if (y + sprite_height < scr_getRowPos(0) + 48){
						y += spr_piece.sprite_height;
						row ++;
					}
					break;
			}
		}
	}
}
#endregion

#region Piece Swapping
if (keyboard_check_pressed(ord("S")) && (keyboard_check(ord("S"))) && (global.active) && (!global.gameover)){
	//holds the piece on the left and right of the cursor
	var left = scr_getPieceAtPos(row,col);
	var right = scr_getPieceAtPos(row,col+1);
	
	//applies swap to both pieces if there are a left and right piece
	if (instance_exists(right) && instance_exists(left)) { 
		if (!(left.swap) && !(right.swap))   &&
		   (!(left.moveUp) && !(right.moveUp)) &&
		   (!(left.match) && !(right.match)) {
			left.targetX = col + 1;
			left.swap = true;
			left.image_index += 4;
			
			right.targetX = col;
			right.swap = true;
			right.image_index += 4;
		}	
	}
	else {
		//applies swap to left piece
		if (instance_exists(left)){
			if !(left.swap) && !(left.match) {
				left.targetX = col + 1;
				left.swap = true;
				left.image_index += 4;
			}
		}
	
		//applies swap to right piece
		if (instance_exists(right)){
			if !(right.swap) && !(right.match) {
				right.targetX = col;
				right.swap = true;
				right.image_index += 4;
			}
		} 
	}
}
#endregion
