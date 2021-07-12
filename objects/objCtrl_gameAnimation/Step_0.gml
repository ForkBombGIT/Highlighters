ui.gameEndTransition = gameEndTransition;

#region Piece Bouncing - Panic Notification
var canBounce = true;
if (scr_checkRow(objCtrl_gameSession.boardHeight - 1)) {
	var topRow = scr_getRow(objCtrl_gameSession.boardHeight - 1);
	var entity = ds_list_find_value(topRow,0);
	if (instance_exists(entity))
		if (entity.y <= scr_getRowPos(objCtrl_gameSession.boardHeight - 1)) 
			canBounce = false;
	ds_list_destroy(topRow);
}

// reset pieces that were bouncing
if (!global.gameover) &&
   (!global.victory) {
	if !(canBounce) {
		with (objPar_piece) {
			if !(squish) && 
			   !(match) && 
			   !(landAnim) &&
			   !(swap) &&
			   !(aboveMatch) {
				image_index = index;
			}
		}
	
	}
}

//turn on bounce animation
if (canBounce) && 
  !(global.forceRise) && 
  !(instance_exists(obj_matchmaker)) {
	if (scr_checkRow(objCtrl_gameSession.boardHeight - 3)) { 
		var currentTallestCol = tallestCol;
		var newTallest = scr_getTallestCol();
		
		if !(bounce) || (scr_getColHeight(newTallest) > scr_getColHeight(currentTallestCol)) {
			tallestCol = newTallest;
			with (objPar_piece) {
				bounce = false	
			}
			var tallestColList = scr_getCol(tallestCol);
			for (var i = 0; i < ds_list_size(tallestColList); i++) {
				var entity = ds_list_find_value(tallestColList,i);
				if (entity.bottomEntity) {
					entity.bounce = true;
					bounce = true;
				}
			}
			ds_list_destroy(tallestColList);
		} 
	} else canBounce = false;	
} else canBounce = false;

if !(canBounce) {
	if (bounce) { 
		bounce = false;
		bounceIndex = 0;
		tallestCol = -1;
		with (objPar_piece) {
			bounce = false	
		}
	}
}

//controls bounce animations, keeps pieces in sync
if (bounce) {
	var animSpeed = (floor(bounceIndex) == 1 || floor(bounceIndex) == 3) ? bounceAnimationFirst :
																		   bounceAnimationLast;
	if (bounceIndex >= 5)
		bounceIndex = 0;
	else bounceIndex += animSpeed;
} else bounceIndex = 0;
#endregion

#region Pulse Animation
if (!(global.victory) &&
    !(global.gameover)) {
	// bomb pulse animation
	var animSpeed = global.pulse ? pulseAnimationSpeedEnd : pulseAnimationSpeedStart;
	pulseIndex += animSpeed;
	//pulse after the first frame lasts for 9 frames
	if (floor(pulseIndex) >= pulseStartIndex) {
		global.pulse = true;	
	}
	//pulse animation
	if (floor(pulseIndex) == pulseEndIndex) &&
	   (pulseReset) {
		   pulseIndex = 0;
		   pulseReset = false;
		   global.pulse = false;
	}
	else if (floor(pulseIndex) > pulseEndIndex) {
		//reset pulse animation variables
		if !(pulseReset) {
			pulseIndex = pulseStartIndex;	
			pulseReset = true;
		}
	}
}
#endregion

#region Gameover Animations
//Starts gameover animation
if (global.gameover) ||
   (global.victory) {
	if !(gameEndAnimation) { 
		gameEndAnimation = true; 
		global.forceRise = false;
		global.riseUp = false;
		global.forceRiseSpeed = 0;
		instance_destroy(obj_matchmaker);
		var avMap = ds_map_find_value(global.options,"av");
		var victorySound = ds_map_find_value(avMap, "musicVol") == 0 ? snd_win_no_transition : snd_win;
		gameEndSound = global.victory ? victorySound : snd_lose;
		audio_play_sound(gameEndSound,1,0);
		//sets starting point for character portrait
		objUI_characterPortrait.characterAnimIndex = 5; 
		alarm[0] = 1; 
	}
}

// falling pieces animation
if (gameEndTransition) {
	if (gameEndState == 0) {
		if (fallDelay == 0) {
			var entity = scr_getPieceAtPos(gameEndRow,gameEndCol);
			fallDelay++;
			if (instance_exists(entity)) {
				if (global.gameover) entity.gameoverFall = true;
				if (global.victory) entity.gameoverRise = true;
			}
			if (global.gameover) {
				if (--gameEndCol == -1) {
					gameEndCol = objCtrl_gameSession.boardWidth - 1
					gameEndRow ++;
					if (gameEndRow > objCtrl_gameSession.boardHeight) {
						gameEndState = 1;	
					}
				}
			}
			if (global.victory) {
				if (++gameEndCol > objCtrl_gameSession.boardWidth - 1) {
					gameEndCol = 0;
					gameEndRow --;
					if (gameEndRow == -2) {
						gameEndState = 1;	
					}
				}
			}
		} else fallDelay = 0;
	}
	if (gameEndState == 1) { 
		if !(audio_is_playing(gameEndSound) && !(objCtrl_gameSession.gameEnd))
			objCtrl_gameSession.gameEnd = true;
	}
}
#endregion