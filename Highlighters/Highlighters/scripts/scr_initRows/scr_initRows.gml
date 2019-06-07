//initializes blocks
//creates -1 row
for (var i = 0; i < boardWidth; i++){
	scr_createEntity(-1,i,(irandom_range(0,2) > 0) ? obj_piece : obj_bomb);	
}
//loops five times for five starting rows
for (var currRow = 0; currRow < startingRows; currRow++){
	for (var col = 0; col < boardWidth; col++){
		if (irandom_range(0,10) > 3) { 
			var tRow = currRow;
			//iterates until a block is found below a position
			//prevents blocks from falling at initialization
			while (tRow > 0) {
				if (!instance_exists(scr_getPieceAtPos(tRow - 1,col)))
					tRow -= 1;
				else break;
			} 
			//creates piece
			scr_createEntity(tRow,col,(irandom_range(0,20) > 2) ? obj_piece : obj_bomb);
		}
	}
}
//ensures there are five rows, checks for empty rows
//and places tiles in viable positions
for (var currRow = 0; currRow < startingRows; currRow++){
	if (!scr_checkRow(currRow)) {	
		for (var col = 0; col < boardWidth; col++) {
			if (instance_exists(scr_getPieceAtPos(currRow - 1,col))) {
				//creates piece
				scr_createEntity(currRow,col,(irandom_range(0,20) > 2) ? obj_piece : obj_bomb);
			}
		}
	}
}