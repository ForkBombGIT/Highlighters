var pieceCount = argument0;
var maxPieces = 30;
//initializes blocks
//creates -1 row
scr_createRow(-1);
//loops for amount of desired starting rows
for (var currRow = 0; currRow < startingRows; currRow++) {
	var bombCount = 0;
	//loops through columns
	for (var col = 0; col < boardWidth; col++) {
		//check if pieces placed are under max
		if (pieceCount < maxPieces) {
			//creates variation in starting positions
			var tRow = currRow;
			//places piece on top of another
			while (tRow > 0) {
				if (!instance_exists(scr_getPieceAtPos(tRow - 1,col)))
					tRow -= 1;
				else break;
			} 
			//if a piece is placed, increment
			var pieceType = scr_initRowsPiecePlace(tRow,col,bombCount);
			if (pieceType != pointer_null) {
				if (pieceType == obj_bomb) bombCount++;
				pieceCount++;
			}
			
		} else break;
	}
	//loop until enough pieces have been placed
	if (pieceCount < maxPieces) {
		if (currRow == startingRows - 1) currRow = 0;
	} else break;	
	
}