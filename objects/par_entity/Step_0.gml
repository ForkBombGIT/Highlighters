#region Force Rise
//rise if the force rise button is pressed
if (!global.gameover) {
	if (global.forceRise) { 
		if (y <= (initY - targY)) {
			initY = -1;
			targY = -1;
			global.forceRise = false;
			global.active = true; 
			obj_controller.riseTimer = current_time;
		}
		else {
			if ((y - global.forceRiseSpeed) < scr_getRowPos(obj_controller.boardHeight - 1)) {
				global.gameover = true;
			}
			y -= global.forceRiseSpeed;	
		}
	}
	else if (global.riseUp) 
		y -= global.riseSpeed;
}
#endregion

#region Grey Pieces
if (!(swap) && 
	!(global.gameover) && 
	!(match) &&
	!(landAnim)) {
	if (y <= scr_getRowPos(0)) {
		image_index = index;
	}
	else image_index = index + 4; 
}
#endregion

#region Rising Pieces
if (y <= scr_getRowPos(obj_controller.boardHeight - 1)) {
	if !match && !(global.gameover) 
		image_index = index + 3;
	if (obj_controller.freezeTime == 0) &&
	!(instance_exists(obj_matchmaker)) {
		if !(alarm[1]) {
			alarm[1] = obj_controller.gameoverDelay;
			obj_controller.canRise = false
		}
	}
}
#endregion

#region Highlight Animation
if (highlight) {
	image_index = index + highlightIndex;
	alarm[2] = highlightDelay;
	highlight = false;
	highlighting = 1;
}
#endregion

#region Grounded Management
if (y >= scr_getRowPos(0)) { 
	bottomEntity = true; 
} else if (position_meeting(x,y+pieceSize,par_entity)) {
	var below = instance_place(x,y+pieceSize,par_entity);
	bottomEntity = below.bottomEntity
} else {
	if !(global.riseUp) && !(global.forceRise)
		bottomEntity = false;
}
	
if ((bottomEntity) && (falling)) {
	landAnim = true;
	landAnimIndex = index;	
	falling = false;
}

if (bottomEntity) && 
   (!(global.gameover)) && 
   (!(match)) {
	var entity = instance_position(x,y + pieceSize,par_entity);
	if (instance_exists(entity)) {
		if (entity.match) && !(match) image_index = index + 3;
	}
}
else {
	if (floating) {
		alarm[3] = floatDelay;
	}
}
#endregion
	
#region Swap Control
if (swap) { 
	bounce = false;
	//reset direction variables
	left = noone; right = noone; up = noone; down = noone
	ds_list_clear(adjacent);
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
//checks if there is no piece below, and ensure the piece below isnt swapping
var pieceBelow = instance_place(x, y + pieceSize, par_entity);
var notSwapping = true;
if (instance_exists(pieceBelow) && (pieceBelow.swap))
	notSwapping = false;
if (!(bottomEntity) && 
	!(match) && 
	!(swap) && 
	!(global.gameover) &&
	 (notSwapping) &&
	!(floating)) {
	if !alarm[0] alarm[0] = fallCheckDelay;
} 

//controls landing animation
if !(global.gameover) &&
   ((landAnim) || 
   ((bounce) && 
   !(global.forceRise) && 
    (obj_controller.freezeTime == 0) && 
   !(instance_exists(obj_matchmaker)))) && 
   !(match) && 
    (bottomEntity) {
	var animSpeed = (floor(landAnimIndex) == index) ? 0.25 : 0.5;
	// landing animation index control
	if !(bounce) {
		if (floor(landAnimIndex) < index + 3) {
		    landAnimIndex += animSpeed;
		} else { landAnimIndex = index; landAnim = false; }
	}
	//apply animation
	//bounce index is controller in controller for all pieces to bounce uniformly
	image_index = (bounce) ? scr_getBounceIndex(floor(obj_controller.bounceIndex)) + index : floor(landAnimIndex) ;
} else bounce = false;

//checks for piece above, and if its bouncing, make this piece bounce as well
var pieceAbove = instance_position(x,y - pieceSize,par_entity);
if (instance_exists(pieceAbove)) {
	if (y <= scr_getRowPos(0) && 
	   (y <= scr_getRowPos(obj_controller.boardHeight - 3))) 
		bounce = pieceAbove.bounce;
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
	left = instance_position(x - pieceSize, y, par_entity);
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
	right = instance_position(x + pieceSize, y, par_entity);
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
	down = instance_position(x, y + pieceSize, par_entity);
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
	up = instance_position(x, y - pieceSize, par_entity);
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