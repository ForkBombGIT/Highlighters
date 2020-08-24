var pieceCount = argument0;
var maxPieces = 30;
var lastTwelve = ds_list_create(); //last twelve pieces placed
var bombsInRow = ds_list_create(); //bombs in row
var piecesInRow = ds_list_create(); //pieces in row
//initializes blocks
//creates -1 row
scr_createRow(-1);
//loops for amount of desired starting rows
for (var row = 0; row < startingRows; row++) {
	var bombCount = 0;
	ds_list_clear(bombsInRow);
	ds_list_clear(piecesInRow);
	//loops through columns
	for (var col = 0; col < objCtrl_gameSession.boardWidth; col++) {
		//check if pieces placed are under max
		if (pieceCount < maxPieces) {
			//if a piece is placed, increment
			var piece = scr_pieceAlgorithm(row,col,lastTwelve,bombsInRow,piecesInRow);
			if (piece != pointer_null) {
				if (object_get_name(piece.object_index) == "obj_bomb") {
					bombCount++;
					ds_list_add(bombsInRow,piece.index);
				}
				pieceCount++;
				ds_list_add(lastTwelve,piece.index);
				ds_list_add(piecesInRow,piece.index);
				if (ds_list_size(lastTwelve) > 12) ds_list_delete(lastTwelve,0);
			} else col--;
			
		} else break;
	}
	//loop until enough pieces have been placed
	if (pieceCount < maxPieces) {
		if (row == startingRows - 1) row = 0;
	} else break;	
	
}