function scr_pieceAlgorithm(argument0, argument1, argument2, argument3, argument4) {
	var row = argument0;
	var col = argument1;
	var history = argument2;
	var bombsInRow = argument3;
	var charmsInRow = argument4;
	var piecesInRow = ds_list_create();
	ds_list_copy(piecesInRow, bombsInRow);
	for (var i = 0; i < ds_list_size(charmsInRow); i++) {
		var piece = ds_list_find_value(charmsInRow,i);
		ds_list_add(piecesInRow,piece);
	}
	
	// Pieces used to determine piece to spawn
	var historyFrequency = scr_generateHistoryFrequency(history);
	var bombFrequency = scr_generateBombFrequency();
	var rowBombCount = ds_list_size(bombsInRow);
	var availablePieces = objCtrl_gameSession.selectedEntities;
	var maxBombFreq = 5;
	var maxBombsInRow = 2;
	
	// Algorithm conditions
	var conditionOne = false;
	var algRetry = 0;
	var conditionOneRetry = 0;   //  generate a matching color if three of the same have been placed
	var conditionTwoRetry = 0;   //  generate a piece not in history
	var conditionThreeRetry = 0; //  generate a piece not in hisotry, if 3 same have been created 
	var conditionFourRetry = 0;  //  if generating a bomb, ensure it's no more than the max amount of bombs
	var maxSameColor = 4;
	var maxRetry = 6;

	var bombProb = 0.5;
	var boostedBombProb = 1;
	var canPlace = instance_exists(scr_getPieceAtPos(row,col));

	var pieceFrames = 18;

	while !(canPlace) {
		algRetry++;
		var left = scr_getPieceAtPos(row, max(0,col - 1)),
			bottom = scr_getPieceAtPos(row - 1, col),
			up = scr_getPieceAtPos(row + 1, col),
			right = scr_getPieceAtPos(row, min(objCtrl_gameSession.boardWidth - 1,col + 1));
		var colorIndex = irandom_range(0,array_length(availablePieces) - 1);
		var color = availablePieces[colorIndex] * pieceFrames;
		var pieceType = (rowBombCount < maxBombsInRow) ? 
						((random_range(0,1) < bombProb) ? obj_bomb : obj_charm) : obj_charm;
		//avoids same color bomb in row
		canPlace = (pieceType == obj_bomb) ? (ds_list_find_index(bombsInRow,color) == -1) : true;
		if (ds_list_size(piecesInRow) > 0) && 
		   (canPlace) && 
		   (algRetry < maxRetry) {
			if (rowBombCount < maxBombsInRow) {
				// c.1 logic
				// if a piece of the same color has been placed >= 3 times, try to generate a bomb 
				// of the same color
				if (conditionOneRetry < maxRetry) {
					var maxFrequency = 3;
					var colorToSet = color;
					for (var i = 0; i < array_length(availablePieces); i++) {
						if (ds_list_find_index(bombsInRow,array_get(availablePieces,i)) == -1) {
							var freqColor = array_get(availablePieces,i);
							var frequency = ds_map_find_value(historyFrequency,freqColor);
							if (frequency > maxFrequency) && 
							   (ds_map_find_value(bombFrequency,freqColor) < maxBombFreq) {
								maxFrequency = frequency;
								colorToSet = array_get(availablePieces,i);
							
							}
						}
					}
					// if the max frequecy has changed, try to generate a bomb at a higher prob.
					if (maxFrequency > 3) {
						conditionOne = true;
						color = colorToSet;
						//conditionOneRetry++;
						if (pieceType == obj_charm)
							pieceType = (random_range(0,1) < boostedBombProb) ? obj_bomb : obj_charm;
					}
				}
			}
		
			// c.2 logic
			// avoid a piece color that has been placed in row
			if (conditionTwoRetry < maxRetry) && canPlace {
				if (ds_list_find_index(piecesInRow,color) != -1) {
					canPlace = false;
					//conditionTwoRetry++;
				}
			}
		
			// c.3 logic
			// if a piece of the same color has been placed >= 3 times, try to generate a piece 
			// not in piecesInRow
			if (conditionThreeRetry < maxRetry) && 
			   (canPlace) && 
			   (pieceType == obj_charm) {
				var counter = 0;
				for (var j = 0; j < ds_list_size(charmsInRow); j++) {
					var piece = ds_list_find_value(charmsInRow,j);
					if (ds_list_find_value(charmsInRow,j) == color) counter++;
				}
				canPlace = counter < maxSameColor;
				//if (counter >= maxSameColor) {
				//	conditionThreeRetry++;
				//}
			}	
			
			// c.4
			// prevent more than maxBombFreq
			if (conditionFourRetry  < maxRetry) && canPlace && (pieceType == obj_bomb){
				var bombFreq = ds_map_find_value(bombFrequency,color);
				if (bombFreq != undefined) {
					canPlace = bombFreq > maxBombFreq
				//	conditionFourRetry++;
				}
			}
			//// c.4 logic
			//// no more than x amount of pieces can exist in the history
			//if (conditionFourRetry < 6) {
			//	for (var i = 0; i < array_length_1d(availablePieces); i++) {
			//		var entity = availablePieces[i];
			//		var pieceFrequency = ds_map_find_value(historyFrequency,entity);
			
			//		canPlace = !(pieceFrequency >= maxSameColor);
			//		if (!canPlace) {
			//			var temp = []; 
			//			var index = 0;
			//			for (var j = 0; j < array_length_1d(availablePieces); j++) {
			//				if (availablePieces[j] != entity) {
			//					temp[index++] = availablePieces[j];	
			//				}
			//			}
			//			availablePieces = temp;
			//			conditionFourRetry++;
			//		} 
			//	}
			//}
		}
		
		if (algRetry == maxRetry) || (array_length(availablePieces) == 1) {
			availablePieces = objCtrl_gameSession.selectedEntities;
		}
		
		if (instance_exists(up)) && canPlace {
			//ensures that the colors touching do not fall into the "trio" of colors
			//the trio describes colors that can not spawn together due to similarity in colors
			canPlace = scr_checkColors(up.index,color);
			//ensures up does not match current color
			if (up.index == color) && (canPlace) canPlace = false;
		}
		if (instance_exists(left) && (canPlace)) {
			canPlace = scr_checkColors(left.index,color);
			//ensures left and current color do not match
			if (left.index == color) && (canPlace) canPlace = false;
		}
		if (instance_exists(bottom) && (canPlace)) {
			canPlace = scr_checkColors(bottom.index,color);
			//ensures bottom and current color do not match
			if (bottom.index == color) && (canPlace) canPlace = false;
		}
		if (instance_exists(right) && (canPlace)) {
			canPlace = scr_checkColors(right.index,color);
			//ensures bottom and current color do not match
			if (right.index == color) && (canPlace) canPlace = false;
		}
		show_debug_message(array_length(availablePieces))
		if (canPlace) {
			var entity = scr_createEntity(row,col,pieceType, color);	
			return entity;
		}
		var updatedAvailablePieces = [];
		for (var i = 0; i < array_length(availablePieces); i++) {
			var piece = array_get(availablePieces,i);
			if (piece != color / pieceFrames)
				array_push(updatedAvailablePieces,piece);
		}
		availablePieces = updatedAvailablePieces;
	}
	ds_map_destroy(historyFrequency);
	ds_map_destroy(bombFrequency);
	ds_map_destroy(piecesInRow);
}
