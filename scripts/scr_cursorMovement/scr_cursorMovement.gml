function scr_cursorMovement(argument0, argument1) {
	var key = argument0;
	var sound = argument1;
	if (key == ds_map_find_value(global.controls,"LEFT")) {
		if (col > 0){
			if (sound != pointer_null) audio_play_sound(sound,1,0);
			col -= 1;
		}
	}
	if (key == ds_map_find_value(global.controls,"RIGHT")) {
		if (col < objCtrl_gameSession.boardWidth - 2){
			if (sound != pointer_null) audio_play_sound(sound,1,0);
			col += 1;
		}
	}
	if (key == ds_map_find_value(global.controls,"UP")) {
		if (y - global.pieceSize >= scr_getRowPos(8)){
			if (sound != pointer_null) audio_play_sound(sound,1,0);
			y -= global.pieceSize; 
			row --;
		}
	}
	if (key == ds_map_find_value(global.controls,"DOWN")) {
		if (y + global.pieceSize <= scr_getRowPos(0)){
			if (sound != pointer_null) audio_play_sound(sound,1,0);
			y += global.pieceSize;
			row ++;
		}
	}


}
