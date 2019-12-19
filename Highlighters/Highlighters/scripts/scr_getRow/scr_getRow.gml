//return a list of pieces in a row
var row = argument0;
var rowList = ds_list_create();

for (var i = 0; i < boardWidth; i++) {
	var entity = scr_getPieceAtPos(row,i);
	if (instance_exists(scr_getPieceAtPos(row,i))) {
		ds_list_add(rowList,entity);
	}
}

return rowList