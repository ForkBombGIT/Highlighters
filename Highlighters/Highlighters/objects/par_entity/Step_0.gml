#region Gameover
if (y < scr_getRowPos(obj_controller.boardHeight - 1) - 1) {global.gameover = true;}
#endregion

#region Rising Pieces
if (riseUp) && (bottomEntity) {
	y -= global.riseSpeed;
	riseUp = false;
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
else if (place_meeting(x,y+48,par_entity)) {
	 if (instance_place(x,y+48,par_entity).bottomEntity && 
		 instance_place(x,y+48,par_entity).id != id) bottomEntity = true;
}
else 
	if !(riseUp)
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
if (!(bottomEntity) && !(swap)) {
	y = scr_closestY(y,par_entity).y + spr_piece.sprite_height;
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
left = instance_position(x - 48, y, par_entity);
if (instance_exists(left)) 
	if ((left.image_index != image_index) || (left == id))
		left = noone;
		
right = instance_position(x + 48, y, par_entity);
if (instance_exists(right)) 
	if ((right.image_index != image_index) || (right == id))
		right = noone;
		
down = instance_position(x, y + 48, par_entity);
if (instance_exists(down)) 
	if ((down.image_index != image_index) || (down == id))
		down = noone;

up = instance_position(x, y - 48, par_entity);
if (instance_exists(up)) 
	if ((up.image_index != image_index) || (up == id))
		up = noone;
#endregion