if (!moveUp) y = scr_getRowPos(row);

#region Grounded Management
if (row == 0) grounded = true;
else if (instance_exists(scr_getPieceAtPos(row - 1, col))) {
	if (row != obj_controller.boardHeight - 1)
		if (scr_getPieceAtPos(row - 1, col).grounded) grounded = true;
} else grounded = false;
#endregion

#region New Row
if (obj_controller.newRow) {
	if ((grounded) || (row == -1)) {
		moveUp = true;		
	}
}
if (moveUp) {
	var targY = scr_getRowPos(row + 1);
	grounded = true;
	if (y >= targY)
		y -= 1;
	else {
		row++;
		moveUp = false;
		obj_controller.rowUp = false;
	}
}
#endregion

#region Fast Drop
if !(match){
	if ((obj_cursor.col == col) || (obj_cursor.col + 1 == col)) {
		if (keyboard_check_pressed(ord("Z"))) fallPace = hardDrop;
		if (keyboard_check_released(ord("Z"))) fallPace = orgFallPace;
	}
}
#endregion

#region Swap Control
if (swap) && !(landAnim){ 
	//reset direction variables
	left = noone;
	right = noone;
	up = noone;
	down = noone
	//checks if there is a col value stored in targetX, 
	//if there is, assign it the x position of the col
	if (targetX < obj_controller.boardWidth) {
		col = targetX;
		targetX = scr_getColPos(targetX);
	}
	
	//increment until position is reached
	if (x < targetX) x += swapSpeed;
	else if (x > targetX) x -= swapSpeed;
	else { x = targetX; swap = false; image_index = index;}
}
#endregion

#region Fall Control
//checks if there is no piece below
if (!instance_exists(scr_getPieceAtPos(row - 1,col)) && 
					 !(match) && 
					 (row > 0) && 
					 !(obj_controller.rowUp)){
	//ensures a block below is not swapping
	var leftPiece = scr_getPieceAtPos(row - 1, col - 1);
	var rightPiece = scr_getPieceAtPos(row - 1, col + 1);
	var drop = true;
		
	if (instance_exists(leftPiece)) 
		if (leftPiece.swap) drop = false;
		
	if (instance_exists(rightPiece)) 
		if (rightPiece.swap) drop = false;			
		
	if (drop) {
		//checks if the timer needs to be set
		if (dropTimer == -1) dropTimer = current_time;
		//checks if the time since it was detected that there is no block below 
		//is greater than fall pace
		if (((current_time - dropTimer) / 1000) > fallPace){
			//checks if at bottom
			if (row - 1 >= 0){
				row--; 
				if instance_exists(scr_getPieceAtPos(row - 1,col)){ 
					if ((scr_getPieceAtPos(row - 1,col).grounded) || (row == 0)) {
						landAnim = true;
						landAnimTimer = current_time;
						image_index++;
						preLandFrame = image_index;
					}
				}
				dropTimer = -1;
			}
		}
	}
} else dropTimer = -1;

//controls landing animation
if (landAnim) {
	if (((current_time - landAnimTimer) / 1000) > landAnimDelay) {
		image_index++;
		if (image_index > (preLandFrame + 2)) {
			image_index = index;
			landAnim = false;
		}
		landAnimTimer = current_time;
	}
} 
#endregion

#region Match Control
//checks for adjacent matching pieces
left = (col - 1 >= 0) ? instance_position(scr_getColPos(col - 1), scr_getRowPos(row), par_entity) : noone;
if (instance_exists(left)) 
	if (left.image_index != image_index) || (left == id)
		left = noone;
		
right = (col + 1 <= obj_controller.boardWidth - 1) ? instance_position(scr_getColPos(col + 1), scr_getRowPos(row), par_entity) : noone;
if (instance_exists(right)) 
	if (right.image_index != image_index) || (right == id)
		right = noone;
		
down = (row - 1 >= 0) ? instance_position(scr_getColPos(col), scr_getRowPos(row - 1), par_entity) : noone;
if (instance_exists(down)) 
	if (down.image_index != image_index) || (down == id)
		down = noone;

up = (row + 1 <= obj_controller.boardHeight - 1) ? instance_position(scr_getColPos(col), scr_getRowPos(row + 1), par_entity) : noone;
if (instance_exists(up)) 
	if (up.image_index != image_index) || (up == id)
		up = noone;

//handles matching, and trigger adjacent
if (match) && !(matchAnim) && !(obj_controller.rowUp){
	if (matchTimer == -1) matchTimer = current_time;
		if (instance_exists(left)) {left.match = true;}
		if (instance_exists(right)) {right.match = true;}
		if (instance_exists(up)) {up.match = true;}
		if (instance_exists(down)) {down.match = true;}
	if ((current_time - matchTimer) / 1000 > matchDelay) {
		if (instance_exists(left)) {left.matchTimer = matchTimer;}
		if (instance_exists(right)) {right.matchTimer = matchTimer;}
		if (instance_exists(up)) {up.matchTimer = matchTimer;}
		if (instance_exists(down)) {down.matchTimer = matchTimer;}
		matchAnim = true;
		imageIndex = image_index + 5;
		image_index = imageIndex;
	}
}

if (matchAnim) {
	image_speed = 0.7;
	if (image_index > imageIndex + 2)
		instance_destroy();
}


#endregion
