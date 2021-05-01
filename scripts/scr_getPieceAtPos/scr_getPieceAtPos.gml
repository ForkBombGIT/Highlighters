function scr_getPieceAtPos(row, col) {
	return instance_position(scr_getColPos(col),scr_getRowPos(row),objPar_piece);
}
