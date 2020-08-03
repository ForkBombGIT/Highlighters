#region Force Rise
//rise if the force rise button is pressed
if (instance_exists(objCtrl_menuPause) && !(objCtrl_menuPause.pause)) {
if !(global.gameover) &&
   !(global.victory) &&
   !(global.riseBrake) {
	if (global.forceRise) { 
		if (y <= (initY - targY)) {
			initY = -1;
			targY = -1;
			global.forceRise = false;
			global.active = true; 
			objCtrl_gameSession.riseTimer = current_time;
		}
		else {
			if ((y - global.forceRiseSpeed) < scr_getRowPos(objCtrl_gameSession.boardHeight - 1)) {
				global.gameover = true;
			}
			y -= global.riseAmount;	
		}
	}
	else if (global.riseUp) 
		y -= global.riseAmount;
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
if (y <= scr_getRowPos(objCtrl_gameSession.boardHeight - 1)) {
	if !(global.freeze) &&
	!(global.riseBrake) {
		if !(alarm[1]) {
			alarm[1] = objCtrl_gameSession.gameoverDelay;
			objCtrl_gameSession.canRise = false
		}
		lastGameoverDelay = alarm[1];
	} 
	//pause gameover delay for freezing and rise brakes
	else {
		if (alarm[1]) alarm[1] = lastGameoverDelay;	
		objCtrl_gameSession.canRise = false
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


#region Warning Notifications
//bounce
if !(global.gameover) &&
   !(global.victory) {
	if (y < scr_getRowPos(0) && 
	   (y <= scr_getRowPos(objCtrl_gameSession.boardHeight - 3)) &&
	   !(global.freeze) && 
	   !(global.forceRise) &&
	   !(instance_exists(obj_matchmaker)) && 
	   !(scr_checkRow(objCtrl_gameSession.boardHeight)) &&
	   !(match)) {
		   if !(bounce) {
				image_index = index;
				bounce = true;
		   }
	} else bounce = false;

	//enables squish when y is in top row
	//checks for piece above, and if its bouncing, make this piece bounce as well
	var pieceAbove = instance_position(x,y - global.pieceSize,objPar_piece);
	if (y <= scr_getRowPos(objCtrl_gameSession.boardHeight - 1)) {
		  if !(squish) {
			image_index = index;
			squish = true;	
		  }
	}
	else if (instance_exists(pieceAbove)) &&
		(y <= scr_getRowPos(objCtrl_gameSession.boardHeight - 3)) {
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
	objPar_piece.bounce = false;
	image_index = index + 3;
}
#endregion

#region Fall Control
//checks if there is no piece below
if (!(bottomEntity) && 
	!(match) && 
	!(swap) && 
	!(global.gameover) &&
    !(global.victory)) {
	if !alarm[0] alarm[0] = (skipDelay) ? 1 : 
							((aboveMatch) ? floatAboveMatchDelay : floatDelay);
	aboveMatch = false;
} 

if (instance_exists(obj_matchmaker)) &&
  !(inMatchCol) &&
  !(match) {
	inMatchCol = scr_checkColForMatch(col,y);
}

//controls landing animation
if !(global.gameover) &&
   !(global.victory) &&  
   (bottomEntity) &&
   ((landAnim) || 
   ((bounce) && 
   !(squish) &&
   !(global.forceRise || keyboard_check(ds_map_find_value(global.controls,"B"))))) {
	   if !(match) {
		   var animSpeed = (floor(landAnimIndex) == index) ? landingAnimationFirst : 
															  landingAnimationRest;
		   // landing animation index control
		   if !(bounce) {
			   if (floor(landAnimIndex) > index + 3) {
				 landAnimIndex = index; landAnim = false; justLanded = false; inMatchCol = false;
			   }
		   }
		   //apply animation
		   //bounce index is controller in controller for all pieces to bounce uniformly
		   image_index = (bounce) ? scr_getBounceIndex(floor(objCtrl_gameAnimation.bounceIndex)) + index : floor(landAnimIndex);
		   landAnimIndex += animSpeed;
	}
}
#endregion

#region Grounded Management
var pieceBelow = instance_place(x, y + global.pieceSize, objPar_piece);
var notSwapping = true;
if (instance_exists(pieceBelow) && (pieceBelow.swap))
	notSwapping = false;
if (y >= scr_getRowPos(0)) { 
	bottomEntity = true; 
} else if (position_meeting(x,y+global.pieceSize,objPar_piece)) {
	var below = instance_place(x,y+global.pieceSize,objPar_piece);
	bottomEntity = below.bottomEntity
	if !(bottomEntity) skipDelay = true;
} else {
	if !(global.riseUp) && 
	   !(global.forceRise) &&
		(notSwapping)
		bottomEntity = false;
}
	
if ((bottomEntity) && (falling)) {
	image_index = index;
	landAnimIndex = index;	
	landAnim = true;
	falling = false;
	if !(audio_is_playing(snd_drop)) {
		audio_play_sound(snd_drop,1,0);
	}
	if (inMatchCol)
		justLanded = true;	
}

//squish if piece below is matched
if !(global.gameover) && 
   !(global.victory) &&
   (!(match)) {
	var entityBelow = instance_position(x,y + global.pieceSize,objPar_piece);
	if (instance_exists(entityBelow)) {
		if (entityBelow.match) && !(match) { image_index = index + 3; aboveMatch = true; }
		
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
	if (targetX < objCtrl_gameSession.boardWidth) {
		col = targetX;
		targetX = scr_getColPos(targetX);
	}
	swapSpeed = ds_list_find_value(swapSpeeds,swapState++);
	//increment until position is reached
	if (x < targetX) x += swapSpeed;
	else if (x > targetX) x -= swapSpeed;
	else { x = targetX; swap = false; image_index = index; swapState = 0;}
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
	left = instance_position(x - global.pieceSize, y, objPar_piece);
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
	right = instance_position(x + global.pieceSize, y, objPar_piece);
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
	down = instance_position(x, y + global.pieceSize, objPar_piece);
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
	up = instance_position(x, y - global.pieceSize, objPar_piece);
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
}
#endregion