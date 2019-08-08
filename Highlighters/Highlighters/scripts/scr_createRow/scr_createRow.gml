var placedPieces = ds_list_create();

for (var i = 0; i < boardWidth; i++){
	var color = obj_controller.selectedEntities[irandom_range(0,array_length_1d(obj_controller.selectedEntities) - 1)] * 11;
	var canPlace = true;
	if (ds_list_size(placedPieces) > 0) 
		scr_checkColors(color,ds_list_find_value(placedPieces,ds_list_size(placedPieces) - 1))
	if (canPlace) {
		scr_createEntity(-1,i,(irandom_range(1,10) > 3) ? obj_charm : obj_bomb, color);
		ds_list_add(placedPieces,color);
	}
	else i--;
}