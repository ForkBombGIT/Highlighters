function scr_getPieceAtPos(argument0, argument1) {
	var row = argument0;
	var col = argument1; 

	return instance_position(scr_getColPos(col),scr_getRowPos(row),objPar_piece);
}
