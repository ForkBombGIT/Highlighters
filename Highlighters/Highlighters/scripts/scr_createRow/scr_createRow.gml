var row = argument0;
var placedPieces = ds_list_create();
var availablePieces = obj_controller.selectedEntities;
var matchCounter = 0;
var bombExists = 0;
var bombCount = 0;


//iterates the length of the board
for (var i = 0; i < boardWidth; i++){
	show_debug_message(bombCount);
	//selects a color
	var colorIndex = irandom_range(0,array_length_1d(availablePieces) - 1);
	var color = availablePieces[colorIndex] * 16;
	var pieceType = (bombCount < 3) ? 
					((irandom_range(1,10) > 2) ? obj_charm : obj_bomb) : obj_charm;
	show_debug_message(pieceType);
	var canPlace = true;
	var up = scr_getPieceAtPos(0, i);
	//checks if the first piece has been placed, if so check if the colors work
	if (ds_list_size(placedPieces) > 0) {
		canPlace = scr_checkColors(color,ds_list_find_value(placedPieces,ds_list_size(placedPieces) - 1))
		if (canPlace) {
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
			bombExists = 1;
			bombCount++;
		}
		ds_list_add(placedPieces,color);
	}
	else { 	
		//shrinks the available options of pieces, removing the one that did not work
		var temp = availablePieces, index = 0;
		availablePieces = [];
		i--; //haults progress on the iteration
		for (var j = 0; j < array_length_1d(temp); j++) {
			if (temp[j] != colorIndex) {
				availablePieces[index++] = temp[j];	
			}
		}
	}
}