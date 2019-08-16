var rp = argument0;
var cp = argument1;
var availablePieces = obj_controller.selectedEntities;
var canPlace = false;
while !(canPlace) {
	var left = scr_getPieceAtPos(rp, cp - 1), bottom = scr_getPieceAtPos(rp - 1, cp);
	var tileType = (irandom_range(1,10) > 3) ? obj_charm : obj_bomb;
	var color = availablePieces[irandom_range(0,array_length_1d(availablePieces) - 1)] * 11;
	show_debug_message(bottom);
	if (instance_exists(bottom)) {
		canPlace = scr_checkColors(bottom.index,color);
		if (bottom.index == color) canPlace = false;
		if (instance_exists(left)) {
			canPlace = scr_checkColors(left.index,color);
			if (left.index == color) canPlace = false;
		}
	} else break; 
	//behavior if tests pass
	if (canPlace) {
		//creates piece
		scr_createEntity(rp,cp,tileType, color);	
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