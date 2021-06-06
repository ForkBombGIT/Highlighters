function scr_createRow(argument0) {
	var row = argument0;
	var placedCharms = ds_list_create();
	var placedBombs = ds_list_create();
	var allPieces = ds_list_create();

	//get all the pieces
	for (var i = 0; i < objCtrl_gameSession.boardHeight; i++) {
		var rowPieces = scr_getRow(i);
		for (var j = 0; j < ds_list_size(rowPieces); j++) {
			ds_list_add(allPieces,ds_list_find_value(rowPieces,j).index);	
		}
		ds_list_destroy(rowPieces);
	}
	
	//iterates the length of the board
	for (var col = 0; col < objCtrl_gameSession.boardWidth; col++) {
		var piece = scr_pieceAlgorithm(row,col,allPieces,placedBombs,placedCharms);
		if (piece != pointer_null) {
			if (object_get_name(piece.object_index) == "obj_bomb") {
				ds_list_add(placedBombs,piece.index);
			} else ds_list_add(placedCharms,piece.index);
		} else col--;
	}
	
	ds_list_destroy(placedBombs);
	ds_list_destroy(placedCharms);
	ds_list_destroy(allPieces);
}
