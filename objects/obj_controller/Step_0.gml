//clear active match list if no matchmakers exist
if (instance_number(obj_matchmaker) == 0) {
	ds_list_clear(activeMatches)	
}

#region Game States

if (global.gameScore >= global.victoryScore) && 
   !(instance_exists(obj_matchmaker)) {
	global.gameover = true;
	var pieceCount = instance_number(par_entity);
	for (var i = 0; i < pieceCount; i++) {
		var entity = instance_find(par_entity,i);
		if !(entity.bottomEntity) global.gameover = false;
	}
}

//handles restart logic
if (global.restart) {
	selectedEntities = scr_generateColors();
	//set global variables
	global.active = false;
	global.restart = false;
	//reset freeze
	freeze = false;
	freezeTime = 0;
	freezeTimer = current_time;
	//reset game variable
	global.gameScore = 0;
	//delete old objects
	instance_destroy(par_entity);
	instance_destroy(obj_cursor);
	instance_destroy(obj_matchmaker);
	cursor = instance_create_layer(x,scr_getRowPos(4),"Cursor",obj_cursor);		
	cursor.visible = false;
	//restart
	scr_initRows(0);
	global.gameLevel = global.startGameLevel;
	riseSpeed = scr_getRiseSpeed(global.gameLevel);
	canRise = true;
	instance_create_layer(168, window_get_height()/4,"GUI",obj_countdown);	
}

//handles gameover logic
if (global.gameover) {
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

//freeze timer
if (freeze) &&
   (global.gameScore < global.victoryScore) &&
   !instance_exists(obj_matchmaker) &&
   !par_entity.falling {
	if ((current_time - freezeTimer)/1000 > 1) {
		freezeTime--;
		freezeTimer = current_time;
	}
}

//turn off freeze if countdown is over
if (freezeTime <= 0)
	freeze = false;
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
   (freezeTimer != 0) &&
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
	}
} else bounce = false;


//controls bounce animations, keeps pieces in sync
if (bounce) {
	var animSpeed = (floor(bounceIndex) == 1 || floor(bounceIndex) == 3) ? 0.25 : 0.5
	if (bounceIndex >= 5)
		bounceIndex = 0;
	else bounceIndex += animSpeed
} else bounceIndex = 0;
#endregion

#region Piece Loop
if ((global.active) && 
   !(global.gameover)) {	
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
			global.gameLevel = min(global.gameLevel + 1,global.maxLevel);
			newRowInc = true;
		}
	} else newRowInc = false;
	
	//manual new row
	if (keyboard_check(ds_map_find_value(global.controls,"B")) && 
	  !(global.forceRise)) && 
	  !instance_exists(obj_matchmaker) &&
	  !par_entity.falling {
		freeze = false;
		freezeTime = 0;
		//checks if piece is gonna rise into game over territory
		if (scr_checkRow(global.boardHeight)) {
			global.gameover = true;
		}
		else {
			global.forceRise = true;
			freeze = false;
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
	if !freeze && 
		canRise && 
	   !instance_exists(obj_matchmaker) &&
	   !par_entity.falling {
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
