function scr_cursorMovement(argument0) {
	var key = argument0;
	if (key == ds_map_find_value(global.controls,"LEFT")) {
		if (col > 0){
			col -= 1;
		}
	}
	if (key == ds_map_find_value(global.controls,"RIGHT")) {
		if (col < objCtrl_gameSession.boardWidth - 2){
			col += 1;
		}
	}
	if (key == ds_map_find_value(global.controls,"UP")) {
		if (y - global.pieceSize >= scr_getRowPos(8)){
			y -= global.pieceSize; 
			row --;
		}
	}
	if (key == ds_map_find_value(global.controls,"DOWN")) {
		if (y + global.pieceSize <= scr_getRowPos(0)){
			y += global.pieceSize;
			row ++;
		}
	}


}
