function scr_checkColForMatch(argument0, argument1) {
	var col = argument0;
	var yPos = argument1;

	var colPieces = scr_getCol(col);
	for (var i = 0; i < ds_list_size(colPieces); i++) {
		var entity = ds_list_find_value(colPieces,i);
		if (entity.match) && 
		   (yPos <= entity.y) {
			return true;	
		}
	}
	ds_list_destroy(colPieces)
}
