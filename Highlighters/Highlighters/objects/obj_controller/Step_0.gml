#region Game Loop
if (instance_exists(obj_matchmaker)) {
	if (obj_matchmaker.animating) freeze = true;	
} else freeze = false;

//handles gameover logic
if (global.gameover) {
	if !(anim) { 
		anim = true; 
		alarm[0] = 1; 
	}
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
		scr_createRow();
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
