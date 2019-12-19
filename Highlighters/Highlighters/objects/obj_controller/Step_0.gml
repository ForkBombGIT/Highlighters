#region Game Loop
#region Restart
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
	cursor = instance_create_layer(x,scr_getRowPos(4),"Entities",obj_cursor);		
	cursor.visible = false;
	//restart
	scr_initRows(0);
	gameSpeed = startGameSpeed;
	nextLevelScale = startNextLevelScale;
	scoreToNextLevel = initialScoreToNextLevel;
	risePace = orgRisePace - (((orgRisePace - minRisePace) / maxLevel) * (gameSpeed - 1))
	instance_create_layer(168, window_get_height()/4,"GUI",obj_countdown);	
}
#endregion
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
//combo freeze handling
for (var i = 0; i < instance_number(obj_matchmaker); i++) {
	var entity = instance_find(obj_matchmaker,i);
	if (entity.animating) {
		var listSize = ds_list_size(entity.final);
		if (listSize >= 4) {
			if (ds_list_find_index(activeMatches,entity) == -1){
				ds_list_add(activeMatches, entity);
				freeze = true;
				freezeTime += (listSize > 9) ? 6 : 
							 ((listSize > 6) ? 4 : 2);
				freezeTimer = current_time;
			}
		}
	}
} 
if (instance_number(obj_matchmaker) == 0) {
	ds_list_clear(activeMatches)	
}

if (freeze) {
	if ((current_time - freezeTimer)/1000 > 1) {
		if (--freezeTime == 0) freeze = false;
		freezeTimer = current_time;
	}
} 
else {
	freezeTime = 0;
}

//block loop
if ((global.active) && !(global.gameover)) {	
	//disables level progression in practice
	if !(practice) {
		//handles level progression
		if (gameScore >= scoreToNextLevel) && (gameSpeed < maxLevel) {
			gameSpeed++;
			scoreToNextLevel = floor(initialScoreToNextLevel * ((++nextLevelScale) * incrementScaler));
			risePace -= (orgRisePace - minRisePace) / maxLevel;
		}
	}
	//rising row
	if !(freeze) && (canRise){
		if ((current_time - riseTimer)/1000 > risePace) { 
			riseTimer = current_time;
			global.riseUp = true;
		} else global.riseUp = false;
	} else global.riseUp = false;
	
	//creates new bottom row
	if (!position_meeting(scr_getColPos(0),scr_getRowPos(0)+25,par_entity)){
		scr_createRow(-1);
	}
	
	//manual new row
	if (keyboard_check(keyB) && !(global.forceRise)) {
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
}
#endregion
