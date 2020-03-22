var row = argument0;
var col = argument1;
var history = argument2;
var bombHistory = argument3;
var rowHistory = argument4;
var historyFrequency = ds_map_create();
var bombCount = ds_list_size(bombHistory);
var availablePieces = obj_controller.selectedEntities;

//algorithm conditions
var conditionOne = false;
var conditionOneRetry = 0; //  generate a matching color if three of the same have been placed
var conditionTwoRetry = 0;   //  generate a piece not in history
var conditionThreeRetry = 0; //  generate a piece not in hisotry, if 3 same have been created 
var maxSameColor = 4;

var bombProb = 1;
var canPlace = instance_exists(scr_getPieceAtPos(row,col));

var pieceFrames = 16;

while !(canPlace) {
	var left = scr_getPieceAtPos(row, col - 1),
		bottom = scr_getPieceAtPos(row - 1, col),
		up = scr_getPieceAtPos(row + 1, col);
	var colorIndex = irandom_range(0,array_length_1d(availablePieces) - 1);
	var color = availablePieces[colorIndex] * pieceFrames;
	var pieceType = (bombCount < 2) ? 
					((irandom_range(1,5) > bombProb) ? obj_charm : obj_bomb) : obj_charm;
	canPlace = (pieceType == obj_bomb) ? (ds_list_find_index(bombHistory,color) == -1) : true;
	if (ds_list_size(rowHistory) > 0) && canPlace{
		if (bombCount < 2) {
			// c.1 logic
			// if a piece of the same color has been placed >= 3 times, try to generate a bomb 
			// of the same color
			if (conditionOneRetry < 6) {
				for (var i = 0; i < ds_list_size(history); i++) {
					var entity = ds_list_find_value(history,i);
					var pieceFrequency = ds_map_find_value(historyFrequency,entity);
					conditionOne = false;
					if (pieceFrequency >= 3) {
						color = entity;
						conditionOneRetry++;
						conditionOne = true;
						break;
					}
					else if (pieceFrequency == undefined) ds_map_add(historyFrequency,entity,0);
					else ds_map_set(historyFrequency,entity,++pieceFrequency);
				}
			}
			
			pieceType = (irandom_range(1,conditionOne ? 2 : 5) > bombProb) ? obj_charm : obj_bomb;
			if (pieceType == obj_bomb) {
				do {
					canPlace = (ds_list_find_index(bombHistory,color) == -1);
					if (canPlace) break;
					else color = availablePieces[irandom_range(0,array_length_1d(availablePieces) - 1)] * pieceFrames;
				} until (canPlace);
			}
		}
		
		// c.2 logic
		// avoid a piece color that has been placed
		if (conditionTwoRetry < 6) && canPlace && !conditionOne {
			if (ds_list_find_index(history,color) != -1) {
				canPlace = false;
				conditionTwoRetry++;
			}
		}
		
		// c.3 logic
		// if a piece of the same color has been placed >= 3 times, try to generate a piece 
		// not in history
		if (conditionThreeRetry < 6) && canPlace && !conditionOne {
			var counter = 0;
			for (var j = 0; j < ds_list_size(history); j++) {
				if (ds_list_find_value(history,j) == color) counter++;
			}
			canPlace = counter < 3;
			if (counter >= 3) {
				conditionThreeRetry++;
			}
		}
		
		
		// c.4 logic
		// no more than x amount of pieces can exist in the history
		for (var i = 0; i < array_length_1d(availablePieces); i++) {
			var entity = availablePieces[i];
			var pieceFrequency = ds_map_find_value(historyFrequency,entity);
			
			canPlace = !(pieceFrequency >= maxSameColor);
			if (!canPlace) {
				var temp = []; 
				var index = 0;
				for (var j = 0; j < array_length_1d(availablePieces); j++) {
					if (availablePieces[j] != entity) {
						temp[index++] = availablePieces[j];	
					}
				}
				availablePieces = temp;
			}
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
			if (left.index == color) canPlace = false;
		}
		if (instance_exists(bottom) && (canPlace)) {
			canPlace = scr_checkColors(bottom.index,color);
			//ensures bottom and current color do not match
			if (bottom.index == color) canPlace = false;
		}
	}
	if (canPlace) {
		var entity = scr_createEntity(row,col,pieceType, color);	
		return entity;
	}
}
