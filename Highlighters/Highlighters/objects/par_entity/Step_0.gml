#region Rising Pieces
if (y <= scr_getRowPos(obj_controller.boardHeight - 1)) 
	if !(alarm[1]) 
		alarm[1] = (obj_controller.risePace - (current_time - obj_controller.riseTimer)/1000) * 60

#region Force Rise
if (!global.gameover) {
	if (global.forceRise) {
		if (y <= initY - targY) {
			initY = -1;
			targY = -1;
			global.forceRise = false;
			global.active = true; 
			obj_controller.riseTimer = current_time;
		}
		else {
			if (y <= scr_getRowPos(obj_controller.boardHeight - 1)) {
				global.gameover = true;
			}
			y -= global.forceRiseSpeed;	
		}
	}
	else if (global.riseUp) 
		y -= global.riseSpeed;
}
#endregion
#endregion

#region Grey Pieces
if (!(swap) && !(global.gameover) && !(match))
	if (y <= scr_getRowPos(0))
		image_index = index;
	else image_index = index + 6; 
#endregion

#region Highlight Animation
if (highlight) {
	alarm[2] = highlightDelay;
	highlight = false;
}
#endregion

#region Grounded Management
if (y >= scr_getRowPos(0)) { bottomEntity = true; }
else if (position_meeting(x,y+48,par_entity)) {
	 bottomEntity = (instance_position(x,y+48,par_entity).bottomEntity) 
} else 
	if !(global.riseUp) && !(global.forceRise)
		bottomEntity = false;
#endregion
	
#region Swap Control
if (swap) { 
	//reset direction variables
	left = noone; right = noone; up = noone; down = noone
	ds_list_clear(adjacent);
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
if (!(bottomEntity) && 
	!(match) && 
	!(swap) && 
	!(global.gameover)) {
	if !alarm[0] alarm[0] = fallDelay;
} 

//controls landing animation
if (landAnim) && !(match) {
	var animSpeed = .25;
	if (round(landAnimIndex) <= index + 3){
	    landAnimIndex += animSpeed;
	} else { landAnimIndex = index; landAnim = false; }
	image_index = floor(landAnimIndex);
} 
#endregion

#region Match Control
//checks for adjacent matching pieces
if ((bottomEntity) && 
	!(match) &&
	!(swap) &&
	!(global.gameover) && 
	(y <= scr_getRowPos(0))) {
	//clear adjacent list
	ds_list_clear(adjacent);
	
	//check for a matching left piece
	left = instance_position(x - 48, y, par_entity);
	if (instance_exists(left)) {
		if (left.index == index && 
		!left.match && 
		!left.swap &&
		left.bottomEntity && 
		left.y <= scr_getRowPos(0) &&
		left != id)
			ds_list_add(adjacent,left);
		else left = noone;
	} else left = noone;
	
	//check for a matching right piece
	right = instance_position(x + 48, y, par_entity);
	if (instance_exists(right)) {
		if (right.index == index && 
		!right.match && 
		!right.swap &&
		right.bottomEntity && 
		right.y <= scr_getRowPos(0) && 
		right != id)
			ds_list_add(adjacent,right);
		else right = noone;
	} else right = noone;
	
	//check for a valid match down
	down = instance_position(x, y + 48, par_entity);
	if (instance_exists(down)) {
		if (down.index == index && 
		!down.match && 
		!down.swap &&
		down.bottomEntity && 
		down.y <= scr_getRowPos(0) && 
		down != id)
			ds_list_add(adjacent,down);
		else down = noone;
	} else down = noone;
	
	//check for a valid match up
	up = instance_position(x, y - 48, par_entity);
	if (instance_exists(up)) {
		if (up.index == index && 
		!up.match && 
		!up.swap &&
		up.bottomEntity && 
		up.y <= scr_getRowPos(0) && 
		up != id)
			ds_list_add(adjacent,up);
		else up = noone;
	} else up = noone;
}	
#endregion