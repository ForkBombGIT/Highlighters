//initializes blocks
//creates -1 row
scr_createRow(-1);
//loops five times for five starting rows
for (var currRow = 0; currRow < startingRows; currRow++){
	for (var col = 0; col < boardWidth; col++) {
		if (irandom_range(0,10) > 2) { 
			var tRow = currRow;
			while (tRow > 0) {
				if (!instance_exists(scr_getPieceAtPos(tRow - 1,col)))
					tRow -= 1;
				else break;
			} 
			scr_initRowsPiecePlace(currRow,col);
		}
	}
}
//ensures there are five rows, checks for empty rows
//and places tiles in viable positions
for (var currRow = 0; currRow < startingRows; currRow++){
	if (!scr_checkRow(currRow)) {	
		for (var col = 0; col < boardWidth; col++) {
			scr_initRowsPiecePlace(currRow,col);
		}
	}
}