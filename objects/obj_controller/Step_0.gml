#region Game Loop
//handles restart logic
if (global.restart) {
	selectedEntities = scr_generateColors();
	//set global variables
	global.active = false;
	global.restart = false;
	//reset game variable
	gameScore = 0;
	//delete old objects
	instance_destroy(par_entity);
	instance_destroy(obj_cursor);
	instance_destroy(obj_matchmaker);
	cursor = instance_create_layer(x,scr_getRowPos(4),"Cursor",obj_cursor);		
	cursor.visible = false;
	//restart
	scr_initRows(0);
	gameSpeed = startGameSpeed;
	nextLevelScale = startNextLevelScale;
	scoreToNextLevel = initialScoreToNextLevel;
	risePace = orgRisePace - (((orgRisePace - minRisePace) / maxLevel) * (gameSpeed - 1))
	canRise = true;
	instance_create_layer(168, window_get_height()/4,"GUI",obj_countdown);	
}

//handles gameover logic
if (global.gameover) {
	global.forceRise = false;
	global.riseUp = false;
	global.forceRiseSpeed = 0;
	if !(anim) { 
		anim = true; 
		alarm[0] = 1; 
	}
}

//clear active match list if no matchmakers exist
if (instance_number(obj_matchmaker) == 0) {
	ds_list_clear(activeMatches)	
}

//freeze timer
if (freeze) &&
   !instance_exists(obj_matchmaker) &&
   !par_entity.falling {
	if ((current_time - freezeTimer)/1000 > 1) {
		freezeTime--;
		freezeTimer = current_time;
	}
}

show_debug_message(freeze);

if (freezeTime <= 0)
	freeze = false;

if (!scr_checkRow(boardHeight)) {
	global.gameover = false;
	//turn on bounce animation
	var rowEntities = scr_getRow(boardHeight - 2);
	for (var i = 0; i < ds_list_size(rowEntities); i++) {
		var entity = ds_list_find_value(rowEntities,i);
		if (entity.bounce != true) {
			entity.bounce = true;
			entity.landAnimIndex = entity.index;	
			var colEntities = scr_getCol(entity.col);
			for (var j = 0; j < ds_list_size(colEntities); j++) {
				var entityCol = ds_list_find_value(colEntities,j);
				entityCol.bounce = true;
				entityCol.landAnimIndex = entityCol.index;	
			}
		}
	}
}
else {
	//turn off bounce animation
	var rowEntities = scr_getRow(boardHeight - 1);
	for (var i = 0; i < ds_list_size(rowEntities); i++) {
		var entity = ds_list_find_value(rowEntities,i);
		if (entity.bounce != false) {
			entity.bounce = false;
			var colEntities = scr_getCol(entity.col);
			for (var j = 0; j < ds_list_size(colEntities); j++) {
				var entityCol = ds_list_find_value(colEntities,j);
				entityCol.bounce = false;
			}
		}
	}
}

//block loop
if ((global.active) && !(global.gameover)) {	
	//disables level progression in practice
	if !(global.practice) {
		//handles level progression
		if (gameScore >= scoreToNextLevel) && (gameSpeed < maxLevel) {
			gameSpeed++;
			scoreToNextLevel = floor(initialScoreToNextLevel * ((++nextLevelScale) * incrementScaler));
			risePace -= (orgRisePace - minRisePace) / maxLevel;
		}
	}
	
	//creates new bottom row
	if (!position_meeting(scr_getColPos(0),scr_getRowPos(0)+24,par_entity)){
		scr_createRow(-1);
	}
	
	//manual new row
	if (keyboard_check(ds_map_find_value(global.controls,"B")) && 
	  !(global.forceRise)) && 
	  !instance_exists(obj_matchmaker) &&
	  !par_entity.falling {
		freeze = false;
		//checks if piece is gonna rise into game over territory
		if (scr_checkRow(boardHeight)) {
			global.gameover = true;
		}
		else {
			global.forceRise = true;
			freeze = false;
			riseTimer = current_time;
		
			var targY = abs(432 - (instance_position(scr_getColPos(0),432,par_entity).y + 24));
			for (var i = 0; i < instance_number(par_entity); i++) {
				var instance = instance_find(par_entity,i);
				instance.targY = targY;
				instance.initY = instance.y;
				global.active = false;
			}
		}
	}
	
	//rising row
	if !freeze && 
		canRise && 
	   !instance_exists(obj_matchmaker) &&
	   !par_entity.falling {
		if ((current_time - riseTimer)/1000 > risePace) { 
			riseTimer = current_time;
			global.riseUp = true;
		} else global.riseUp = false;
	} else {
		riseTimer = current_time;
		global.riseUp = false;
	}
}
#endregion
