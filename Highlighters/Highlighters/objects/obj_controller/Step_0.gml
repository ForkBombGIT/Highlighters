 #region Game Loop

//block loop
if ((global.active) && !(global.gameover)){
	if (!position_meeting(scr_getColPos(0),scr_getRowPos(0)+25,par_entity)){
		for (var i = 0; i < boardWidth; i++){
			scr_createEntity(-1,i,(irandom_range(0,2) > 0) ? obj_piece : obj_bomb);	
		}
	}

	#region New Row
	if ((current_time - riseTimer)/1000 > risePace) { 
		riseTimer = current_time;
		global.rise = true;
		show_debug_message("oubg")
	} else global.rise = false;
	#endregion
	
	//bomb loop
	//if (currentBomb == noone){
	//	var pieceCol = irandom_range(0,boardWidth - 1);
	//	if (((obj_gui.totalMillis - lastTimeBomb) / room_speed) >= bombPace) {
	//		if (!scr_getPieceAtPos(8,pieceCol)) {
	//			currentBomb = scr_createEntity(8,pieceCol,obj_bomb);	
	//			currentBomb.image_index = nextBomb;
	//			currentBomb.index = nextBomb;
	//			nextBomb = selectedEntities[irandom_range(0,array_length_1d(selectedEntities) - 1)] * 10;
	//		}
	//	}
	//} else {
	//	if (instance_exists(currentBomb)) {
	//		if (currentBomb.grounded) {
	//			lastTimeBomb = obj_gui.totalMillis;
	//			currentBomb = noone;	
	//		}
	//	} else currentBomb = noone;
	//}
}
//handles gameover logic
if (global.gameover) {
	if !(anim) { anim = true; alarm[0] = 30; }
}
#endregion
