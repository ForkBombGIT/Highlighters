var row = argument0;
var placedPieces = ds_list_create();
var availablePieces = obj_controller.selectedEntities;
var matchCounter = 0;
var bombExists = 0;
var bombCount = 0;
var bombProb = 1;
var placedBombs = ds_list_create();
var bottomRows = ds_list_create();
var pieceFrames = 16;

//get the two bottom rows of the board
for (var i = 0; i < 2; i++) {
	var rowPieces = scr_getRow(i);
	for (var j = 0; j < ds_list_size(rowPieces); j++) {
		ds_list_add(bottomRows,ds_list_find_value(rowPieces,j));	
	}
}

//iterates the length of the board
for (var i = 0; i < boardWidth; i++){
	//selects a color
	var colorIndex = irandom_range(0,array_length_1d(availablePieces) - 1);
	var color = availablePieces[colorIndex] * pieceFrames;
	var pieceType = (bombCount < 3) ? 
					((irandom_range(1,6) > bombProb) ? obj_charm : obj_bomb) : obj_charm;
	var canPlace = (pieceType == obj_bomb) ? (ds_list_find_index(placedBombs,color) == -1) : true;
	var up = scr_getPieceAtPos(0, i);
	//checks if the first piece has been placed, if so check if the colors work
	if (ds_list_size(placedPieces) > 0)  && canPlace {
		if (scr_checkColors(color,ds_list_find_value(placedPieces,ds_list_size(placedPieces) - 1))) {
			//prevents a match occuring in a row
			//increments match counter if pieces match colors
			if (color == ds_list_find_value(placedPieces,ds_list_size(placedPieces) - 1)) {
				matchCounter++;	
			}
			else { matchCounter = 0; bombExists = 0; }
			//if there are >= 3 match counters (like colors) and a bomb, then piece cannot be placed
			if ((matchCounter >= 3))  {
				if (bombExists || pieceType == obj_bomb) {
					canPlace = false; matchCounter = 0; bombExists = 0; 
				}
			}
			
			//checks if the above color falls into the trios
			if (canPlace) 
				if (instance_exists(up)) canPlace = scr_checkColors(color,up.index);
			
		}
	}
	//if the colors work, create the piece, reset the available pieces, and add it to the placed pieces
	if (canPlace) {
		scr_createEntity(row,i,pieceType, color);
		availablePieces = obj_controller.selectedEntities;
		if (pieceType == obj_bomb) {
			ds_list_add(placedBombs,color);
			bombExists = 1;
			bombCount++;
		}
		ds_list_add(placedPieces,color);
	}
}