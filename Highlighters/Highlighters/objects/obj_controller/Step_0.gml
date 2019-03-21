 #region Game Loop

//block loop
if ((global.active) && !(global.gameover)){
	if (!position_meeting(scr_getColPos(0),scr_getRowPos(0)+24,par_entity)){
		for (var i = 0; i < boardWidth; i++){
			scr_createEntity(-1,i,(irandom_range(0,2) > 0) ? obj_piece : obj_bomb);	
		}
	}

	#region New Row
	if ((current_time - riseTimer)/1000 > risePace) { 
		riseTimer = current_time;
		if (obj_cursor.y > scr_getRowPos(8)) obj_cursor.riseUp = true;
		for (var i = 0; i < instance_number(par_entity); i++) {
			var instance = instance_find(par_entity,i);
			instance.riseUp = true;
		}
	} 
	#endregion
}

//handles gameover logic
if (global.gameover) {
	if !(anim) { anim = true; alarm[0] = 30; }
}
#endregion
