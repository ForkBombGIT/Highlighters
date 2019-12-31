var rp = argument0;
var cp = argument1;
var bombCount = argument2;
var lastTwelve = argument3;
var bombsInRow = argument4;
var conditionOneRetry = 0;   //  generate a piece not in history
var conditionTwoRetry = 0; //  generate a piece not in hisotry, if 3 same have been created 
var conditionThreeRetry = 0; //  generate a matching color if three of the same have been placed

var availablePieces = obj_controller.selectedEntities;
var canPlace = instance_exists(scr_getPieceAtPos(rp,cp));
var bombProb = 1;
var pieceFrames = 16;
while !(canPlace) {
	var left = scr_getPieceAtPos(rp, cp - 1), bottom = scr_getPieceAtPos(rp - 1, cp);
	var color = availablePieces[irandom_range(0,array_length_1d(availablePieces) - 1)] * pieceFrames;
	var tileType;
	var lastTwelveFrequency = ds_map_create();
	//checks to see if there is a piece below the placement position
	if (instance_exists(bottom)) {
		//checks if less than 3 bombs have been placed
		//if there has been, default to a charm
		if (bombCount < 2) {
			if (ds_list_size(lastTwelve) > 0) && (conditionThreeRetry < 6) {
				// check if three pieces of the saem color have been placed
				// if they have, create a piece of the same color
				for (var i = 0; i < ds_list_size(lastTwelve); i++) {
					var entity = ds_list_find_value(lastTwelve,i);
					var pieceFrequency = ds_map_find_value(lastTwelveFrequency,entity)
					if (pieceFrequency >= 3) {
						color = entity;
						conditionThreeRetry++;
						break;
					}
					else if (pieceFrequency == undefined) ds_map_add(lastTwelveFrequency,entity,0);
					else ds_map_set(lastTwelveFrequency,entity,++pieceFrequency);
				}
			}
			//pick piece type randomly
			tileType = (irandom_range(1,5) > bombProb) ? obj_charm : obj_bomb;
			if (tileType == obj_bomb) {
				do {
					canPlace = (ds_list_find_index(bombsInRow,color) == -1);
					if (canPlace) break;
					else color = availablePieces[irandom_range(0,array_length_1d(availablePieces) - 1)] * pieceFrames;
				} until (canPlace);
			}
		} else tileType = obj_charm;
		//ensures that the colors touching do not fall into the "trio" of colors
		//the trio describes colors that can not spawn together due to similarity in colors
		canPlace = scr_checkColors(bottom.index,color);
		//condition one piece generation
		if (conditionOneRetry < 6) && canPlace {
			if (ds_list_find_index(lastTwelve,color) != -1) {
				canPlace = false;
				conditionOneRetry++;
			}
		}
		//condition two piece generation
		var counter = 0;
		if (conditionTwoRetry < 6) && canPlace {
			for (var i = 0; i < ds_list_size(lastTwelve); i++) {
				if (ds_list_find_value(lastTwelve,i) == color) counter++;
			}
			canPlace = counter < 3;
			if (counter >= 3) conditionTwoRetry++;
		}
		
		//ensures bottom does not match current color
		if (bottom.index == color) && (canPlace) canPlace = false;
		if (instance_exists(left) && (canPlace)) {
			canPlace = scr_checkColors(left.index,color);
			//ensures left and current color do not match
			if (left.index == color) canPlace = false;
		}
	} else return pointer_null; 
	//behavior if tests pass
	if (canPlace) {
		//creates piece
		var entity = scr_createEntity(rp,cp,tileType, color);	
		return entity;
	}
}