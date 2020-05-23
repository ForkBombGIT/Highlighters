#region Force Rise
//rise if the force rise button is pressed
if !(global.gameover) &&
   !(global.victory) &&
   !(global.riseBrake) {
	if (global.forceRise) { 
		if (y <= (initY - targY)) {
			initY = -1;
			targY = -1;
			global.forceRise = false;
			global.active = true; 
			obj_controller.riseTimer = current_time;
		}
		else {
			if ((y - global.forceRiseSpeed) < scr_getRowPos(global.boardHeight - 1)) {
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
	!(global.victory) &&
	!(match) &&
	!(landAnim)) {
	if (y <= scr_getRowPos(0)) {
		image_index = index;
	}
	else image_index = index + 4; 
}
#endregion

#region Rising Pieces
if (y <= scr_getRowPos(global.boardHeight - 1)) {
	if !(global.freeze) &&
	!(global.riseBrake) {
		if !(alarm[1]) {
			alarm[1] = obj_controller.gameoverDelay;
			obj_controller.canRise = false
		}
		lastGameoverDelay = alarm[1];
	} 
	//pause gameover delay for freezing and rise brakes
	else {
		if (alarm[1]) alarm[1] = lastGameoverDelay;	
	}
} 
//reset gameover delay if piece is not in top row
else {
	if (alarm[1]) alarm[1] = -1;	
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
} else if (position_meeting(x,y+global.pieceSize,par_entity)) {
	var below = instance_place(x,y+global.pieceSize,par_entity);
	bottomEntity = below.bottomEntity
} else {
	if !(global.riseUp) && !(global.forceRise)
		bottomEntity = false;
}
	
if ((bottomEntity) && (falling)) {
	image_index = index;
	landAnimIndex = index;	
	landAnim = true;
	falling = false;
}

if (bottomEntity) && 
   !(global.gameover) && 
   !(global.victory) &&
   (!(match)) {
	var entity = instance_position(x,y + global.pieceSize,par_entity);
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
	if (targetX < global.boardWidth) {
		col = targetX;
		targetX = scr_getColPos(targetX);
	}
	
	//increment until position is reached
	if (x < targetX) x += swapSpeed;
	else if (x > targetX) x -= swapSpeed;
	else { x = targetX; swap = false; image_index = index;}
}
#endregion

#region Warning Notifications
//bounce
if !(global.gameover) &&
   !(global.victory) {
	if (y < scr_getRowPos(0) && 
	   (y <= scr_getRowPos(global.boardHeight - 3)) &&
	   !(global.freeze) && 
	   !(global.forceRise) &&
	   !(instance_exists(obj_matchmaker)) && 
	   !(scr_checkRow(global.boardHeight)) &&
	   !(match)) {
		   if !(bounce) {
				image_index = index;
				bounce = true;
		   }
	} else bounce = false;

	//enables squish when y is in top row
	//checks for piece above, and if its bouncing, make this piece bounce as well
	var pieceAbove = instance_position(x,y - global.pieceSize,par_entity);
	if (y <= scr_getRowPos(global.boardHeight - 1)) &&
	   (bottomEntity) {
		  if !(squish) {
			image_index = index;
			squish = true;	
		  }
	}
	else if (instance_exists(pieceAbove)) &&
		(y <= scr_getRowPos(global.boardHeight - 3)) {
		squish = pieceAbove.squish;	
	} else {
		if (squish)
			image_index = index;
		squish = false;
	}
}
else {
	squish = false;	
	bounce = false;
}

//squish when piece is at top of stack
if (squish) && 
  !(global.gameover) &&
  !(global.victory) &&
  !(match) {
	par_entity.bounce = false;
	image_index = index + 3;
}
#endregion


#region Fall Control
//checks if there is no piece below, and ensure the piece below isnt swapping
var pieceBelow = instance_place(x, y + global.pieceSize, par_entity);
var notSwapping = true;
if (instance_exists(pieceBelow) && (pieceBelow.swap))
	notSwapping = false;
if (!(bottomEntity) && 
	!(match) && 
	!(swap) && 
	!(global.gameover) &&
    !(global.victory) &&
	 (notSwapping) &&
	!(floating)) {
	if !alarm[0] alarm[0] = fallCheckDelay;
} 

//controls landing animation
if !(global.gameover) &&
   !(global.victory) &&  
   !(match) &&
   (bottomEntity) &&
   ((landAnim) || 
   ((bounce) && 
   !(squish))) {
	var animSpeed = (floor(landAnimIndex) == index) ? landingAnimationFirst : 
													  landingAnimationRest;
	// landing animation index control
	if !(bounce) {
		landAnimIndex += animSpeed;
		if (floor(landAnimIndex) > index + 2) {
			landAnimIndex = index; landAnim = false;
		}
	}
	//apply animation
	//bounce index is controller in controller for all pieces to bounce uniformly
	image_index = (bounce) ? scr_getBounceIndex(floor(obj_controller.bounceIndex)) + index : floor(landAnimIndex) ;
}
#endregion


#region Match Control
//checks for adjacent matching pieces
if ((bottomEntity) && 
	!(swap) &&
	!(global.gameover) && 
    !(global.victory) &&
	(y <= scr_getRowPos(0))) {
	//clear adjacent list
	ds_list_clear(adjacent);
	
	//check for a matching left piece
	left = instance_position(x - global.pieceSize, y, par_entity);
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
	right = instance_position(x + global.pieceSize, y, par_entity);
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
	down = instance_position(x, y + global.pieceSize, par_entity);
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
	up = instance_position(x, y - global.pieceSize, par_entity);
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