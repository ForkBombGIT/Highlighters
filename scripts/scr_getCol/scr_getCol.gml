function scr_getCol(argument0) {
	//return a list of pieces in a column
	var col = argument0;
	var colList = ds_list_create();

	for (var i = 0; i < objCtrl_gameSession.boardHeight; i++) {
		var entity = scr_getPieceAtPos(i,col);
		if (instance_exists(entity)) {
			ds_list_add(colList,entity);
		}
	}

	return colList


}
