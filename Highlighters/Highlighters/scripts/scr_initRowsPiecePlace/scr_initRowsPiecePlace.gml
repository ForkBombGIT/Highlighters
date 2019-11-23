var rp = argument0;
var cp = argument1;
var availablePieces = obj_controller.selectedEntities;
var canPlace = instance_exists(scr_getPieceAtPos(rp,cp));
var bombCount = 0;
while !(canPlace) {
	var left = scr_getPieceAtPos(rp, cp - 1), bottom = scr_getPieceAtPos(rp - 1, cp);
	var color = availablePieces[irandom_range(0,array_length_1d(availablePieces) - 1)] * 16;
	var tileType;
	if (bombCount < 3) {
		tileType = (irandom_range(1,10) > 3) ? obj_charm : obj_bomb;
	}
	if (tileType == obj_bomb) bombCount++;
	if (instance_exists(bottom)) {
		canPlace = scr_checkColors(bottom.index,color);
		if (bottom.index == color) canPlace = false;
		if (instance_exists(left) && (canPlace)) {
			canPlace = scr_checkColors(left.index,color);
			if (left.index == color) canPlace = false;
		}
	} else return false; 
	//behavior if tests pass
	if (canPlace) {
		//creates piece
		scr_createEntity(rp,cp,tileType, color);	
		return true;
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