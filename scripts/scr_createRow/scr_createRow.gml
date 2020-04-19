var row = argument0;
var placedPieces = ds_list_create();
var placedBombs = ds_list_create();
var bottomRows = ds_list_create();

//get the two bottom rows of the board
for (var i = 0; i < 2; i++) {
	var rowPieces = scr_getRow(i);
	for (var j = 0; j < ds_list_size(rowPieces); j++) {
		ds_list_add(bottomRows,ds_list_find_value(rowPieces,j).index);	
	}
}

//iterates the length of the board
for (var col = 0; col < global.boardWidth; col++) {
	var piece = scr_pieceAlgorithm(row,col,bottomRows,placedBombs,placedPieces);
	if (piece != pointer_null) {
		if (object_get_name(piece.object_index) == "obj_bomb") {
			ds_list_add(placedBombs,piece.index);
		}
		ds_list_add(placedPieces,piece.index);
	} else col--;
}