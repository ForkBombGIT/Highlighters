#region Gameover
if (y < scr_getRowPos(obj_controller.boardHeight - 1) - 1) {global.gameover = true;}
#endregion

#region Rising Pieces
if (global.riseUp) {
	y -= global.riseSpeed;
	match = false;
}
#endregion

#region Grey Pieces
if (!(swap) && !(global.gameover))
	if (y <= scr_getRowPos(0))
		image_index = index;
	else image_index = index + 6; 
#endregion

#region Grounded Management
if (y >= scr_getRowPos(0)) { bottomEntity = true; }
else if (place_meeting(x,y+25,par_entity)) {
	 if (instance_place(x,y+25,par_entity).bottomEntity && 
		 instance_place(x,y+25,par_entity).id != id) bottomEntity = true;
}
else 
	if !(global.riseUp) 
		bottomEntity = false;
#endregion
	
#region Swap Control
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
	
	//increment untisl position is reached
	if (x < targetX) x += swapSpeed;
	else if (x > targetX) x -= swapSpeed;
	else { x = targetX; swap = false; image_index = index;}
}
#endregion

#region Fall Control
//checks if there is no piece below
if (!(bottomEntity) && !(swap) && !(global.gameover)) {
	if !alarm[0] alarm[0] = 15;
} 

//controls landing animation
if (landAnim) {
	var animSpeed = .25;
	if (round(landAnimIndex) < index + 4){
	    landAnimIndex += animSpeed;
	} else { landAnimIndex = index; landAnim = false; }
	image_index = round(landAnimIndex);
} 
#endregion

#region Match Control
//checks for adjacent matching pieces
if ((bottomEntity) && !(swap)) {
	left = instance_position(x - 48, y, par_entity);
	if (instance_exists(left)) 
		if ((left.index != image_index) || (y > scr_getRowPos(0)) || (left == id))
			left = noone;
		
	right = instance_position(x + 48, y, par_entity);
	if (instance_exists(right)) 
		if ((right.index != image_index) || (y > scr_getRowPos(0)) || (right == id))
			right = noone;
		
	down = instance_position(x, y + 48, par_entity);
	if (instance_exists(down)) 
		if ((down.index != image_index) || (y > scr_getRowPos(0)) || (down == id) || (down.y > scr_getRowPos(0)))
			down = noone;

	up = instance_position(x, y - 48, par_entity);
	if (instance_exists(up)) 
		if ((up.index != image_index) || (y > scr_getRowPos(0)) || (up == id))
			up = noone; 
}
#endregion