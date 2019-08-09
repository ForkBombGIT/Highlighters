var row = argument0;
var placedPieces = ds_list_create();
var availablePieces = obj_controller.selectedEntities;

//iterates the length of the board
for (var i = 0; i < boardWidth; i++){
	//selects a color
	var colorIndex = irandom_range(0,array_length_1d(obj_controller.selectedEntities) - 1);
	var color = availablePieces[colorIndex] * 11;
	var canPlace = true;
	//checks if the first piece has been placed, if so check if the colors work
	if (ds_list_size(placedPieces) > 0) 
		canPlace = scr_checkColors(color,ds_list_find_value(placedPieces,ds_list_size(placedPieces) - 1))
	//if the colors work, create the piece, reset the available pieces, and add it to the placed pieces
	if (canPlace) {
		scr_createEntity(row,i,(irandom_range(1,10) > 3) ? obj_charm : obj_bomb, color);
		availablePieces = obj_controller.selectedEntities;
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