 #region Game Loop
//handles gameover logic
if (global.gameover) {
	if !(anim) { anim = true; alarm[0] = 1; }
}

//block loop
if ((global.active) && !(global.gameover)) {	
	//rising row
	if ((current_time - riseTimer)/1000 > risePace) { 
		if (!scr_checkRow(8)) {
			global.riseSpeed = global.orgRiseSpeed;
			riseTimer = current_time;
			global.riseUp = true;
		} else global.gameover = true;
	} else global.riseUp = false;
	
	//manual new row
	if (keyboard_check_pressed(ord("A"))) {
		if (scr_checkRow(8)) global.gameover = true;
		else {
			global.riseUp = true;
			global.riseSpeed = abs(432 - (instance_position(scr_getColPos(0),432,par_entity).y + 24));
			obj_cursor.riseUp = true;
			for (var i = 0; i < instance_number(par_entity); i++) {
				var instance = instance_find(par_entity,i);
				instance.riseUp = true;
			}
			riseTimer = current_time;
		}
	}
	
	//creates new bottom row
	if (!position_meeting(scr_getColPos(0),scr_getRowPos(0)+25,par_entity)){
		for (var i = 0; i < boardWidth; i++){
			scr_createEntity(-1,i,(irandom_range(0,2) > 0) ? obj_piece : obj_bomb);	
		}
	}
}
#endregion
