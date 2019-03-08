if (y < scr_getRowPos(obj_controller.boardHeight - 1) - 15) {grounded = true; global.gameover = true;}
#region Grounded Management
if (y > scr_getRowPos(0)) bottomEntity = true;
else if (instance_exists(instance_position(x,y+24,par_entity))) {
	if (y > scr_getRowPos(8))
		if (instance_position(x,y+24,par_entity).bottomEntity) bottomEntity = true;
} else bottomEntity = false;
#endregion

#region New Row
if !(global.gameover) && (global.active){
	if (bottomEntity)
		y -= global.riseSpeed;
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
if (!instance_exists(instance_position(x,y+23,par_entity)) && 
					 !(match) && 
					 !(swap)  &&
					 (y != scr_getRowPos(0))) {
	y += fallSpeed;
} 

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
	if ((left.image_index != image_index) || (left == id))
		left = noone;
		
right = (col + 1 <= obj_controller.boardWidth - 1) ? instance_position(scr_getColPos(col + 1), scr_getRowPos(row), par_entity) : noone;
if (instance_exists(right)) 
	if ((right.image_index != image_index) || (right == id))
		right = noone;
		
down = (row - 1 >= 0) ? instance_position(scr_getColPos(col), scr_getRowPos(row - 1), par_entity) : noone;
if (instance_exists(down)) 
	if ((down.image_index != image_index) || (down == id))
		down = noone;

up = (row + 1 <= obj_controller.boardHeight - 1) ? instance_position(scr_getColPos(col), scr_getRowPos(row + 1), par_entity) : noone;
if (instance_exists(up)) 
	if ((up.image_index != image_index) || (up == id))
		up = noone;

//handles matching, and trigger adjacent
if (match) && !(matchAnim) && !(global.gameover){
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
