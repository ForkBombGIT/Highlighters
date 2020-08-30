function scr_getRow(argument0) {
	//return a list of pieces in a row
	var row = argument0;
	var rowList = ds_list_create();

	for (var i = 0; i < objCtrl_gameSession.boardWidth; i++) {
		var entity = scr_getPieceAtPos(row,i);
		if (instance_exists(entity)) {
			ds_list_add(rowList,entity);
		}
	}

	return rowList


}
