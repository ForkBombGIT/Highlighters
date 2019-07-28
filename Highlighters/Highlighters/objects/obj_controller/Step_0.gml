#region Game Loop
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
		//global.orgRiseSpeed = global.orgRiseSpeed + maxRiseSpeed/maxLevel;
		//global.riseSpeed = global.orgRiseSpeed;
	}
	//rising row
	if ((current_time - riseTimer)/1000 > risePace) { 
		global.riseSpeed = global.orgRiseSpeed;
		riseTimer = current_time;
		global.riseUp = true;
	} else global.riseUp = false;
	
	//creates new bottom row
	if (!position_meeting(scr_getColPos(0),scr_getRowPos(0)+25,par_entity)){
		for (var i = 0; i < boardWidth; i++){
			scr_createEntity(-1,i,(irandom_range(1,10) > 3) ? obj_charm : obj_bomb,obj_controller.selectedEntities[irandom_range(0,array_length_1d(obj_controller.selectedEntities) - 1)] * 11);	
		}
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
