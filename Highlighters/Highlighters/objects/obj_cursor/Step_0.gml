#region Positioning Control
//updates position based of row and col
x = scr_getColPos(col) + sprite_get_width(spr_piece) / 2;
visible = true;

if (global.riseUp) {
	if (y - global.riseSpeed < scr_getRowPos(8)) {
		var yDisplacement = (((abs(instance_nearest(x,y,par_entity).y - y)/spr_piece.sprite_height)) - ((abs(instance_nearest(x,y,par_entity).y - y)/spr_piece.sprite_height) - 1)) * spr_piece.sprite_height;
		y += yDisplacement;
	}
	y -= global.riseSpeed;
}
#endregion

#region Cursor Movement
if !(global.gameover){
	if (keyboard_check(vk_anykey)){
		if (keyboard_key == vk_left || keyboard_key == vk_right || keyboard_key == vk_up || keyboard_key == vk_down) {
			//single press behavior
			if (++keyPressLength == 1) scr_cursorMovement(keyboard_lastkey);
		} 
	} else 
		keyPressLength = 0;
	
	// handles long press behavior
	if (keyPressLength > longPress) {
		if (keyPressLength > 0) {
			if ((current_time - delayTime) > delay){
				delayTime = current_time;
				scr_cursorMovement(keyboard_key);
			}
		} 
	}
}
#endregion

#region Piece Swapping
if (keyboard_check_pressed(ord("S")) && (global.active) && (!global.gameover)){
	//holds the piece on the left and right of the cursor
	var left = instance_position(x-24,y,par_entity);
	var right = instance_position(x+24,y,par_entity);
	
	//applies swap to both pieces if there are a left and right piece
	if (instance_exists(right) && instance_exists(left)) { 
		if (!(left.swap) && !(right.swap))   &&
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
