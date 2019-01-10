if (!moveUp) y = scr_getRowPos(row);

//move row up
if (obj_controller.newRow) {
	if (instance_exists(scr_getPieceAtPos(row - 1,col)) || (row == -1)) {
		moveUp = true;		
	}
}
if (moveUp) {
	var targY = scr_getRowPos(row + 1);
	if (y >= targY)
		y -= 1;
	else {
		row++;
		moveUp = false;
	}
}


#region Swap control
if (swap){ 
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
	else { x = targetX; swap = false; image_index -= 4;}
}
#endregion

#region Fall Control
//check if a new row is being added
if !(obj_controller.newRow) && (!moveUp){
	//checks if there is no piece below
	if (!instance_exists(scr_getPieceAtPos(row - 1,col)) && (row > 0)){
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
					dropTimer = -1;
				}
			}
		}
	} else dropTimer = -1;
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

//handles matching, and trigger adjacent matches
if (match) && !(matchAnim){
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
