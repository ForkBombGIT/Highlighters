//clear active match list if no matchmakers exist
if (instance_number(obj_matchmaker) == 0) {
	ds_list_clear(activeMatches)	
}

#region Game States
if !(scr_checkRow(global.boardHeight - 1)) { 
	obj_controller.canRise = true;	
}

if (global.gameScore >= global.victoryScore) && 
   !(global.riseBrake) {
	global.victory = true;
	with (par_entity) {
		if !(bottomEntity) global.victory = false;	
	}
}

if (global.gameLevel % global.levelToMatch == global.levelToMatch - 1) global.requiresCombo = true;
else global.requiresCombo = false;

//handles restart logic
if (global.restart) {
	selectedEntities = scr_generateColors();
	//set global variables
	global.active = false;
	global.restart = false;
	//reset freeze
	global.freeze = false;
	freezeTime = 0;
	freezeTimer = current_time;
	//reset game variable
	global.gameScore = 0;
	//delete old objects
	instance_destroy(par_entity);
	instance_destroy(obj_cursor);
	instance_destroy(obj_matchmaker);
	instance_destroy(obj_star);
	cursor = instance_create_layer(x,scr_getRowPos(4),"Cursor",obj_cursor);		
	cursor.visible = false;
	//restart
	if !(global.practice)
		scr_generateStars(starsGridSize,starGridUnitSize);
	scr_initRows(0);
	global.gameLevel = global.startGameLevel;
	riseSpeed = scr_getRiseSpeed(global.gameLevel);
	canRise = true;
	instance_create_layer(168, window_get_height()/4,"GUI",obj_countdown);	
}

//handles gameover logic
if (global.gameover) ||
   (global.victory) {
	global.forceRise = false;
	global.riseUp = false;
	global.forceRiseSpeed = 0;
	if !(anim) { 
		//sets starting point for character portrait
		global.characterPortrait.characterAnimIndex = 5;
		anim = true; 
		alarm[0] = 1; 
	}
}

var pieceSwap = false
with (par_entity) {
	if (swap) pieceSwap = true;
}

var pieceFalling = false;
with (par_entity) {
	if !(bottomEntity) pieceFalling = true;
}
	
global.riseBrake = (instance_exists(obj_matchmaker)) || pieceFalling || pieceSwap

//freeze timer
if (global.freeze) &&
   (global.gameScore < global.victoryScore) &&
   !(global.riseBrake) {
	if ((current_time - freezeTimer) / 1000 > 1) {
		freezeTime--;
		freezeTimer = current_time;
	}
}  

//turn off freeze if countdown is over
if (freezeTime <= 0) {
	global.freeze = false;
}

#endregion

#region Piece Bouncing - Panic Notif
var canBounce = true;
if (scr_checkRow(global.boardHeight - 1)) {
	var topRow = scr_getRow(global.boardHeight - 1);
	var entity = ds_list_find_value(topRow,0);
	if (instance_exists(entity))
		if (entity.y <= scr_getRowPos(global.boardHeight - 1)) 
			canBounce = false;
}
if (canBounce) && 
  !(global.freeze) &&
  !(global.forceRise) {
	if (scr_checkRow(global.boardHeight - 3)) { 
		global.gameover = false;
		//turn on bounce animation
		var rowEntities = scr_getRow(global.boardHeight - 3);
		for (var i = 0; i < ds_list_size(rowEntities); i++) {
			var entity = ds_list_find_value(rowEntities,i);
			if (entity.bottomEntity) && 
			   !(entity.swap) &&
			   (entity.y <= scr_getRowPos(global.boardHeight - 3)){
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

#region Piece Loop
if keyboard_check(ds_map_find_value(global.controls,"B")) {
	global.fastAnim = true;
} else global.fastAnim = false;

if ((global.active) && 
   !(global.victory) &&
   !(global.gameover)) {
	   
	// bomb pulse animation
	var animSpeed = global.pulse ? pulseAnimationSpeedEnd : pulseAnimationSpeedStart;
	pulseIndex += animSpeed;
	show_debug_message(floor(pulseIndex));
	//pulse after the first frame lasts for 9 frames
	if (floor(pulseIndex) > pulseStartIndex) {
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
	   
	if !(global.practice) { //disables level progression in practice
		//handles level progression
		if (global.gameLevel < global.maxLevel) {
			riseSpeed = scr_getRiseSpeed(global.gameLevel);
		}
	}
	
	//creates new bottom row
	if (!position_meeting(scr_getColPos(0),scr_getRowPos(0)+24,par_entity)){
		scr_createRow(-1);
		if !(newRowInc) {
			global.gameScore = min(global.gameScore + 1,global.victoryScore);
			if !(global.practice) && 
				// levelToMatch must be advance with a combo
				(global.gameLevel % global.levelToMatch != global.levelToMatch - 1)
				global.gameLevel = min(global.gameLevel + 1,global.maxLevel);
			newRowInc = true;
		}
	} else newRowInc = false;
	
	//manual new row
	if (keyboard_check(ds_map_find_value(global.controls,"B")) && 
	  !(global.forceRise) && 
	  !(global.riseBrake)) {
		global.freeze = false;
		freezeTime = 0;
		//checks if piece is gonna rise into game over territory
		if (scr_checkRow(global.boardHeight)) {
			global.gameover = true;
		}
		else {
			global.forceRise = true;
			freezeTime = 0;
			riseTimer = current_time;
		
			var targY = abs(432 - (instance_position(scr_getColPos(0),432,par_entity).y + 24));
			for (var i = 0; i < instance_number(par_entity); i++) {
				var instance = instance_find(par_entity,i);
				instance.targY = targY;
				instance.initY = instance.y;
				instance.initY = instance.y;
			}
		}
	}
	
	//rising row
	if !(global.freeze) && 
		(canRise) && 
	   !(global.riseBrake) {
		if ((current_time - riseTimer)/1000 > (riseSpeed / room_speed)) { 
			riseTimer = current_time;
			global.riseUp = true;
		} else global.riseUp = false;
	} else {
		riseTimer = current_time;
		global.riseUp = false;
	}
}
#endregion
