#region Game Loop
if (instance_exists(obj_matchmaker)) {
	if (obj_matchmaker.animating) {
		freeze = true;	
	}
} else freeze = false;

#region Restart
if (global.restart) {
	//set global variables
	global.active = false;
	global.restart = false;
	//reset game variable
	gameScore = 0;
	//delete old objects
	instance_destroy(par_entity);
	instance_destroy(obj_cursor);
	cursor = instance_create_layer(x,scr_getRowPos(4),"Instances",obj_cursor);		
	cursor.visible = false;
	//restart
	scr_initRows(0);
	gameSpeed = startGameSpeed;
	nextLevelScale = startNextLevelScale;
	scoreToNextLevel = initialScoreToNextLevel;
	risePace = orgRisePace - (((orgRisePace - minRisePace) / maxLevel) * (gameSpeed - 1))
	show_debug_message(risePace);
	instance_create_layer(168, window_get_height()/4,"GUI",obj_countdown);	
}
#endregion
//handles gameover logic
if (global.gameover) {
	if !(anim) { 
		anim = true; 
		alarm[0] = 1; 
	}
}

if (freeze) {
}

//block loop
if ((global.active) && !(global.gameover)) {	
	if (gameScore >= scoreToNextLevel) {
		gameSpeed++;
		scoreToNextLevel = floor(initialScoreToNextLevel * ((++nextLevelScale) * incrementScaler));
		risePace -= (orgRisePace - minRisePace) / maxLevel;
	}
	//rising row
	if !(freeze) {
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
	if (keyboard_check(ord(keyB)) && !(global.forceRise)) {
		global.forceRise = true;
		var targY = abs(432 - (instance_position(scr_getColPos(0),432,par_entity).y + 24));
		for (var i = 0; i < instance_number(par_entity); i++) {
			var instance = instance_find(par_entity,i);
			instance.targY = targY;
			instance.initY = instance.y;
			global.active = false;
		}
	}
}
#endregion
