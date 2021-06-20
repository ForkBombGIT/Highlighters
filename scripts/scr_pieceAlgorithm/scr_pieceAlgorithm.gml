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
	var maxSameBombsInRow = 2;
	var maxSameCharmInRow = 3;
	var maxBombsInRow = 3;
	
	// Algorithm conditions
	var conditionOne = false;
	var algRetry = 0;
	var maxRetry = 6;
	var maxSame = 15;
	var bombProb = 0.5;
	var boostedBombProb = 1;
	var canPlace = instance_exists(scr_getPieceAtPos(row,col));
	
	// The amount of frames in the piece sprite
	var pieceFrames = 18;

	while !(canPlace) {
		var left = scr_getPieceAtPos(row, max(0,col - 1)),
			bottom = scr_getPieceAtPos(row - 1, col),
			up = scr_getPieceAtPos(row + 1, col),
			right = scr_getPieceAtPos(row, min(objCtrl_gameSession.boardWidth - 1,col + 1));
		var colorIndex = irandom_range(0,array_length(availablePieces) - 1);
		var color = availablePieces[colorIndex] * pieceFrames;
		var pieceType = (rowBombCount < maxBombsInRow) ? ((random_range(0,1) < bombProb) ? obj_bomb : obj_charm) : obj_charm;
		
		//avoids same color bomb in row
		canPlace = true;
		
		// Conditions
		if (ds_list_size(piecesInRow) > 0) && 
		   (canPlace) && 
		   (algRetry < maxRetry) {
			// c.1
			// prevent more than maxSame
			if (canPlace) {
				var pieceFreq = ds_map_find_value(historyFrequency,color);
				if (pieceFreq != undefined) {
					canPlace = pieceFreq < maxSame
				//	conditionFourRetry++;
				}
			}
		
			// c.2 logic
			// if a piece of the same color has been placed >= 3 times, try to generate a bomb 
			// of the same color
			if (rowBombCount < maxBombsInRow) {
				var maxFrequency = 3;
				var colorToSet = color;
				for (var i = 0; i < array_length(availablePieces); i++) {
					//if (ds_list_find_index(bombsInRow,array_get(availablePieces,i)) == -1) {
					var freqColor = array_get(availablePieces,i);
					var frequency = ds_map_find_value(historyFrequency,freqColor);
					if (frequency > maxFrequency) && 
						(ds_map_find_value(bombFrequency,freqColor) < maxBombFreq) {
						maxFrequency = frequency;
						colorToSet = array_get(availablePieces,i);
					}
					//}
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
		
		if (algRetry == maxRetry) || (array_length(availablePieces) == 1) {
			availablePieces = objCtrl_gameSession.selectedEntities;
		}
		
		// Post conditions
		//if (rowBombCount >= maxSameBombsInRow) pieceType = obj_charm;
		
		
		// pc.1
		// Only two bombs of the same color can be in the same row
		if (canPlace) &&
			(pieceType == obj_bomb) {
			var counter = 0;
			for (var i = 0; i < ds_list_size(bombsInRow); i++) {
				var bomb = ds_list_find_value(bombsInRow,i);
				if (bomb == color) counter++;
			}
			if (counter >= maxSameBombsInRow) {
				canPlace = false;
			}
		}
			
		// pc.2
		// Only three charms of the same color can be in the same row
		if (canPlace) &&
			(pieceType == obj_charm) {
			var counter = 0;
			for (var i = 0; i < ds_list_size(charmsInRow); i++) {
				var charm = ds_list_find_value(charmsInRow,i);
				if (charm == color) counter++;
			}
			if (counter >= maxSameCharmInRow) {
				canPlace = false;
			}
		}
		
		// pc.3
		// prevent more than maxBombFreq
		if canPlace && 
			(pieceType == obj_bomb) {
			var bombFreq = ds_map_find_value(bombFrequency,color);
			if (bombFreq != undefined) {
				canPlace = bombFreq < maxBombFreq
			//	conditionFourRetry++;
			}
		}
		
		
		// pc. 4 and 5
		// Piece must not be part of an invalid color trio
        // Bomb must not be same with adjacent pieces
		if (instance_exists(up)) && canPlace {
			//ensures that the colors touching do not fall into the "trio" of colors
			//the trio describes colors that can not spawn together due to similarity in colors
			canPlace = scr_checkColors(up.index,color);
			//ensures up does not match current color
			if (pieceType == obj_bomb) || (object_get_name(up.object_index) == "obj_bomb")
				if (up.index == color) canPlace = false;
		}
		if (instance_exists(left) && (canPlace)) {
			canPlace = scr_checkColors(left.index,color);
			//ensures left and current color do not match
			if (pieceType == obj_bomb) || (object_get_name(left.object_index) == "obj_bomb")
				if (left.index == color) canPlace = false;
		}
		if (instance_exists(bottom) && (canPlace)) {
			canPlace = scr_checkColors(bottom.index,color);
			//ensures bottom and current color do not match
			if (pieceType == obj_bomb) || (object_get_name(bottom.object_index) == "obj_bomb")
				if (bottom.index == color) canPlace = false;
		}
		if (instance_exists(right) && (canPlace)) {
			canPlace = scr_checkColors(right.index,color);
			//ensures bottom and current color do not match
			if (pieceType == obj_bomb) || (object_get_name(right.object_index) == "obj_bomb")
				if (right.index == color) canPlace = false;
		}
		
		// Piece creation
		if (canPlace) {
			var entity = scr_createEntity(row,col,pieceType, color);	
			return entity;
		}
		
		// Remove unsuccessful color
		var updatedAvailablePieces = [];
		for (var i = 0; i < array_length(availablePieces); i++) {
			var piece = array_get(availablePieces,i);
			if (piece != color / pieceFrames)
				array_push(updatedAvailablePieces,piece);
		}
		availablePieces = updatedAvailablePieces;
		algRetry++;
	}
	ds_map_destroy(historyFrequency);
	ds_map_destroy(bombFrequency);
	ds_map_destroy(piecesInRow);
}
