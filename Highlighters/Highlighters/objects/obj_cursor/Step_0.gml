//updates position based of row and col
x = scr_getColPos(col) + sprite_get_width(spr_piece) / 2;
if !(moveUp) y = scr_getRowPos(row);

#region New Row Control
//move cursor up one on new row
if (instance_exists(scr_getPieceAtPos(row,col))) {
	if (object_get_name(scr_getPieceAtPos(row,col).object_index) == "obj_piece")
		if ((obj_controller.newRow) && (row + 1 < obj_controller.boardHeight)) 
			moveUp = true;
} else if (instance_exists(scr_getPieceAtPos(row,col+1))) {
	if (object_get_name(scr_getPieceAtPos(row,col+1).object_index) == "obj_piece")
		if ((obj_controller.newRow) && (row + 1 < obj_controller.boardHeight)) 
			moveUp = true;
}

//handles sliding cursor up
if (moveUp) && !(global.gameover){
	var target = scr_getRowPos(row + 1)
	if (y >= target) { y--; moveUp = true; }
	else { row ++; moveUp = false; }
}

#endregion
		
#region Cursor Movement
if !(moveUp) && !(global.gameover){
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
