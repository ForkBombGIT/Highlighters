var row = argument0;
var placedPieces = ds_list_create();
var availablePieces = obj_controller.selectedEntities;
var bombCount = 0;
var bombProb = 1;
var placedBombs = ds_list_create();
var bottomRows = ds_list_create();
var bottomRowFrequency = ds_map_create();
var pieceFrames = 16;

var conditionOneRetry = 0;   //  generate a piece not in history
var conditionTwoRetry = 0;   //  generate a piece not in hisotry, if 3 same have been created 
var conditionThreeRetry = 0; //  generate a matching color if three of the same have been placed

//get the two bottom rows of the board
for (var i = 0; i < 2; i++) {
	var rowPieces = scr_getRow(i);
	for (var j = 0; j < ds_list_size(rowPieces); j++) {
		ds_list_add(bottomRows,ds_list_find_value(rowPieces,j).index);	
	}
}

//iterates the length of the board
for (var i = 0; i < boardWidth; i++) {
	//selects a color
	var colorIndex = irandom_range(0,array_length_1d(availablePieces) - 1);
	var color = availablePieces[colorIndex] * pieceFrames;
	var pieceType = (bombCount < 3) ? 
					((irandom_range(1,5) > bombProb) ? obj_charm : obj_bomb) : obj_charm;
	var canPlace = (pieceType == obj_bomb) ? (ds_list_find_index(placedBombs,color) == -1) : true;
	var up = scr_getPieceAtPos(0, i);
	var matchCounter = 0;
	//checks if the first piece has been placed, if so check if the colors work
	if (ds_list_size(placedPieces) > 0)  && canPlace {
		if (bombCount < 3) {
			if (ds_list_size(bottomRows) > 0) && (conditionThreeRetry < 6) {
				// check if three pieces of the saem color have been placed
				// if they have, create a piece of the same color
				for (var j = 0; j < ds_list_size(bottomRows); j++) {
					var entity = ds_list_find_value(bottomRows,j);
					var pieceFrequency = ds_map_find_value(bottomRowFrequency,entity)
					if (pieceFrequency >= 3) {
						color = entity;
						conditionThreeRetry++;
						break;
					}
					else if (pieceFrequency == undefined) ds_map_add(bottomRowFrequency,entity,0);
					else ds_map_set(bottomRowFrequency,entity,++pieceFrequency);
				}
			}
			//pick piece type randomly
			pieceType = (irandom_range(1,5) > bombProb) ? obj_charm : obj_bomb;
			if (pieceType == obj_bomb) {
				do {
					canPlace = (ds_list_find_index(placedBombs,color) == -1);
					if (canPlace) break;
					else color = availablePieces[irandom_range(0,array_length_1d(availablePieces) - 1)] * pieceFrames;
				} until (canPlace);
			}
		} else pieceType = obj_charm;
	
		canPlace = scr_checkColors(color,ds_list_find_value(placedPieces,ds_list_size(placedPieces) - 1))
		
		// handles condition one behavior
		if (conditionOneRetry < 6) && canPlace {
			if (ds_list_find_index(bottomRows,color) != -1) {
				canPlace = false;
				conditionOneRetry++;
			}
		}
		
		// handles condition two behavior
		if (conditionTwoRetry < 6) && canPlace {
			var counter = 0;
			for (var j = 0; j < ds_list_size(bottomRows); j++) {
				if (ds_list_find_value(bottomRows,j) == color) counter++;
			}
			canPlace = counter < 3;
			if (counter >= 3) {
				conditionTwoRetry++;
			}
		}
		
		//prevents a match occuring in a row
		//increments match counter if pieces match colors
		var index = 1;
		while (color == ds_list_find_value(placedPieces,ds_list_size(placedPieces) - index)) {
			matchCounter++;	
			if (++index > ds_list_size(placedPieces)) {
				break;
			}
		}
		
		//if there are >= 3 match counters (like colors) and a bomb, then piece cannot be placed
		if ((matchCounter >= 3))  {
			if (pieceType == obj_bomb) || (ds_list_find_index(placedBombs,color) != -1) {
				canPlace = false;
			}
		}
		
		//ensures 5 pieces of the same color are not in a row
		matchCounter = 0;
		for (var j = 0; j < ds_list_size(placedPieces); j++) {
			if (color == ds_list_find_value(placedPieces,j)) {
				if (++matchCounter >= 5) {
					canPlace = false;	
				}
			}
		}
		
		//checks if the above color falls into the trios
		if (canPlace) 
			if (instance_exists(up)) canPlace = scr_checkColors(color,up.index);
	}
	//if the colors work, create the piece, reset the available pieces, and add it to the placed pieces
	if (canPlace) {
		scr_createEntity(row,i,pieceType,color);
		if (pieceType == obj_bomb) {
			ds_list_add(placedBombs,color);
			bombCount++;
		}
		ds_list_add(placedPieces,color);
	} else i--;
}