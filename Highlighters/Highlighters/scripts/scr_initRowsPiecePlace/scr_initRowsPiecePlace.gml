var rp = argument0;
var cp = argument1;
var bombCount = argument2;
var lastTwelve = argument3;
var conditionOneRetry = 0;   //  generate a piece not in history
var conditionTwoRetry = 0;   //  generate a piece not in hisotry, if 3 same have been created 
var availablePieces = obj_controller.selectedEntities;
var canPlace = instance_exists(scr_getPieceAtPos(rp,cp));
var bombProb = 3;
while !(canPlace) {
	var left = scr_getPieceAtPos(rp, cp - 1), bottom = scr_getPieceAtPos(rp - 1, cp);
	var color = availablePieces[irandom_range(0,array_length_1d(availablePieces) - 1)] * 16;
	var tileType;
	//checks if less than 3 bombs have been placed
	//if there has been, default to a charm
	if (bombCount < 3) {
		tileType = (irandom_range(1,10) > bombProb) ? obj_charm : obj_bomb;
	} else tileType = obj_charm;
	//checks to see if there is a piece below the placement position
	if (instance_exists(bottom)) {
		//ensures that the colors touching do not fall into the "trio" of colors
		//the trio describes colors that can not spawn together due to similarity in colors
		canPlace = scr_checkColors(bottom.index,color);
		//condition two piece generation
		if (conditionOneRetry < 6) && canPlace {
			if (ds_list_find_index(lastTwelve,color) != -1) {
				canPlace = false;
				conditionOneRetry++;
			}
		}
		//condition three piece generation
		if (conditionTwoRetry < 6)  && canPlace {
			var counter = 0;
			for (var i = 0; i < ds_list_size(lastTwelve); i++) {
				if (ds_list_find_value(lastTwelve,i) == color) counter++;
			}
			canPlace = counter < 3;
			if (counter >= 3) conditionTwoRetry++;
		}
		
		//ensures bottom does not match current color
		if (bottom.index == color) && canPlace canPlace = false;
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
	} else {
		var temp = availablePieces, index = 0;
		availablePieces = [];
		for (var j = 0; j < array_length_1d(temp); j++) {
			if (temp[j] != color) {
				availablePieces[index++] = temp[j];	
			}
		}	
	}
}