//switch to gray sprite
if (scr_checkRow(animRow)) {
	for (var j = 0; j < boardWidth; j++){
		var piece = scr_getPieceAtPos(animRow,j);
		if (instance_exists(piece)) {
			piece.landAnim = false;
			piece.image_index = piece.index;
			piece.image_index += 14;	
		}
	}
}

//checks if animRow is at a valid row index
//if it isnt, apply a longer delay
if (--animRow < -1) {
	alarm[2] = 60;
}
else
	alarm[0] = 5;