#region Positioning Control
//updates position based of row and col
x = scr_getColPos(col) + sprite_get_width(spr_charm) / 2;
visible = !global.gameover && 
          !global.victory;
var inputMap = ds_map_find_value(global.options,"input");

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
			y -= global.riseAmount;		
	}
	else if (global.riseUp) {
		y -= global.riseAmount;
	}
	//displaces the cursor if its about to go out of view
	if (global.riseUp) || 
	  ((global.forceRise) && 
	  (!scr_checkRow(objCtrl_gameSession.boardHeight - 1))) {
		if (y < scr_getRowPos(objCtrl_gameSession.boardHeight - 1)) {
			var yDisplacement = (((abs(instance_nearest(x,y,objPar_piece).y - y)/global.pieceSize)) - 
								 ((abs(instance_nearest(x,y,objPar_piece).y - y)/global.pieceSize) - 1)) * global.pieceSize;
			y += yDisplacement;
		}
	}
}
#endregion

#region Piece Swapping
if ((global.active) && 
	!(global.gameover) &&
	!(global.victory)) {
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
		buffer = 0;
		swap = true;
	}
	if (keyboard_check(ds_map_find_value(inputMap,"A"))) {
		if (release) swapPressLength++;
	}
	if (keyboard_check_released(ds_map_find_value(inputMap,"A"))) {
		swapPressLength = 0;
		release = true;
	}
}

if (swap) {
	if (buffer++ < bufferLength) {
		//holds the piece on the left and right of the cursor
		leftPiece = instance_position(x-24,y,objPar_piece);
		rightPiece = instance_position(x+24,y,objPar_piece);
		var leftUp = instance_position(x-24,y-48,objPar_piece);
		var rightUp = instance_position(x+24,y-48,objPar_piece);
		var leftUpBottomEntity = instance_exists(leftUp) ? leftUp.bottomEntity : true;
		var rightUpBottomEntity = instance_exists(rightUp) ? rightUp.bottomEntity : true;
	
		//applies swap to both pieces if there are a left and right piece
		if (!objPar_piece.swap) {
			if (instance_exists(rightPiece) && instance_exists(leftPiece)) { 
				if (!(leftPiece.swap) && !(rightPiece.swap) && 
				   (leftUpBottomEntity) && (rightUpBottomEntity) &&
				   (!(leftPiece.match) && !(rightPiece.match)) &&
				   (leftPiece.bottomEntity) && (rightPiece.bottomEntity)) {
					audio_play_sound(snd_swap,1,0);
					leftPiece.targetX = col + 1;
					leftPiece.swap = true;
					leftPiece.image_index = leftPiece.index + 4;
					leftPiece.depth = leftPiece.orgDepth - 100;
					//if (leftPiece.zipSwapDirection != 1) {
					//	ds_list_clear(leftPiece.trail)
					//	leftPiece.alarm[3] = 1;
					//}
			
					rightPiece.targetX = col;
					rightPiece.swap = true;
					rightPiece.image_index = rightPiece.index + 4;
					//if (rightPiece.zipSwapDirection != -1) {
					//	ds_list_clear(rightPiece.trail);
					//	rightPiece.alarm[3] = 1;
					//}
					swap = false;
				}	
			}
			else {
				//applies swap to left piece
				if (instance_exists(leftPiece)) {
					if !(leftPiece.swap) && 
					   !(leftPiece.match) && 
					   (leftPiece.bottomEntity) && 
					   (rightUpBottomEntity) {
						audio_play_sound(snd_swap,1,0);
						leftPiece.targetX = col + 1;
						leftPiece.swap = true;
						leftPiece.image_index = leftPiece.index + 4;
						leftPiece.depth = leftPiece.orgDepth - 100;
						//if (leftPiece.zipSwapDirection != 1) {
						//	ds_list_clear(leftPiece.trail)
						//	leftPiece.alarm[3] = 1;
						//}
						swap = false;
					}
				}
	
				//applies swap to right piece
				else if (instance_exists(rightPiece)){
					if !(rightPiece.swap) && 
					   !(rightPiece.match) && 
					   (rightPiece.bottomEntity) && 
					   (leftUpBottomEntity) {
						audio_play_sound(snd_swap,1,0);
						rightPiece.targetX = col;
						rightPiece.swap = true;
						rightPiece.image_index = rightPiece.index + 4;
						//if (rightPiece.zipSwapDirection != -1) {
						//	ds_list_clear(rightPiece.trail);
						//	rightPiece.alarm[3] = 1;
						//}
						swap = false;
					}
				} 
			}
		}
	} else {
		buffer = 0;
		swap = false;
	}
}
// Zip Swap
if (swapPressLength > longPress) {
	if (instance_exists(leftPiece)) {
		var canZip = true;
		// if piece is furthest to right, set right to itself to flip canZip flag
		var right = (leftPiece.col == objCtrl_gameSession.boardWidth - 1) ? leftPiece : 
																			scr_getPieceAtPos(scr_getRowFromPos(leftPiece.y), 
																							  leftPiece.col + 1);
		
		if (instance_exists(right)) 
			canZip = false;
		// long swap set to 1 so piece will move right
		if (canZip) {
			leftPiece.zipSwap = 1;	
			leftPiece.zipSwapLength = 1;
		}
	}
	if (instance_exists(rightPiece)) {
		var canZip = true;
		// if piece is furthest to left, set left to itself to flip canZip flag
		var left = (rightPiece.col == 0) ? rightPiece : 
										   scr_getPieceAtPos(scr_getRowFromPos(rightPiece.y), 
														     rightPiece.col - 1);
		if (instance_exists(left)) canZip = false;
		// long swap set to -1 so piece will move left
		if (canZip) {
			rightPiece.zipSwap = -1;	
			rightPiece.zipSwapLength = 1;
			//rightPiece.trailDrawLength = rightPiece.maxTrailLength;
			//ds_list_clear(rightPiece.trail)
		}
	}
	leftPiece = noone;
	rightPiece = noone;
	swapPressLength = 0;
	release = false;
}
#endregion

#region Cursor Movement
leftB = keyboard_check(ds_map_find_value(inputMap,"LEFT"));
rightB = keyboard_check(ds_map_find_value(inputMap,"RIGHT"));
upB = keyboard_check(ds_map_find_value(inputMap,"UP"));
downB = keyboard_check(ds_map_find_value(inputMap,"DOWN"));
if !(global.gameover) &&
   !(global.victory) {
	if (leftB || rightB || upB || downB) {
		var key = (leftB) ? ds_map_find_value(inputMap,"LEFT") : 
				  ((rightB) ? ds_map_find_value(inputMap,"RIGHT") :
				  ((upB) ? ds_map_find_value(inputMap,"UP") : ds_map_find_value(inputMap,"DOWN")));
		//single press behavior
		if (lastKey != key) keyPressLength = 0;
		if (++keyPressLength == 1) { scr_cursorMovement(key,snd_move); }
		lastKey = key;
	} 
	else 
		keyPressLength = 0;
	
	// handles long press behavior
	if (keyPressLength > longPress) {
		if (keyPressLength > 0) {
			if ((current_time - delayTime) > delay){
				delayTime = current_time;
				scr_cursorMovement(keyboard_key,pointer_null);
			}
		} 
	}
}
#endregion

