#region Positioning Control
//updates position based of row and col
x = scr_getColPos(col) + sprite_get_width(spr_charm) / 2;
visible = !global.gameover && 
          !global.victory;

//ensure that the cursor remains in line with the pieces as the board rises
if !(global.gameover) &&
   !(global.victory) &&
   !(global.riseBrake) {
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
	//displaces the cursor if its about to go out of view
	if (global.riseUp) || 
	  ((global.forceRise) && 
	  (!scr_checkRow(global.boardHeight - 1))) {
		if (y < scr_getRowPos(global.boardHeight - 1)) {
			var yDisplacement = (((abs(instance_nearest(x,y,par_entity).y - y)/spr_charm.sprite_height)) - ((abs(instance_nearest(x,y,par_entity).y - y)/spr_charm.sprite_height) - 1)) * spr_charm.sprite_height;
			y += yDisplacement;
		}
	}
}
#endregion

#region Piece Swapping
if ((global.active) && 
	!(global.gameover) &&
	!(global.victory)) {
	if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))){
		//holds the piece on the left and right of the cursor
		var left = instance_position(x-24,y,par_entity);
		var right = instance_position(x+24,y,par_entity);
		var leftUp = instance_position(x-24,y-48,par_entity);
		var rightUp = instance_position(x+24,y-48,par_entity);
		var leftUpBottomEntity = instance_exists(leftUp) ? leftUp.bottomEntity : true;
		var rightUpBottomEntity = instance_exists(rightUp) ? rightUp.bottomEntity : true;
	
		//applies swap to both pieces if there are a left and right piece
		if (!par_entity.swap) {
			if (instance_exists(right) && instance_exists(left)) { 
				if (!(left.swap) && !(right.swap) && 
				   (leftUpBottomEntity) && (rightUpBottomEntity) &&
				   (!(left.match) && !(right.match)) &&
				   (left.bottomEntity) && (right.bottomEntity)) {
					left.targetX = col + 1;
					left.swap = true;
					left.image_index = left.index + 4;
			
					right.targetX = col;
					right.swap = true;
					right.image_index = right.index + 4;
				}	
			}
			else {
				//applies swap to left piece
				if (instance_exists(left)) {
					if !(left.swap) && !(left.match) && (left.bottomEntity) && (rightUpBottomEntity) {
						left.targetX = col + 1;
						left.swap = true;
						left.image_index = left.index + 4;
					}
				}
	
				//applies swap to right piece
				else if (instance_exists(right)){
					if !(right.swap) && !(right.match) && (right.bottomEntity) && (leftUpBottomEntity) {
						right.targetX = col;
						right.swap = true;
						right.image_index = right.index + 4;
					}
				} 
			}
		}
	}
}
#endregion

#region Cursor Movement
leftB = keyboard_check(ds_map_find_value(global.controls,"LEFT"));
rightB = keyboard_check(ds_map_find_value(global.controls,"RIGHT"));
upB = keyboard_check(ds_map_find_value(global.controls,"UP"));
downB = keyboard_check(ds_map_find_value(global.controls,"DOWN"));
if !(global.gameover) &&
   !(global.victory) {
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

