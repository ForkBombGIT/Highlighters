ui.gameEndTransition = gameEndTransition;
ui.gameEndTransitionIndex = gameEndTransitionIndex;

#region Piece Bouncing - Panic Notification
var canBounce = true;
if (scr_checkRow(objCtrl_gameSession.boardHeight - 1)) {
	var topRow = scr_getRow(objCtrl_gameSession.boardHeight - 1);
	var entity = ds_list_find_value(topRow,0);
	if (instance_exists(entity))
		if (entity.y <= scr_getRowPos(objCtrl_gameSession.boardHeight - 1)) 
			canBounce = false;
}

// reset pieces that were bouncing
if (!global.gameover) &&
   (!global.victory) {
	if !(canBounce) {
		with (objPar_piece) {
			if !(squish) {
				image_index = index;
			}
		}
	
	}
}

if (canBounce) && 
  !(global.freeze) &&
  !(global.forceRise) {
	if (scr_checkRow(objCtrl_gameSession.boardHeight - 3)) { 
		global.gameover = false;
		//turn on bounce animation
		var rowEntities = scr_getRow(objCtrl_gameSession.boardHeight - 3);
		for (var i = 0; i < ds_list_size(rowEntities); i++) {
			var entity = ds_list_find_value(rowEntities,i);
			if (entity.bottomEntity) && 
			   !(entity.swap) &&
			   (entity.y <= scr_getRowPos(objCtrl_gameSession.boardHeight - 3)){
				entity.bounce = true;
				bounce = true;
			}
		}
	} else {
		bounce = false;
		bounceIndex = 0;
	}
} else {
	bounce = false;
	bounceIndex = 0;
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
if ((global.active) && 
   !(global.victory) &&
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
//handles gameover logic
if (global.gameover) ||
   (global.victory) {
	global.forceRise = false;
	global.riseUp = false;
	global.forceRiseSpeed = 0;
	instance_destroy(obj_matchmaker);
	if !(gameEndAnimation) { 
		audio_play_sound(global.gameover ? snd_lose : snd_win,1,0);
		//sets starting point for character portrait
		with (objPar_piece) {
			image_index = index;	
		}
		objUI_characterPortrait.characterAnimIndex = 5; 
		gameEndAnimation = true; 
		alarm[0] = global.victory ? room_speed * 2 : 1; 
	}
}


if (gameEndTransition) {
	var animSpeed = 0.25;
	//pulse after the first frame lasts for 9 frames
	gameEndTransitionIndex += animSpeed;
	if (floor(gameEndTransitionIndex) >= gameEndTransitionEndIndex) {
		if !(alarm[1]) alarm[1] = 60;
		gameEndTransition = false;
	}
}
#endregion