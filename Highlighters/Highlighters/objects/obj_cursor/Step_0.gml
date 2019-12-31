#region Positioning Control
//updates position based of row and col
x = scr_getColPos(col) + sprite_get_width(spr_charm) / 2;
visible = !global.gameover;

if !(global.gameover) {
	if (global.forceRise) {
		if (y == initY - targY) {
			initY = -1;
			targY = -1;
			global.forceRise = false;
			global.active = true; 
		}
		else 
			y -= global.forceRiseSpeed;		
	}
	else if (global.riseUp) {
		y -= global.riseSpeed;
	}

	if (global.riseUp) || (global.forceRise) {
		if (y - global.riseSpeed < scr_getRowPos(8)) {
			var yDisplacement = (((abs(instance_nearest(x,y,par_entity).y - y)/spr_charm.sprite_height)) - ((abs(instance_nearest(x,y,par_entity).y - y)/spr_charm.sprite_height) - 1)) * spr_charm.sprite_height;
			y += yDisplacement;
		}
	}
}
#endregion

#region Cursor Movement
leftB = keyboard_check(ds_map_find_value(global.controls,"LEFT"));
rightB = keyboard_check(ds_map_find_value(global.controls,"RIGHT"));
upB = keyboard_check(ds_map_find_value(global.controls,"UP"));
downB = keyboard_check(ds_map_find_value(global.controls,"DOWN"));
if !(global.gameover){
	if (leftB || rightB || upB || downB) {
		var key = (leftB) ? ds_map_find_value(global.controls,"LEFT") : 
				  ((rightB) ? ds_map_find_value(global.controls,"RIGHT") :
				  ((upB) ? ds_map_find_value(global.controls,"UP") : ds_map_find_value(global.controls,"DOWN")));
		//single press behavior
		if (lastKey != key) keyPressLength = 0;
		if (++keyPressLength == 1) { scr_cursorMovement(key); }
		lastKey = key;
	} 
	else 
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
if ((keyPressLength < longPress) && (global.active) && (!global.gameover)) {
	if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))){
		//holds the piece on the left and right of the cursor
		var left = instance_position(x-24,y,par_entity);
		var right = instance_position(x+24,y,par_entity);
	
		//applies swap to both pieces if there are a left and right piece
		if (instance_exists(right) && instance_exists(left)) { 
			if (!(left.swap) && !(right.swap))   &&
			   (!(left.match) && !(right.match)) &&
			   (left.bottomEntity) && (right.bottomEntity) {
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
				if !(left.swap) && !(left.match) && (left.bottomEntity) {
					left.targetX = col + 1;
					left.swap = true;
					left.image_index += 4;
				}
			}
	
			//applies swap to right piece
			if (instance_exists(right)){
				if !(right.swap) && !(right.match) && (right.bottomEntity) {
					right.targetX = col;
					right.swap = true;
					right.image_index += 4;
				}
			} 
		}
	}
}
#endregion
