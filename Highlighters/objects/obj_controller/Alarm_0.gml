if (scr_checkRow(animRow)) {
	for (var j = 0; j < boardWidth; j++){
		var piece = scr_getPieceAtPos(animRow,j);
		if (instance_exists(piece)) {
			piece.image_index = piece.index;
			piece.image_index += 8;	
		}
	}
}
animRow -= 1;
alarm[0] = 15;